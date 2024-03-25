//
//  DetailedProductView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-25.
//

import SwiftUI

struct DetailedProductView: View {
    @State private var size=""
    @State private var color="redda"
    @State private var image="gaana"
    @State private var itemName=""
     var body: some View {
        
         ZStack{
             Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
             VStack{
                 Text(itemName).font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                 
                 
                 
                 
                 
                 
                 AsyncImage(url:URL(string:"https://picsum.photos/id/1/200/300")){
                     image in
                     image.image?.resizable().aspectRatio(contentMode:.fill)
                 }.frame(maxWidth:.infinity,maxHeight:300,alignment:.topLeading)                     .cornerRadius(20)
.clipped().padding(.vertical,8)
                     .padding(.horizontal,24)
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
                 
                 Text("Size :" + size).padding()
                 
                 
                     .foregroundColor(.black.opacity(0.5)).font(.system(size:22, weight:.semibold)).frame(maxWidth:.infinity).background(Color(red:245/255,green:245/255,blue:245/255)).padding(.horizontal,24).padding(.vertical,8)
                
                 Text("Color :" + color).padding()
                     .foregroundColor(.black.opacity(0.5)).font(.system(size:22, weight:.semibold)).frame(maxWidth:.infinity).background(Color(red:245/255,green:245/255,blue:245/255)).padding(.horizontal,24)
             }.padding()
         }
         }
                    
            
}

#Preview {
    DetailedProductView()
}
