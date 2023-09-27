//
//  ControlViewController.swift
//  DelegateTest
//
//  Created by Anne Victoria Batista Auzier on 27/09/23.
//

import UIKit

class ControlViewController: UIViewController {
    
    var delegate: IncrementValueDelegate?
    
    lazy var incrementButton: UIButton = {
        let frame = CGRect(x: view.bounds.midX - 100,
                           y: 140,
                           width: 200,
                           height: 60)
        let button = UIButton(frame: frame)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 16
        button.setTitle("Increment", for: .normal)
        button.titleLabel?.textColor = .white
        return button
    }()
    
    override func viewDidLoad() {
        view.addSubview(incrementButton)
        view.backgroundColor = .black
        
        incrementButton.addTarget(self, action: #selector(increment), for: .touchUpInside)
    }
    
    @objc
    func increment() {
        delegate?.increment()
    }
}
