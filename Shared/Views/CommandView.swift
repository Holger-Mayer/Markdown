//
//  CommandView.swift
//  MarkdownEditor
//
//  Created by holgermayer on 03.11.20.
//

import SwiftUI

struct CommandView: View {
    @Binding var markdownContent : String
    @Binding var selectedRange : NSRange
    
    var body: some View {
        HStack {
            Button("Chapter") {
                let range  = Range(selectedRange,in:markdownContent)
                markdownContent.replaceSubrange(range!, with: "\n# Chapter")
                selectedRange = NSMakeRange(selectedRange.length+selectedRange.location, 0)
            }
            Button("Section") {
                let range  = Range(selectedRange,in:markdownContent)
                markdownContent.replaceSubrange(range!, with: "\n## Section")
            }
            Button(action: {
                    let tableString  =
                        """
                            \n
                            | A | B | C | D | E |
                            |:---|:---:|---:|---|---|
                            | l | c | r |   |   |
                            | l | c | r |   |   |
                            | l | c | r |   |   |
                            \n
                            """
                let range  = Range(selectedRange,in:markdownContent)
                markdownContent.replaceSubrange(range!, with: tableString)

            }) {
                 Image(systemName: "tablecells")
            }
            Button(action: {
                 let range  = Range(selectedRange,in:markdownContent)
                 markdownContent.replaceSubrange(range!, with: "** Bold **")
               }) {
                Image(systemName: "bold")
            }
            Button(action: {
                let range  = Range(selectedRange,in:markdownContent)
                markdownContent.replaceSubrange(range!, with: "* Italic *")
            }) {
                Image(systemName: "italic")
            }

        }
    }
}

struct CommandView_Previews: PreviewProvider {
    static var previews: some View {
        CommandView(markdownContent: .constant("Dies ist ein Hugo"), selectedRange: .constant(NSMakeRange(0, 0)))
    }
}
