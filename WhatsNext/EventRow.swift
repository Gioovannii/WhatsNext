//
//  EventRow.swift
//  WhatsNext
//
//  Created by Giovanni Gaffé on 2022/2/8.
//

import EventKit
import SwiftUI

struct EventRow: View {
    let event: EKEvent
    
    var body: some View {
        HStack {
            Text(event.title)
            Spacer()
            Text(eventDate)
        }
    }
    
    var eventDate: String {
        if Calendar.current.isDateInToday(event.startDate) ||
            Calendar.current.isDateInTomorrow(event.startDate) {
            return event.startDate.formatted(date: .omitted, time: .shortened)
        } else {
            return event.startDate.formatted(.dateTime.weekday(.wide).hour().minute())
        }
    }
}

