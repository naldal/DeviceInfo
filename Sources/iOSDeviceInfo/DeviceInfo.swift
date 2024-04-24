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
  
  public static var isNetworkConnected: Bool {
    Network.isConnected
  }
  
  public static var isWifiConnected: Bool {
    Network.isWiFiConnected
  }
  
  public static var isCellularConnected: Bool {
    Network.isCellularConnected
  }
  
  public static var ipAddress: String? {
    Network.ipAddress
  }
  
  // MARK: - SPEC
  
  public static var cpuInfo: String {
    SpecInfo.cpuInfo
  }
  
  public static var ramCapacity: String {
    SpecInfo.ramCapacity
  }
  
  public static var storageCapacity: String {
    SpecInfo.storageCapacity
  }
  
  public static var screenResolution: String {
    SpecInfo.screenResolution
  }
  
  public static var screenSize: String {
    SpecInfo.screenSize
  }
  
}

