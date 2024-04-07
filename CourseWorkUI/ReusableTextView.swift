//
//  ReusableTextView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import SwiftUI

struct ReusableTextView: View {
    @Binding var text: String
    var placeholder: String
    @FocusState private var isFocused: Bool
    @State private var clicked = false
    
    var body: some View {
        let displayedText: Binding<String> = Binding(
            get: { self.text.isEmpty && !self.isFocused ? self.placeholder : self.text },
            set: { newValue in
                if newValue == self.placeholder {
                    self.text = ""
                } else {
                    self.text = newValue
                }
            }
        )
        
        TextField("", text: displayedText)
            .focused($isFocused)
            .padding()
            .background(Color(red: 245/255, green: 245/255, blue: 245/255))
            .padding(.horizontal, 24)
            .padding(.vertical, 8)
            .foregroundColor(.black.opacity(0.5))
            .font(.system(size: 22, weight: .semibold))
            .onTapGesture {
                clicked = true
                isFocused = true
            }
            .onChange(of: text) {
                if text.isEmpty {
                    clicked = false
                    isFocused = false
                }
            }
    }
}
