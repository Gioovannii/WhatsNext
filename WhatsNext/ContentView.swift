//
//  ContentView.swift
//  WhatsNext
//
//  Created by Giovanni Gaffé on 2022/2/8.
//

import EventKit
import SwiftUI

extension Date {
    func offsetBy(days: Int, seconds: Int) -> Date {
        var components = DateComponents()
        components.day = days
        components.second = seconds
        return Calendar.current.date(byAdding: components, to: self) ?? self
    }
    
    static var startOfToday: Date {
        Calendar.current.startOfDay(for: Date.now)
    }
    
    static var endOfToday: Date {
        startOfToday.offsetBy(days: 1, seconds: -1)
    }
    
    
    static var startOfTomorrow: Date {
        startOfToday.offsetBy(days: 1, seconds: 0)
    }
    
    static var endOfTomorrow: Date {
        startOfToday.offsetBy(days: 2, seconds: -1)
    }
    
    static var startOfLater: Date {
        startOfToday.offsetBy(days: 2, seconds: 0)
    }
    
    static var endOfLater: Date {
        startOfToday.offsetBy(days: 7, seconds: 0)
    }
}

struct ContentView: View {
    @State private var eventStore = EKEventStore()
    @State private var storeAccessGranted = false
    
    @State private var todayEvents = [EKEvent]()
    @State private var tomorrowEvents = [EKEvent]()
    @State private var laterEvents = [EKEvent]()

    var body: some View {
        VStack {
            List {
                EventSection(name: "Today", events: todayEvents)
                EventSection(name: "Tomorrow", events: tomorrowEvents)
                EventSection(name: "Later", events: laterEvents)
            }
            
            Button("Close") {
                NSApp.terminate(nil)
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                eventStore.requestAccess(to: .event) { granted, error in
                    storeAccessGranted = granted

//                    NSApp.terminate(nil)
                    
                    if granted {
                        todayEvents = events(from: Date.now, to: Date.endOfToday)
                        tomorrowEvents = events(from: Date.startOfTomorrow, to: Date.endOfTomorrow)
                        laterEvents = events(from: Date.startOfLater, to: Date.endOfLater)
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
