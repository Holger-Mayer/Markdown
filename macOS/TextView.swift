//
//  TextView.swift
//  Markdown (macOS)
//
//  Created by holgermayer on 04.11.20.
//

import SwiftUI

struct TextView: View {
    @Binding var text  : String
    @Binding var selectedRange : NSRange
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: .constant("Dies ist ein Hugo"), selectedRange: .constant(NSMakeRange(0, 1)))
    }
}
