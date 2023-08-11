//
//  ContentViewModel.swift
//  TimeToMove
//
//  Created by tunix on 08/08/23.
//

import Foundation
import SwiftUI


class ContentViewModel : ObservableObject {
  @Published var sliderTime = 0.0
  
  private let preferences   = UserDefaults.standard
  private let reminder      = Reminder()
  
  func onSliderChanged(sliderValue: Double){
    preferences.saveSelectedInterval(Int(sliderValue))
    startTimer()
  }
  
  func startTimer(){
    reminder.reset()
  }
  
  func closeApp(){
    NSApplication.shared.terminate(nil)
  }
  
}
