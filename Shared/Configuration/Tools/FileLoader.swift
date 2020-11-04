//
//  FileLoader.swift
//  MarkdownEditor
//
//  Created by holgermayer on 04.11.20.
//

import Foundation


struct FileLoader {
    
    static func load(fileName:String) -> String  {
        if let filepath = Bundle.main.path(forResource: fileName, ofType: "md") {
            do {
                let contents = try String(contentsOfFile: filepath)
                return contents
            } catch {
                return """
                    # Error
                     File content could not be loaded
                     \(fileName).md
                    """
            }
        } else {
               return """
                # Error
                File not found
                \(fileName).md
                ###
                """
        }
    }
    
}
