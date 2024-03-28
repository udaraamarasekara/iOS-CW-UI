//
//  LoginView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-26.
//

import SwiftUI

struct LoginView: View {
    @State private var email=""
    @State private var password=""
    @State private var loginStatus = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
                
                VStack{
                    Text("Login").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                    
                    ReusableTextView(text:$email, placeholder:"Email")
                    ReusableTextView(text:$password, placeholder:"Password")
                    
                    
                    HStack{
                        Button {
                            
                        }label:{
                            Text("Quit").padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                .padding(.vertical,8)
                            .foregroundStyle(Color.black)}
                        Spacer()
                        
                        Button {
                           email =  login(email: email, password:password)
                        }label:{
                            Text("login").padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                .padding(.vertical,8)
                            .foregroundStyle(Color.black)}
                    }.padding(.vertical)
                    
                    NavigationLink(destination:RegistrationView()){
                        Text("Register now!").foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )               }}
            }
            
        }.buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    LoginView()
}
