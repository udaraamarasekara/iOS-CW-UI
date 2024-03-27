//
//  NewProductViewThree.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-26.
//

import SwiftUI

import PhotosUI
import SwiftUI

struct NewProductViewThree: View {
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    private var name=""
      private var price=""
       private var color=""
      private var size=""
       private var discription=""
    var body: some View {
        ZStack{
            Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
            
            VStack{
                Text("New product").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                NavigationStack {
                    ScrollView {
                        LazyVStack {
                            ForEach(0..<selectedImages.count, id: \.self) { i in
                                selectedImages[i]
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                            }
                        }
                    }
                    .toolbar {
                        PhotosPicker("Select images", selection: $selectedItems, matching: .images)
                    }
                    .onChange(of: selectedItems) {
                        Task {
                            selectedImages.removeAll()
                            
                            for item in selectedItems {
                                if let image = try? await item.loadTransferable(type: Image.self) {
                                    selectedImages.append(image)
                                }
                                
                            }
                        }
                        
                        
                    }}
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
                        Text("Add ").padding().frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)                             .background(Color(red:195/255,green:184/255,blue:83/255)).fontWeight(.semibold)   .padding(.horizontal,24)
                        
                        .foregroundStyle(Color.black) .padding(.vertical,30)                    }}
                
                
                
                
                            }.padding().padding().padding(.vertical,24).padding(.horizontal,24)
    

            }
        }
    }

#Preview {
    NewProductViewThree()
}
