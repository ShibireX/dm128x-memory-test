//
//  QuizManager.swift
//  BachelorsExperiment
//
//  Created by Andreas Garcia on 2024-02-07.
//

import Foundation

struct QuizPhaseResult: Codable {
    var phaseNumber: Int
    var score: Int
}

struct QuizResult: Codable {
    var languageNumber: Int
    var phaseResults: [QuizPhaseResult]
}

class QuizResultsManager: ObservableObject {
    private var phaseResults: [QuizPhaseResult] = []
    private var quizResults: [QuizResult] = []
    
    func addQuizResult(languageNumber: Int) {
        quizResults.append(QuizResult(languageNumber: languageNumber, phaseResults: phaseResults))
        phaseResults = []
    }
    
    func addPhaseResult(_ result: QuizPhaseResult) {
        phaseResults.append(result)
    }
    
    func writeResultsToFile() {
        let fileName = "QuizResults.txt"
        let filePath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath).appendingPathComponent(fileName)
        
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(quizResults), let jsonString = String(data: data, encoding: .utf8) {
            if FileManager.default.fileExists(atPath: filePath.path) {
                if let fileHandle = try? FileHandle(forWritingTo: filePath) {
                    fileHandle.seekToEndOfFile()
                    fileHandle.write("\n\(jsonString)".data(using: .utf8)!)
                    fileHandle.closeFile()
                }
            } else {
                try? jsonString.write(to: filePath, atomically: true, encoding: .utf8)
            }
        }
    }
}
