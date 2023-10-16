//
//  ViewController.swift
//  Calculator_Swift-Storyboard
//
//  Created by Alexander on 14.10.23.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Private properties
    private var result: String = "0" {
        didSet {
            resultLabel.text = toundingFractionalPart(result)
            
            // Changing the font size
            if result.count > 6 {
                resultLabel.font = .systemFont(ofSize: 50)
            }
            else {
                resultLabel.font = .systemFont(ofSize: 80)
            }
        }
    }
    private var secondValue: String = "0" {
        didSet {
            if secondValue != "0" {
          
                resultLabel.text = toundingFractionalPart(secondValue)
                
                // Changing the font size
                if secondValue.count > 6 {
                    resultLabel.font = .systemFont(ofSize: 50)
                }
                else {
                    resultLabel.font = .systemFont(ofSize: 80)
                }
            }
        }
    }
    private var currentOperation: String = ""
    private var fractionalNumberResult: Bool = false
    private var fractionalNumberSecondValue: Bool = false
    private var secondNumberSet: Bool = false
    
    private let resultView = UIView()
    private let resultLabel = UILabel()
    private let buttonsBackgroundView = UIView()
    private let sizeTextButton = 35
    private var outputOfResult: Bool = false
    
    private let verticalButtonStackView = UIStackView()
    private let firstLineButtonStackView = UIStackView()
    private let secondLineButtonStackView = UIStackView()
    private let thirdLineButtonStackView = UIStackView()
    private let fourthLineButtonStackView = UIStackView()
    private let fifthLineButtonStackView = UIStackView()
    
    private let clearButton = UIButton(type: .system)
    private let negativityButton = UIButton(type: .system)
    private let moduleButton = UIButton(type: .system)
    private let divisionButton = UIButton(type: .system)
    private let multiplicationButton = UIButton(type: .system)
    private let minusButton = UIButton(type: .system)
    private let plusButton = UIButton(type: .system)
    private let equalButton = UIButton(type: .system)
    
    private let zeroNumberButton = UIButton(type: .system)
    private let oneNumberButton = UIButton(type: .system)
    private let twoNumberButton = UIButton(type: .system)
    private let threeNumberButton = UIButton(type: .system)
    private let fourNumberButton = UIButton(type: .system)
    private let fiveNumberButton = UIButton(type: .system)
    private let sixNumberButton = UIButton(type: .system)
    private let sevenNumberButton = UIButton(type: .system)
    private let eightNumberButton = UIButton(type: .system)
    private let nineNumberButton = UIButton(type: .system)
    private let fractionalPartButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Setting the height of the two main views
        resultView.heightAnchor.constraint(equalToConstant: (view.frame.height - (view.frame.width / 4 ) * 5)).isActive = true
        buttonsBackgroundView.heightAnchor.constraint(equalToConstant: (view.frame.width / 4 ) * 5).isActive = true
        
        // Setting the height, width and radius of buttons
        settingWidthHeightRadiusButton([clearButton, negativityButton, moduleButton, divisionButton, sevenNumberButton, eightNumberButton, nineNumberButton, multiplicationButton, fourNumberButton, fiveNumberButton, sixNumberButton, minusButton, oneNumberButton, twoNumberButton, threeNumberButton, plusButton, fractionalPartButton, equalButton])

        zeroNumberButton.widthAnchor.constraint(equalToConstant: (view.frame.width / 2) - 12.5).isActive = true
        zeroNumberButton.heightAnchor.constraint(equalToConstant: (view.frame.width / 4) - 12.5).isActive = true
        zeroNumberButton.layer.cornerRadius = ((view.frame.width - 50) / 8 )
    }

    // MARK: - Helpers
    private func addSubviews(){
        view.addSubview(resultView)
        view.addSubview(buttonsBackgroundView)
        resultView.addSubview(resultLabel)
        buttonsBackgroundView.addSubview(verticalButtonStackView)
        
        verticalButtonStackView.addArrangedSubview(firstLineButtonStackView)
        verticalButtonStackView.addArrangedSubview(secondLineButtonStackView)
        verticalButtonStackView.addArrangedSubview(thirdLineButtonStackView)
        verticalButtonStackView.addArrangedSubview(fourthLineButtonStackView)
        verticalButtonStackView.addArrangedSubview(fifthLineButtonStackView)
        
        firstLineButtonStackView.addArrangedSubview(clearButton)
        firstLineButtonStackView.addArrangedSubview(negativityButton)
        firstLineButtonStackView.addArrangedSubview(moduleButton)
        firstLineButtonStackView.addArrangedSubview(divisionButton)
        
        secondLineButtonStackView.addArrangedSubview(sevenNumberButton)
        secondLineButtonStackView.addArrangedSubview(eightNumberButton)
        secondLineButtonStackView.addArrangedSubview(nineNumberButton)
        secondLineButtonStackView.addArrangedSubview(multiplicationButton)
        
        thirdLineButtonStackView.addArrangedSubview(fourNumberButton)
        thirdLineButtonStackView.addArrangedSubview(fiveNumberButton)
        thirdLineButtonStackView.addArrangedSubview(sixNumberButton)
        thirdLineButtonStackView.addArrangedSubview(minusButton)
        
        fourthLineButtonStackView.addArrangedSubview(oneNumberButton)
        fourthLineButtonStackView.addArrangedSubview(twoNumberButton)
        fourthLineButtonStackView.addArrangedSubview(threeNumberButton)
        fourthLineButtonStackView.addArrangedSubview(plusButton)
        
        fifthLineButtonStackView.addArrangedSubview(zeroNumberButton)
        fifthLineButtonStackView.addArrangedSubview(fractionalPartButton)
        fifthLineButtonStackView.addArrangedSubview(equalButton)
    }

    private func configureConstraints(){
        
        // resultView
        resultView.translatesAutoresizingMaskIntoConstraints = false
        resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resultView.bottomAnchor.constraint(equalTo: buttonsBackgroundView.topAnchor).isActive = true
        resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        resultView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // resultLabel
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.leadingAnchor.constraint(equalTo: resultView.leadingAnchor, constant: 35).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -35).isActive = true
        resultLabel.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -10).isActive = true
    
        // buttonsBackgroundView
        buttonsBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        buttonsBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        buttonsBackgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        buttonsBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // verticalButtonStackView
        verticalButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalButtonStackView.axis = .vertical
        verticalButtonStackView.spacing = 10
        verticalButtonStackView.leadingAnchor.constraint(equalTo: buttonsBackgroundView.leadingAnchor, constant: 10).isActive = true
        verticalButtonStackView.topAnchor.constraint(equalTo: buttonsBackgroundView.topAnchor, constant: 10).isActive = true
   
        // Setting margins between buttons - 10
        settingSpacingStackView([firstLineButtonStackView, secondLineButtonStackView, thirdLineButtonStackView, fourthLineButtonStackView, fifthLineButtonStackView], spacing: 10)
    }
    
    private func configureUI(){
        
        view.backgroundColor = .black
        resultView.backgroundColor = .black
        buttonsBackgroundView.backgroundColor = .black
        
        resultLabel.text = result
        resultLabel.textColor = .white
        resultLabel.textAlignment = .right
        resultLabel.font = .systemFont(ofSize: 80)

        // Action buttons
        settingTextColorFontSizeButton(clearButton, #selector(actionClearButtonTapped), text: "C", backgroundColor: .systemGray, titleColor: . black)
        settingTextColorFontSizeButton(negativityButton, #selector(actionNegativityButtonTapped), text: "±", backgroundColor: .systemGray, titleColor: . black)
        settingTextColorFontSizeButton(moduleButton, #selector(actionModuleButtonTapped), text: "%", backgroundColor: .systemGray, titleColor: . black)
        settingTextColorFontSizeButton(divisionButton, #selector(actionDivisionButtonTapped), text: "÷", backgroundColor: .systemOrange, titleColor: . white)
        settingTextColorFontSizeButton(multiplicationButton, #selector(actionMultiplicationButtonTapped), text: "✕", backgroundColor: .systemOrange, titleColor: . white)
        settingTextColorFontSizeButton(minusButton, #selector(actionMinusButtonTapped), text: "-", backgroundColor: .systemOrange, titleColor: . white)
        settingTextColorFontSizeButton(plusButton, #selector(actionPlusButtonTapped), text: "+", backgroundColor: .systemOrange, titleColor: . white)
        settingTextColorFontSizeButton(equalButton, #selector(actionEqualButtonTapped), text: "=", backgroundColor: .systemOrange, titleColor: . white)

        // Number buttons
        settingTextColorFontSizeButton(zeroNumberButton, #selector(actionZeroNumberButtonTapped), text: "0", backgroundColor: .darkGray, titleColor: . white)
        settingTextColorFontSizeButton(oneNumberButton, #selector(actionOneNumberButtonTapped), text: "1", backgroundColor: .darkGray, titleColor: . white)
        settingTextColorFontSizeButton(twoNumberButton, #selector(actionTwoNumberButtonTapped), text: "2", backgroundColor: .darkGray, titleColor: . white)
        settingTextColorFontSizeButton(threeNumberButton, #selector(actionThreeNumberButtonTapped), text: "3", backgroundColor: .darkGray, titleColor: . white)
        settingTextColorFontSizeButton(fourNumberButton, #selector(actionFourNumberButtonTapped), text: "4", backgroundColor: .darkGray, titleColor: . white)
        settingTextColorFontSizeButton(fiveNumberButton, #selector(actionFiveNumberButtonTapped), text: "5", backgroundColor: .darkGray, titleColor: . white)
        settingTextColorFontSizeButton(sixNumberButton, #selector(actionSixNumberButtonTapped), text: "6", backgroundColor: .darkGray, titleColor: . white)
        settingTextColorFontSizeButton(sevenNumberButton, #selector(actionSevenNumberButtonTapped), text: "7", backgroundColor: .darkGray, titleColor: . white)
        settingTextColorFontSizeButton(eightNumberButton, #selector(actionEightNumberButtonTapped), text: "8", backgroundColor: .darkGray, titleColor: . white)
        settingTextColorFontSizeButton(nineNumberButton, #selector(actionNineNumberButtonTapped), text: "9", backgroundColor: .darkGray, titleColor: . white)
        settingTextColorFontSizeButton(fractionalPartButton, #selector(actionFractionalPartButtonTapped), text: ",", backgroundColor: .darkGray, titleColor: . white)
    }
    
    private func settingWidthHeightRadiusButton(_ buttons: [UIButton]) {
        for button in buttons {
            button.widthAnchor.constraint(equalToConstant: (view.frame.width / 4) - 12.5).isActive = true
            button.heightAnchor.constraint(equalToConstant: (view.frame.width / 4) - 12.5).isActive = true
            button.layer.cornerRadius = ((view.frame.width - 50) / 8 )
        }
    }
    
    private func settingSpacingStackView(_ stackViews: [UIStackView], spacing: CGFloat) {
        for stackView in stackViews {
            stackView.spacing = spacing
        }
    }
    
    private func settingTextColorFontSizeButton(_ button: UIButton, _ selectorActionButton: Selector, text: String, backgroundColor: UIColor, titleColor: UIColor) {
        button.setTitle(text, for: .normal)
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = .systemFont(ofSize: CGFloat(sizeTextButton))
        button.addTarget(self, action: selectorActionButton, for: .touchUpInside)
        button.setTitleColor(titleColor, for: .normal)
    }
    
    private func changeResult(_ value: Int) {
        if checkingLimit() {
            if currentOperation == "" {
                if result == "0" {
                    result = String(value)
                }
                else {
                    result += String(value)
                }
            }
            else {
                secondNumberSet = true
                if secondValue == "0" {
                    secondValue = String(value)
                }
                else {
                    secondValue += String(value)
                }
            }
        }
    }
    
    private func checkingLimit() -> Bool {
        if currentOperation == "" {
            let countNumber = result.filter{ item in
                if item != "-" && item != "." {
                    return true
                }
                return false
            }.count
            
            if countNumber > 8 {
                return false
            }
            else {
                return true
            }
        }
        else {
            let countNumber = secondValue.filter{ item in
                if item != "-" && item != "." {
                    return true
                }
                return false
            }.count
            
            if countNumber > 8 {
                return false
            }
            else {
                return true
            }
        }
    }
    
    private func toundingFractionalPart(_ result: String) -> String {
        var verified = false
        var newResult = result
        var res: String
        
        if newResult.count > 9 {
            if newResult.contains(".") && newResult.contains("-") {
                newResult = String(newResult.prefix(11))
            }
            if newResult.contains(".") && !newResult.contains("-") {
                newResult = String(newResult.prefix(10))
            }
            if !newResult.contains(".") && !newResult.contains("-") {
                newResult = String(newResult.prefix(9))
            }
        }
        newResult = String(newResult.reversed())
        
        if outputOfResult {
            outputOfResult = false
            res = newResult.filter { item in
                if !verified && (item == "0" || item == ".") {
                    if newResult.contains(".") {
                        if item == "." {
                            verified = true
                            return false
                        }
                        else {
                            return false
                        }
                    }
                    else {
                        return true
                    }
                }
                else {
                    verified = true
                    return true
                }
            }
        } else {
            res = newResult
        }
        res = res.replacingOccurrences(of: ".", with: ",")
        res = String(res.reversed())
        
        return res
    }
    
    @objc private func actionClearButtonTapped() {
        result = "0"
        secondValue = "0"
        fractionalNumberResult = false
        fractionalNumberSecondValue = false
        secondNumberSet = false
        currentOperation = ""
    }
    
    @objc private func actionNegativityButtonTapped() {
        if currentOperation == "" {
            if result.contains("-") {
                result = result.filter{ item in
                    if item != "-" {
                        return true
                    }
                    return false
                }
            }
            else {
                result = "-" + result
            }
        }
        else {
            if secondValue.contains("-") {
                secondValue = secondValue.filter{ item in
                    if item != "-" {
                        return true
                    }
                    return false
                }
            }
            else {
                secondValue = "-" + secondValue
            }
        }
    }
    
    @objc private func actionModuleButtonTapped() {
        if secondNumberSet {
            if currentOperation != "minus" && currentOperation != "plus" {
                let DoubleSecondValue = Double(secondValue)!
                secondValue = String(DoubleSecondValue / 100)
            }
            else {
                let DoubleResult = Double(result)!
                let DoubleSecondValue = Double(secondValue)!
                
                if currentOperation == "minus" {
                    currentOperation = "moduleMinus"
                    let value = DoubleResult * (DoubleSecondValue * 0.01)
                    if value < 999999999 {
                        secondValue = String(value)
                    }
                }
                else {
                    currentOperation = "modulePlus"
                    let value = DoubleResult * (DoubleSecondValue * 0.01)
                    if value < 999999999 {
                        secondValue = String(value)
                    }
                }
            }
        }
        else {
            let DoubleResult = Double(result)!
            result = String(DoubleResult / 100)
        }
    }
    
    @objc private func actionDivisionButtonTapped() {
        currentOperation = "division"
    }
    
    @objc private func actionMultiplicationButtonTapped() {
        currentOperation = "multiplication"
    }
    
    @objc private func actionMinusButtonTapped() {
        currentOperation = "minus"
    }
    
    @objc private func actionPlusButtonTapped() {
        currentOperation = "plus"
    }
    
    @objc private func actionEqualButtonTapped() {
        outputOfResult = true
    
        if currentOperation != "" {
            switch currentOperation {
            case "division":
                if secondNumberSet {
                    let DoubleResult = Double(result)!
                    let DoubleSecondValue = Double(secondValue)!
                    if DoubleResult / DoubleSecondValue < 999999999 {
                        result = String(DoubleResult / DoubleSecondValue)
                    }
                }
            case "multiplication":
                if secondNumberSet {
                    let DoubleResult = Double(result)!
                    let DoubleSecondValue = Double(secondValue)!
                    if DoubleResult * DoubleSecondValue < 999999999 {
                        result = String(DoubleResult * DoubleSecondValue)
                    }
                }
            case "minus":
                if secondNumberSet {
                    let DoubleResult = Double(result)!
                    let DoubleSecondValue = Double(secondValue)!
                    if DoubleResult - DoubleSecondValue < 999999999 {
                        result = String(DoubleResult - DoubleSecondValue)
                    }
                }
            case "plus":
                if secondNumberSet {
                    let DoubleResult = Double(result)!
                    let DoubleSecondValue = Double(secondValue)!
                    if DoubleResult + DoubleSecondValue < 999999999 {
                        result = String(DoubleResult + DoubleSecondValue)
                    }
                }
            case "moduleMinus":
                if secondNumberSet {
                    let DoubleResult = Double(result)!
                    let DoubleSecondValue = Double(secondValue)!
                    if DoubleResult - DoubleSecondValue < 999999999 {
                        result = String(DoubleResult - DoubleSecondValue)
                    }
                }
            case "modulePlus":
                if secondNumberSet {
                    let DoubleResult = Double(result)!
                    let DoubleSecondValue = Double(secondValue)!
                    if DoubleResult + DoubleSecondValue < 999999999 {
                        result = String(DoubleResult + DoubleSecondValue)
                    }
                }
            default:
                print()
            }
        }
        
        secondValue = "0"
        fractionalNumberSecondValue = false
        secondNumberSet = false
        currentOperation = ""
    }
    
    
    @objc private func actionZeroNumberButtonTapped() {
        changeResult(0)
    }
    
    @objc private func actionOneNumberButtonTapped() {
        changeResult(1)
    }
    
    @objc private func actionTwoNumberButtonTapped() {
        changeResult(2)
    }
    
    @objc private func actionThreeNumberButtonTapped() {
        changeResult(3)
    }
    
    @objc private func actionFourNumberButtonTapped() {
        changeResult(4)
    }
    
    @objc private func actionFiveNumberButtonTapped() {
        changeResult(5)
    }
    
    @objc private func actionSixNumberButtonTapped() {
        changeResult(6)
    }
    
    @objc private func actionSevenNumberButtonTapped() {
        changeResult(7)
    }
    
    @objc private func actionEightNumberButtonTapped() {
        changeResult(8)
    }
    
    @objc private func actionNineNumberButtonTapped() {
        changeResult(9)
    }
    
    @objc private func actionFractionalPartButtonTapped() {
        if currentOperation == "" {
            if !result.contains(".") {
                result += "."
                fractionalNumberResult = true
            }
        }
        else {
            if !secondValue.contains(".") {
                secondValue += "."
                fractionalNumberSecondValue = true
            }
        }
    }
}
