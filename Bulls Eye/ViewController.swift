//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Suren Poghosyan on 08.07.23.
//

import UIKit

class ViewController: UIViewController {

    var game = Game()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberToGuessLabel.text = numberToGuessValue
        scoreValueLabel.text = scoreValue
        roundValueLabel.text = roundValue
        setupUI()
    }
    
    let submitAnswerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)  
        button.addTarget(self, action: #selector(submitAnswerButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let restartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.counterclockwise"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(restartButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        return button
    }()

    let numberGuessSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.setValue(50, animated: true)
        slider.setThumbImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Put the bulls eye as close as you can to:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let numberToGuessLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scoreTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "SCORE:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let roundTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "ROUND:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let scoreValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let roundValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fromValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let toValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "100"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var numberToGuessValue: String {
        return "\(game.numberToGuess ?? 0)"
    }

    var scoreValue: String {
        return "\(game.score)"
    }

    var roundValue: String {
        return "\(game.gameRound)"
    }

    
    func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(numberToGuessLabel)
        view.addSubview(submitAnswerButton)
        view.addSubview(numberGuessSlider)
        view.addSubview(restartButton)
        view.addSubview(scoreTitleLabel)
        view.addSubview(scoreValueLabel)
        view.addSubview(roundTitleLabel)
        view.addSubview(roundValueLabel)
        view.addSubview(fromValueLabel)
        view.addSubview(toValueLabel)
        
        view.backgroundColor = .white

        
        NSLayoutConstraint.activate([
 
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),


            numberToGuessLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 180),
            numberToGuessLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -130),
            numberToGuessLabel.widthAnchor.constraint(equalToConstant: 50),
            numberToGuessLabel.heightAnchor.constraint(equalToConstant: 40),
            
            fromValueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -180),
            fromValueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            fromValueLabel.widthAnchor.constraint(equalToConstant: 50),
            fromValueLabel.heightAnchor.constraint(equalToConstant: 40),
          
            numberGuessSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberGuessSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            numberGuessSlider.widthAnchor.constraint(equalToConstant: 350),
            numberGuessSlider.heightAnchor.constraint(equalToConstant: 40),

            toValueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 220),
            toValueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            toValueLabel.widthAnchor.constraint(equalToConstant: 50),
            toValueLabel.heightAnchor.constraint(equalToConstant: 40),
            
            submitAnswerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitAnswerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            submitAnswerButton.widthAnchor.constraint(equalToConstant: 100),
            submitAnswerButton.heightAnchor.constraint(equalToConstant: 40),

            restartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            restartButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            restartButton.widthAnchor.constraint(equalToConstant: 100),
            restartButton.heightAnchor.constraint(equalToConstant: 40),

            scoreTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -200),
            scoreTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            scoreTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            scoreTitleLabel.heightAnchor.constraint(equalToConstant: 40),

            scoreValueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -120),
            scoreValueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            scoreValueLabel.widthAnchor.constraint(equalToConstant: 100),
            scoreValueLabel.heightAnchor.constraint(equalToConstant: 40),

            roundTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 200),
            roundTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            roundTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            roundTitleLabel.heightAnchor.constraint(equalToConstant: 40),

            roundValueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 280),
            roundValueLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            roundValueLabel.widthAnchor.constraint(equalToConstant: 100),
            roundValueLabel.heightAnchor.constraint(equalToConstant: 40),

            
            
        ])
    }

    @objc func submitAnswerButtonTapped() {
        numberGuessSlider.isEnabled = false
        submitAnswerButton.isEnabled = false
        
        game.choosenNumber = Int(numberGuessSlider.value)
        let result = game.checkAnswer()
        self.showAlert(message: result)
        scoreValueLabel.text = scoreValue
        restartButton.isEnabled = true
    }
    
    @objc func restartButtonTapped() {
        numberGuessSlider.isEnabled = true
        submitAnswerButton.isEnabled = true
        restartButton.isEnabled = false
        
        game.newGame()
        
        roundValueLabel.text = roundValue
        numberToGuessLabel.text = numberToGuessValue
        numberGuessSlider.setValue(50, animated: true)
    }

    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

