//
//  ContentView.swift
//  WhatsNext
//
//  Created by Giovanni Gaffé on 2022/2/8.
//

import EventKit
import SwiftUI

struct ContentView: View {
    @State private var eventStore = EKEventStore()
    @State private var storeAccessGranted = false
    
    @State private var todayEvents = [EKEvent]()
    @State private var tomorrowEvents = [EKEvent]()
    @State private var laterEvents = [EKEvent]()

    var body: some View {
        Text("Hello, world!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                eventStore.requestAccess(to: .event) { granted, error in
                    storeAccessGranted = granted

                    if granted {
                        // read events
                    }
                }
            }
    }
    
    func events(from: Date, to: Date) -> [EKEvent] {
        let predicate = eventStore.predicateForEvents(withStart: from, end: to, calendars: nil)
        return eventStore.events(matching: predicate)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
