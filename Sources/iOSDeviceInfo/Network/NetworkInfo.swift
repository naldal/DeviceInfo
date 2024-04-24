//
//  File.swift
//  
//
//  Created by Hamin Song on 4/24/24.
//

import UIKit
import SystemConfiguration

internal extension DeviceInfo {
  struct Network {}
}

internal extension DeviceInfo.Network {
  
  static var isConnected: Bool {
    guard let reachability = SCNetworkReachabilityCreateWithName(nil, "www.apple.com") else {
      return false
    }
    
    var flags = SCNetworkReachabilityFlags()
    if !SCNetworkReachabilityGetFlags(reachability, &flags) {
      return false
    }
    
    let isReachable = flags.contains(.reachable)
    let needsConnection = flags.contains(.connectionRequired)
    
    return isReachable && !needsConnection
  }
  
  static var isWiFiConnected: Bool {
    guard let interfaceTypes = getActiveInterfaceTypes() else {
      return false
    }
    return interfaceTypes.contains("en0")
  }
  
  static var isCellularConnected: Bool {
    guard let interfaceTypes = getActiveInterfaceTypes() else {
      return false
    }
    return interfaceTypes.contains("pdp_ip0")
  }
  
  static var ipAddress: String? {
    var address: String?
    var ifaddr: UnsafeMutablePointer<ifaddrs>?
    
    if getifaddrs(&ifaddr) == 0 {
      var ptr = ifaddr
      while ptr != nil {
        defer { ptr = ptr?.pointee.ifa_next }
        
        guard let interface = ptr?.pointee else { return nil }
        let addrFamily = interface.ifa_addr.pointee.sa_family
        if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
          let name = String(cString: interface.ifa_name)
          if name == "en0" || name == "pdp_ip0" {
            var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
            getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                        &hostname, socklen_t(hostname.count),
                        nil, socklen_t(0), NI_NUMERICHOST)
            address = String(cString: hostname)
          }
        }
      }
      freeifaddrs(ifaddr)
    }
    return address
  }
  
  
  // MARK: - private func
  
  private static func getActiveInterfaceTypes() -> [String]? {
    var interfaces = [String]()
    var ifaddr: UnsafeMutablePointer<ifaddrs>?
    
    if getifaddrs(&ifaddr) == 0 {
      var ptr = ifaddr
      while ptr != nil {
        defer { ptr = ptr?.pointee.ifa_next }
        
        guard let interface = ptr?.pointee else { return nil }
        let addrFamily = interface.ifa_addr.pointee.sa_family
        if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
          let name = String(cString: interface.ifa_name)
          interfaces.append(name)
        }
      }
      freeifaddrs(ifaddr)
    }
    return interfaces
  }
  
}
