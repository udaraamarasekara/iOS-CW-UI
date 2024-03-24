//
//  Item.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-03-24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
