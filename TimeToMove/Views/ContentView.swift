//
//  ContentView.swift
//  TimeToMove
//
//  Created by tunix on 08/08/23.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var viewModel : ContentViewModel = ContentViewModel()
  
  @AppStorage(PreferenceType.sound.rawValue) var playSoundToggle:  Bool = false
  @AppStorage(PreferenceType.startup.rawValue) var startupToggle : Bool = true
  
  
  var body: some View {
    VStack(alignment: .center) {
      Image("turtle64")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 48)
      
      Text("Time To Move")
        .font(.custom("Gilroy-ExtraBold", size: 22))
      
      HStack(alignment: .center){
        VStack{
          Text("Notify me every:")
            .font(.custom("Gilroy-Light", size: 12))
          Text("\(UserDefaults.standard.intervalAsString())")
            .font(.custom("Gilroy-Light", size: 12))
            .fontWeight(.semibold)
        }
        .padding()
        
        Slider(value: $viewModel.sliderTime, in: 0...4, step: 1)
          .onReceive(viewModel.$sliderTime,
                     perform: {value in
            viewModel.onSliderChanged(sliderValue: value)
          })
        
      }
      Spacer().frame(height: 20)
      HStack(alignment: .center, spacing: 10){
        Toggle("Play Sound", isOn: $playSoundToggle)
          .toggleStyle(SwitchToggleStyle())
          .font(.custom("Gilroy-Light", size: 12))
        Divider()
          .frame(height: 40)
        Toggle("Launch on Startup", isOn: $startupToggle)
          .toggleStyle(SwitchToggleStyle())
          .font(.custom("Gilroy-Light", size: 12))
        
      }
      
      Button("Quit App") {
        viewModel.closeApp()
      }
      .frame(width: 100, height: 40)
      .font(.body)
      .foregroundColor(.white)
      .cornerRadius(10)
      
      Text("Made with 🚀 tunix")
        .font(.footnote)
        .fontWeight(.light)
        .padding(.top)
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
