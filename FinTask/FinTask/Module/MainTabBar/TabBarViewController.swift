//
//  ViewController.swift
//  FinTask
//
//  Created by Иван Незговоров, Timofey Zykov, Ivan Nezgovorov on 23.06.2024.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private let tabs: [(image: UIImage?, title: String)] = [
        (UIImage(systemName: "creditcard.and.123"), "Финансы"),
        (UIImage(systemName: "lightbulb.min"), "Задачи"),
        (UIImage(systemName: "house"), "Главная"),
        (UIImage(systemName: "eye"), "Аналитика"),
        (UIImage(systemName: "gearshape"), "Настройки")
    ]
    
    private lazy var tabBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var selectedItem = UIAction { [weak self] sender in
        guard
            let self = self,
            let sender = sender.sender as? UIButton
        else { return }
        
        self.selectedIndex = sender.tag
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedIndex = 2
    }
}

// MARK: -- Setup layer
private extension TabBarViewController {
    func setup() {
        view.backgroundColor = .red
        tabBar.isHidden = true
        setupTabBarButton()
        setControllers()
    }
    
    // setup tab button
    func setupTabBarButton() {
        let stackView = UIStackView(frame: tabBarView.bounds)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        tabs.enumerated().forEach { index, tab in
            let tabButton = createTabBarButton(icon: tab.image!, title: tab.title, tag: index)
            
            stackView.addArrangedSubview(tabButton)
        }
        
        view.addSubview(tabBarView)
        view.addSubview(stackView)
        
        setupConstraints(stack: stackView)
    }
    
    // create tab bar button
    func createTabBarButton(icon: UIImage, title: String, tag: Int) -> UIButton {
        var config = UIButton.Configuration.plain()
        config.image = icon
        config.title = title
        config.imagePadding = 2
        config.imagePlacement = .top
        
        var attributedTitle = AttributedString(title)
        attributedTitle.font = .systemFont(ofSize: 9, weight: .light)
        attributedTitle.foregroundColor = .white
        
        config.attributedTitle = attributedTitle

        
        let button = UIButton(configuration: config, primaryAction: selectedItem)
        button.tag = tag
        button.tintColor = .white
        return button
    }
    
    // SETUP constraints for stack, and tab bar view
    func setupConstraints(stack: UIStackView) {
        NSLayoutConstraint.activate([
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 80),
            
            stack.leadingAnchor.constraint(equalTo: tabBarView.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: tabBarView.trailingAnchor, constant: -20),
            stack.topAnchor.constraint(equalTo: tabBarView.topAnchor, constant: 10),
            stack.bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor, constant: -20)
        ])
    }
    
    // Set view controller
    func setControllers() {
        setViewControllers([FinanceViewController(), TaskViewController(), HomeViewController(), AnalyticViewController(), SettingViewController()], animated: true)
    }
}

