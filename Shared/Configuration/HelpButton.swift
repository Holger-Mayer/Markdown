//
//  HelpButton.swift
//  MarkdownEditor
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI

struct HelpButton: View {
    @State var showHelpView : Bool = false
    
    var body: some View {
        Button(action: {
            self.showHelpView.toggle()
        }) {
            Text("Help")
        }.sheet(isPresented: $showHelpView) {
            LicenseView(content:FileLoader.load(fileName:"Help"))
        }
    }
}

struct HelpButton_Previews: PreviewProvider {
    static var previews: some View {
        HelpButton()
    }
}
