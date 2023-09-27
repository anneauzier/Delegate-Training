//
//  CounterViewController.swift
//  DelegateTest
//
//  Created by Anne Victoria Batista Auzier on 27/09/23.
//

import UIKit

protocol IncrementValueDelegate {
    func increment() -> Void
}

class CounterViewController: UIViewController, IncrementValueDelegate {

    private var value: Int = 0

    lazy var counterLabel: UILabel = {
        let frame = CGRect(x: view.bounds.midX - 50,
                           y: view.bounds.midY - 30,
                           width: 100,
                           height: 60)
        let label = UILabel(frame: frame)
        label.text = String(value)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 64, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var navigateButton: UIButton = {
        let frame = CGRect(x: view.bounds.midX - 100,
                           y: view.bounds.maxY - 140,
                           width: 200,
                           height: 60)

        let button = UIButton(frame: frame)
        button.backgroundColor = .black
        button.setTitle("Show", for: .normal)
        button.layer.cornerRadius = 16
        return button
    }()
    
    func increment() {
        self.value += 1
        
        counterLabel.text = String(value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(counterLabel)
        view.addSubview(navigateButton)

        navigateButton.addTarget(self, action: #selector(navigate), for: .touchUpInside)
    }
    
    @objc
    private func navigate(_ sender: UIButton) {
        let controlViewController = ControlViewController()

        controlViewController.delegate = self
        
        present(controlViewController, animated: true)
    }
}
