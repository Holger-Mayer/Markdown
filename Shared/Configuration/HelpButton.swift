//
//  HelpButton.swift
//  MarkdownEditor
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI

struct HelpButton: View {
    @State var showingHelpView : Bool = false
    
    var body: some View {
        Button(action: {
            self.showingHelpView.toggle()
        }) {
            Text("Help")
        }.sheet(isPresented: $showingHelpView) {
            LicenseView(content:FileLoader.load(fileName:"Help"))
        }
    }
}

struct HelpButton_Previews: PreviewProvider {
    static var previews: some View {
        HelpButton()
    }
}
