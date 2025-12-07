//
//  ViewController.swift
//  TodoList
//
//  Created by ikhwan on 08/12/25.
//

import UIKit

class ViewController: UIViewController {
    
    var todos: [Task] = []
    
    let tableView = UITableView()
    
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskViewCell.self, forCellReuseIdentifier: "TodoCell")
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    func setupActivityIndicator() {
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func setupNavbar() {
        self.title = "My Todos"
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = plusButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        getTasks()
        setupTableView()
    }
    
    @objc func addButtonTapped() {
        let vc = AddTaskViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func getTasks() {
        todos = UserDefaults.standard.todos()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, AddTaskDelegate {
    func onTapSave(title: String) {
        todos.append(Task(title: title, isCompleted: false))
        UserDefaults.standard.saveTodos(tasks: todos)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? TaskViewCell else {
                    return UITableViewCell()
                }
        let task = todos[indexPath.row]
        cell.configure(with: task)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todos[indexPath.row].isCompleted.toggle()
        UserDefaults.standard.saveTodos(tasks: todos)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
