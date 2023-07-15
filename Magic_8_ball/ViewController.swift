//
//  ViewController.swift
//  Magic_8_ball
//
//  Created by Каламкас on 15.07.2023.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    let circleOne: UIView = {
        let height: CGFloat = UIScreen.main.bounds.width - 100
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = height / 2
        view.snp.makeConstraints {
            $0.size.equalTo(height)
        }
        
        return view
    }()
    
    let circleTwo: UIView = {
        let height: CGFloat = 200
        let view = UIView()
        view.backgroundColor = .purple
        view.layer.cornerRadius = height / 2
        view.snp.makeConstraints {
            $0.size.equalTo(height)
        }
        
        return view
    }()
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "American Typewriter", size: 164)
        label.text = "8"
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    let myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Make prediction", for: .normal)
        button.configuration = .filled()
        return button
    }()
    
    
    let predictions = ["It is certain",
                       "It is decidedly so",
                       "Without a doubt",
                       "Yes definitely",
                       "You may rely on it",
                       "As I see it, yes",
                       "Most likely",
                       "Outlook good",
                       "Yes",
                       "Signs point to yes",
                       "Reply hazy, try again",
                       "Ask again later",
                       "Better not tell you now",
                       "Cannot predict now",
                       "Concentrate and ask again",
                       "Don't count on it",
                       "My reply is no",
                       "My sources say no",
                       "Outlook not so good",
                       "Very doubtful"
    ]
    
    var isReset: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        myMakeConstraints()
    }
}

private extension ViewController {
    func setupScene() {
        view.backgroundColor = .white
        view.addSubview(circleOne)
        circleOne.addSubview(circleTwo)
        circleTwo.addSubview(myLabel)
        view.addSubview(myButton)
        myButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    func myMakeConstraints() {
        circleOne.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        circleTwo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-25)
        }
        
        myLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-10)
            $0.width.height.equalToSuperview().inset(25)
        }
        
        myButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(159)
            $0.right.left.equalToSuperview().inset(50)
        }
    
    }
    }

@objc private extension ViewController {
    func buttonTapped() {
        if isReset {
            myLabel.text = predictions.randomElement()
            myButton.setTitle("Reset", for: .normal)
        } else {
            myLabel.text = "8"
            myButton.setTitle("Make prediction", for: .normal)
        }
        
        isReset.toggle()
    }
}


