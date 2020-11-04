//
//  MarkdownDocument.swift
//  Shared
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var markdownText: UTType {
        UTType(importedAs: "de.h-mayer.markdown")
    }
}

struct MarkdownDocument: FileDocument {
    var markdownContent : String
    
    init(text: String = "# Chapter 1") {
        self.markdownContent = text
    }
    
    static var readableContentTypes: [UTType] { [.markdownText] }
    
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        markdownContent = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = markdownContent.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}
