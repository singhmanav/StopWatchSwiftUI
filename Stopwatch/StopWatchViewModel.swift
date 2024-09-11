//
//  StopWatchViewModel.swift
//  Stopwatch
//
//  Created by Manav Prakash on 12/09/24.
//

import SwiftUI
import Combine

class StopwatchViewModel: ObservableObject {
  @Published var progressTime = 0
  @Published var isRunning = false
  
  var hours: Int {
    progressTime / 3600
  }
  
  var minutes: Int {
    (progressTime % 3600) / 60
  }
  
  var seconds: Int {
    progressTime % 60
  }
  
  private var timer: Timer?
  
  func toggleTimer() {
    if isRunning {
      stopTimer()
    } else {
      startTimer()
    }
    isRunning.toggle()
  }
  
  func reset() {
    stopTimer()
    progressTime = 0
    isRunning = false
  }
  
  private func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
      withAnimation {
        self?.progressTime -= 1
        if self?.progressTime ?? 0 < 0 {
          self?.progressTime = 0
          self?.toggleTimer()
        }
      }
    }
  }
  
  private func stopTimer() {
    timer?.invalidate()
    timer = nil
  }
}



