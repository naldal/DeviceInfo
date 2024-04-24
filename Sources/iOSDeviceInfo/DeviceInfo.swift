//
//  File.swift
//  
//
//  Created by Hamin Song on 4/24/24.
//

import UIKit

public struct DeviceInfo { 
  
  static var batteryLevel: Float {
    Self.Battery.level
  }
  
  static var batteryState: UIDevice.BatteryState {
    Self.Battery.state
  }
  
  static var batteryPercentage: Int {
    get throws {
      try Self.Battery.levelPercentage
    }
  }
  
}

