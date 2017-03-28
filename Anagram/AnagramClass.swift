//
//  AnagramClass.swift
//  Anagram
//
//  Created by 표영권 on 2017. 3. 28..
//  Copyright © 2017년 CodersHigh. All rights reserved.
//

import Foundation

extension String {
    
    var length: Int {
        return self.characters.count
    }
    
    subscript (i: Int) -> String {
        return self[Range(i ..< i + 1)]
    }
    
    func substring(from: Int) -> String {
        return self[Range(min(from, length) ..< length)]
    }
    
    func substring(to: Int) -> String {
        return self[Range(0 ..< max(0, to))]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return self[Range(start ..< end)]
    }
    
}

func generateAnagram(word: String) -> Dictionary<String, Int> {
    var result = Dictionary<String, Int>()
    var w = word
    while w.isEmpty == false {
        let s = w[0].lowercased()
        if let x = result[s] {
            result.updateValue(x+1, forKey: s)
        } else {
            result[s] = 1
        }
        w.remove(at: w.startIndex)
    }
    
    return result
}

class Anagram {
    let word:String

    init(word: String) {
        self.word = word
    }
    
    
    
    func match(words:[String]) -> [String] {
        var result:[String] = []
        let anagram = generateAnagram(word: self.word)
        for w in words {
            if w.lowercased() != self.word.lowercased() && generateAnagram(word: w) == anagram {
                result += [w]
            }
        }
        return result
    }
}
