//
//  NewProductView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-26.
//

import SwiftUI

struct NewProductView: View {
    @State private var name=""
       @State private var price=""
       @State private var color=""
       @State private var size=""
       var body: some View {
           ZStack{
               Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
               
               VStack{
                   Text("New Product").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                   ReusableTextView(text:$name, placeholder:"Product name name")
                   ReusableTextView(text:$price, placeholder:"price")
                   ReusableTextView(text:$color, placeholder:"Color")
                   ReusableTextView(text:$size, placeholder:"Size")
                   
                   HStack{
                       Button {
                           
                       }label:{
                           Text("Quit").padding()
                               .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                               .padding(.vertical,8)
                           .foregroundStyle(Color.black)}
                   Spacer()
                       
                       Button {
                           
                       }label:{
                           Text("Next").padding()
                               .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                               .padding(.vertical,8)
                           .foregroundStyle(Color.black)}
                   }.padding(.vertical)
                                 }
           }
               
           }
}

#Preview {
    NewProductView()
}
