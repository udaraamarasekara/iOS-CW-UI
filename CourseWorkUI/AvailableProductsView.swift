//
//  AvailableProductsView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI

struct AvailableProductsView: View {
    @State private var search=""
    @State private var itemName=""
    @State private var price=""
    var body: some View {
        
        ZStack{
            Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
            VStack{
                Text("Available Products").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                ReusableTextView(text:$search, placeholder:"Search").padding(.vertical)
                
                
                
                
                ZStack(alignment:.top)
                {
                    VStack{
                        AsyncImage(url:URL(string:"https://picsum.photos/id/1/200/300")){
                            image in
                            image.image?.resizable().aspectRatio(contentMode:.fill)
                        }.frame(maxWidth:.infinity,maxHeight:200,alignment:.center)
                            .clipped()
                        
                        HStack{
                            Text("ItemName : "+itemName).font(.system(size: 26)).padding()
                            Spacer()
                            Text("ItemName : "+itemName).font(.system(size: 26)).padding()
                            
                            
                        }
                        HStack{
                            Button {
                                
                            }label:{
                                Text("Order").padding()
                                    .frame(maxWidth: .infinity).background(Color(red:86/255,green:217/255,blue:226/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                    .padding(.vertical,8)
                                .foregroundStyle(Color.black)}
                            Spacer()
                            
                            Button {
                                
                            }label:{
                                Text("Vier more").padding()
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:189/255,green:226/255,blue:86/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                                    .padding(.vertical,8)
                                .foregroundStyle(Color.black)}
                        }.padding(.vertical)
                        
                        
                    }
                    
                    
                    
                    
                } .background(Color(red:245/255,green:245/255,blue:245/255))
                    .cornerRadius(20).padding(.horizontal,24)
                
                HStack{
                    Button {
                        
                    }label:{
                        Text("Back").padding()
                        
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)}
                    Spacer()
                    
                    Button {
                        
                    }label:{
                        Text("Next").padding()
                        
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)}
                    
                    
                }.padding(.vertical,30).padding(.horizontal,10)

            }
            
            
        }
        
    }}

#Preview {
    AvailableProductsView()
}
