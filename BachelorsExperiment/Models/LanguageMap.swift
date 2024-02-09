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
                ["Chinese", "Japanese", "Korean"]
            ],
            "English": [
                ["None"],
                ["Swedish", "German"],
                ["French", "Italian", "Portuguese", "Hindi"],
                ["Chinese", "Japanese", "Korean"]
            ],
            
            "German": [
                ["Swedish"],
                ["English"],
                ["French", "Italian", "Portuguese", "Spanish", "Hindi"],
                ["Chinese", "Japanese", "Korean"]
            ],
            
            "Italian": [
                ["Spanish", "Portuguese"],
                ["French"],
                ["Swedish", "German", "English", "Hindi"],
                ["Korean", "Japanese", "Chinese"]
            ],
            
            "French": [
                ["None"],
                ["Italian", "Portuguese", "Spanish"],
                ["English", "Swedish", "Hindi", "German"],
                ["Chinese", "Korean", "Japanese"]
            ],
            
            "Spanish": [
                ["Italian", "Portuguese"],
                ["French"],
                ["Swedish", "German", "Hindi", "English"],
                ["Chinese", "Japanese", "Korean"]
            ],
            "Portuguese": [
                ["Spanish", "Italian"],
                ["French"],
                ["Swedish", "English", "German", "Hindi"],
                ["Korean", "Japanese", "Chinese"]
            ],
            "Hindi": [
                ["None"],
                ["None", ],
                ["Italian", "French", "Spanish", "Swedish", "Portuguese", "German", "English"],
                ["Korean", "Japanese", "Chinese"]
            ],
            
            "Korean": [
                ["None"],
                ["None"],
                ["Hindi", "Chinese"],
                ["Portuguese", "Italian", "Japanese", "French", "Spanish", "English", "Swedish", "German"]
            ],
            
            "Chinese": [
                ["None"],
                ["None"],
                ["Japanese", "Korean"],
                ["French", "German", "Swedish", "English", "Italian", "Hindi", "Portuguese", "Spanish"]
            ],
            
            "Japanese": [
                ["None"],
                ["None"],
                ["Chinese", "Hindi"],
                ["German", "Korean", "French", "Italian", "English", "Swedish", "Portuguese", "Spanish"]
            ],
            
        ]
    }
