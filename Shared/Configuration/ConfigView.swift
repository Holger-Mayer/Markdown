//
//  ConfigView.swift
//  MarkdownEditor
//
//  Created by holgermayer on 03.11.20.
//

import SwiftUI

struct ConfigView: View {
    @Binding var useExternalCSS : Bool
    @Binding var externalCSSPath : String
    
    var body: some View {
        VStack(alignment:.leading) {
            Toggle(isOn: $useExternalCSS) {
                Text("Use external CSS for formatting")
            }
       
            if useExternalCSS == true {
                TextField("URL:", text: $externalCSSPath)
            }
        }.padding()
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView(useExternalCSS: .constant(true), externalCSSPath: .constant("http://h-mayer.de"))
    }
}
