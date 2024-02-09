//
//  SetupView.swift
//  BachelorsExperiment
//
//  Created by Andreas Garcia on 2024-02-07.
//

import SwiftUI

struct SetupView: View {
    @State private var languageFluencyLevels: [String : String] = ["Swedish" : "", "English" : "", "German" : "", "Italian" : "", "French" : "", "Spanish" : "", "Portuguese" : "", "Hindi": "", "Korean" : "", "Chinese (mandarin)" : "", "Japanese" : ""]
    let fluencyLevels: [String] = ["Native", "Fluent", "Intermediate", "Basic", "No Knowledge"]
    let languages: [String] = ["Swedish", "English", "German", "Italian", "French", "Spanish", "Portuguese", "Hindi", "Korean", "Chinese (mandarin)", "Japanese"]
    @State private var isSettingUp: Bool = true

    
    var body: some View {
        if isSettingUp {
            VStack {
                Text("Please fill out your language fluency levels for the following languages").font(.system(size: 32)).multilineTextAlignment(.center).padding()
                
                ForEach(languages, id:\.self) { language in
                    HStack {
                        Text(language).font(.system(size: 20))
                        Spacer()
                        Picker("", selection: self.binding(for: language)) {
                            ForEach(fluencyLevels, id: \.self) { level in
                                Text(level).tag(level)
                            }
                        }
                        .frame(width: 400)
                        .pickerStyle(.segmented)
                        .padding()
                    }
                    .padding(.horizontal, 200)
                }
                Button("Submit") {
                    AudioPlayerManager.shared.languageArray = calculateLanguageSequence()
                    isSettingUp = false
                }
                .font(.system(size: 32)).fontWidth(.expanded).padding(.vertical, 50)
            }
        } else {
            WelcomeView()
        }
    }
    
    private func binding(for language: String) -> Binding<String> {
        Binding<String>(
            get: { self.languageFluencyLevels[language, default: "Basic"] },
            set: { self.languageFluencyLevels[language] = $0 }
        )
    }
    
    private func calculateLanguageSequence() -> [String] {
        var output = [String]()
        var nativeLanguage = ""
        for language in languages {
            if languageFluencyLevels[language] == "Native" {
                nativeLanguage = language
                output.append(nativeLanguage)
                break
            }
        }
        if languageFluencyLevels["English"] == "Fluent" {
            output.append("English")
        } else {
            for language in languages {
                if languageFluencyLevels[language] == "Fluent" {
                    output.append(language)
                    break
                }
            }
        }

        for language in LanguageMap.langMap[nativeLanguage]![1] {
            if languageFluencyLevels[language] == "No Knowledge" && language != "None" {
                output.append(language)
                break
            }
        }
        
        if output.count != 3 {
            for language in LanguageMap.langMap[nativeLanguage]![2] {
                if languageFluencyLevels[language] == "No Knowledge" && language != "None" {
                    output.append(language)
                    break
                }
            }
        }
        
        for language in LanguageMap.langMap[nativeLanguage]![3].reversed() {
            if languageFluencyLevels[language] == "No Knowledge" && language != "None" {
                output.append(language)
                break
            }
        }
        
        if output.count != 4 {
            for language in LanguageMap.langMap[nativeLanguage]![2].reversed() {
                if languageFluencyLevels[language] == "No Knowledge" && language != "None" {
                    output.append(language)
                    break
                }
            }
        }
        return output.reversed()
    }
}

#Preview {
    SetupView()
}
