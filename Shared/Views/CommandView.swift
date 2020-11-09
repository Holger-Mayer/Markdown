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
                let tag =  "\n# Chapter"
                replaceRangeWith(tag)
            }
            Button("Section") {
                let tag =  "\n## Section"
                replaceRangeWith(tag)
             }
            Button(action: {
                    let tag  =
                        """
                            \n
                            | A | B | C | D | E |
                            |:---|:---:|---:|---|---|
                            | l | c | r |   |   |
                            | l | c | r |   |   |
                            | l | c | r |   |   |
                            \n
                            """
                  replaceRangeWith(tag)

            }) {
                 Image(systemName: "tablecells")
            }
            Button(action: {
                toogleSurroundingTag(tag: "**")
                 }) {
                Image(systemName: "bold")
            }
            
            Button(action: {
                toogleSurroundingTag(tag: "*")
            }) {
                Image(systemName: "italic")
            }

        }
    }
    
    func replaceRangeWith(_ tag : String) {
        let range  = Range(selectedRange,in:markdownContent)
        markdownContent.replaceSubrange(range!, with:tag)
        selectedRange = NSMakeRange(selectedRange.length+selectedRange.location+tag.count,0)
    }
    
    func surroundRangeWith(startTag:String, endTag:String) {
        let range  = Range(selectedRange,in:markdownContent)
        
        let startIndex = range?.lowerBound
        let endIndex = range?.upperBound
        let innerContent = markdownContent[startIndex!..<endIndex!]
        let newInnerContent = startTag +  innerContent + endTag
        markdownContent.replaceSubrange(range!, with: newInnerContent)
        selectedRange = NSMakeRange(selectedRange.location,selectedRange.length + startTag.count + endTag.count)
    }
    
    func toogleSurroundingTag(tag : String){
        let range  = Range(selectedRange,in:markdownContent)
        
        let startIndex = range?.lowerBound
        let endIndex = range?.upperBound
        let  innerContent = markdownContent[startIndex!..<endIndex!]

        if innerContent.hasPrefix(tag) && innerContent.hasSuffix(tag) && innerContent.count >= tag.count * 2 {
            var newInnerContent = innerContent.dropFirst(tag.count)
            newInnerContent = newInnerContent.dropLast(tag.count)
            
            markdownContent.replaceSubrange(range!, with: newInnerContent)
            selectedRange = NSMakeRange(selectedRange.location,selectedRange.length - 2 * tag.count)
       } else {
            surroundRangeWith(startTag: tag, endTag: tag)
        }
    }
}

struct CommandView_Previews: PreviewProvider {
    static var previews: some View {
        CommandView(markdownContent: .constant("Dies ist ein Hugo"), selectedRange: .constant(NSMakeRange(0, 0)))
    }
}
