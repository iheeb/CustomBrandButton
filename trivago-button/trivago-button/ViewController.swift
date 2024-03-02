//
//  ViewController.swift
//  trivago-button
//
//  Created by Iheb Rahali on 29.02.24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //MARK: First button
        // Create a BrandButtonViewModel
        let firstButtonViewModel = BrandButtonViewModel(
            label: "Primary Leading Icon",
            variant: .primaryBlue,
            leadingIcon: UIImage(systemName: "cat.fill"))
        // Create a BrandButton
        let firstButton = BrandButton(tag: 1)
        firstButton.viewModel = firstButtonViewModel
        firstButton.delegate = self
        // Add the BrandButton to the view
        view.addSubview(firstButton)
        // Set up constraints
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //MARK: Second button
        let secondButtonViewModel = BrandButtonViewModel(
            label: "Primary Trailing Icon",
            variant: .primaryBlue ,
            trailingIcon: UIImage(systemName: "dog.fill"))
        let secondButton = BrandButton(tag: 2)
        secondButton.viewModel = secondButtonViewModel
        secondButton.delegate = self
        view.addSubview(secondButton)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //MARK: Third button
        let thirdButtonViewModel = BrandButtonViewModel(
            label: "Secondary Green Image",
            variant: .secondaryGreen,
            leadingIcon: UIImage(systemName: "star.fill"),
            trailingIcon: UIImage(systemName: "star.fill"))
        let thirdButton = BrandButton(tag: 3)
        thirdButton.viewModel = thirdButtonViewModel
        thirdButton.delegate = self
        view.addSubview(thirdButton)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 20),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //MARK: Forth button
        let forthButtonViewModel = BrandButtonViewModel(
            label: "Secondary Blue",
            variant: .secondaryBlue)
        let forthButton = BrandButton(tag: 4)
        forthButton.viewModel = forthButtonViewModel
        forthButton.delegate = self
        view.addSubview(forthButton)
        forthButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forthButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: 20),
            forthButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        //MARK: Fifth button
        let fifthButtonViewModel = BrandButtonViewModel(
            label: "Primary Full Width",
            variant: .primaryGreen,
            fullWidth: true)
        let fifthButton = BrandButton(tag: 5)
        fifthButton.viewModel = fifthButtonViewModel
        fifthButton.delegate = self
        view.addSubview(fifthButton)
        fifthButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fifthButton.topAnchor.constraint(equalTo: forthButton.bottomAnchor, constant: 20),
            fifthButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        //MARK: Sixth button
        let sixthButtonViewModel = BrandButtonViewModel(
            label: "Secondary Full Width",
            variant: .secondaryBlue,
            fullWidth: true)
        let sixthButton = BrandButton(tag: 6)
        sixthButton.viewModel = sixthButtonViewModel
        sixthButton.delegate = self
        view.addSubview(sixthButton)
        sixthButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sixthButton.topAnchor.constraint(equalTo: fifthButton.bottomAnchor, constant: 20),
            sixthButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //MARK: Seventh button
        let seventhViewModel = BrandButtonViewModel(
            label: "Disabled Primary",
            variant: .primaryBlue,
            buttonIsEnabled: false)
        let seventhButton = BrandButton(tag: 7)
        seventhButton.viewModel = seventhViewModel
        seventhButton.delegate = self
        view.addSubview(seventhButton)
        seventhButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            seventhButton.topAnchor.constraint(equalTo: sixthButton.bottomAnchor, constant: 20),
            seventhButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //MARK: Eighth button
        let eighthViewModel = BrandButtonViewModel(
            label: "Disabled Secondary",
            variant: .secondaryBlue,
            leadingIcon: UIImage(systemName: "car"),
            buttonIsEnabled: false)
        let eighthButton = BrandButton(tag: 7)
        eighthButton.viewModel = eighthViewModel
        eighthButton.delegate = self
        view.addSubview(eighthButton)
        eighthButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eighthButton.topAnchor.constraint(equalTo: seventhButton.bottomAnchor, constant: 20),
            eighthButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //MARK: Custom button 1
        let firstCustomViewModel = BrandButtonViewModel(
            label: "Custom",
            variant: .primaryBlue,
            leadingIcon: UIImage(systemName: "apple.logo"),
            iconColor: .white,
            font: UIFont.boldSystemFont(ofSize: 20),
            fontColor: .black)
        let firstCustomButton = BrandButton(tag: 8)
        firstCustomButton.viewModel = firstCustomViewModel
        firstCustomButton.delegate = self
        view.addSubview(firstCustomButton)
        firstCustomButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstCustomButton.topAnchor.constraint(equalTo: eighthButton.bottomAnchor, constant: 20),
            firstCustomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //MARK: Custom button 2
        let secondCustomViewModel = BrandButtonViewModel(
            label: "Custom Italic",
            variant: .secondaryBlue,
            trailingIcon: UIImage(systemName: "arrow.triangle.2.circlepath.camera.fill"),
            iconColor: .red,
            font: UIFont.italicSystemFont(ofSize: 20),
            fontColor: .red)
        let secondCustomButton = BrandButton(tag: 9)
        secondCustomButton.viewModel = secondCustomViewModel
        secondCustomButton.delegate = self
        view.addSubview(secondCustomButton)
        secondCustomButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondCustomButton.topAnchor.constraint(equalTo: firstCustomButton.bottomAnchor, constant: 20),
            secondCustomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}

// Conforming to BrandButtonDelegate
extension ViewController: BrandButtonDelegate {
    func buttonTapped(_ button: BrandButton, withTag tag: Int) {
        print("Button tapped with tag: \(tag)")
        // Handle button tap action here
    }
}


