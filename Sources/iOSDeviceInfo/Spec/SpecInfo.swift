//
//  File.swift
//
//
//  Created by Hamin Song on 4/24/24.
//

import UIKit

internal extension DeviceInfo {
  struct SpecInfo { }
}

extension DeviceInfo.SpecInfo {
  
  static var cpuInfo: String {
    let processorInfo = ProcessInfo.processInfo
    let cpuCount = processorInfo.processorCount
    let activeProcessorCount = processorInfo.activeProcessorCount
    
    var cpuInfo = "CPU Information:\n"
    cpuInfo += "- Processor Name: \(processorInfo.processName)\n"
    cpuInfo += "- CPU Core Count: \(cpuCount)\n"
    cpuInfo += "- Active CPU Core Count: \(activeProcessorCount)"
    
    return cpuInfo
  }
  
  static var ramCapacity: String {
    let bytesInMegabyte = 1024.0 * 1024.0
    let physicalMemory = Double(ProcessInfo.processInfo.physicalMemory) / bytesInMegabyte
    let formattedMemory = String(format: "%.2f", physicalMemory)
    
    return "\(formattedMemory) MB"
  }
  
  static var storageCapacity: String {
    let bytesInGigabyte = 1024.0 * 1024.0 * 1024.0
    let totalDiskSpace = Double(totalDiskSpaceInBytes()) / bytesInGigabyte
    let formattedDiskSpace = String(format: "%.2f", totalDiskSpace)
    
    return "\(formattedDiskSpace) GB"
  }
  
  static var screenResolution: String {
    let screenBounds = UIScreen.main.bounds
    let screenScale = UIScreen.main.scale
    let screenWidth = screenBounds.width * screenScale
    let screenHeight = screenBounds.height * screenScale
    
    return "\(Int(screenWidth)) x \(Int(screenHeight))"
  }
  
  static var screenSize: String {
    let screenBounds = UIScreen.main.bounds
    let screenWidth = screenBounds.width
    let screenHeight = screenBounds.height
    let screenDiagonal = sqrt(pow(screenWidth, 2) + pow(screenHeight, 2))
    let formattedDiagonal = String(format: "%.2f", screenDiagonal)
    
    return "\(formattedDiagonal) inches"
  }
  
  // MARK: - private func
  
  private static func totalDiskSpaceInBytes() -> Int64 {
    guard let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String),
          let space = (systemAttributes[FileAttributeKey.systemSize] as? NSNumber)?.int64Value else {
      return 0
    }
    return space
  }
}
