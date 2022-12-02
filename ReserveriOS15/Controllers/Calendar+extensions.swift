//
//  Calendar+extensions.swift

import Foundation

extension Calendar {
    func isDateAHoliday(_ date: Date) -> Bool{
        return self.isDateInWeekend(date)
    }
}
