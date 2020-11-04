//
//  WebView.swift
//  Markdown (macOS)
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI

struct WebView: View {
    @Binding var content : String
    @Binding var useExternalCSS : Bool
    @Binding var externalCSSPath : String

    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(content: .constant("Test"), useExternalCSS: .constant(false), externalCSSPath: .constant(""))
    }
}
