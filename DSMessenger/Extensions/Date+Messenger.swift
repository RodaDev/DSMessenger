//
//  Date+Messenger.swift
//  DSMessenger
//
//  Created by Dmitry Sharygin on 06.10.2023.
//
import Foundation

extension Date {
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateFormat = "HH:mm"
        return formatter
    }
    
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateFormat = "MM/dd/yy"
        return formatter
    }
    
    func timeStampString() -> String {
        return Calendar.current.isDateInToday(self) ? timeString() : dayString()
    }
    
    private func timeString() -> String {
        timeFormatter.string(from: self)
    }
    
    private func dayString() -> String {
        dayFormatter.string(from: self)
    }
}
