//
//  dateFomatter.swift
//  JournalCoreData
//
//  Created by Lon Chandler Madsen on 7/26/21.
//

import Foundation

extension Date {
    func dateAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
}
