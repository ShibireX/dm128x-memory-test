//
//  TestView.swift
//  BachelorsExperiment
//
//  Created by Andreas Garcia on 2024-02-07.
//

import SwiftUI

struct TestView: View {
    @StateObject var quizManager = QuizResultsManager()
    @StateObject var audioPlayer = AudioPlayerManager()
    @State var isPreview: Bool = false
    @FocusState var isTextFieldFocused: Bool
    
    @State var currentDisplayedNumber: Int? = nil
    @State var currentLanguage: Int = 1
    @State var currentPhase: Int = 1
    @State var inputText: String = ""
    @State var isSubmitting: Bool = false
    @State var showPhaseEndedDisclaimer: Bool = false
    @State var timer: Timer?
    @State var showEndView: Bool = false
    
    var body: some View {
        VStack {
            if showPhaseEndedDisclaimer {
                Text("Current language phase finished, press the button below when you want to move on").font(.system(size: 42)).multilineTextAlignment(.center).padding()
                Button {
                    startNewLanguageRound()
                } label: {
                    Text("Continue").font(.system(size: 42))
                }
            } else if showEndView {
                EndView()
            } else {
                if !isSubmitting {
                    Text("Memorize the number below")
                    if let number = currentDisplayedNumber {
                        Text(String(number)).padding().font(.system(size: 62, weight: .bold))
                    }
                }
                if isSubmitting {
                    TextField("Enter the shown number", text: $inputText)
                        .focused($isTextFieldFocused)
                        .frame(width: 750)
                        .font(.system(size: 52))
                        .padding()
                        .onSubmit {
                            submitAnswer()
                            
                        }
                        .onAppear {
                            isTextFieldFocused = true
                        }
                }
            }
        }
        .font(.system(size: 52, weight: .medium)).fontWidth(.expanded)
        .onAppear {
            currentDisplayedNumber = TestModel.getRandomNumber(length: currentPhase+3)
            self.startTimer()
            if !isPreview {
                audioPlayer.playMusic(file: "korean", type: "mp3")
            }
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { _ in
            isSubmitting = true
            self.startSubmitTimer()
        }
    }
    
    func startSubmitTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 12, repeats: true) { _ in
            submitAnswer()
        }
    }
    
    func submitAnswer() {
        quizManager.addPhaseResult(QuizPhaseResult(phaseNumber: currentPhase, score: TestModel.isCorrectAnswer(guessValue: inputText, realValue: String(currentDisplayedNumber!)) ? 1 : 0))
        if currentPhase == 5 {
            timer?.invalidate()
            quizManager.addQuizResult(languageNumber: currentLanguage)
            if currentLanguage == 2 {
                audioPlayer.pauseMusic()
                quizManager.writeResultsToFile()
                showEndView = true
            } else {
                audioPlayer.pauseMusic()
                showPhaseEndedDisclaimer = true
            }
        } else {
            currentPhase += 1
            currentDisplayedNumber = TestModel.getRandomNumber(length: currentPhase+3)
            inputText = ""
            isSubmitting = false
            self.startTimer()
        }
    }
    
    func startNewLanguageRound() {
        showPhaseEndedDisclaimer = false
        currentLanguage += 1
        currentPhase = 1
        currentDisplayedNumber = TestModel.getRandomNumber(length: currentPhase+3)
        inputText = ""
        isSubmitting = false
        audioPlayer.playMusic(file: "english", type: "mp3")
        self.startTimer()
    }
    
}

#Preview {
    TestView(isPreview: true)
}
