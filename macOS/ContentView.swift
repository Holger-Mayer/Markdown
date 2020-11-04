//
//  ContentView.swift
//  Markdown (macOS)
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI


struct ContentView: View {
    @Binding var document: MarkdownDocument
    @State var showingConfigPopover  = false
    @State var selectedRange : NSRange = NSMakeRange(0, 0)
    @State var useExternalCSS : Bool = false
    @State var externalCSSPath : String = "http://macminiservermax.local/Demo.css"
    
    var body: some View {
        HStack {
            TextView(text: $document.markdownContent,selectedRange:$selectedRange)
            WebView(content: $document.markdownContent,useExternalCSS: $useExternalCSS,externalCSSPath: $externalCSSPath)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(MarkdownDocument()))
    }
}
