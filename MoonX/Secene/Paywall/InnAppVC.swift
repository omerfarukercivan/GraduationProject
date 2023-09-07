//
//  InnApp.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK

final class InnAppVC: UIViewController, RevenueCatManagerDelegate {

	let closeButton = UIButton()
	let label = UILabel()
	let label2 = UILabel()
	let label3 = UILabel()
	let image1 = UIImageView()
	let image2 = UIImageView()
	let image3 = UIImageView()


	let weeklyButton = CustomInAppButton()
	let monthlyButton = CustomInAppButton()
	let annualButton = CustomInAppButton()

	let purchaseButton = UIButton()
	let legalView = NeonLegalView()

	var weeklyPrice: String?
	var monthlyPrice: String?
	var annualPrice: String?

	var productID = "com.neonapps.education.SwiftyStoreKitDemo.Annual"

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .purple
		RevenueCatManager.delegate = self

		packageFetched()
		setupUI()
	}

//	override func viewWillAppear(_ animated: Bool) {
//		super.viewWillAppear(animated)
//		isUserPremium()
//	}

	private func setupUI() {
		label.text = "Lorem Ipssum\n Dolar Sit"
		label.font = Font.custom(size: 34, fontWeight: .Bold)
		label.textColor = .white
		label.numberOfLines = 0
		label.textAlignment = .center
		view.addSubview(label)
		label.snp.makeConstraints { make in
			make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
			make.centerX.equalToSuperview()
		}

		closeButton.setImage(UIImage(named: "btn_close"), for: .normal)
		closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchDown)
		closeButton.contentMode = .scaleAspectFit
		view.addSubview(closeButton)
		closeButton.snp.makeConstraints { make in
			make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(8)
			make.width.height.equalTo(50)
		}

		label2.text = "Why do I need to pay?"
		label2.font = Font.custom(size: 20, fontWeight: .Regular)
		label2.textColor = .white
		view.addSubview(label2)
		label2.snp.makeConstraints { make in
			make.top.equalTo(label.snp.bottom)
			make.centerX.equalToSuperview()
		}

		label3.text = "Experience a virtual presence like never before, crafted just for you. despite the computational demands, we offer this innovative solution at an affordable price."
		label3.font = Font.custom(size: 16, fontWeight: .Regular)
		label3.textColor = .white
		label3.numberOfLines = 0
		label3.textAlignment = .center
		view.addSubview(label3)
		label3.snp.makeConstraints { make in
			make.top.equalTo(label2.snp.bottom).offset(12)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(16)
			make.centerX.equalToSuperview()
		}

		image2.image = UIImage(named: "img_inapp2")
		image2.contentMode = .scaleAspectFit
		view.addSubview(image2)
		image2.snp.makeConstraints { make in
			make.top.equalTo(label3.snp.bottom).offset(16)
			make.bottom.equalTo(view.snp.centerY)
			make.centerX.equalToSuperview().multipliedBy(0.9)
		}


		image1.image = UIImage(named: "img_inapp1")
		image1.contentMode = .scaleAspectFit
		view.addSubview(image1)
		image1.snp.makeConstraints { make in
			make.top.equalTo(image2.snp.top).offset(10)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
			make.bottom.equalTo(view.snp.centerY).offset(-10)
		}

		image3.image = UIImage(named: "img_inapp3")
		image3.contentMode = .scaleAspectFit
		view.addSubview(image3)
		image3.snp.makeConstraints { make in
			make.top.equalTo(image2.snp.top).offset(10)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
			make.bottom.equalTo(view.snp.centerY).offset(-10)
		}










		legalView.termsURL = "[https://www.neonapps.co/terms-of-use](https://www.neonapps.co/terms-of-use)"
		legalView.privacyURL = "[https://www.neonapps.co/privacy-policy](https://www.neonapps.co/privacy-policy)"
		legalView.restoreButtonClicked = {
			RevenueCatManager.restorePurchases(vc: self, animation: .loadingBar) {
				self.present(destinationVC: HomeVC(), slideDirection: .up)
			} completionFailure: {
				print("restore error")
			}
		}
		legalView.textColor = .white
		view.addSubview(legalView)
		legalView.snp.makeConstraints { make in
			make.bottom.left.right.equalToSuperview()
			make.height.equalTo(50)
		}

		purchaseButton.setTitle("Purchase for \(annualPrice!)", for: .normal)
		purchaseButton.backgroundColor = .lightPurple
		purchaseButton.layer.cornerRadius = 16
		purchaseButton.addTarget(self, action: #selector(purchaseButtonTapped), for: .touchDown)
		view.addSubview(purchaseButton)
		purchaseButton.snp.makeConstraints { make in
//			make.top.equalTo(annualButton.snp.bottom).offset(16)
			make.bottom.equalTo(legalView.snp.top).offset(16)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(64)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(64)
			make.height.equalTo(purchaseButton.snp.width).multipliedBy(0.25)
		}


		weeklyButton.image.image = UIImage(named: "btn_checkbox1")
		weeklyButton.label.text = "Weekly"
		weeklyButton.label2.text = weeklyPrice
		weeklyButton.addTarget(self, action: #selector(weeklyButtonTapped), for: .touchDown)
		view.addSubview(weeklyButton)
		weeklyButton.snp.makeConstraints { make in
			make.top.equalTo(view.snp.centerY).offset(10)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
			make.height.equalTo(weeklyButton.snp.width).multipliedBy(0.22)
		}

//		let monthlyButton = CustomInAppButton()
		monthlyButton.image.image = UIImage(named: "btn_checkbox1")
		monthlyButton.label.text = "Monthly"
		monthlyButton.label2.text = monthlyPrice
		monthlyButton.addTarget(self, action: #selector(monthlyButtonTapped), for: .touchDown)
		view.addSubview(monthlyButton)
		monthlyButton.snp.makeConstraints { make in
			make.top.equalTo(weeklyButton.snp.bottom).offset(12)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
			make.height.equalTo(weeklyButton.snp.width).multipliedBy(0.22)
		}

//		let annualButton = CustomInAppButton()
		annualButton.backgroundColor = .darkPurple
		annualButton.layer.borderColor = UIColor.lightPurple.cgColor
		annualButton.image.image = UIImage(named: "btn_checkbox2")
		annualButton.label.text = "Annual"
		annualButton.label2.text = annualPrice
		annualButton.addTarget(self, action: #selector(annualButtonTapped), for: .touchDown)
		view.addSubview(annualButton)
		annualButton.snp.makeConstraints { make in
			make.top.equalTo(monthlyButton.snp.bottom).offset(12)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
			make.height.equalTo(weeklyButton.snp.width).multipliedBy(0.22)
		}

		let popularView = UIView()
		popularView.backgroundColor = .lightPurple
		view.addSubview(popularView)
		popularView.snp.makeConstraints { make in
			make.top.equalTo(monthlyButton.snp.top).offset(-8)
			make.right.equalTo(monthlyButton.snp.right).inset(16)
			make.width.equalTo(120)
			make.height.equalTo(16)
		}

		let popularImage = UIImageView()
		popularImage.image = UIImage(named: "img_moon4")
		popularView.addSubview(popularImage)
		popularImage.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(2)
			make.bottom.equalToSuperview().offset(-2)
			make.left.equalTo(popularView.snp.left).offset(4)
			make.width.equalTo(popularImage.snp.height)
		}

		let popularLabel = UILabel()
		popularLabel.text = "MOST POPULAR"
		popularLabel.textColor = .white2
		popularLabel.font = .systemFont(ofSize: 12)
		popularView.addSubview(popularLabel)
		popularLabel.snp.makeConstraints { make in
			make.right.equalTo(popularView.snp.right).inset(4)
			make.centerY.equalToSuperview()
		}
	}

	func packageFetched() {
		if let weekly = RevenueCatManager.getPackagePrice(id: "com.neonapps.education.SwiftyStoreKitDemo.Weekly") {
			weeklyPrice = "\(weekly)"
		}

		if let monthly = RevenueCatManager.getPackagePrice(id: "com.neonapps.education.SwiftyStoreKitDemo.Montly") {
			monthlyPrice = "\(monthly)"
		}

		if let annual = RevenueCatManager.getPackagePrice(id: "com.neonapps.education.SwiftyStoreKitDemo.Annual") {
			annualPrice = "\(annual)"
		}
	}

	@objc private func closeButtonTapped() {
		present(destinationVC: HomeVC(), slideDirection: .up)
	}

	@objc private func weeklyButtonTapped() {
		weeklyButton.image.image = UIImage(named: "btn_checkbox2")
		monthlyButton.image.image = UIImage(named: "btn_checkbox1")
		annualButton.image.image = UIImage(named: "btn_checkbox1")

		weeklyButton.backgroundColor = .darkPurple
		weeklyButton.layer.borderColor = UIColor.lightPurple.cgColor

		monthlyButton.backgroundColor = .mainBlack
		monthlyButton.layer.borderColor = UIColor.mainBlack.cgColor

		annualButton.backgroundColor = .mainBlack
		annualButton.layer.borderColor = UIColor.mainBlack.cgColor

		purchaseButton.setTitle("Purchase for \(weeklyPrice!)", for: .normal)
		productID = "com.neonapps.education.SwiftyStoreKitDemo.Weekly"
	}

	@objc private func monthlyButtonTapped() {
		weeklyButton.image.image = UIImage(named: "btn_checkbox1")
		monthlyButton.image.image = UIImage(named: "btn_checkbox2")
		annualButton.image.image = UIImage(named: "btn_checkbox1")


		weeklyButton.backgroundColor = .mainBlack
		weeklyButton.layer.borderColor = UIColor.mainBlack.cgColor

		monthlyButton.backgroundColor = .darkPurple
		monthlyButton.layer.borderColor = UIColor.lightPurple.cgColor

		annualButton.backgroundColor = .mainBlack
		annualButton.layer.borderColor = UIColor.mainBlack.cgColor

		purchaseButton.setTitle("Purchase for \(monthlyPrice!)", for: .normal)
		productID = "com.neonapps.education.SwiftyStoreKitDemo.Montly"
	}

	@objc private func annualButtonTapped() {
		weeklyButton.image.image = UIImage(named: "btn_checkbox1")
		monthlyButton.image.image = UIImage(named: "btn_checkbox1")
		annualButton.image.image = UIImage(named: "btn_checkbox2")


		weeklyButton.backgroundColor = .mainBlack
		weeklyButton.layer.borderColor = UIColor.mainBlack.cgColor

		monthlyButton.backgroundColor = .mainBlack
		monthlyButton.layer.borderColor = UIColor.mainBlack.cgColor

		annualButton.backgroundColor = .darkPurple
		annualButton.layer.borderColor = UIColor.lightPurple.cgColor

		purchaseButton.setTitle("Purchase for \(annualPrice!)", for: .normal)
		productID = "com.neonapps.education.SwiftyStoreKitDemo.Annual"
	}

	@objc private func purchaseButtonTapped() {
		RevenueCatManager.selectPackage(id: productID)
		RevenueCatManager.subscribe(animation: .loadingBar) {
			self.present(destinationVC: HomeVC(), slideDirection: .up)
		} completionFailure: {
			print("purchase error")
		}
	}
}
