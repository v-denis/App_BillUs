//
//  ResultViewController.swift
//  Lesson4_homework
//
//  Created by MacBook Air on 11.03.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
	
	var topView = UIView()
	var totalPerPesonLabel = UILabel()
	var calculationResultLabel = UILabel()
	var fullDescriptionLabel = UILabel()
	var recalculateButton = UIButton(type: .system)

	var totalResult = "0.0"
	var tip = "0%"
	var discount = "0%"
	var persons = "2"
	
    override func viewDidLoad() {
        super.viewDidLoad()
        configuratingResultVC()
    }
    

	private func configuratingResultVC() {
		
		topView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
		topView.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.9764705882, blue: 0.9215686275, alpha: 1)
		view.backgroundColor = #colorLiteral(red: 0.9725490196, green: 1, blue: 0.9921568627, alpha: 1)
		
		totalPerPesonLabel.frame = CGRect(x: 0, y: 0, width: topView.frame.width, height: 40)
		totalPerPesonLabel.center = topView.center
		calculationResultLabel.frame = CGRect(x: 0, y: totalPerPesonLabel.frame.maxY, width: topView.frame.width, height: 80)
		calculationResultLabel.center.x = topView.center.x
		fullDescriptionLabel.frame = CGRect(x: 0, y: topView.frame.maxY, width: view.frame.width - 60, height: 180)
		fullDescriptionLabel.center.x = topView.center.x
		
		totalPerPesonLabel.text = "Итого на человека"
		totalPerPesonLabel.textColor = #colorLiteral(red: 0.5591291244, green: 0.5591291244, blue: 0.5591291244, alpha: 1)
		totalPerPesonLabel.font = UIFont.systemFont(ofSize: 30)
		totalPerPesonLabel.textAlignment = .center
		
		calculationResultLabel.font = UIFont.systemFont(ofSize: 45, weight: .bold)
		calculationResultLabel.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
		calculationResultLabel.textAlignment = .center
		calculationResultLabel.text = String(totalResult)
		
		fullDescriptionLabel.font = UIFont.systemFont(ofSize: 24)
		fullDescriptionLabel.textColor = #colorLiteral(red: 0.5591291244, green: 0.5591291244, blue: 0.5591291244, alpha: 1)
		fullDescriptionLabel.numberOfLines = 0
		fullDescriptionLabel.lineBreakMode = .byWordWrapping
		fullDescriptionLabel.adjustsFontSizeToFitWidth = true
		fullDescriptionLabel.textAlignment = .center
		fullDescriptionLabel.text = "Разделено между \(persons) персонами, с учётом чаевых \(tip) и скидкой \(discount)"
		
		recalculateButton.frame = CGRect(x: 0, y: view.frame.height - 150, width: 200, height: 50)
		recalculateButton.center.x = view.center.x
		recalculateButton.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
		recalculateButton.tintColor = .white
		recalculateButton.titleLabel?.textColor = .white
		recalculateButton.layer.cornerRadius = 20
		recalculateButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 20)
		recalculateButton.setTitle("Пересчитать", for: .normal)
		recalculateButton.addTarget(self, action: #selector(goBackToParametersVC), for: .touchUpInside)
		
		topView.addSubview(totalPerPesonLabel)
		topView.addSubview(calculationResultLabel)
		view.addSubview(topView)
		view.addSubview(fullDescriptionLabel)
		view.addSubview(recalculateButton)
	}
	
	@objc private func goBackToParametersVC() {
		self.dismiss(animated: true, completion: nil)
	}

}
