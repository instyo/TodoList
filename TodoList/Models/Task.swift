//
//  Task.swift
//  TodoList
//
//  Created by ikhwan on 08/12/25.
//

import Foundation

struct Task: Codable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool
}
