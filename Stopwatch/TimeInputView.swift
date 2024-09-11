//
//  TimePickerView.swift
//  Stopwatch
//
//  Created by Manav Prakash on 12/09/24.
//

import Foundation

import SwiftUI

struct TimeInputView: View {
  @State private var selectedHours = 0
  @State private var selectedSeconds = 0
  @State private var selectedMinutes = 0
  
  @Binding var totalSeconds: Int
  
  var body: some View {
    VStack {
      HStack {
        Picker("Hours", selection: $selectedHours) {
          ForEach(0..<24) { hour in
            Text("\(hour) hr")
          }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(width: 100)
        
        Picker("Minutes", selection: $selectedMinutes) {
          ForEach(0..<60) { minute in
            Text("\(minute) min")
          }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(width: 100)
        
        Picker("Seconds", selection: $selectedSeconds) {
          ForEach(0..<60) { second in
            Text("\(second) sec")
          }
        }
        .pickerStyle(WheelPickerStyle())
        .frame(width: 100)
      }
      .onChange(of: selectedHours) { _ in
        updateTotalSeconds()
      }
      .onChange(of: selectedMinutes) { _ in
        updateTotalSeconds()
      }
      .onChange(of: selectedSeconds) { _ in
        updateTotalSeconds()
      }
    }
  }
  
  func updateTotalSeconds() {
    totalSeconds = (selectedHours * 3600) + (selectedMinutes * 60) + selectedSeconds
  }
}

