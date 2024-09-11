//
//  StopWatchUnit.swift
//  Stopwatch
//
//  Created by Manav Prakash on 12/09/24.
//

import SwiftUI

struct StopWatchUnitView: View {
  
  var timeUnit: Int
  var timeUnitText: String
  var color: Color
  
  var timeUnitStr: String {
    let timeUnitStr = String(timeUnit)
    return timeUnit < 10 ? "0" + timeUnitStr : timeUnitStr
  }
  
  var body: some View {
    VStack {
      ZStack {
        RoundedRectangle(cornerRadius: 15.0)
          .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round))
          .fill(color)
          .frame(width: 75, height: 75, alignment: .center)
        
        HStack(spacing: 2) {
          Text(timeUnitStr.substring(index: 0))
            .contentTransition(.numericText(countsDown: false))
            .font(.system(size: 48))
            .frame(width: 28)
          Text(timeUnitStr.substring(index: 1))
            .contentTransition(.numericText(countsDown: false))
            .font(.system(size: 48))
            .frame(width: 28)
        }
      }
      
      Text(timeUnitText)
        .font(.system(size: 16))
    }
  }
}
