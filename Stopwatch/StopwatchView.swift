//
//  File.swift
//  Stopwatch
//
//  Created by Manav Prakash on 12/09/24.
//

import SwiftUI


struct StopwatchView: View {
  @StateObject private var viewModel = StopwatchViewModel()
  
  private let darkBlue = Color(red: 96/255, green: 174/255, blue: 201/255)
  private let darkPink = Color(red: 244/255, green: 132/255, blue: 177/255)
  private let darkGreen = Color(red: 137/255, green: 192/255, blue: 180/255)
  
  var body: some View {
    VStack {
      TimeInputView(totalSeconds: $viewModel.progressTime)
        .disabled(viewModel.isRunning)
      
      HStack(spacing: 10) {
        StopWatchUnitView(timeUnit: viewModel.hours, timeUnitText: "HOUR", color: darkPink)
        Text(":")
          .font(.system(size: 48))
          .offset(y: -18)
        StopWatchUnitView(timeUnit: viewModel.minutes, timeUnitText: "MINUTE", color: darkBlue)
        Text(":")
          .font(.system(size: 48))
          .offset(y: -18)
        StopWatchUnitView(timeUnit: viewModel.seconds, timeUnitText: "SECOND", color: darkGreen)
      }
      
      HStack {
        Button(action: {
          viewModel.toggleTimer()
        }) {
          ZStack {
            RoundedRectangle(cornerRadius: 15.0)
              .frame(width: 120, height: 50, alignment: .center)
              .foregroundColor(viewModel.isRunning ? darkPink : darkGreen)
            
            Text(viewModel.isRunning ? "Stop" : "Start")
              .font(.title)
              .foregroundColor(.white)
          }
        }
        
        Button(action: {
          viewModel.reset()
        }) {
          ZStack {
            RoundedRectangle(cornerRadius: 15.0)
              .frame(width: 120, height: 50, alignment: .center)
              .foregroundColor(.gray)
            
            Text("Reset")
              .font(.title)
              .foregroundColor(.white)
          }
        }
      }
    }
  }
}



#Preview {
  StopwatchView()
}
