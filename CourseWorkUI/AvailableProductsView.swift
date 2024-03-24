//
//  AvailableProductsView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI

struct AvailableProductsView: View {
    @State private var search=""
    @State private var itemName="redda"
    @State private var price="gaana"
    var body: some View {
        
            ZStack{
                Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
                    VStack{
                        Text("Available Products").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                        ReusableTextView(text:$search, placeholder:"Search")
                        
                        
                        
                       
                            ZStack(alignment:.center)
                            {
                                VStack{
                                    AsyncImage(url:URL(string:"https://picsum.photos/id/1/200/300")){
                                                                   image in
                                                                   image.image?.resizable().aspectRatio(contentMode:.fill)
                                    }.padding().frame(width:280,height:240,alignment:.topLeading).clipped()
                                    HStack{        Text(itemName).bold().padding()
                                   
                                        Spacer()
                                        Text(price).bold().padding()
                                         
                                        
                                    }
                                    
                                    HStack{
                                        Button {
                                            
                                        }label:{
                                            Text("Order").padding()
                                                .background(Color(Color(red:189/255,green:226/255,blue:86/255))).fontWeight(.semibold)   .padding(.horizontal,24)
                                                .padding(.vertical,8)
                                            .foregroundStyle(Color.black).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.center)                       }.frame(width:180)
                           
                                        Button {
                                            
                                        }label:{
                                            Text("View more").padding()
                                                .background(Color(red:86/255,green:217/255,blue:226/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                                .padding(.vertical,8)
                                            .foregroundStyle(Color.black).frame(maxWidth: .infinity,alignment:.center)                       }.frame(width:180)
                                        
                                        
                                    }.padding()
                                }
                                .padding().frame(width: 280).frame(width: 350,height: 400).background(Color.white)
                            }.cornerRadius(20)
                        HStack{
                            Button {
                                
                            }label:{
                                Text("Back").padding()
                                    .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                    .padding(.vertical,8)
                                .foregroundStyle(Color.black).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)                       }.padding(.vertical,30)
                        Spacer()
                            
                            Button {
                                
                            }label:{
                                Text("Next").padding()
                                    .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                    .padding(.vertical,8)
                                .foregroundStyle(Color.black).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/) .padding(.vertical,30)                      }
                        }
                        }
                        
                       
                    
            }   }
}

#Preview {
    AvailableProductsView()
}
