//
//  LanguageMap.swift
//  BachelorsExperiment
//
//  Created by Andreas Garcia on 2024-02-09.
//

import Foundation


struct LanguageMap {
        static var langMap: [String: [[String]]] = [
            "Swedish": [
                ["English"],
                ["German"],
                ["Italian", "Spanish", "Portuguese", "French", "Hindi"],
                ["Chinese (mandarin)", "Japanese", "Korean"]
            ],
            "English": [
                ["None"],
                ["Swedish", "German"],
                ["French", "Italian", "Portuguese", "Hindi"],
                ["Chinese (mandarin)", "Japanese", "Korean"]
            ],
            
            "German": [
                ["Swedish"],
                ["English"],
                ["French", "Italian", "Portuguese", "Spanish", "Hindi"],
                ["Chinese (mandarin)", "Japanese", "Korean"]
            ],
            
            "Italian": [
                ["Spanish", "Portuguese"],
                ["French"],
                ["Swedish", "German", "English", "Hindi"],
                ["Korean", "Japanese", "Chinese (mandarin)"]
            ],
            
            "French": [
                ["None"],
                ["Italian", "Portuguese", "Spanish"],
                ["English", "Swedish", "Hindi", "German"],
                ["Chinese (mandarin)", "Korean", "Japanese"]
            ],
            
            "Spanish": [
                ["Italian", "Portuguese"],
                ["French"],
                ["Swedish", "German", "Hindi", "English"],
                ["Chinese (mandarin)", "Japanese", "Korean"]
            ],
            "Portuguese": [
                ["Spanish", "Italian"],
                ["French"],
                ["Swedish", "English", "German", "Hindi"],
                ["Korean", "Japanese", "Chinese (mandarin)"]
            ],
            "Hindi": [
                ["None"],
                ["None"],
                ["Italian", "French", "Spanish", "Swedish", "Portuguese", "German", "English"],
                ["Korean", "Japanese", "Chinese (mandarin)"]
            ],
            
            "Korean": [
                ["None"],
                ["None"],
                ["Hindi", "Chinese (mandarin)"],
                ["Portuguese", "Italian", "Japanese", "French", "Spanish", "English", "Swedish", "German"]
            ],
            
            "Chinese (mandarin)": [
                ["None"],
                ["None"],
                ["Japanese", "Korean"],
                ["French", "German", "Swedish", "English", "Italian", "Hindi", "Portuguese", "Spanish"]
            ],
            
            "Japanese": [
                ["None"],
                ["None"],
                ["Chinese (mandarin)", "Hindi"],
                ["German", "Korean", "French", "Italian", "English", "Swedish", "Portuguese", "Spanish"]
            ],
            
        ]
    }
