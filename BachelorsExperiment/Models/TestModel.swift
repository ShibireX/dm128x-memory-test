//
//  TestModel.swift
//  BachelorsExperiment
//
//  Created by Andreas Garcia on 2024-02-07.
//

import Foundation

struct TestModel {
    static func getRandomNumber(length: Int) -> Int {
        return Int.random(in: Int(1)*Int(pow(Double(10), Double(length-1)))...Int(9.9)*Int(pow(Double(10), Double(length-1))))
    }
    
    static func isCorrectAnswer(guessValue: String, realValue: String) -> Bool {
        return guessValue == realValue
    }
    
}


