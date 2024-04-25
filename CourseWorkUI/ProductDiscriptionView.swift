//
//  ProductDiscriptionView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-25.
//

import SwiftUI

struct ProductDiscriptionView: View {
    @Binding var path:NavigationPath
    @State  var response:ClothWholeResponseDescription
    var body: some View {
        
        ZStack{
            Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
            VStack{
                
                Text(response.data[0].name).font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                
                
                Text(response.data[0].description).fontWeight(.semibold)
                
                
                
                
                HStack{
                    Button {
                        path.removeLast()
                    }label:{
                        Text("Back").padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)                             .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black) .padding(.vertical,30)                       }
                    Spacer()
                    
                    Button {
                        path.append(response.data[0])
                    }label:{
                        Text("Next").padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)                             .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                        
                        .foregroundStyle(Color.black) .padding(.vertical,30)                    }}
                
                
                
                
                
            }
        }
    }
}
