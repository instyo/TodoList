//
//  TaskManager.swift
//  TodoList
//
//  Created by ikhwan on 08/12/25.
//

import Foundation

final class TaskManager {
    private let storage = UserDefaults.standard
    
    var tasks: [Task] = []
    
    func loadTasks() {
        tasks = storage.todos()
    }
    
    private func saveTasks() {
        storage.saveTodos(tasks: tasks)
    }
    
    func addTask(_ title: String) {
        let task = Task(title: title, isCompleted: false)
        tasks.append(task)
        saveTasks()
    }
    
    func toggleTask(at index: Int) {
        tasks[index].isCompleted.toggle()
        saveTasks()
    }
    
    
}
