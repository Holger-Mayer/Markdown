//
//  WebView.swift
//  MarkdownEditor
//
//  Created by holgermayer on 02.11.20.
//

import SwiftUI
import WebKit
import Ink

struct WebView : UIViewRepresentable {
     
    @Binding var content : String
    @Binding var useExternalCSS : Bool
    @Binding var externalCSSPath : String 

    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    
        var htmlStart = ""
        
        if useExternalCSS {
            htmlStart = """
            <html><head>
            <link rel="stylesheet" href="\(externalCSSPath
            )">
            </head><body>
            """
        } else {
            htmlStart = """
         <html><head><style>
        h1 {color: blue;}
        table { width:100%; border-collapse: collapse;}
        table, th, td {
        border: 1px solid black;}
        </style></header> <body>
        """
        }
        let htmlEnd = "</body></html>"
        
        let parser = MarkdownParser()
        let htmlCore = parser.html(from:content)
        
        let html = htmlStart + htmlCore + htmlEnd
        
        uiView.loadHTMLString(html, baseURL: nil)
    }
    
}
