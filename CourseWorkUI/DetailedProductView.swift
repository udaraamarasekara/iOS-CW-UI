//
//  DetailedProductView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-25.
//

import SwiftUI

struct DetailedProductView: View {
    @State  var response:ClothWholeResponse
    @State  var img :ImageDummy
    @State var isError = false
    @State var page = 2
    @Binding var path:NavigationPath
    var body: some View {
        
        ZStack{
             
            Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
            VStack{
                Button{
                        path.append(response.data[0])
                    
                }label:{
                    Text("Order->").foregroundStyle( Color(red:127/255,green:123/255,blue:13/255)).padding(.horizontal,24).frame(maxWidth:.infinity,alignment:.trailing).padding()
                }
                Text(response.data[0].name).font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                
                
                
                
                
                
                AsyncImage(url:URL(string:imageUrl+img.data[0].image)){
                    image in
                    image.image?.resizable().aspectRatio(contentMode:.fill)
                }.frame(maxWidth:.infinity,maxHeight:300,alignment:.topLeading)                     .cornerRadius(20)
                    .clipped().padding(.vertical,8)
                    .padding(.horizontal,24)
                HStack{
                    Button {
                        Task{
                            if img.prev_page_url != nil
                            {
                                page-=1
                                img = await clothImagesNextOrPrev(urlRow:"getClothImages/\(response.data[0].id)?page=\(page)")
                                
                                page-=1
                            }
                            else{
                                let tmpRsp = await allClothes()
                                path.append(tmpRsp)
                            }
                            
                       
                        }
                        
                    }label:{
                        Text("Back").padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)                             .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black) .padding(.vertical,30)                       }
                    Spacer()
                    
                    Button {
                        Task{
                            if img.next_page_url != nil
                            {
                                
                                    img = await clothImagesNextOrPrev(urlRow:"getClothImages/\(response.data[0].id)?page=\(page)")
                        
                                page+=1
                                }
                            else{
                                UserDefaults.standard.setValue("No more data!",forKey:"error")
                                isError = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    isError = false
                                }                             }                        }                     }label:{
                            Text("Next").padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)                             .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            
                            .foregroundStyle(Color.black) .padding(.vertical,30)                    }}
                
                Text("Size :" + response.data[0].size).padding()
                
                
                    .foregroundColor(.black.opacity(0.5)).font(.system(size:22, weight:.semibold)).frame(maxWidth:.infinity).background(Color(red:245/255,green:245/255,blue:245/255)).padding(.horizontal,24).padding(.vertical,8)
                
                Text("Color :" + response.data[0].color).padding()
                    .foregroundColor(.black.opacity(0.5)).font(.system(size:22, weight:.semibold)).frame(maxWidth:.infinity).background(Color(red:245/255,green:245/255,blue:245/255)).padding(.horizontal,24)
                
                if (isError){ ErrorPopupView()
                }
                Button{
                    path.append(ClothWholeResponseDescription(current_page: response.current_page, data:response.data, first_page_url:response.first_page_url, from: response.from, last_page: response.last_page, last_page_url:response.last_page_url, links:response.links, next_page_url: response.next_page_url, path: response.path, per_page: response.per_page, prev_page_url:response.prev_page_url, to: response.to, total: response.total))
                    
                }label:{
         
                                    Text("more details...").foregroundStyle( Color(red:127/255,green:123/255,blue:13/255)).padding(.horizontal,24).frame(maxWidth:/*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.trailing).padding()
                }
                          }.padding()
       
            
           
            
            
        }
      
        
        
         }
                    
            
}
