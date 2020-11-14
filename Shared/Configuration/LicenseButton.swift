//
//  LicenseButton.swift
//  MarkdownEditor
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI

struct LicenseButton: View {
    @State var showLicenseView : Bool = false
    
    var body: some View {
        Button(action: {
            self.showLicenseView.toggle()
        }) {
            Text("License")
        }.sheet(isPresented: $showLicenseView) {
            LicenseView(content:FileLoader.load(fileName:"License"))
        }
    }
}

struct LicenseButton_Previews: PreviewProvider {
    static var previews: some View {
        LicenseButton()
    }
}
