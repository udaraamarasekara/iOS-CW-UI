//
//  EditAccountViewPartTwo.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI

struct EditAccountViewPartTwo: View {
    var userName=""
         var password_confirmation=""
         var email=""
         var password=""
        @State private var card_number=""
        @State private var expired_date=""
        @State private var account_name=""
        @State private var cvv=""
        @State private var path = NavigationPath()
        var body: some View {
            ZStack{
                Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
                
                VStack{
                    Text("Account").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                    ReusableTextView(text:$card_number, placeholder:"Card number")
                    ReusableTextView(text:$account_name, placeholder:"Account name")
                    ReusableTextView(text:$expired_date, placeholder:"Expired date (yyyy-mm-dd)")
                    ReusableTextView(text:$cvv, placeholder:"CVV")
                   
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
                            Text("Save").padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                .padding(.vertical,8)
                            .foregroundStyle(Color.black)}
                    }.padding(.vertical)

                    Text("Login instead!").foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                    
                }
            }
                
            }
}

#Preview {
    EditAccountViewPartTwo()
}
