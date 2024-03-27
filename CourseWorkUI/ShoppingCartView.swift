//
//  ShoppingCartView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-26.
//

import SwiftUI

struct ShoppingCartView: View {
    private var orders = ["",""]

    var body: some View {
        ZStack{
            Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
            
            VStack{
                
                HStack{
                    Text("Shopping cart").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) ).padding(.horizontal,24)
                    Spacer()
                    Text("+").font(.system(size:36)).bold().padding().background((Color(red:195/255,green:184/255,blue:83/255))).clipShape(Circle()).padding(.horizontal,24)}
                ForEach(orders,id:\.self){
                order in
                    Text(order)
                    
                }
                HStack{
                    Button {
                        
                    }label:{
                        Text("Back").padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black)}
                Spacer()
                    
                    Button {
                        
                    }label:{
                        Text("Place Order").padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black)}
                }.padding(.vertical)
                              }
        }
            
        }
}

#Preview {
    ShoppingCartView()
}
