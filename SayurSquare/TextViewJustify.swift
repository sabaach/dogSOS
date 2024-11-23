//
//  TextViewJustify.swift
//  SayurSquare
//
//  Created by Bryan Vernanda on 03/04/24.
//

import SwiftUI

struct TextViewJustify: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        textView.textAlignment = .justified
        textView.isEditable = false
        textView.isScrollEnabled = true
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
