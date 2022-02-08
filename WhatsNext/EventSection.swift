//
//  EventSection.swift
//  WhatsNext
//
//  Created by Giovanni Gaffé on 2022/2/8.
//

import SwiftUI
import EventKit

struct EventSection: View {
    let name: String
    let events: [EKEvent]
    
    var body: some View {
        Section(name) {
            if events.isEmpty {
                Text("Nothing!")
            } else {
                ForEach(events, id: \.calendarItemIdentifier, content: EventRow.init)
            }
        }
    }
}

