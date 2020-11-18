//
//  ContentView.swift
//  Shared
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: MarkdownDocument
    @State var showingConfigPopover  = false
    @State var selectedRange : NSRange = NSMakeRange(0, 0)
    @State var useExternalCSS : Bool = false
    @State var externalCSSPath : String = "http://macminiservermax.local/Demo.css"
    @Environment(\.undoManager) var undoManager

                                    
    var body: some View {
        HStack {
            TextView(text: $document.markdownContent,selectedRange:$selectedRange)
                .navigationBarTitle("Markdown", displayMode: .inline)
            WebView(content: $document.markdownContent,useExternalCSS: $useExternalCSS,externalCSSPath: $externalCSSPath)
        }.navigationBarItems(
            leading:
                CommandView(markdownContent:$document.markdownContent,selectedRange: $selectedRange)
            ,
            trailing:
                HStack {
                    if undoManager != nil {
                        Button(action: {
                            undoManager?.undo()
                        }) {
                            Image(systemName: "arrow.uturn.backward.circle")
                        }.disabled(!undoManager!.canUndo)
                        Button(action: {
                            undoManager?.redo()
                        }) {
                            Image(systemName: "arrow.uturn.forward.circle")
                        }.disabled(!undoManager!.canRedo)
                    }
                    Button(action: {
                        self.showingConfigPopover.toggle()
                    }) {
                        Image(systemName: "gear")
                    }.popover(isPresented: self.$showingConfigPopover,arrowEdge: .bottom){
                        ConfigPopoverView(useExternalCSS: $useExternalCSS, externalCSSPath: $externalCSSPath)
                    }
                    
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(MarkdownDocument()))
    }
}
