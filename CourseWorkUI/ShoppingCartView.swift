//
//  ShoppingCartView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-26.
//

import SwiftUI

struct ShoppingCartView: View {
    @State  var orders = retrieveObjects()
    @Binding var path:NavigationPath

    var body: some View {
        ZStack{
            Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
            
            VStack{
                
                HStack{
                    Text("Shopping cart").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) ).padding(.horizontal,24)
                    Spacer()
                    Button{
                        Task{
                            let tmpRsp = await allClothes()
                            path.append(tmpRsp)
                        }
                    }label: {
                        Text("+").font(.system(size:36)).bold().padding().background((Color(red:195/255,green:184/255,blue:83/255))).clipShape(Circle()).padding(.horizontal,24)}                    }
                 
                ForEach(orders.indices, id: \.self) { index in
                    let order = orders[index]
                    HStack {
                        Text("Item Code : \(order.cloth_id)")
                        Text("Quantity : \(order.quantity)")
                        Text("Total  : \(order.total)")
                        Button(action: {
                            removeObject(at: index)
                            orders = retrieveObjects()
                        }) {
                            Text("Remove this").foregroundColor(.red)
                        }
                    
                }                }.padding().padding(.horizontal,24)
                    .padding(.vertical,8)
                HStack{
                    Button {
                        path.removeLast()
                    }label:{
                        Text("Back").padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black)}
                Spacer()
                    
                    Button {
                        Task{
                         let result = await placeOrder()
                            UserDefaults.standard.removeObject(forKey:"objectsArray")
                        }
                        }label:{
                        Text("Place Order").padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                            .padding(.vertical,8)
                        .foregroundStyle(Color.black)}
                }.padding(.vertical)
                              }
        }
            
        }
}

