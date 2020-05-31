//
//  asdasd.swift
//  MoviesApplication
//
//  Created by Sevval Armagan on 31.05.2020.
//  Copyright © 2020 Sevval Armagan. All rights reserved.
//

import Foundation

func firstLetterName(a:String) -> String{
    let stringInput = a
    let stringInputArr = stringInput.components(separatedBy: " ")
    var stringNeed = ""
    
    for string in stringInputArr {
        stringNeed = stringNeed + String(string.first!)
    }
    return stringNeed
}

// MARK : Number of a particular character in a word
extension String {
    func countNumberOfOccurrencesOfCharacter(char: String) -> Int {
        let chars = self.lowercased().filter {
            $0 == Character(String(char).lowercased())
        }
        return chars.count
    }
}

// MARK : The last word in a sentence
extension String {
    func trim(_ emptyToNil: Bool = true)->String? {
        let text = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return emptyToNil && text.isEmpty ? nil : text
    }
    var lastWord: String? {
        if let size = self.lastIndex(of: " "), size >= self.startIndex {
            return String(self[size...]).trim()
        }
        return nil
    }
}
// MARK : Word count
extension String {
    var numberOfWords: Int {
        let inputRange = CFRangeMake(0, utf16.count)
        let flag = UInt(kCFStringTokenizerUnitWord)
        let locale = CFLocaleCopyCurrent()
        let tokenizer = CFStringTokenizerCreate(kCFAllocatorDefault, self as CFString, inputRange, flag, locale)
        var tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer)
        var count = 0
        
        while tokenType != [] {
            count += 1
            tokenType = CFStringTokenizerAdvanceToNextToken(tokenizer)
        }
        return count
    }
}
