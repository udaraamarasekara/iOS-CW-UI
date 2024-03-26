//
//  ProductDiscriptionView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-25.
//

import SwiftUI

struct ProductDiscriptionView: View {
    @State private var discription=""
    @State private var itemName=""
     var body: some View {
        
         ZStack{
             Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
             VStack{
                 Text("Order->").foregroundStyle( Color(red:127/255,green:123/255,blue:13/255)).padding(.horizontal,24).frame(maxWidth:/*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.trailing).padding()
                 Text(itemName).font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                 
                 
                 Text("order").fontWeight(.semibold)
                     

                 
                 
                 HStack{
                     Button {
                         
                     }label:{
                         Text("Back").padding()
                             .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)                             .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                             .padding(.vertical,8)
                         .foregroundStyle(Color.black) .padding(.vertical,30)                       }
                     Spacer()
                     
                     Button {
                         
                     }label:{
                         Text("Next").padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)                             .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                         
                         .foregroundStyle(Color.black) .padding(.vertical,30)                    }}
                 
                 
                 
                 
                 Text("<-Back").foregroundStyle( Color(red:127/255,green:123/255,blue:13/255)).padding(.horizontal,24).frame(maxWidth:/*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.trailing).padding()             }.padding()
         }
         }
}

#Preview {
    ProductDiscriptionView()
}
