//
//  ErrorPopupView.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-28.
//

import SwiftUI

struct ErrorPopupView: View {
    var body: some View {
        Text(UserDefaults.standard.string(forKey: "error") ?? "error occured").padding().background(Color(red:250/255,green:162/255,blue:197/255)).cornerRadius(20)    }
}

#Preview {
    ErrorPopupView()
}
