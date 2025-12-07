//
//  TaskViewCell.swift
//  TodoList
//
//  Created by ikhwan on 08/12/25.
//

import UIKit

class TaskViewCell: UITableViewCell {
    
    let titleLabel: UILabel = UILabel()
    let checkbox: UIImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        // Set translatesAutoresizingMaskIntoConstraints FIRST
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure titleLabel
        titleLabel.numberOfLines = 2
        addSubview(titleLabel)
        
        // Configure checkbox
        checkbox.image = UIImage(systemName: "square")
        checkbox.contentMode = .scaleAspectFit
        checkbox.tintColor = UIColor.black
        addSubview(checkbox)
        
        NSLayoutConstraint.activate([
            // Title
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                        titleLabel.trailingAnchor.constraint(equalTo: checkbox.leadingAnchor, constant: -16),
            
            // Checkbox
            checkbox.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            checkbox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkbox.widthAnchor.constraint(equalToConstant: 24),
            checkbox.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func configure(with task: Task) {
        titleLabel.text = task.title
        if task.isCompleted {
            checkbox.image = UIImage(systemName: "checkmark.square")
                        checkbox.tintColor = UIColor.systemBlue
                    } else {
                        checkbox.image = UIImage(systemName: "square")
                        checkbox.tintColor = UIColor.black
        }
    }
}
