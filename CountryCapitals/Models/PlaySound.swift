//
//  PlaySound.swift
//  CountryCapitals
//
//  Created by Ufuoma Okoro on 21/02/2020.
//  Copyright © 2020 Ufuoma Okoro. All rights reserved.
//

import Foundation
import AVFoundation



//Function to play speech
func readSpeech(word: String) {
    
    let utterance = AVSpeechUtterance(string: word)
    utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
    utterance.rate = 0.5
    
    
    let synthersizer = AVSpeechSynthesizer()
    synthersizer.speak(utterance)
    
}
