//
//  ParametersViewController.swift
//  Lesson4_homework
//
//  Created by MacBook Air on 11.03.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit


class ParametersViewController: UIViewController {
	
	var billCountView = UIView()
	var parametersView = UIView()
	var enterBillLabel = UILabel()
	var entertTipLabel = UILabel()
	var enterPersonsLabel = UILabel()
	var enterDiscountLabel = UILabel()
	var billAmountTextField = UITextField()
	var tipAmounTextField = UITextField()
	var personsAmountTextField = UITextField()
	var discountAmountTextField = UITextField()
	var tipSegmentControl = UISegmentedControl()
	var discountSegmentControl = UISegmentedControl()
	var tipPossibleSwitch = UISwitch()
	var discountPossibleSwitch = UISwitch()
	var personsStepper = UIStepper()
	var calculateButton = UIButton(type: .system)
	var rubleImageOne = UIImageView(image: UIImage(systemName: "rublesign.circle"))
	var percentImageOne = UIImageView(image: UIImage(systemName: "percent"))
	var rubleImageTwo = UIImageView(image: UIImage(systemName: "rublesign.circle"))
	var percentImageTwo = UIImageView(image: UIImage(systemName: "percent"))
	
    override func viewDidLoad() {
        super.viewDidLoad()

		configuratingParametersVC()
		addGesture()
    }
    

//MARK: - configurating VC view
	private func configuratingParametersVC() {
		
		//Configurating frames
		billCountView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 200)
		parametersView.frame = CGRect(x: 0, y: 200, width: view.bounds.width, height: view.frame.height - 200)
		enterBillLabel.frame = CGRect(x: 30, y: 70, width: view.frame.width - 30, height: 30)
		billAmountTextField.frame = CGRect(x: 0, y: enterBillLabel.frame.maxY + 20, width: view.frame.width, height: 60)
		entertTipLabel.frame = CGRect(x: 30, y: parametersView.frame.minY + 30, width: 150, height: 30)
		
		tipAmounTextField.frame = CGRect(x: view.frame.width / 2 - 20, y: entertTipLabel.frame.minY, width: view.frame.width / 2 + 10, height: 40)
		tipAmounTextField.center.y = entertTipLabel.center.y
		tipPossibleSwitch.frame = CGRect(x: 50, y: entertTipLabel.frame.maxY + 30, width: 40, height: 40)
		
		tipSegmentControl.frame = CGRect(x: tipAmounTextField.frame.minX, y: 0, width: tipAmounTextField.frame.width, height: 40)
		tipSegmentControl.center.y = tipPossibleSwitch.center.y
		
		enterDiscountLabel.frame = CGRect(x: 30, y: tipSegmentControl.frame.maxY + 70, width: 150, height: 30)
		discountAmountTextField.frame = CGRect(x: view.frame.width / 2 - 20, y: 0, width: view.frame.width / 2 + 10, height: 40)
		discountAmountTextField.center.y = enterDiscountLabel.center.y
		
		discountPossibleSwitch.frame = CGRect(x: 50, y: enterDiscountLabel.frame.maxY + 30, width: 40, height: 40)
		discountSegmentControl.frame = CGRect(x: discountAmountTextField.frame.minX, y: 0, width: discountAmountTextField.frame.width, height: 40)
		discountSegmentControl.center.y = discountPossibleSwitch.center.y
		
		enterPersonsLabel.frame = CGRect(x: 30, y: discountSegmentControl.frame.maxY + 70, width: 150, height: 30)
		personsAmountTextField.frame = CGRect(x: view.frame.width / 2 - 20, y: 0, width: view.frame.width / 2 + 10, height: 40)
		personsAmountTextField.center.y = enterPersonsLabel.center.y
		
		personsStepper.frame = CGRect(x: 0, y: personsAmountTextField.frame.maxY + 15, width: 100, height: 30)
		personsStepper.center.x = personsAmountTextField.center.x
		
		percentImageOne.frame = CGRect(x: tipPossibleSwitch.frame.minX - 28, y: 0, width: 20, height: 20)
		percentImageOne.center.y = tipPossibleSwitch.center.y
		rubleImageOne.frame = CGRect(x: tipPossibleSwitch.frame.maxX + 7, y: 0, width: 29, height: 29)
		rubleImageOne.center.y = tipPossibleSwitch.center.y
		percentImageTwo.frame = CGRect(x: discountPossibleSwitch.frame.minX - 28, y: 0, width: 20, height: 20)
		percentImageTwo.center.y = discountPossibleSwitch.center.y
		rubleImageTwo.frame = CGRect(x: discountPossibleSwitch.frame.maxX + 7, y: 0, width: 29, height: 29)
		rubleImageTwo.center.y = discountPossibleSwitch.center.y
		
		calculateButton.frame = CGRect(x: 0, y: view.frame.height - 90, width: 200, height: 50)
		calculateButton.center.x = view.center.x
		
		//View config
		billCountView.backgroundColor = #colorLiteral(red: 0.9725490196, green: 1, blue: 0.9921568627, alpha: 1)
		parametersView.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.9764705882, blue: 0.9215686275, alpha: 1)
		
		//Labels config
		setLabelTextColor(for: [enterBillLabel, entertTipLabel, enterPersonsLabel, enterDiscountLabel], color: .darkGray)
		setLabelFont(for: [enterBillLabel, entertTipLabel, enterPersonsLabel, enterDiscountLabel], font: UIFont(name: "HelveticaNeue", size: 20))
		enterBillLabel.text = "Введите сумму счёта"
		entertTipLabel.text = "Чаевые"
		enterDiscountLabel.text = "Скидка"
		enterPersonsLabel.text = "Кол-во персон"
		
		//Switches configuration
		discountPossibleSwitch.onTintColor = .clear
		tipPossibleSwitch.onTintColor = .clear
		discountPossibleSwitch.addTarget(self, action: #selector(controlSwitchPosition(_:)), for: .valueChanged)
		tipPossibleSwitch.addTarget(self, action: #selector(controlSwitchPosition(_:)), for: .valueChanged)
		
		//Segment controls configuration
		tipSegmentControl.isMomentary = true
		discountSegmentControl.isMomentary = true
		
		tipSegmentControl.insertSegment(withTitle: "0%", at: 0, animated: true)
		tipSegmentControl.insertSegment(withTitle: "10%", at: 1, animated: true)
		tipSegmentControl.insertSegment(withTitle: "20%", at: 2, animated: true)
		discountSegmentControl.insertSegment(withTitle: "0%", at: 0, animated: true)
		discountSegmentControl.insertSegment(withTitle: "5%", at: 1, animated: true)
		discountSegmentControl.insertSegment(withTitle: "10%", at: 2, animated: true)
		tipSegmentControl.selectedSegmentTintColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
		discountSegmentControl.selectedSegmentTintColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
		tipSegmentControl.addTarget(self, action: #selector(segmentControlSelected(_:)), for: .valueChanged)
		discountSegmentControl.addTarget(self, action: #selector(segmentControlSelected(_:)), for: .valueChanged)
		
		//Images configuration
		rubleImageOne.tintColor = #colorLiteral(red: 0.5591291244, green: 0.5591291244, blue: 0.5591291244, alpha: 1)
		percentImageOne.tintColor = #colorLiteral(red: 0.5591291244, green: 0.5591291244, blue: 0.5591291244, alpha: 1)
		rubleImageOne.contentMode = .scaleAspectFit
		percentImageOne.contentMode = .scaleAspectFit
		rubleImageTwo.tintColor = #colorLiteral(red: 0.5591291244, green: 0.5591291244, blue: 0.5591291244, alpha: 1)
		percentImageTwo.tintColor = #colorLiteral(red: 0.5591291244, green: 0.5591291244, blue: 0.5591291244, alpha: 1)
		rubleImageTwo.contentMode = .scaleAspectFit
		percentImageTwo.contentMode = .scaleAspectFit
		
		//Stepper configuration
		personsStepper.value = 2
		personsStepper.minimumValue = 2
		personsStepper.maximumValue = 1000
		personsStepper.stepValue = 1
		personsStepper.tintColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
		personsStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
		
		//Button configuration
		calculateButton.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
		calculateButton.layer.cornerRadius = 20
		calculateButton.setTitle("Рассчитать", for: .normal)
		calculateButton.titleLabel?.textColor = .white
		calculateButton.tintColor = .white
		calculateButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 20)
		calculateButton.addTarget(self, action: #selector(goToResultVC), for: .touchUpInside)
		
		//Textfields config
		setTextFieldParameters(for: billAmountTextField,
							   font: UIFont(name: "HelveticaNeue-Medium", size: 35),
							   backgroundColor: #colorLiteral(red: 0.9725490196, green: 1, blue: 0.9921568627, alpha: 1),
							   placeholder: "Например: 2379",
							   alignment: .center,
							   keyboardType: .decimalPad, cornerRadius: 0)
		setTextFieldParameters(for: tipAmounTextField,
							   font: UIFont(name: "HelveticaNeue", size: 20),
							   backgroundColor: #colorLiteral(red: 0.9725490196, green: 1, blue: 0.9921568627, alpha: 1),
							   placeholder: "Например: 10%",
							   alignment: .center,
							   keyboardType: .numberPad, cornerRadius: 10)
		setTextFieldParameters(for: discountAmountTextField,
							   font: UIFont(name: "HelveticaNeue", size: 20),
							   backgroundColor: #colorLiteral(red: 0.9725490196, green: 1, blue: 0.9921568627, alpha: 1),
							   placeholder: "Например: 5%",
							   alignment: .center,
							   keyboardType: .numberPad, cornerRadius: 10)
		setTextFieldParameters(for: personsAmountTextField,
							   font: UIFont(name: "HelveticaNeue", size: 20),
							   backgroundColor: #colorLiteral(red: 0.9725490196, green: 1, blue: 0.9921568627, alpha: 1),
							   placeholder: "Например: 5",
							   alignment: .center,
							   keyboardType: .numberPad, cornerRadius: 10)
		
		//Adding subviews to main view
		addSubViews(in: view, with: [billCountView, parametersView, enterBillLabel, entertTipLabel, enterPersonsLabel, enterDiscountLabel, tipPossibleSwitch, discountPossibleSwitch, billAmountTextField, tipAmounTextField, discountAmountTextField, personsAmountTextField, tipSegmentControl, discountSegmentControl, percentImageOne, percentImageTwo, rubleImageOne, rubleImageTwo, personsStepper, calculateButton])
	}
	

}

//MARK: - custom methods
extension ParametersViewController {
	
	private func addGesture() {
		let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		view.addGestureRecognizer(gesture)
	}
	
	private func personsAmountTextFieldEmpty() -> Bool {
		guard let text = personsAmountTextField.text, !text.isEmpty else { return true }
		return false
	}
	
	private func billAmountTextFieldEmpty() -> Bool {
		guard let text = billAmountTextField.text, !text.isEmpty else { return true }
		return false
	}
	
	private func createAlert(with title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		alert.addAction(okAction)
		present(alert, animated: true, completion: nil)
	}
	
	private func changeTipSegmentControlTitle(for state: Bool) {
		if state {
			tipSegmentControl.setTitle("0p", forSegmentAt: 0)
			tipSegmentControl.setTitle("100p", forSegmentAt: 1)
			tipSegmentControl.setTitle("200p", forSegmentAt: 2)
			tipAmounTextField.placeholder = "Например: 100p"
		} else {
			tipSegmentControl.setTitle("0%", forSegmentAt: 0)
			tipSegmentControl.setTitle("10%", forSegmentAt: 1)
			tipSegmentControl.setTitle("20%", forSegmentAt: 2)
			tipAmounTextField.placeholder = "Например: 10%"
		}
	}
	
	private func changeDiscountSegmentControlTitle(for state: Bool) {
		if state {
			discountSegmentControl.setTitle("0p", forSegmentAt: 0)
			discountSegmentControl.setTitle("50p", forSegmentAt: 1)
			discountSegmentControl.setTitle("100p", forSegmentAt: 2)
			discountAmountTextField.placeholder = "Например: 50p"
		} else {
			discountSegmentControl.setTitle("0%", forSegmentAt: 0)
			discountSegmentControl.setTitle("5%", forSegmentAt: 1)
			discountSegmentControl.setTitle("10%", forSegmentAt: 2)
			discountAmountTextField.placeholder = "Например: 5%"
		}
	}
	
	func calculateTotalResult() -> String? {
		
		
		guard let persons = Int(personsAmountTextField.text!) else { return nil }
		guard var totalResult = Double(billAmountTextField.text!.replaceCharacter(with: ",", newChar: ".")) else { return nil }
		
		if let discount = discountAmountTextField.text, !discount.isEmpty, Double(discount) != nil {
			if discountPossibleSwitch.isOn {
				totalResult -= Double(discount)!
			} else {
				totalResult *= (100 - Double(discount)!) / 100
			}
		}
		
		if let tip = tipAmounTextField.text, !tip.isEmpty, Double(tip) != nil {
			if tipPossibleSwitch.isOn {
				totalResult += Double(tip)!
			} else {
				totalResult *= (100 + Double(tip)!) / 100
			}
		}
		
		totalResult = totalResult / Double(persons)
		
		return String(format: "%.2f", totalResult)
	}
	
}

//MARK: - selectors methods
extension ParametersViewController {
	
	@objc private func dismissKeyboard() {
//		self.dismissKeyboard()
		self.view.endEditing(true)
	}
	
	@objc private func stepperValueChanged() {
		personsAmountTextField.text = String(format: "%.0f", personsStepper.value)
	}
	
	@objc private func segmentControlSelected(_ sender: UISegmentedControl) {
		if sender == tipSegmentControl {
			let segment = tipSegmentControl.selectedSegmentIndex
			var title = tipSegmentControl.titleForSegment(at: segment)
			title?.removeLast()
			tipAmounTextField.text = title
		} else if sender == discountSegmentControl {
			let segment = discountSegmentControl.selectedSegmentIndex
			var title = discountSegmentControl.titleForSegment(at: segment)
			title?.removeLast()
			discountAmountTextField.text = title
		}
	}
	
	@objc private func controlSwitchPosition(_ sender: UISwitch) {
		if sender == tipPossibleSwitch {
			if sender.isOn {
				changeTipSegmentControlTitle(for: true)
			} else {
				changeTipSegmentControlTitle(for: false)
			}
		} else if sender == discountPossibleSwitch {
			if sender.isOn {
				changeDiscountSegmentControlTitle(for: true)
			} else {
				changeDiscountSegmentControlTitle(for: false)
			}
		}
	}
	
	@objc private func goToResultVC() {
		guard !billAmountTextFieldEmpty() else {
			createAlert(with: "Внимание", message: "Введите сумму счёта")
			return
		}
		guard !personsAmountTextFieldEmpty() else {
			createAlert(with: "Внимание", message: "Введите количество персон")
			return
		}
		
		let resultVC = ResultViewController()
		
		if let discText = discountAmountTextField.text, !discText.isEmpty {
			resultVC.discount = discText
			resultVC.discount += discountPossibleSwitch.isOn ? "p" : "%"
		}
		if let tipText = tipAmounTextField.text, !tipText.isEmpty {
			resultVC.tip = tipText
			resultVC.tip += tipPossibleSwitch.isOn ? "p" : "%"
		}
		resultVC.persons = personsAmountTextField.text!
		
		guard let result = calculateTotalResult() else {
			createAlert(with: "Внимание", message: "Введены некорректные данные")
			return
		}
		resultVC.totalResult = result + "p"
		present(resultVC, animated: true, completion: nil)
	}
	
}


//MARK: - helping methods
extension ParametersViewController {
	
	private func setLabelTextColor(for array: [UILabel], color: UIColor) {
		for index in array.indices {
			array[index].textColor = color
		}
	}
	
	private func setLabelFont(for array: [UILabel], font: UIFont? = UIFont()) {
		for index in array.indices {
			array[index].font = font
		}
	}
	
	
	private func addSubViews(in mainView: UIView, with views: [UIView]) {
		for view in views {
			mainView.addSubview(view)
		}
	}
	
	private func setTextFieldParameters(for textField: UITextField, font: UIFont? = UIFont.systemFont(ofSize: 20), backgroundColor: UIColor, placeholder: String, alignment: NSTextAlignment, keyboardType: UIKeyboardType, cornerRadius: CGFloat) {
		textField.font = font
		textField.backgroundColor = backgroundColor
		textField.placeholder = placeholder
		textField.textAlignment = alignment
		textField.keyboardType = keyboardType
		textField.layer.cornerRadius = cornerRadius
	}
}


