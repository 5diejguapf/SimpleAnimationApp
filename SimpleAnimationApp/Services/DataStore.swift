//
//  DataStore.swift
//  SimpleAnimationApp
//
//  Created by serg on 16.06.2023.
//

import SpringAnimation


class DataStore {
    static let shared = DataStore()
    
    let animations = AnimationPreset.allCases
    let curves = AnimationCurve.allCases
    
    private init() {}
}
