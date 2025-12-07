//
//  UserDefaults+Extension.swift
//  TodoList
//
//  Created by ikhwan on 08/12/25.
//

import Foundation

extension UserDefaults {
    func todos() -> [Task] {
        guard let data = data(forKey: "todos") else { return [] }
        
        do {
            return try JSONDecoder().decode([Task].self, from: data)
                } catch {
                    print("Failed to decode todos: \(error.localizedDescription)")
            return []
        }
    }
    
    func saveTodos(tasks: [Task]) {
        if let data = try? JSONEncoder().encode(tasks) {
            set(data, forKey: "todos")
        }
    }
}
