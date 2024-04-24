//
//  File.swift
//  
//
//  Created by Hamin Song on 4/24/24.
//

import UIKit

public struct DeviceInfo { 
  
  
  // MARK: - battery
  
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
  
  // MARK: - network
  
  static var isNetworkConnected: Bool {
    Self.Network.isConnected
  }
  
  static var isWifiConnected: Bool {
    Self.Network.isWiFiConnected
  }
  
  static var isCellularConnected: Bool {
    Self.Network.isCellularConnected
  }
  
  static var ipAddress: String? {
    Self.Network.ipAddress
  }
  
}

