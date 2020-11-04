//
//  MarkdownApp.swift
//  Shared
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI

@main
struct MarkdownApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: MarkdownDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
