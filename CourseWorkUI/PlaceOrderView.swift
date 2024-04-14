//
//  PlaceOrderView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI

struct PlaceOrderView: View {
    @State  var response:ClothData
    @Binding var path:NavigationPath
       @State private var quantity=""
       @State private var total=""
    @State private var numOne:Float = 1.00
    @State private var numTwo:Float = 1.00
       var body: some View {
           ZStack{
               Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
               
               VStack{
                   Text("Place Order").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                   Text(response.name).padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)                   .background(Color(red:245/255,green:245/255,blue:245/255))
                       .padding(.horizontal,24)
                       .padding(.vertical,8)
                       .foregroundColor(.black.opacity(0.5)).font(.system(size:22, weight:.semibold))
                   Text(response.price).padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)                   .background(Color(red:245/255,green:245/255,blue:245/255))
                       .padding(.horizontal,24)
                       .padding(.vertical,8)
                       .foregroundColor(.black.opacity(0.5)).font(.system(size:22, weight:.semibold))
                   ReusableTextView(text:$quantity, placeholder:"Quantity").onChange(of: quantity){
                       oldQty,qty in
                       if let convertedNumber = Float(qty) {
                           numOne = convertedNumber
                           
                       } else {
                           // Handle invalid input if needed
                           print("Invalid input1")
                       }
                       if let convertedNumberTwo = Float(response.price) {
                           numTwo = convertedNumberTwo
                       } else {
                           // Handle invalid input if needed
                           print("Invalid input2")
                       }  
                       let tot = numOne * numTwo
                       total = "\(tot)"
                   }
                   
                   Text(total).padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment:.leading)                   .background(Color(red:245/255,green:245/255,blue:245/255))
                       .padding(.horizontal,24)
                       .padding(.vertical,8)
                       .foregroundColor(.black.opacity(0.5)).font(.system(size:22, weight:.semibold))
                   HStack{
                       Button {
                           
                       }label:{
                           Text("Back").padding()
                               .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                               .padding(.vertical,8)
                           .foregroundStyle(Color.black)}
                       Spacer()
                       
                       Button {
                           let floatTot = Double(total) ?? 0.0
                           let object = OrderObject(cloth_id:response.id , quantity:Int(quantity)!, total:Int(floatTot))
                           addObject(object)
                           path.append("cart")
                       }label:{
                           Text("Order").padding()
                               .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                               .padding(.vertical,8)
                           .foregroundStyle(Color.black)}
                   }.padding(.vertical)
               }
           }
               
           }
}

