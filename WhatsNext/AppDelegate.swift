//
//  AppDelegate.swift
//  WhatsNext
//
//  Created by Giovanni Gaffé on 2022/2/8.
//

import SwiftUI

class appDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popover = NSPopover()
    
    func showPopover() {
        guard let statusBarItem = statusItem?.button else { return }
        
        popover.show(relativeTo: statusBarItem.bounds, of: statusBarItem, preferredEdge: .maxY)
    }
    
    
}
