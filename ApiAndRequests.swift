//
//  ApiAndRequests.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-27.
//

import Foundation
    
   let  url = "https://courseworkbackend-b793e777959e.herokuapp.com/api/"
   let session = URLSession.shared
   func login(email:String,password:String)->Bool{
       
       struct loginResponse:Hashable,Codable{
        let role:String
        let token:String
       }
       var res = false
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
           }
       res = false
       session.dataTask(with:request){data,response,error in
               if let error = error {
                   res = false
                   return
               }
            
               guard let httpResponse = response as? HTTPURLResponse else {
                   res = false
                   return
               }
               
               if httpResponse.statusCode == 200 {
                   res = true
                   // Handle data returned from the server
                   if let data = data {
                       // Parse and handle the response data
                       do{
                           let newVal = try JSONDecoder().decode(loginResponse.self, from: data)
                           UserDefaults.standard.set(newVal.token , forKey:"token")
                           UserDefaults.standard.set(newVal.role , forKey:"role")
                       }catch{
                           res = false
                       }
                   }
                   
               } else {
                   res = false
               }
               
           }.resume()
           
       
       return res
    }

