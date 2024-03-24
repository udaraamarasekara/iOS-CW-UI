//
//  RegistrationView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var userName=""
       @State private var password_confirmation=""
       @State private var email=""
       @State private var password=""
       var body: some View {
           ZStack{
               Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
               
               VStack{
                   Text("Register").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                   ReusableTextView(text:$userName, placeholder:"User name")
                   ReusableTextView(text:$email, placeholder:"Email")
                   ReusableTextView(text:$password, placeholder:"Password")
                   ReusableTextView(text:$password_confirmation, placeholder:"Password confirmation")
                   Text("Login instead!").foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                   HStack{
                       Button {
                           
                       }label:{
                           Text("Quit").padding()
                               .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                               .padding(.vertical,8)
                               .foregroundStyle(Color.black).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)                       }
                   Spacer()
                       
                       Button {
                           
                       }label:{
                           Text("Next").padding()
                               .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                               .padding(.vertical,8)
                           .foregroundStyle(Color.black).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)                       }
                   }
               }
           }
               
           }
}

#Preview {
    RegistrationView()
}
