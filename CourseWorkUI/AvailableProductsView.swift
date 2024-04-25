//
//  AvailableProductsView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI

struct AvailableProductsView: View {
    @State private var search=""
    @State var response:ClothWholeResponse
    @State var isError = false
    @Binding var path:NavigationPath
    var body: some View {
        
        ZStack{
            Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
            VStack{
                Text("Available Products").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                ReusableTextView(text:$search, placeholder:"Search").padding(.vertical)
                
                
                
                ZStack(alignment:.top)
                {
                    VStack{
                        if response.data.isEmpty{
                            Text("No Products!").background(Color(red:217/255,green: 217/255,blue:217/255)                        )}
                        else{
                            AsyncImage(url:URL(string:imageUrl+response.data[0].image.data[0].image)){
                                image in
                                image.image?.resizable().aspectRatio(contentMode:.fill)
                            }.frame(maxWidth:.infinity,maxHeight:200,alignment:.center)
                                .clipped()
                            
                            HStack{
                                Text("ItemName : "+response.data[0].name).font(.system(size: 26)).padding()
                                Spacer()
                                Text("Price : "+response.data[0].price).font(.system(size: 26)).padding()
                                
                                
                            }
                            HStack{
                                Button {
                                    path.append(response.data[0])
                                }label:{
                                    Text("Order").padding()
                                        .frame(maxWidth: .infinity).background(Color(red:86/255,green:217/255,blue:226/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                        .padding(.vertical,8)
                                    .foregroundStyle(Color.black)}
                                Spacer()
                                
                                Button {
                                    Task{
                                        let images = await clothImagesNextOrPrev(urlRow:"getClothImages/\(response.data[0].id)?page=1")
                                        path.append(DetailedCloth(id: UUID(), data:response, img:images))
                                        
                                    }
                                }label:{
                                    Text("View more").padding()
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:189/255,green:226/255,blue:86/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                        .padding(.vertical,8)
                                    .foregroundStyle(Color.black)}
                            }.padding(.vertical)
                            
                            
                        }
                        
                        
                    }
                    
                } .background(Color(red:245/255,green:245/255,blue:245/255))
                    .cornerRadius(20).padding(.horizontal,24)
                
                HStack{
                    Button {
                        Task{
                            if response.prev_page_url != nil
                            {
                                
                                var imgpg = response.data[0].image.first_page_url
                                if response.data[0].image.next_page_url != nil
                                {
                                    imgpg = response.data[0].image.next_page_url
                                }
                                response = await allClothesNextOrPrev(urlRow:response.prev_page_url ?? "",imgpg:imgpg ?? "")
                            }
                            else
                            {
                                path.append("welcome")
                            }
                        }
                    }label:{
                        Text("Back").padding()
                        
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)}
                    Spacer()
                    
                    Button {
                        Task{
                            if response.next_page_url != nil
                            {
                                var imgpg = response.data[0].image.first_page_url
                                if response.data[0].image.next_page_url != nil
                                {
                                    imgpg = response.data[0].image.next_page_url
                                }
                                
                                response = await allClothesNextOrPrev(urlRow:response.next_page_url ?? "",imgpg:imgpg ?? "")
                            }
                            else
                            {
                                UserDefaults.standard.setValue("No more data!",forKey:"error")
                                isError = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    isError = false
                                }
                            }
                        }
                    }label:{
                        Text("Next").padding()
                        
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)}
                    
                    
                }.padding(.vertical,30).padding(.horizontal,10)

            }
            
            if (isError){ ErrorPopupView()
            }
            
        }
        
    }}


