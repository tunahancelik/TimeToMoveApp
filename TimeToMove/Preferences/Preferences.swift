//
//  Preferences.swift
//  TimeToMove
//
//  Created by tunix on 08/08/23.
//

import Foundation

enum PreferenceType: String {
    case interval
    case sound
    case startup
}

extension UserDefaults {
    
    func isSoundEnabled() -> Bool {
        return bool(forKey: PreferenceType.sound.rawValue)
    }
    
    func isStartupLaunch() -> Bool {
        return bool(forKey: PreferenceType.startup.rawValue)
    }
    
    func saveSound(isEnabled: Bool) {
        set(isEnabled, forKey: PreferenceType.sound.rawValue)
    }
    
    func saveStartupLaunch(isEnabled: Bool) {
        set(isEnabled, forKey: PreferenceType.startup.rawValue)
    }
    
}
