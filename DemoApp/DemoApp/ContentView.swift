//
//  ContentView.swift
//  testProj
//
//  Created by Hamin Song on 4/24/24.
//

import SwiftUI
import iOSDeviceInfo

struct ContentView: View {
  
  let batteryPercentage: Int
  
  init() {
    do {
      self.batteryPercentage = try DeviceInfo.batteryPercentage
    } catch {
      self.batteryPercentage = -1
    }
  }
    var body: some View {
        VStack {
          if batteryPercentage >= 0 {
            Text("Battery Percentage: \(batteryPercentage)%")
          } else {
            Text("Failed to retrieve battery percentage")
          }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
