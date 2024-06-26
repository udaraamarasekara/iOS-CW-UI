//
//  EditAccountView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI

struct EditAccountView: View {
    @State private var userName=""
       @State private var password_confirmation=""
       @State private var email=""
       @State private var password=""
    @Binding var path:NavigationPath
    var body: some View {
        ZStack{
            Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
            
            VStack{
                Text("Account").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                ReusableTextView(text:$userName, placeholder:"User name")
                ReusableTextView(text:$email, placeholder:"Email")
                ReusableTextView(text:$password, placeholder:"Password")
                ReusableTextView(text:$password_confirmation, placeholder:"Password confirmation")
                
                HStack{
                    Button {
                        path.removeLast()
                    }label:{
                        Text("Back").padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)    .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black)}
                    Spacer()
                    
                    Button {
                        path.append(RegistrationRequestDataTwo(id:UUID(),userName: userName, email: email, password:password, passwordConfirmation:password_confirmation)
                              )
                    }label:{
                        Text("Next").padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)      .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black)}
                }.padding(.vertical)

            }
        }
            
        }
}

