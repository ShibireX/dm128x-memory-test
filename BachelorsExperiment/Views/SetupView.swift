//
//  SetupView.swift
//  BachelorsExperiment
//
//  Created by Andreas Garcia on 2024-02-07.
//

import SwiftUI

struct SetupView: View {
    @State private var languageFluencyLevels: [String : String] = ["Swedish" : "", "English" : "", "German" : "", "Italian" : "", "French" : "", "Spanish" : "", "Portuguese" : "", "Hindi": "", "Korean" : "", "Chinese (mandarin)" : "", "Japanese" : ""]
    let fluencyLevels: [String] = ["Native", "Fluent", "Familiar", "Unfamiliar", "Unheard"]
    let languages: [String] = ["Swedish", "English", "German", "Italian", "French", "Spanish", "Portuguese", "Hindi", "Korean", "Chinese (mandarin)", "Japanese"]
    
    var body: some View {
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
        }
    }
    
    private func binding(for language: String) -> Binding<String> {
        Binding<String>(
            get: { self.languageFluencyLevels[language, default: "Unfamiliar"] },
            set: { self.languageFluencyLevels[language] = $0 }
        )
    }
}

#Preview {
    SetupView()
}
