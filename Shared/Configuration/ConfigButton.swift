//
//  CSSCommandButton.swift
//  MarkdownEditor
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI

struct ConfigButton: View {
    @Binding var useExternalCSS : Bool
    @Binding var externalCSSPath : String

    @State var showingConfigView : Bool = false

    var body: some View {
        Button(action: {
            self.showingConfigView.toggle()
        }) {
            Text("Config")
        }.sheet(isPresented: $showingConfigView) {
            ConfigView(useExternalCSS: $useExternalCSS, externalCSSPath: $externalCSSPath)
        }
    }
}

struct ConfigButton_Previews: PreviewProvider {
    static var previews: some View {
        ConfigButton(useExternalCSS: .constant(true), externalCSSPath: .constant("http://h-mayer.de"))
    }
}
