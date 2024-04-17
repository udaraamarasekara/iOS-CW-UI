//
//  WelcomeView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-28.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var path:NavigationPath
    @State var response =  UserOrderResponse(current_page:0,data:[OrderResponseData(id:1, total:"1", status: "String", order_key:1,quantity:0,final_bill:0, cloth:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
    @State var adminResponse =  AdminOrderResponse(current_page:0,data:[AdminOrderResponseData(id:1, total:"1", status: "String", order_key:1,quantity:0,final_bill:0, cloth:"",user:"")], first_page_url:nil, from:0, last_page: 1, last_page_url: nil, links: [Links( url: "", label: "String", active: true)], next_page_url: nil,path:"",per_page: 1,prev_page_url: nil, to: 2, total: 3)
    
    @State var clothResponse =   ClothWholeResponse(current_page: 0, data: [ClothData(id: 0, name: "", size: "", description: "", color:"", price:"", created_at: "", updated_at: "", image: ImageDummy(current_page: 0, data: [ImageDataDummy(id: 0, created_at: "", updated_at: "", image: "", cloth_id: 0)], first_page_url:nil, from: nil, last_page: 0, last_page_url:nil, links: [Links(url: "", label: "", active: false)], next_page_url:"", path:"" , per_page: 0, prev_page_url: nil, to:0, total:0))], first_page_url: nil, from: 0, last_page:0, last_page_url: nil, links: [Links(url: nil, label:"", active: false)], next_page_url: nil, path: "", per_page: 0, prev_page_url: nil, to:nil, total:0)
    var body: some View {
        ZStack{
            Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
            
            VStack{
                Text("Welcome").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                
                
                
                Button {
                    Task{
                        if(UserDefaults.standard.string(forKey:"role")=="admin")
                        {
                            adminResponse = await adminOrders()
                            path.append(adminResponse)}
                        else{
                            response = await userOrders()
                            path.append(response)
                        }
                    }
                }            label:{
                    Text("Orders").padding()
                        .frame(maxWidth: .infinity).background(Color(red:189/255,green:226/255,blue:86/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                        .padding(.vertical,8)
                    .foregroundStyle(Color.black)}
                Button {
                    Task{
                        clothResponse = await allClothes()
                        path.append(clothResponse)
                    }
                    
                    }            label:{
                    Text("Products").padding()
                        .frame(maxWidth: .infinity).background(Color(red:189/255,green:226/255,blue:86/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                        .padding(.vertical,8)
                    .foregroundStyle(Color.black)}
                if(UserDefaults.standard.string(forKey:"role")=="admin")
                {
                    Button {
                        path.append("newProduct")
                    }            label:{
                        Text("New Product").padding()
                            .frame(maxWidth: .infinity).background(Color(red:189/255,green:226/255,blue:86/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black)}
                }
                    Button {
                        path.append("account")
                }            label:{
                    Text("Account").padding()
                        .frame(maxWidth: .infinity).background(Color(red:189/255,green:226/255,blue:86/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                        .padding(.vertical,8)
                    .foregroundStyle(Color.black)}
                Button {
                    path.removeLast()
                }            label:{
                    Text("Back").padding()
                        .frame(maxWidth: .infinity).background(Color(red:189/255,green:226/255,blue:86/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                        .padding(.vertical,8)
                    .foregroundStyle(Color.black)}
            }}
    }
    
}
        


