//
//  ViewOrdersView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI

struct ViewOrdersView: View {
    var response:UserOrderResponse
    var body: some View {
        
        
        ZStack{
            Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
            
            VStack{
                Text("Your Orders").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                if(response.currentPage == 0)
                {
                    Text("You have no orders!").fontWeight(.semibold)
                }
                else
                {
                    ForEach(response.data)
                    {
                        element in
                        VStack{
                            Text("Order status :"+" "+element.status)
                            Text("Total items  :"+" "+"\(element.items)")
                            Text("Total price  :"+" "+"\(element.total)")
                           }
                        }
                }
                    
                HStack{
                    Button {
                        
                    }label:{
                        Text("Back").padding()
                        
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)}
                    Spacer()
                    
                    Button {
                        
                    }label:{
                        Text("Next").padding()
                        
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)}
                }
            }}}
}


