//
//  RegistrationView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI

struct RegistrationView: View {
    @State  var userName=""
    @Binding var path:NavigationPath

       @State  var password_confirmation=""
       @State  var email=""
       @State  var password=""
       @State var isActive = false
    @State var data = RegistrationRequestData(id:UUID(),userName: "", email: "", password:"", passwordConfirmation:"")
    var body: some View {
            ZStack{
                Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
                
                VStack{
                    Text("Register").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                    ReusableTextView(text:$userName, placeholder:"User name")
                    ReusableTextView(text:$email, placeholder:"Email")
                    ReusableTextView(text:$password, placeholder:"Password")
                    ReusableTextView(text:$password_confirmation, placeholder:"Password confirmation")
                    
                    HStack{
                        Button {
                            exit(0)
                        }label:{
                            Text("Quit").padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                .padding(.vertical,8)
                            .foregroundStyle(Color.black)}
                        Spacer()
                        NavigationLink(value:RegistrationRequestData(id:UUID(),userName: userName, email: email, password:password, passwordConfirmation:password_confirmation) ){                               Button {
                            
                        }label:{
                            Text("Next").padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                .padding(.vertical,8)
                            .foregroundStyle(Color.black)}
                            .padding(.vertical)}}
                    NavigationLink(value:"login"){Text("Login instead!").foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )              } }
            
            
        }}
           
}


