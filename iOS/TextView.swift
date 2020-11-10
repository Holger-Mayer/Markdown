//
//  TextView.swift
//  MarkdownEditor
//
//  Created by holgermayer on 03.11.20.
//

import SwiftUI
import UIKit
struct TextView : UIViewRepresentable {
    
    @Binding var text  : String
    @Binding var selectedRange : NSRange
    
    func makeUIView(context: Context) -> UITextView {
        let textView =  UITextView()
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.delegate = context.coordinator
        textView.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.selectedRange = selectedRange
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator($text,selectedRange: $selectedRange)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
        var selectedRange :Binding<NSRange>

        init(_ text: Binding<String>,selectedRange :Binding<NSRange>) {
            self.text = text
            self.selectedRange = selectedRange
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.text.wrappedValue = textView.text
        }
        
        func textViewDidChangeSelection(_ textView:UITextView) {

            self.selectedRange.wrappedValue = textView.selectedRange
        }

    }
    
}
