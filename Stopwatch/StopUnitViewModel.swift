//
//  StopUnitViewModel.swift
//  Stopwatch
//
//  Created by Manav Prakash on 12/09/24.
//

import SwiftUI

class StopwatchUnitViewModel: ObservableObject {
    var timeUnit: Int
    
    init(timeUnit: Int) {
        self.timeUnit = timeUnit
    }
    
    var timeUnitStr: String {
        let timeUnitStr = String(timeUnit)
        return timeUnit < 10 ? "0" + timeUnitStr : timeUnitStr
    }
}


extension String {
  func substring(index: Int) -> String {
    let arrayString = Array(self)
    return String(arrayString[index])
  }
}
