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
struct UserOrderResponse: Codable,Hashable {
    let current_page: Int
    let data: [OrderResponseData]
    let first_page_url: String?
    let from: Int
    let last_page: Int
    let last_page_url: String?
    let links: [Links]
    let next_page_url: String?
    let path: String
    let per_page: Int
    let prev_page_url: String?
    let to: Int
    let total: Int

   
}
struct Links:Codable,Hashable{
 let url:String?
 let label:String
 let active:Bool
}
struct OrderResponseData:Codable,Identifiable,Hashable{
      let id: Int
      let total: Int
      let status: String
      let order_key: Int
      let quantity: Int
    let final_bill: Int
    let cloth : String
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
        return UserOrderResponse(current_page:1,data:[OrderResponseData(id:1, total:1, status: "String", order_key:1,quantity:0,final_bill:0, cloth:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
        
        
    }
    do{
        
        let (job, _) = try! await session.data(for:request)
        let obj = try JSONDecoder().decode(UserOrderResponse.self, from:job)
        print(obj)
             return obj
    }catch{
       print("\(error)")
    }
            
            
            
        
    
    
    return UserOrderResponse(current_page:1,data:[OrderResponseData(id:1, total:1, status: "String", order_key:1,quantity:0,final_bill:0, cloth:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
    
}

func nextOrPrevItemViewOrdersView (url:String) async -> UserOrderResponse
{
    guard let url = URL(string:url) else {
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
        return UserOrderResponse(current_page:1,data:[OrderResponseData(id:1, total:1, status: "String", order_key:1,quantity:0,final_bill:0, cloth:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
        
        
    }
    do{
        
        let (job, _) = try! await session.data(for:request)
        let obj = try JSONDecoder().decode(UserOrderResponse.self, from:job)
        print(obj)
             return obj
    }catch{
       print("\(error)")
    }
            
            
            
        
    
    
     return UserOrderResponse(current_page:1,data:[OrderResponseData(id:1, total:1, status: "String", order_key:1,quantity:0,final_bill:0, cloth:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
    
}
