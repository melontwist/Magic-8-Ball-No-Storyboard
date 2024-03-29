//
//  ViewController.swift
//  Magic-8-Ball-No-Storyboard
//
//  Created by Vianney Marcellin on 2022/05/07.
//

import UIKit

class ViewController: UIViewController {
  
    private let topView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let middleView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [topView, middleView, bottomView])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let magicBallImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "ball1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Ask Me Anything..."
        label.tintColor = .white
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    lazy var askButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ask", for: .normal)
        button.backgroundColor = .white
        button.tintColor = UIColor(red: 0.36, green: 0.69, blue: 0.88, alpha: 1.00)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(askButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    let ballArray: [UIImage?] = [UIImage(named: "ball1"), UIImage(named: "ball2"), UIImage(named: "ball3"), UIImage(named: "ball4"), UIImage(named: "ball5"),]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.36, green: 0.69, blue: 0.88, alpha: 1.00)
        
        view.addSubview(stackView)
        topView.addSubview(titleLabel)
        middleView.addSubview(magicBallImageView)
        bottomView.addSubview(askButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        magicBallImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        askButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            //Constraints for stackView
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            
            //Constraints for title label
            titleLabel.widthAnchor.constraint(equalToConstant: 240),
            titleLabel.heightAnchor.constraint(equalToConstant: 36),
            titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            
            
            //Constraints for magic ball imageView
            magicBallImageView.widthAnchor.constraint(equalToConstant: 250),
            magicBallImageView.heightAnchor.constraint(equalToConstant: 250),
            magicBallImageView.centerXAnchor.constraint(equalTo: middleView.centerXAnchor),
            magicBallImageView.centerYAnchor.constraint(equalTo: middleView.centerYAnchor),
            
            //Constraints for button
            askButton.widthAnchor.constraint(equalToConstant: 73),
            askButton.heightAnchor.constraint(equalToConstant: 50),
            askButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            askButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            
        ])
        
    }

    @objc func askButtonPressed() {
        magicBallImageView.image = ballArray.randomElement() as? UIImage
        
    }

}

