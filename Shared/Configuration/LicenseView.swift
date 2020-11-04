//
//  LicenseView.swift
//  MarkdownEditor
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI

struct LicenseView: View {
    @State var content : String = """
    <H1>License</H1>
    <p>
    Copyright @ 2020 Holger Mayer
    </p>
    """
    @State var useExternalCSS : Bool = false
    @State var externalCSSPath : String = "http://macminiservermax.local/Demo.css"
    var body: some View {
        WebView(content: $content,useExternalCSS: $useExternalCSS,externalCSSPath: $externalCSSPath).padding()

    }
}

struct LicenseView_Previews: PreviewProvider {
    static var previews: some View {
        LicenseView()
    }
}
