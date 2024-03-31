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
        
        UserDefaults.standard.set(obj.token, forKey:"token")
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
struct CommonResponse:Codable{
    let data:[OrderResponseData]
    let current_page:Int
    let first_page_url:String
    let last_page:Int
    let last_page_url:String
    let links:[Links]
    let next_page_url:String
    let prev_page_url:String
    let to :Int
    let total:Int
    
}
struct Links:Codable{
 let url:String
 let label:String
 let active:Bool
}
struct OrderResponseData:Codable,Identifiable{
    let id:Int
    let total :Float
    let status:String
    let order_key:Int
    let items:Int
}

func userOrders()async->CommonResponse{
    let currentToken = UserDefaults.standard.string(forKey: "token")
    guard let endpoint = URL(string:url+"")else{return CommonResponse(data: [OrderResponseData(id: 0, total: 0, status: "", order_key: 0, items: 0)], current_page: 0, first_page_url: "", last_page: 0, last_page_url:"", links: [Links(url: "", label:"", active: false)], next_page_url: "", prev_page_url: "", to: 0, total:0)}
    var request = URLRequest(url:endpoint)
    request.httpMethod = "GET"
    
    request.setValue( "Bearer \(String(describing: currentToken))", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    UserDefaults.standard.set("Something went wrong", forKey:"error")
    
    do{
        let (job, _) = try await  session.data(for:request)
        let obj = try JSONDecoder().decode(CommonResponse.self, from: job)
        return obj
    }catch{
         return CommonResponse(data: [OrderResponseData(id: 0, total: 0, status: "", order_key: 0, items: 0)], current_page: 0, first_page_url: "", last_page: 0, last_page_url:"", links: [Links(url: "", label:"", active: false)], next_page_url: "", prev_page_url: "", to: 0, total:0)   }
}
