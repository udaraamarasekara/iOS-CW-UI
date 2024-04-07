//
//  ContentView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var path = NavigationPath()
    var body: some View {
        NavigationStack(path:$path)
        {
            
            NavigationLink(value:"Login"){
                
            }
                .navigationDestination(for:String.self){
                    value in
                       if value == "Login"
                       {
                          LoginView()
                       }
                        
                    }
                        
                    }
                }
            
        }

    

    


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
