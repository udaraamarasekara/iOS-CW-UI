//
//  AvailableProductsView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI

struct AvailableProductsView: View {
    @State private var search=""
    var body: some View {
        
            ZStack{
                Color(red:217/255,green: 217/255,blue:217/255).ignoresSafeArea()
                    VStack{
                        Text("Available Products").font(.system(size:36)).foregroundStyle( Color(red:127/255,green:123/255,blue:13/255) )
                        ReusableTextView(text:$search, placeholder:"Search")
                        
                        
                        
                       
                            ZStack(alignment:.center)
                            {
                     
                                Spacer()
                            }
                        }
                        
                       
                    
            }   }
}

#Preview {
    AvailableProductsView()
}
