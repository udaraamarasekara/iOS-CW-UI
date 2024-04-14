//
//  ViewOrdersView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI

struct ViewOrdersView: View {
  @State  var response:UserOrderResponse
  @State var isError = false
  @Binding var path:NavigationPath
    var body: some View {
        
        
        ZStack{
            Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
            
            VStack{
                Text("Your Orders").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                if(response.current_page == 0)
                {
                    Text("You have no orders!").fontWeight(.semibold)
                }
                else
                {
                    ForEach(response.data)
                    {
                        element in
                        HStack{
                            Text("Order status : \(element.status)").fontWeight(.semibold)
                            Text("Total :  \(element.final_bill)").fontWeight(.semibold)
                        }
                        
                        VStack{
                            Text("Cloth:"+" "+"\(element.cloth)")
                            Text("Quantity :"+" "+"\(element.quantity)")
                            Text("Price :"+" "+"\(element.total)")
                        }
                    }
                }
                
                HStack{
                    Button {
                        if response.prev_page_url != nil
                        {
                            Task{
                                response =   await nextOrPrevItemViewOrdersView(url:response.prev_page_url ?? "")
                            }
                        }
                        else{
                            path.append("welcome")
                        }                    }label:{
                            Text("Back").padding()
                            
                                .padding(.vertical,8)
                            .foregroundStyle(Color.black).frame(maxWidth: .infinity).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)}
                    Spacer()
                    
                    Button {
                        if response.next_page_url != nil
                        {
                            Task{
                                response =   await nextOrPrevItemViewOrdersView(url:response.next_page_url ?? "")
                            }
                        }
                        else{
                            UserDefaults.standard.setValue("No more data!",forKey:"error")
                            isError = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isError = false
                            }               
                        }
                    }label:{
                        Text("Next").padding()
                        
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)}
                }
                
                if (isError){ ErrorPopupView()
                }
            }
        }}
}


