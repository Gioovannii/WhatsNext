//
//  AppDelegate.swift
//  WhatsNext
//
//  Created by Giovanni Gaffé on 2022/2/8.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popover = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem?.button?.title = "What's next?"
        statusItem?.button?.target = self
        statusItem?.button?.action = #selector(tooglePopover)
        
        let contentView = ContentView()
        popover.contentSize = NSSize(width: 400, height: 400)
        popover.contentViewController = NSHostingController(rootView: contentView)
        
        NSEvent.addGlobalMonitorForEvents(matching: [.leftMouseDown, .rightMouseDown]) { [weak self] event in
            guard let self = self else { return }
            
            if self.popover.isShown {
                self.hidePopover(event)
            }
        }
    }
    
    func showPopover() {
        guard let statusBarItem = statusItem?.button else { return }
        popover.show(relativeTo: statusBarItem.bounds, of: statusBarItem, preferredEdge: .maxY)
    }
    
    func hidePopover(_ sender: Any) {
        popover.performClose(sender)
    }
    
    @objc func tooglePopover(_ sender: Any) {
        if popover.isShown {
            hidePopover(sender)
        } else {
            showPopover()
        }
    }
}
