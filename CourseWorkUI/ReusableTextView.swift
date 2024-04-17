//
//  TextInput.swift
//  CourseWork
//
//  Created by Udara PC on 2024-03-14.
//
import SwiftUI

struct ReusableTextView: View {
    @Binding var text: String
    var placeholder: String
    @FocusState private var isFocused:Bool
    @State private var clicked=false
    var body: some View {
        
        let displayedText: Binding<String> = Binding(
            get: { self.text.isEmpty && !self.isFocused && !clicked ? self.placeholder : self.text },
            set: {  if self.text==self.placeholder  {text=""}else{
                text = $0
            } }
        )
        if (self.placeholder == "Password" || self.placeholder == "Password confirmation" ) && clicked==true {
            SecureField("", text:
                            displayedText).focused($isFocused)
                .padding()
                .background(Color(red:245/255,green:245/255,blue:245/255))
                .padding(.horizontal,24)
                .padding(.vertical,8)
                .foregroundColor(.black.opacity(0.5)).font(.system(size:22, weight:.semibold)).onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.75 )
                    {
                        isFocused=true
                    }
                    
                }.onChange(of:text){oldValue,newValue in if newValue == "" {clicked = false}}
        }else
        {
            TextField("", text:displayedText)
            .focused($isFocused)
            .padding()
            .background(Color(red:245/255,green:245/255,blue:245/255))
            .padding(.horizontal,24)
            .padding(.vertical,8)
            .foregroundColor(.black.opacity(0.5)).font(.system(size:22, weight:.semibold))
            .onTapGesture {
                clicked = true
            }.onChange(of:text){oldValue,newValue in if newValue == "" {clicked = false
                isFocused = false}}        }
    }
    
}
