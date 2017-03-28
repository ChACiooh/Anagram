//
//  AnagramTests.swift
//  AnagramTests
//
//  Created by Lingostar on 2016. 2. 13..
//  Copyright © 2016년 CodersHigh. All rights reserved.
//

import XCTest
@testable import Anagram

class AnagramTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNoMatches() {
        let anagram = Anagram(word: "diaper")
        let results = anagram.match(words: ["hello","world","zombies","pants"])
        let expected: [String] = []
        XCTAssertEqual(results, expected)
    }
    
    
    func testDetectSimpleAnagram() {
        let anagram = Anagram(word: "ant")
        let results = anagram.match(words: ["tan","stand","at"])
        let expected = ["tan"]
        XCTAssertEqual(results, expected)
    }
    
    func testDetectMultipleAnagrams() {
        let anagram = Anagram(word: "master")
        let results = anagram.match(words: ["stream","pigeon","maters"])
        let expected = ["stream","maters"]
        XCTAssertEqual(results, expected)
    }
    
    func testDoesNotConfuseDifferentDuplicates() {
        let anagram = Anagram(word: "galea")
        let results = anagram.match(words: ["eagle"])
        let expected: [String] = []
        XCTAssertEqual(results, expected)
    }
    
    func testIdenticalWordIsNotAnagram() {
        let anagram = Anagram(word: "corn")
        let results = anagram.match(words: ["corn", "dark", "Corn", "rank", "CORN", "cron", "park"])
        let expected = ["cron"]
        XCTAssertEqual(results, expected)
    }
    
    func testEliminateAnagramsWithSameChecksum() {
        let anagram = Anagram(word: "mass")
        let results = anagram.match(words: ["last"])
        let expected: [String] = []
        XCTAssertEqual(results, expected)
    }
    
    func testEliminateAnagramSubsets() {
        let anagram = Anagram(word: "good")
        let results = anagram.match(words: ["dog","goody"])
        let expected: [String] = []
        XCTAssertEqual(results, expected)
    }
    
    func testDetectAnagram() {
        let anagram = Anagram(word: "listen")
        let results = anagram.match(words: ["enlists","google","inlets","banana"])
        let expected = ["inlets"]
        XCTAssertEqual(results, expected)
    }
    
    func testMultipleAnagrams() {
        let anagram = Anagram(word: "allergy")
        let results = anagram.match(words: ["gallery","ballerina","regally","clergy","largely","leading"])
        let expected = ["gallery","regally","largely"]
        XCTAssertEqual(results, expected)
    }
    
    func testAnagramsAreCaseInsensitive() {
        let anagram = Anagram(word: "Orchestra")
        let results = anagram.match(words: ["cashregister","Carthorse","radishes"])
        let expected = ["Carthorse"]
        XCTAssertEqual(results, expected)
    }

    
}
