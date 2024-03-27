//
//  ApiAndRequests.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-27.
//

import Foundation
    
   let  url = "https://courseworkbackend-b793e777959e.herokuapp.com/api/"
   let session = URLSession.shared
var token = ""
var role = ""
   func login(email:String,password:String)->Any{
       
       struct loginResponse:Hashable,Codable{
        let role:String
        let token:String
       }
       var res:Any = ""
      guard let endpoint = URL(string:url+"sanctum/token")else{return "" }
       var request = URLRequest(url:endpoint)
       request.httpMethod = "POST"
       let requestData:[String:Any]=[
        "email":email,
        "password":password,
        "device_name":"apple"
       ]
       do {
               request.httpBody = try JSONSerialization.data(withJSONObject: requestData)
           } catch {
               res=false
               
           }       
       let task = session.dataTask(with:request){data,response,error in
           
           if let error = error {
               res = false
               return
           }
           
           guard let httpResponse = response as? HTTPURLResponse else {
           res = false
               return
           }
           
           if httpResponse.statusCode == 200 {
               print("Request succeeded!")
               // Handle data returned from the server
               if let data = data {
                   // Parse and handle the response data
                   do{
                       let newVal = try JSONDecoder().decode(loginResponse.self, from: data)
                       token = newVal.token
                        res = newVal
                   }catch{
                       
                   }
               }
                   
           } else {
               res = false
           }
           
       }
           // Resume the task
           task.resume()
       
           
       return res
    }

