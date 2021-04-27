//
//  ViewController.swift
//  AutoLayoutStarter
//
//  Created by Derrick Park on 2019-04-17.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let main = UIView()
        // important when setting contraints programmatically
        main.translatesAutoresizingMaskIntoConstraints = false
        main.backgroundColor = .green
        return main
    }()
    
    let pinkBox1: UIView = {
        let rect = CGRect.zero
        let view = UIView(frame: rect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    let pinkBox2: UIView = {
        let rect = CGRect.zero
        let view = UIView(frame: rect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    let blueBoxSize = CGFloat(40)
    let blueBox1: UIView = {
        let rect = CGRect.zero
        let box = UIView(frame: rect)
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .blue
        return box
    }()
    
    let blueBox2: UIView = {
        let rect = CGRect.zero
        let box = UIView(frame: rect)
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .blue
        return box
    }()
    
    let blueBox3: UIView = {
        let rect = CGRect.zero
        let box = UIView(frame: rect)
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .blue
        return box
    }()

    let purpleBox: UIView = {
        let rect = CGRect.zero
        let view = UIView(frame: rect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        return view
    }()
    
    let squareButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Square", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(squareTapped), for: .touchUpInside)
        return butt
    }()
    
    let portraitButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Portrait", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(portraitTapped), for: .touchUpInside)
        return butt
    }()
    
    let landScapeButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("Landscape", for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.addTarget(self, action: #selector(landscapeTapped), for: .touchUpInside)
        return butt
    }()
    
    var widthAnchor: NSLayoutConstraint?
    var heightAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Blue
        let blueContainer = UIStackView(arrangedSubviews: [
            blueBox1, blueBox2, blueBox3
        ])
        blueContainer.translatesAutoresizingMaskIntoConstraints = false
        blueContainer.alignment = .center
        blueContainer.axis = .vertical
        blueContainer.distribution = .equalSpacing
        
        // Red
        
        let redContainer = UIStackView(arrangedSubviews: [pinkBox1, pinkBox2])
        redContainer.backgroundColor = .red
        
        redContainer.translatesAutoresizingMaskIntoConstraints = false
        redContainer.alignment = .center
        redContainer.axis = .horizontal
        redContainer.distribution = .equalSpacing
        redContainer.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        redContainer.isLayoutMarginsRelativeArrangement = true
        
        // Add subview
        mainView.addSubview(purpleBox)
        mainView.addSubview(redContainer)
        mainView.addSubview(blueContainer)
        
        NSLayoutConstraint.activate([
            // puple
            purpleBox.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
            purpleBox.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            purpleBox.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.6),
            purpleBox.heightAnchor.constraint(equalToConstant: 40),
            
            // red
            redContainer.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            redContainer.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            redContainer.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.3),
            redContainer.heightAnchor.constraint(equalToConstant: 60),
            pinkBox1.widthAnchor.constraint(equalTo: redContainer.widthAnchor, multiplier: 0.4),
            pinkBox1.heightAnchor.constraint(equalTo: redContainer.heightAnchor, multiplier: 0.8),
            pinkBox2.widthAnchor.constraint(equalTo: redContainer.widthAnchor, multiplier: 0.4),
            pinkBox2.heightAnchor.constraint(equalTo: redContainer.heightAnchor, multiplier: 0.8),
            
            // blue
            blueContainer.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            blueContainer.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 25),
            blueContainer.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -25),
            blueContainer.widthAnchor.constraint(equalToConstant: blueBoxSize),
            blueBox1.widthAnchor.constraint(equalToConstant: blueBoxSize),
            blueBox1.heightAnchor.constraint(equalToConstant: blueBoxSize),
            blueBox2.widthAnchor.constraint(equalToConstant: blueBoxSize),
            blueBox2.heightAnchor.constraint(equalToConstant: blueBoxSize),
            blueBox3.widthAnchor.constraint(equalToConstant: blueBoxSize),
            blueBox3.heightAnchor.constraint(equalToConstant: blueBoxSize),
        ])
        
        view.addSubview(mainView)
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        widthAnchor = mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7, constant: 0)
        widthAnchor?.isActive = true
        
        heightAnchor = mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7, constant: 0)
        heightAnchor?.isActive = true
        
        let buttStackView = UIStackView(arrangedSubviews: [
                                            squareButton, portraitButton, landScapeButton])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.alignment = .center
        buttStackView.distribution = .fillEqually
        
        view.addSubview(buttStackView)
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 50),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    @objc private func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 2.0) {
            self.widthAnchor?.isActive = false
            self.widthAnchor? = self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95)
            self.widthAnchor?.isActive = true
            
            self.heightAnchor?.isActive = false
            self.heightAnchor? = self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4)
            self.heightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}

