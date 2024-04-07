//
//  WelcomeView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-28.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var path:NavigationPath
    @State var response =  UserOrderResponse( currentPage:1,data:[OrderResponseData(id:1, total:1, status: "String", orderKey:1, items: 1)], firstPageUrl: "String", from:0, lastPage: 1, lastPageUrl: "String", links: [Links(id:1,url: "", label: "String", active: true)], nextPageUrl: "String",path:"",perPage: 1,prevPageUrl: "String", to: 2, total: 3)

    var body: some View {
        ZStack{
            Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
            
            VStack{
                Text("Welcome").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                
                
                
                Button {
                    Task{
                        response = await userOrders()
                            path.append(response)
                        
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
            }}
    }
    
}
        


