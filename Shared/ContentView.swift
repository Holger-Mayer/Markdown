//
//  ContentView.swift
//  Shared
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: MarkdownDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(MarkdownDocument()))
    }
}
