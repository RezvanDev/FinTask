//
//  HomeViewController.swift
//  FinTask
//
//  Created by Иван Незговоров on 24.06.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: -- Set layer
private extension HomeViewController {
    
    func setup() {
        view.backgroundColor = .white
        setupConstraintsHeaderView()
    }
    
    // setup constraints header view
    func setupConstraintsHeaderView() {
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
}
