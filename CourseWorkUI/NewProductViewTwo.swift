//
//  NewProductViewTwo.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-26.
//

import SwiftUI

struct NewProductViewTwo: View {
     private var name=""
       private var price=""
        private var color=""
       private var size=""
       @State private var discription=""
       var body: some View {
           ZStack{
               Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
               
               VStack{
                   Text("New product").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                   TextField("Product description",text:$discription).frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.top).padding()
                       .background(Color(red:245/255,green:245/255,blue:245/255))
                       .padding(.horizontal,24)
                       .padding(.vertical,8)
                       .foregroundColor(.black.opacity(0.5)).font(.system(size:22, weight:.semibold))
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
    NewProductViewTwo()
}
