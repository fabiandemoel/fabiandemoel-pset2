//
//  Story.swift
//  Madlibs
//
//  Created by Julian Jansen on 13-04-16 for Swift 2.
//  Updated by Julian Jansen on 06-11-16 for Swift 3.
//  Updated by Marijn Jansen on 23-10-18 for Swift 4.
//
//  Based on: CS 193A, Marty Stepp
//

import Foundation
/**
 This class represents a Mad Libs story that comes from a text file.
 You can construct it and pass a filename to read the story text.
 After constructing it, you can ask it for each placeholder by calling
 nextPlaceholder, then filling in that placeholder by calling fillInPlaceholder.
 To see how many placeholders are left, use the values
 placeholdersRemaining and isFilledIn.
 */
struct Story {
    static private let startString = """
<div style='font-family: "Helvetica Neue"; font-size: 12pt'>
"""

    static private let endString = "</div>"
    
    /// Text of the story.
    private var htmlText = ""
    /// List of placeholders to fill in.
    private var placeholders = [String]()
    /// Numbers of placeholders that have been filled in.
    private var filledIn = 0
    
    /// The Story as a Sting.
    var normalText: String {
        return attributedText.string
    }
    
    /// The Story as a NSAttributedString.
    var attributedText: NSAttributedString {
        let data = Data((Story.startString + htmlText + Story.endString).utf8)
        let attributedString = try! NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        return attributedString
    }
    
    /// Constructs a new Story reading its text from the given input stream.
    /// - Parameter stream: The story as a String with placeholders.
    init(withText stream: String) {
        self.read(withText: stream)
    }
    
    /// A Boolean value that determines if the Story is filled in completly.
    var isFilledIn: Bool {
        return filledIn >= placeholders.count
    }
    
    /// Replaces the next unfilled placeholder with the given word.
    mutating func fillInPlaceholder(word: String) {
        if (!isFilledIn) {
            htmlText = htmlText.replacingOccurrences(of: "<\(filledIn)>", with: word)
            filledIn += 1
        }
    }
    
    /// The next placeholder that can be filled in (e.g.: "adjective").
    var nextPlaceholder: String? {
        if isFilledIn {
            return nil
        } else {
            return placeholders[filledIn]
        }
    }
    
    /// Total number of placeholders in the story.
    var totalPlaceholders: Int {
        return placeholders.count
    }
    
    /// Ammount of placeholders that still need to be filled in.
    var remainingPlaceholders: Int {
        return placeholders.count - filledIn
    }
    
    /// Reads initial story text from the given input stream.
    private mutating func read(withText stream: String) {
        let words = stream.split{ $0 == " " || $0 == "\r\n" || $0 == "\n"}
        
        for word in words {
            if (word.hasPrefix("<") && word.hasSuffix(">")) {
                // A placeholder; replace with e.g. " <0>" so I can find/replace it easily later
                htmlText += " <b><\(placeholders.count)></b>"
                
                // "<plural-noun>" becomes "plural noun".
                let range = word.index(after: word.startIndex)..<word.index(before: word.endIndex)
                let placeholder = word[range].replacingOccurrences(of: "-", with: " ")
                placeholders.append(placeholder)
            } else {
                // A regular word; just concatenate.
                if (htmlText.count != 0) {
                    htmlText += " ";
                }
                htmlText += word;
            }
        }
    }
}
