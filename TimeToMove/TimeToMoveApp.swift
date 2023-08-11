//
//  TimeToMoveApp.swift
//  TimeToMove
//
//  Created by tunix on 08/08/23.
//

import SwiftUI

@main
struct TimeToMoveApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        Settings{
            EmptyView().frame(width: .zero)
        }
    }
}

