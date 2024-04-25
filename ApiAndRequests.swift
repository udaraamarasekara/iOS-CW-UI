//
//  ApiAndRequests.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-27.
//

import Foundation
import SwiftUI
import UIKit
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
        print(String(data:job,encoding:.utf8))
        return res
    }catch{
return false    }
}

func updateAccount(email:String,password:String,passwordConfirmation:String,name:String,
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
        "cvv":cvv,
        "old_mail":UserDefaults.standard.string(forKey:"email") ?? ""
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
    let created_at:String
    let updated_at:String
    var image:ImageDummy
}

struct ImageDummy:Codable,Hashable{
let current_page:Int
    var data:[ImageDataDummy]
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
    var id:Int
    var created_at:String
    var updated_at:String
    var image:String
    var cloth_id:Int
}

struct ClothWholeResponse:Codable,Hashable{
    let current_page:Int
    var data:[ClothData]
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

struct ClothWholeResponseDescription:Codable,Hashable{
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
struct RegistrationRequestDataTwo:Codable,Identifiable,Hashable{
    let id:UUID
 let userName:String
let email:String
let password:String
let passwordConfirmation:String
}
struct RegistrationRequestDataTwoV2:Codable,Identifiable,Hashable{
    let id:UUID
 let userName:String
let email:String
let password:String
let passwordConfirmation:String
}
struct NewProductData:Codable,Identifiable,Hashable{
    let id:UUID
 let name:String
let price:String
let color:String
let size:String
}
struct NewProductDataTwo:Codable,Identifiable,Hashable{
    let id:UUID
 let name:String
let price:String
let color:String
let size:String
    let description:String
}
struct NewProductDataFinal:Identifiable{
    let id:UUID
 let name:String
let price:String
let color:String
let size:String
    let description:String
    let images:[UIImage]
}
struct DetailedCloth:Codable,Hashable{
    let id :UUID
    let data:ClothWholeResponse
    var img:ImageDummy
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
func getClothImages  (urlNow:String) async -> ImageDummy {
    guard let url = URL(string:url+urlNow) else {
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
        return  ImageDummy(current_page: 0, data: [ImageDataDummy(id: 0, created_at: "", updated_at: "", image: "", cloth_id: 0)], first_page_url:nil, from: nil, last_page: 0, last_page_url:nil, links: [Links(url: "", label: "", active: false)], next_page_url:"", path:"" , per_page: 0, prev_page_url: nil, to:0, total:0)
    }
    do{
        
        let (job, _) = try! await session.data(for:request)
        let obj = try JSONDecoder().decode(ImageDummy.self, from:job)
        print(obj)
        return obj
    }catch{
        print("\(error)")
    }
    
    
    
    
    
    
    return  ImageDummy(current_page: 0, data: [ImageDataDummy(id: 0, created_at: "", updated_at: "", image: "", cloth_id: 0)], first_page_url:nil, from: nil, last_page: 0, last_page_url:nil, links: [Links(url: "", label: "", active: false)], next_page_url:"", path:"" , per_page: 0, prev_page_url: nil, to:0, total:0)

}
func allClothes  () async -> ClothWholeResponse {
    guard let url = URL(string:url+"allCloths") else {
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
        return ClothWholeResponse(current_page: 0, data: [ClothData(id: 0, name: "", size: "", description: "", color:"", price:"", created_at: "", updated_at: "", image: ImageDummy(current_page: 0, data: [ImageDataDummy(id: 0, created_at: "", updated_at: "", image: "", cloth_id: 0)], first_page_url:nil, from: nil, last_page: 0, last_page_url:nil, links: [Links(url: "", label: "", active: false)], next_page_url:"", path:"" , per_page: 0, prev_page_url: nil, to:0, total:0))], first_page_url: nil, from: 0, last_page:0, last_page_url: nil, links: [Links(url: nil, label:"", active: false)], next_page_url: nil, path: "", per_page: 0, prev_page_url: nil, to:nil, total:0)
        
    }
    do{
        
        let (job, _) = try! await session.data(for:request)
        var obj = try JSONDecoder().decode(ClothWholeResponse.self, from:job)
        obj.data[0].image =  await getClothImages(urlNow:"getClothImages/\(obj.data[0].id)")
        print(obj)
             return obj
    }catch{
       print("\(error)")
    }
            
            
            
        
    
    
    return ClothWholeResponse(current_page: 0, data: [ClothData(id: 0, name: "", size: "", description: "", color:"", price:"", created_at: "", updated_at: "", image: ImageDummy(current_page: 0, data: [ImageDataDummy(id: 0, created_at: "", updated_at: "", image: "", cloth_id: 0)], first_page_url:nil, from: nil, last_page: 0, last_page_url:nil, links: [Links(url: "", label: "", active: false)], next_page_url:"", path:"" , per_page: 0, prev_page_url: nil, to:0, total:0))], first_page_url: nil, from: 0, last_page:0, last_page_url: nil, links: [Links(url: nil, label:"", active: false)], next_page_url: nil, path: "", per_page: 0, prev_page_url: nil, to:nil, total:0)
}
func allClothesNextOrPrev  (urlRow:String,imgpg:String) async -> ClothWholeResponse {
    guard let url = URL(string:urlRow) else {
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
        return ClothWholeResponse(current_page: 0, data: [ClothData(id: 0, name: "", size: "", description: "", color:"", price:"", created_at: "", updated_at: "", image: ImageDummy(current_page: 0, data: [ImageDataDummy(id: 0, created_at: "", updated_at: "", image: "", cloth_id: 0)], first_page_url:nil, from: nil, last_page: 0, last_page_url:nil, links: [Links(url: "", label: "", active: false)], next_page_url:"", path:"" , per_page: 0, prev_page_url: nil, to:0, total:0))], first_page_url: nil, from: 0, last_page:0, last_page_url: nil, links: [Links(url: nil, label:"", active: false)], next_page_url: nil, path: "", per_page: 0, prev_page_url: nil, to:nil, total:0)
        
    }
    do{
        
        let (job, _) = try! await session.data(for:request)
        var obj = try JSONDecoder().decode(ClothWholeResponse.self, from:job)
        
        obj.data[0].image =  await getClothImages(urlNow:"getClothImages/\(obj.data[0].id)")
        return obj
    }catch{
       print("\(error)")
    }
            
            
            
        
    
    
    return ClothWholeResponse(current_page: 0, data: [ClothData(id: 0, name: "", size: "", description: "", color:"", price:"", created_at: "", updated_at: "", image: ImageDummy(current_page: 0, data: [ImageDataDummy(id: 0, created_at: "", updated_at: "", image: "", cloth_id: 0)], first_page_url:nil, from: nil, last_page: 0, last_page_url:nil, links: [Links(url: "", label: "", active: false)], next_page_url:"", path:"" , per_page: 0, prev_page_url: nil, to:0, total:0))], first_page_url: nil, from: 0, last_page:0, last_page_url: nil, links: [Links(url: nil, label:"", active: false)], next_page_url: nil, path: "", per_page: 0, prev_page_url: nil, to:nil, total:0)
}

func clothImagesNextOrPrev  (urlRow:String) async -> ImageDummy {
    guard let url = URL(string:url+urlRow) else {
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
        return  ImageDummy(current_page: 0, data: [ImageDataDummy(id: 0, created_at: "", updated_at: "", image: "", cloth_id: 0)], first_page_url:nil, from: nil, last_page: 0, last_page_url:nil, links: [Links(url: "", label: "", active: false)], next_page_url:"", path:"" , per_page: 0, prev_page_url: nil, to:0, total:0)
        
    }
    do{
        
        let (job, _) = try! await session.data(for:request)
        let obj = try JSONDecoder().decode(ImageDummy.self, from:job)
        print(obj)
             return obj
    }catch{
       print("\(error)")
    }
            
            
            
        
    
    
     return  ImageDummy(current_page: 0, data: [ImageDataDummy(id: 0, created_at: "", updated_at: "", image: "", cloth_id: 0)], first_page_url:nil, from: nil, last_page: 0, last_page_url:nil, links: [Links(url: "", label: "", active: false)], next_page_url:"", path:"" , per_page: 0, prev_page_url: nil, to:0, total:0)
}



func placeOrder () async -> Bool {
   
    guard let url = URL(string:url+"newOrder") else {
        fatalError("Invalid URL")
    }
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("*/*", forHTTPHeaderField:"Accept")
    request.httpMethod = "POST"
    print(retrieveObjects())
    struct requestData:Codable{
        let row:[OrderObject]
        let email:String
    }
    struct responseData:Codable{
        let message:String
    }    
    
    
    let instance =
    
    requestData(row:retrieveObjects(),email:UserDefaults.standard.string(forKey:"email") ??  "")
    do{
        request.httpBody = try JSONEncoder().encode(instance)
        
    }
    catch{
        print("request error")
        return false
        
        
    }
    do{
        
        let (job, _) = try! await session.data(for:request)
        let obj = try JSONDecoder().decode(responseData.self, from:job)
        print(obj)
        storeObjects([])
             return true
    }catch{
       print("\(error)")
    }
            
            
            
        
    
    
    return true
    
}

extension Data{
    mutating func append(_ string :String){
        if let data = string.data(using:.utf8){
            self.append(data)
        }
    }
}

func newProduct (product:NewProductDataFinal) async -> Bool {
    let boundary = "Boundary-\(UUID().uuidString)"
    guard let url = URL(string:url+"newCloth") else {
        fatalError("Invalid URL")
    }
    var request = URLRequest(url: url)
    request.setValue("multipart/form-data; boundary=" + boundary, forHTTPHeaderField: "Content-Type")
    request.setValue("*/*", forHTTPHeaderField:"Accept")
    request.httpMethod = "POST"
    
    struct responseData:Codable{
        let message:String
    }
    
    
    
    
    do{
        
        
        var requestBody = Data()
        let lineBreak = "\r\n"
        
        requestBody.append("--\(boundary + lineBreak)")
        requestBody.append("Content-Disposition: form-data; name=\"name\"\(lineBreak + lineBreak)")
        requestBody.append("\(product.name + lineBreak)")
        
        requestBody.append("--\(boundary + lineBreak)")
        requestBody.append("Content-Disposition: form-data; name=\"color\"\(lineBreak + lineBreak)")
        requestBody.append("\(product.color + lineBreak)")
        
        requestBody.append("--\(boundary + lineBreak)")
        requestBody.append("Content-Disposition: form-data; name=\"price\"\(lineBreak + lineBreak)")
        requestBody.append("\(product.price + lineBreak)")
        
        requestBody.append("--\(boundary + lineBreak)")
        requestBody.append("Content-Disposition: form-data; name=\"size\"\(lineBreak + lineBreak)")
        requestBody.append("\(product.size + lineBreak)")
        
        requestBody.append("--\(boundary + lineBreak)")
        requestBody.append("Content-Disposition: form-data; name=\"description\"\(lineBreak + lineBreak)")
        requestBody.append("\(product.description + lineBreak)")
        for image in product.images {
            if let uuid = UUID().uuidString.components(separatedBy: "-").first {
                requestBody.append("--\(boundary + lineBreak)")
                requestBody.append("Content-Disposition: form-data; name=\"images[]\"; filename=\"\(uuid).jpg\"\(lineBreak)")
                requestBody.append("Content-Type: image/jpeg\(lineBreak + lineBreak)")
                requestBody.append(image.jpegData(compressionQuality:0)!)
                requestBody.append(lineBreak)
            }
            requestBody.append("--\(boundary)--\(lineBreak)")
            request.httpBody = requestBody
            do{
                
                let (job, _) = try! await session.data(for:request)
                print(String(data:job,encoding: .utf8) ?? "kela")
                storeObjects([])
                return true
            }
            
            
            
            
            
            
            
        }
    }
return false
}
