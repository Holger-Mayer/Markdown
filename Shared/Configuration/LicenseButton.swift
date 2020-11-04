//
//  LicenseButton.swift
//  MarkdownEditor
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI

struct LicenseButton: View {
    @State var showingLicenseView : Bool = false
    
    var body: some View {
        Button(action: {
            self.showingLicenseView.toggle()
        }) {
            Text("License")
        }.sheet(isPresented: $showingLicenseView) {
            LicenseView(content:FileLoader.load(fileName:"License"))
        }
    }
}

struct LicenseButton_Previews: PreviewProvider {
    static var previews: some View {
        LicenseButton()
    }
}
