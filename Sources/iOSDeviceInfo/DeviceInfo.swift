//
//  File.swift
//  
//
//  Created by Hamin Song on 4/24/24.
//

import UIKit

public struct DeviceInfo { 
  
  
  // MARK: - BATTERY
  
  public static var batteryLevel: Float {
    Battery.level
  }
  
  public static var batteryState: UIDevice.BatteryState {
    Battery.state
  }
  
  public static var batteryPercentage: Int {
    get throws {
      try Battery.levelPercentage
    }
  }
  
  // MARK: - NETWORK
  
  static var isNetworkConnected: Bool {
    Network.isConnected
  }
  
  static var isWifiConnected: Bool {
    Network.isWiFiConnected
  }
  
  static var isCellularConnected: Bool {
    Network.isCellularConnected
  }
  
  static var ipAddress: String? {
    Network.ipAddress
  }
  
  // MARK: - SPEC
  
  static var cpuInfo: String {
    SpecInfo.cpuInfo
  }
  
  static var ramCapacity: String {
    SpecInfo.ramCapacity
  }
  
  static var storageCapacity: String {
    SpecInfo.storageCapacity
  }
  
  static var screenResolution: String {
    SpecInfo.screenResolution
  }
  
  static var screenSize: String {
    SpecInfo.screenSize
  }
  
}

