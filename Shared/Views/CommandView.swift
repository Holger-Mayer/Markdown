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
            
            Button("Lorem") {
                let tag =  """
                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

                Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.

                Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.

                Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.
                """
                replaceRangeWith(tag)
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
