//
//  ViewController.swift
//  Lesson4_homework
//
//  Created by MacBook Air on 11.03.2020.
//  Copyright © 2020 Denis Valshchikov. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
	
	var startButton = UIButton(type: .system)
	var previewLabel = UILabel()

	override func viewDidLoad() {
		super.viewDidLoad()
		configuratingStartVC()
	}


	private func configuratingStartVC() {
		
		previewLabel.frame = CGRect(x: 25, y: 65, width: view.frame.width - 50, height: 100)
		previewLabel.textColor = #colorLiteral(red: 0.5591291244, green: 0.5591291244, blue: 0.5591291244, alpha: 1)
		previewLabel.numberOfLines = 0
		previewLabel.lineBreakMode = .byWordWrapping
		previewLabel.font = UIFont(name: "HelveticaNeue", size: 19)
		previewLabel.text = "Приложение поможет разделить общий счёт между друзьями в баре, кафе или ресторане"
		previewLabel.center.x = view.center.x
		previewLabel.textAlignment = .center
		
		view.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.9764705882, blue: 0.9215686275, alpha: 1)
		startButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
		startButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 19)
		startButton.setTitle("Разделить счёт", for: .normal)
		startButton.center = view.center
		startButton.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
		startButton.setTitleColor(.white, for: .normal)
		startButton.layer.cornerRadius = 20
		startButton.addTarget(self, action: #selector(goToParametersVC), for: .touchUpInside)
		view.addSubview(startButton)
		view.addSubview(previewLabel)
	}
	

	@objc private func goToParametersVC() {
		let paramVC = ParametersViewController()
		paramVC.modalTransitionStyle = .coverVertical
		paramVC.modalPresentationStyle = .fullScreen
		self.present(paramVC, animated: true, completion: nil)
	}
}

