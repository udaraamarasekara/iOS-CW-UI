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
    @Binding var path:NavigationPath
    @State var data = NewProductData(id:UUID(),name: "", price: "", color:"", size:"")
    
       var body: some View {
           ZStack{
               Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
               
               VStack{
                   Text("New Product").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                   ReusableTextView(text:$name, placeholder:"Product name")
                   ReusableTextView(text:$price, placeholder:"price")
                   ReusableTextView(text:$color, placeholder:"Color")
                   ReusableTextView(text:$size, placeholder:"Size")
                   
                   HStack{
                       Button {
                           path.removeLast()
                       }label:{
                           Text("Back").padding()
                               .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                               .padding(.vertical,8)
                           .foregroundStyle(Color.black)}
                   Spacer()
                       
                       Button {
                           path.append(NewProductData(id: UUID(), name:name, price: price, color: color, size: size))
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

