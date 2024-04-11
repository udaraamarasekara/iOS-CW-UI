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
   let imageUrl = "https://courseworkbackend-b793e777959e.herokuapp.com/photos/"
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
    let from: Int?
    let last_page: Int
    let last_page_url: String?
    let links: [Links]
    let next_page_url: String?
    let path: String
    let per_page: Int
    let prev_page_url: String?
    let to: Int?
    let total: Int

   
}
struct AdminOrderResponse: Codable,Hashable {
    let current_page: Int
    let data: [AdminOrderResponseData]
    let first_page_url: String?
    let from: Int?
    let last_page: Int
    let last_page_url: String?
    let links: [Links]
    let next_page_url: String?
    let path: String
    let per_page: Int
    let prev_page_url: String?
    let to: Int?
    let total: Int

   
}
struct Links:Codable,Hashable{
 let url:String?
 let label:String
 let active:Bool
}
struct OrderResponseData:Codable,Identifiable,Hashable{
      let id: Int
      let total: String
      let status: String
      let order_key: Int
      let quantity: Int
    let final_bill: Int
    let cloth : String
}
struct AdminOrderResponseData:Codable,Identifiable,Hashable{
      let id: Int
      let total: String
      let status: String
      let order_key: Int
      let quantity: Int
    let final_bill: Int
    let cloth : String
    let user : String
}

struct ClothData:Codable,Identifiable,Hashable{
      let id: Int
      let name: String
      let size: String
      let description: String
      let color: String
    let price: String
    let Image : String
    let created_at:String
    let updated_at:String
    let images:[ImageDummy]
    let first_page_url: String?
    let from: Int?
    let last_page: Int
    let last_page_url: String?
    let links: [Links]
    let next_page_url: String?
    let path: String
    let per_page: Int
    let prev_page_url: String?
    let to: Int?
    let total: Int
}

struct ImageDummy:Codable,Hashable{
let current_page:Int
let data:[ImageDataDummy]
    let first_page_url: String?
    let from: Int?
    let last_page: Int
    let last_page_url: String?
    let links: [Links]
    let next_page_url: String?
    let path: String
    let per_page: Int
    let prev_page_url: String?
    let to: Int?
    let total: Int
}

struct ImageDataDummy:Codable,Hashable{
    let id:Int
    let created_at:String
    let updated_at:String
    let image:String
    let cloth_id:Int
}

struct ClothWholeResponse:Codable,Hashable{
    let current_page:Int
    let data:[ClothData]
    let first_page_url: String?
    let from: Int?
    let last_page: Int
    let last_page_url: String?
    let links: [Links]
    let next_page_url: String?
    let path: String
    let per_page: Int
    let prev_page_url: String?
    let to: Int?
    let total: Int}

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
        return UserOrderResponse(current_page:0,data:[OrderResponseData(id:1, total:"1", status: "String", order_key:1,quantity:0,final_bill:0, cloth:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
        
        
    }
    do{
        
        let (job, _) = try! await session.data(for:request)
        let obj = try JSONDecoder().decode(UserOrderResponse.self, from:job)
        print(obj)
             return obj
    }catch{
       print("\(error)")
    }
            
            
            
        
    
    
    return UserOrderResponse(current_page:0,data:[OrderResponseData(id:1, total:"1", status: "String", order_key:1,quantity:0,final_bill:0, cloth:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
    
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
        return UserOrderResponse(current_page:0,data:[OrderResponseData(id:1, total:"1", status: "String", order_key:1,quantity:0,final_bill:0, cloth:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
        
        
    }
    do{
        
        let (job, _) = try! await session.data(for:request)
        let obj = try JSONDecoder().decode(UserOrderResponse.self, from:job)
        print(obj)
             return obj
    }catch{
       print("\(error)")
    }
            
            
            
        
    
    
     return UserOrderResponse(current_page:0,data:[OrderResponseData(id:1, total:"1", status: "String", order_key:1,quantity:0,final_bill:0, cloth:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
    
}
func adminOrders  () async -> AdminOrderResponse {
    guard let url = URL(string:url+"adminOrders") else {
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
        return AdminOrderResponse(current_page:0,data:[AdminOrderResponseData(id:1, total:"1", status: "String", order_key:1,quantity:0,final_bill:0, cloth:"",user:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
        
        
    }
    do{
        
        let (job, _) = try! await session.data(for:request)
        let obj = try JSONDecoder().decode(AdminOrderResponse.self, from:job)
        print(obj)
             return obj
    }catch{
       print("\(error)")
    }
            
            
            
        
    
    return AdminOrderResponse(current_page:0,data:[AdminOrderResponseData(id:1, total:"1", status: "String", order_key:1,quantity:0,final_bill:0, cloth:"",user:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
    
    
}

func nextOrPrevItemViewOrdersView (url:String) async -> AdminOrderResponse
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
        return AdminOrderResponse(current_page:0,data:[AdminOrderResponseData(id:1, total:"1", status: "String", order_key:1,quantity:0,final_bill:0, cloth:"",user:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
        
        
    }
    do{
        
        let (job, _) = try! await session.data(for:request)
        let obj = try JSONDecoder().decode(AdminOrderResponse.self, from:job)
        print(obj)
             return obj
    }catch{
       print("\(error)")
    }
            
            
            
        
    
    
    return AdminOrderResponse(current_page:0,data:[AdminOrderResponseData(id:1, total:"1", status: "String", order_key:1,quantity:0,final_bill:0, cloth:"",user:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
    
}

func updateOrderStatus(order_key:Int,status:String) async -> Bool
{
    struct updatedStatus:Codable{
        let message:String
    }
    guard let endpoint = URL(string:url+"editOrderStatus")else{return false }
    var request = URLRequest(url:endpoint)
    request.httpMethod = "POST"
    let requestData:[String:Any]=[
        "order_key":order_key,
        "status":status,
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
        let obj =  try JSONDecoder().decode(updatedStatus.self, from:job)
        if obj.message == "Status updated!"
        {
            res = true

        }
        else{
            res = false
        }
            
        return res
    }catch{
        
     return false
    }
}


func allClothes  () async -> ClothWholeResponse {
    guard let url = URL(string:url+"adminOrders") else {
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
        return ClothWholeResponse(current_page: 0, data: [ClothData(id: 0, name: "", size: "", description: "", color:"", price:"", Image: "", created_at: "", updated_at: "", images: [ImageDummy(current_page: 0, data: [ImageDataDummy(id: 0, created_at: "", updated_at: "", image: "", cloth_id: 0)], first_page_url:nil, from: nil, last_page: 0, last_page_url:nil, links: [Links(url: "", label: "", active: false)], next_page_url:"", path:"" , per_page: 0, prev_page_url: nil, to:0, total:0)], first_page_url:nil, from: 0, last_page: 0, last_page_url: nil, links: [Links(url:nil, label: "", active: false)], next_page_url: nil, path:"", per_page: 0, prev_page_url: nil, to: 0, total: 0)], first_page_url: nil, from: 0, last_page:0, last_page_url: nil, links: [Links(url: nil, label:"", active: false)], next_page_url: nil, path: "", per_page: 0, prev_page_url: nil, to:nil, total:0)
        
    }
    do{
        
        let (job, _) = try! await session.data(for:request)
        let obj = try JSONDecoder().decode(ClothWholeResponse.self, from:job)
        print(obj)
             return obj
    }catch{
       print("\(error)")
    }
            
            
            
        
    
    
    return ClothWholeResponse(current_page: 0, data: [ClothData(id: 0, name: "", size: "", description: "", color:"", price:"", Image: "", created_at: "", updated_at: "", images: [ImageDummy(current_page: 0, data: [ImageDataDummy(id: 0, created_at: "", updated_at: "", image: "", cloth_id: 0)], first_page_url:nil, from: nil, last_page: 0, last_page_url:nil, links: [Links(url: "", label: "", active: false)], next_page_url:"", path:"" , per_page: 0, prev_page_url: nil, to:0, total:0)], first_page_url:nil, from: 0, last_page: 0, last_page_url: nil, links: [Links(url:nil, label: "", active: false)], next_page_url: nil, path:"", per_page: 0, prev_page_url: nil, to: 0, total: 0)], first_page_url: nil, from: 0, last_page:0, last_page_url: nil, links: [Links(url: nil, label:"", active: false)], next_page_url: nil, path: "", per_page: 0, prev_page_url: nil, to:nil, total:0)
}
