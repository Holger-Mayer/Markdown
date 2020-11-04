//
//  ConfigPopoverView.swift
//  MarkdownEditor
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI

struct ConfigPopoverView: View {
    @Binding var useExternalCSS : Bool
    @Binding var externalCSSPath : String
        
    var body: some View {
        VStack {
            ConfigButton(useExternalCSS: $useExternalCSS, externalCSSPath: $externalCSSPath)
            HelpButton().padding()
            LicenseButton()
        }.frame(width: 100, height: 130)
    }
}

struct ConfigPopoverView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigPopoverView(useExternalCSS: .constant(true), externalCSSPath: .constant("http://h-mayer.de"))
    }
}
