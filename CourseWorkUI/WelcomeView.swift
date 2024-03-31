//
//  WelcomeView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-28.
//

import SwiftUI

struct WelcomeView: View {
    @State private var path = NavigationPath()
    @State var response = CommonResponse(data: [OrderResponseData(id: 0, total: 0, status: "", order_key: 0, items: 0)], current_page: 0, first_page_url: "", last_page: 0, last_page_url:"", links: [Links(url: "", label:"", active: false)], next_page_url: "", prev_page_url: "", to: 0, total:0)
        var body: some View {
        NavigationStack(path:$path){            ZStack{
                Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
                
                VStack{
                    Text("Welcome").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                    
                    
                    
                    Button {
                        Task{
                            response = await userOrders()
                            path.append("ViewOrdersView")
                        }
                    }            label:{
                        Text("Orders").padding()
                            .frame(maxWidth: .infinity).background(Color(red:189/255,green:226/255,blue:86/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black)}
                    Button {
                        
                    }            label:{
                        Text("Products").padding()
                            .frame(maxWidth: .infinity).background(Color(red:189/255,green:226/255,blue:86/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black)}
                    Button {
                        
                    }            label:{
                        Text("Account").padding()
                            .frame(maxWidth: .infinity).background(Color(red:189/255,green:226/255,blue:86/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black)}
                }
            }
            }.navigationDestination(for: String.self){
                view in
                if (view=="ViewOrdersView")
                {
                    ViewOrdersView( response:$response)
                }        }
        } }
        

#Preview {
    WelcomeView()
}
