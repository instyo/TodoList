//
//  AddTaskViewController.swift
//  TodoList
//
//  Created by ikhwan on 08/12/25.
//

import UIKit

protocol AddTaskDelegate: AnyObject {
    func onTapSave(title: String)
}

class AddTaskViewController: UIViewController {
    
    weak var delegate: AddTaskDelegate?
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter task"
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray4.cgColor
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        // Add padding
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        tf.leftViewMode = .always
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        tf.rightViewMode = .always
        
        return tf
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        self.title = "Add new task"
        view.backgroundColor = .white
        
        view.addSubview(textField)
        view.addSubview(saveButton)
        
        // Connect the button action
        saveButton.addTarget(self, action: #selector(handleTapSave), for: .touchUpInside)
        
        // Setup constraints
        NSLayoutConstraint.activate([
            // Text field constraints
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 44),
            
            // Save button constraints
            saveButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saveButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func handleTapSave() {
       guard let text = textField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
                    // Show alert if text is empty or only whitespace
            let alert = UIAlertController(title: "Error", message: "Please enter a task", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        delegate?.onTapSave(title: text)
        navigationController?.popViewController(animated: true)
    }
}
