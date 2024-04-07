//
//  ApiAndRequests.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-27.
//

import Foundation
import SwiftUI
var res = false



struct RuntimeError: LocalizedError {
    let description: String

    init(_ description: String) {
        self.description = description
    }

    var errorDescription: String? {
        description
    }
}

   let  url = "https://courseworkbackend-b793e777959e.herokuapp.com/api/"
   let session = URLSession.shared
func login(email:String,password:String) async  -> Bool{
    
    struct loginResponse:Codable{
        let role:String
        let token:String
        let email:String
    }
    guard let endpoint = URL(string:url+"sanctum/token")else{return false }
    var request = URLRequest(url:endpoint)
    request.httpMethod = "POST"
    let requestData:[String:Any]=[
        "email":email,
        "password":password,
        "device_name":"apple"
    ]
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: requestData,options:[])
    } catch {
        res = false
        UserDefaults.standard.set("Something went wrong", forKey:"error")
    }
    res = false
    do{
        let (job, _) = try await  session.data(for:request)
        let obj = try JSONDecoder().decode(loginResponse.self, from: job)
        
        UserDefaults.standard.set(obj.email, forKey:"email")
        UserDefaults.standard.set(obj.role, forKey:"role")
            
        res = true
        return res
    }catch{
        
     return false
    }
}
         
     
func register(email:String,password:String,passwordConfirmation:String,name:String,
              cardNumber:String,accountName:String,expiredDate:String,cvv:String) async  -> Bool{
    
  
    guard let endpoint = URL(string:url+"register")else{return false }
    var request = URLRequest(url:endpoint)
    request.httpMethod = "POST"
    let requestData:[String:Any]=[
        "email":email,
        "password":password,
        "password_confirmation":passwordConfirmation,
        "name":name,
        "card_number":cardNumber,
        "expired_date":expiredDate,
        "account_name":accountName,
        "cvv":cvv
    ]
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("*/*", forHTTPHeaderField:"Accept")
    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: requestData,options:[])
    } catch {
        res = false
        UserDefaults.standard.set("Something went wrong", forKey:"error")
    }
    res = false
    do{
        let (job, _) = try await  session.data(for:request)
        res = true
        print(job)
        return res
    }catch{
return false    }
}
struct UserOrderResponse: Decodable,Hashable {
    // Computed property for generating auto-incremented id
    private static var nextId: Int = 1
    private static var idLock = NSLock()

    private static func generateId() -> Int {
        idLock.lock()
        defer { idLock.unlock() }
        let id = nextId
        nextId += 1
        return id
    }
    // Stored properties
    let id:Int
    let currentPage: Int
    let data: [OrderResponseData]
    let firstPageUrl: String
    let from: Int
    let lastPage: Int
    let lastPageUrl: String
    let links: [Links]
    let nextPageUrl: String?
    let path: String
    let perPage: Int
    let prevPageUrl: String?
    let to: Int
    let total: Int

    // Initialize with auto-generated id
    init(currentPage: Int, data: [OrderResponseData], firstPageUrl: String, from: Int, lastPage: Int, lastPageUrl: String, links: [Links], nextPageUrl: String?, path: String, perPage: Int, prevPageUrl: String?, to: Int, total: Int) {
        self.id = UserOrderResponse.generateId()
        self.currentPage = currentPage
        self.data = data
        self.firstPageUrl = firstPageUrl
        self.from = from
        self.lastPage = lastPage
        self.lastPageUrl = lastPageUrl
        self.links = links
        self.nextPageUrl = nextPageUrl
        self.path = path
        self.perPage = perPage
        self.prevPageUrl = prevPageUrl
        self.to = to
        self.total = total
    }
}
struct Links:Decodable,Hashable{
    private static var nextId: Int = 1
    private static var idLock = NSLock()

    private static func generateId() -> Int {
        idLock.lock()
        defer { idLock.unlock() }
        let id = nextId
        nextId += 1
        return id
    }
 let id:Int
 let url:String
 let label:String
 let active:Bool
    init(id: Int, url: String, label: String, active: Bool) {
        self.id = Links.generateId()
        self.url = url
        self.label = label
        self.active = active
    }
}
struct OrderResponseData:Decodable,Identifiable,Hashable{
    let id: Int
      let total: Int
      let status: String
      let orderKey: Int
      let items: Int
}
struct RegistrationRequestData:Codable,Identifiable,Hashable{
    let id:UUID
 let userName:String
let email:String
let password:String
let passwordConfirmation:String
}

func userOrders  () async -> UserOrderResponse {
        guard let url = URL(string:url+"userOrders") else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("*/*", forHTTPHeaderField:"Accept")
    request.httpMethod = "POST"
    let requestData:[String:Any] =  [
        "email":UserDefaults.standard.string(forKey:"email") ??  ""
          ]
    do{
        request.httpBody = try JSONSerialization.data(withJSONObject: requestData,options:[])
    }
        catch{
            print("request error")
            return UserOrderResponse(currentPage:1,data:[OrderResponseData(id:1, total:1, status: "String", orderKey:1, items: 1)], firstPageUrl: "String", from:0, lastPage: 1, lastPageUrl: "String", links: [Links(id: 0, url: "", label: "String", active: true)], nextPageUrl: "String",path:"",perPage: 1,prevPageUrl: "String", to: 2, total: 3)

    }
    do{
        let (job, _) = try await session.data(for:request)
        let obj = try JSONDecoder().decode(UserOrderResponse.self, from: job)
        
        return obj
    }catch{
        print("\(error)")
        return UserOrderResponse( currentPage:1,data:[OrderResponseData(id:1, total:1, status: "String", orderKey:1, items: 1)], firstPageUrl: "String", from:0, lastPage: 1, lastPageUrl: "String", links: [Links(id:1,url: "", label: "String", active: true)], nextPageUrl: "String",path:"",perPage: 1,prevPageUrl: "String", to: 2, total: 3)
    }
}
