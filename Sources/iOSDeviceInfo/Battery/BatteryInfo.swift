//
//  File.swift
//  
//
//  Created by Hamin Song on 4/24/24.
//

import UIKit

public extension DeviceInfo {
  struct Battery {}
}


public extension DeviceInfo.Battery {
  
  static var level: Float {
    UIDevice.current.isBatteryMonitoringEnabled = true
    return UIDevice.current.batteryLevel
  }
  
  static var state: UIDevice.BatteryState {
    UIDevice.current.isBatteryMonitoringEnabled = true
    return UIDevice.current.batteryState
  }
  
  static var levelPercentage: Int {
    get throws {
      let level = DeviceInfo.Battery.level
      if level < 0 {
        throw DeviceInfoError.BatteryError.unknownBatteryLevel
      }
      return Int(level * 100)
    }
  }
  
}
