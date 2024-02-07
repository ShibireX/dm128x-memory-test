//
//  ContentView.swift
//  BachelorsExperiment
//
//  Created by Andreas Garcia on 2024-02-07.
//

import SwiftUI

struct WelcomeView: View {
    @State var showTestView: Bool = false
    var body: some View {
        if showTestView {
            TestView()
        } else {
            VStack {
                Text("Memory Experiment")
                Button {
                    showTestView = true
                } label: {
                    Text("Start").padding(.horizontal, 150).padding(.vertical, 15)
                }
            }
            .font(.system(size: 64, weight: .medium)).fontWidth(.expanded)
            .padding()
        }
    }
    
}

#Preview {
    WelcomeView()
}
