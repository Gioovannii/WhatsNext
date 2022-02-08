//
//  WhatsNextApp.swift
//  WhatsNext
//
//  Created by Giovanni Gaffé on 2022/2/8.
//

import SwiftUI

@main
struct WhatsNextApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}
