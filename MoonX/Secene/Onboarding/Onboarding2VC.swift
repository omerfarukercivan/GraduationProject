//
//  Onboarding2VC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK

final class Onboarding2VC: UIViewController {

	private let datePicker = UIDatePicker()
	private let dateField = UITextField()
	private let timePicker = UIDatePicker()
	private let timeField = UITextField()
	private let nextButton = UIButton()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black
		nextButton.hero.id = "nextButton"

		setupUI()
	}

	private func setupUI() {
		var backgroundImage = UIImageView()
		backgroundImage = UIImageView(image: UIImage(named: "img_background_onboarding2"))
		view.addSubview(backgroundImage)
		backgroundImage.snp.makeConstraints { make in
			make.width.equalTo(backgroundImage.snp.width)
		}

		let label = UILabel()
		label.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusam. Sed ut perspt perspiciatis unde omnis iste natus error si."
		label.font = Font.custom(size: 16, fontWeight: .Regular)
		label.textColor = .white
		label.textAlignment = .center
		label.numberOfLines = 0
		view.addSubview(label)
		label.snp.makeConstraints { make in
//			make.bottom.equalTo(backgroundImage.snp.bottom).inset(32)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(48)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(48)
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview().multipliedBy(0.9)
		}

		let dateLabel = UILabel()
		dateLabel.text = "Enter Birth Date"
		dateLabel.font = Font.custom(size: 16, fontWeight: .Medium)
		dateLabel.textColor = .white
		view.addSubview(dateLabel)
		dateLabel.snp.makeConstraints { make in
			make.top.equalTo(label.snp.bottom).offset(48)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
		}

		datePicker.datePickerMode = .date
		datePicker.preferredDatePickerStyle = .wheels
		datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)

		dateField.delegate = self
		dateField.attributedPlaceholder = NSAttributedString(string: "09/03/1999", attributes: [.foregroundColor: UIColor.white1])
		dateField.textColor = .white1
		dateField.textAlignment = .center
		dateField.borderStyle = .none
		dateField.backgroundColor = .darkPurple
		dateField.layer.cornerRadius = 16
		dateField.inputView = datePicker
		view.addSubview(dateField)
		dateField.snp.makeConstraints { make in
			make.top.equalTo(dateLabel.snp.bottom).offset(8)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
			make.height.equalTo(48)
		}

		let timeLabel = UILabel()
		timeLabel.text = "Enter Birth Date"
		timeLabel.font = Font.custom(size: 16, fontWeight: .Medium)
		timeLabel.textColor = .white
		view.addSubview(timeLabel)
		timeLabel.snp.makeConstraints { make in
			make.top.equalTo(dateField.snp.bottom).offset(24)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
		}

		timePicker.datePickerMode = .time
		timePicker.preferredDatePickerStyle = .wheels
		timePicker.locale = Locale(identifier: "tr")
		timePicker.addTarget(self, action: #selector(timeChanged(_:)), for: .valueChanged)

		timeField.delegate = self
		timeField.attributedPlaceholder = NSAttributedString(string: "09/03/1999", attributes: [.foregroundColor: UIColor.white1])
		timeField.textColor = .white1
		timeField.textAlignment = .center
		timeField.borderStyle = .none
		timeField.backgroundColor = .darkPurple
		timeField.layer.cornerRadius = 16
		timeField.inputView = timePicker
		view.addSubview(timeField)
		timeField.snp.makeConstraints { make in
			make.top.equalTo(timeLabel.snp.bottom).offset(8)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
			make.height.equalTo(48)
		}

		nextButton.setTitle("Next", for: .normal)
		nextButton.setTitleColor(.white, for: .normal)
		nextButton.backgroundColor = .lightPurple
		nextButton.layer.borderColor = UIColor.lightPurple.cgColor
		nextButton.layer.cornerRadius = 20
		nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchDown)
		view.addSubview(nextButton)
		nextButton.snp.makeConstraints { make in
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(64)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(64)
			make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(32)
			make.height.equalTo(nextButton.snp.width).multipliedBy(0.2)
			make.centerX.equalToSuperview()
		}

		let pages = UIImageView()
		pages.image = UIImage(named: "img_pages2")
		view.addSubview(pages)
		pages.snp.makeConstraints { make in
			make.bottom.equalTo(nextButton.snp.top).offset(-24)
			make.centerX.equalToSuperview()
		}





		dateField.text = "23/11/2001"
		timeField.text = "23.23"
	}

	@objc private func nextButtonTapped() {
		if !timeField.text!.isEmpty && !dateField.text!.isEmpty {
			UserDefaults.standard.set(dateField.text, forKey: "date")
			UserDefaults.standard.set(timeField.text, forKey: "time")

			present(destinationVC: Onboarding3VC(), slideDirection: .right)
		} else {
			ShowAlert.showAlert(title: "Error", message: "You must enter date and time of birth", viewController: self)
		}
	}

	@objc private func dateChanged(_ datePicker: UIDatePicker) {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/yyyy"
		dateField.text = dateFormatter.string(from: datePicker.date)
	}

	@objc func timeChanged(_ timePicker: UIDatePicker) {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm"
		timeField.text = dateFormatter.string(from: timePicker.date)
	}
}

extension Onboarding2VC: UITextFieldDelegate {
	func textFieldDidBeginEditing(_ textField: UITextField) {
		if textField == dateField {
			datePicker.isHidden = false
		}

		if textField == timeField {
			timePicker.isHidden = false
		}
	}
}
