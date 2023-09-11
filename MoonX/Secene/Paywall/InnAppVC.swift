//
//  InnApp.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK

final class InnAppVC: UIViewController, RevenueCatManagerDelegate {

	private let closeButton = UIButton()
	private let label = UILabel()
	private let label2 = UILabel()
	private let label3 = UILabel()
	private let image1 = UIImageView()
	private let image2 = UIImageView()
	private let image3 = UIImageView()
	private let weeklyButton = CustomInAppButton()
	private let monthlyButton = CustomInAppButton()
	private let annualButton = CustomInAppButton()
	private let purchaseButton = UIButton()
	private let legalView = NeonLegalView()

	private var weeklyPrice: String?
	private var monthlyPrice: String?
	private var annualPrice: String?

	private var productID = "com.neonapps.education.SwiftyStoreKitDemo.Annual"
	private var lastButton = 2

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black
		RevenueCatManager.delegate = self

		packageFetched()
		setupUI()
	}

	private func setupUI() {
		label.text = "Lorem Ipsum\n Dolar Sit"
		label.font = Font.custom(size: 30, fontWeight: .Bold)
		label.textColor = .white
		label.numberOfLines = 0
		label.textAlignment = .center
		view.addSubview(label)
		label.snp.makeConstraints { make in
			make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(6)
			make.centerX.equalToSuperview()
		}

		closeButton.setImage(UIImage(named: "btn_close"), for: .normal)
		closeButton.contentMode = .scaleAspectFit
		closeButton.addAction {
			self.present(destinationVC: HomeVC(), slideDirection: .up)
		}
		view.addSubview(closeButton)
		closeButton.snp.makeConstraints { make in
			make.top.equalTo(view.safeAreaLayoutGuide).offset(4)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(8)
			make.width.height.equalTo(50)
		}

		label2.text = "Why do I need to pay?"
		label2.font = Font.custom(size: 20, fontWeight: .Regular)
		label2.textColor = .white
		view.addSubview(label2)
		label2.snp.makeConstraints { make in
			make.top.equalTo(label.snp.bottom).offset(8)
			make.centerX.equalToSuperview()
		}

		label3.text = "Experience a virtual presence like never before, crafted just for you. despite the computational demands, we offer this innovative solution at an affordable price."
		label3.font = Font.custom(size: 16, fontWeight: .Regular)
		label3.textColor = .white
		label3.numberOfLines = 0
		label3.textAlignment = .center
		view.addSubview(label3)
		label3.snp.makeConstraints { make in
			make.top.equalTo(label2.snp.bottom).offset(8)
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

		weeklyButton.image.image = UIImage(named: "btn_checkbox1")
		weeklyButton.label.text = "Weekly"
		weeklyButton.label2.text = weeklyPrice
		weeklyButton.tag = 100
		weeklyButton.addTarget(self, action: #selector(inAppButtonTapped), for: .touchDown)
		view.addSubview(weeklyButton)
		weeklyButton.snp.makeConstraints { make in
			make.top.equalTo(view.snp.centerY).multipliedBy(1.04)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
			make.height.equalTo(weeklyButton.snp.width).multipliedBy(0.22)
		}

		monthlyButton.image.image = UIImage(named: "btn_checkbox1")
		monthlyButton.label.text = "Monthly"
		monthlyButton.label2.text = monthlyPrice
		monthlyButton.tag = 200
		monthlyButton.addTarget(self, action: #selector(inAppButtonTapped), for: .touchDown)
		view.addSubview(monthlyButton)
		monthlyButton.snp.makeConstraints { make in
			make.top.equalTo(view.snp.centerY).multipliedBy(1.27)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
			make.height.equalTo(weeklyButton.snp.width).multipliedBy(0.22)
		}

		annualButton.backgroundColor = .darkPurple
		annualButton.layer.borderColor = UIColor.lightPurple.cgColor
		annualButton.image.image = UIImage(named: "btn_checkbox2")
		annualButton.label.text = "Annual"
		annualButton.label2.text = annualPrice
		annualButton.tag = 300
		annualButton.addTarget(self, action: #selector(inAppButtonTapped), for: .touchDown)
		view.addSubview(annualButton)
		annualButton.snp.makeConstraints { make in
			make.top.equalTo(view.snp.centerY).multipliedBy(1.49)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
			make.height.equalTo(weeklyButton.snp.width).multipliedBy(0.22)
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
			make.bottom.equalTo(legalView.snp.top).offset(10)
			make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(64)
			make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(64)
			make.height.equalTo(purchaseButton.snp.width).multipliedBy(0.25)
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
		popularLabel.font = Font.custom(size: 12, fontWeight: .SemiBold)
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

	@objc private func inAppButtonTapped(_ sender: CustomInAppButton) {
		let timePeriod = "\((sender.subviews.first(where: { $0 is UILabel }) as? UILabel)!.text!)"
		let buttons = [weeklyButton, monthlyButton, annualButton]
		let prices = [weeklyPrice, monthlyPrice, annualPrice]
		let index = buttons.firstIndex(of: sender)!

		productID = timePeriod == "Monthly" ? "com.neonapps.education.SwiftyStoreKitDemo.Montly" : "com.neonapps.education.SwiftyStoreKitDemo.\(timePeriod)"

		buttons[lastButton].image.image = UIImage(named: "btn_checkbox1")
		buttons[lastButton].backgroundColor = .mainBlack
		buttons[lastButton].layer.borderColor = UIColor.mainBlack.cgColor

		purchaseButton.setTitle("Purchase for \(prices[index]!)", for: .normal)

		lastButton = index

		sender.image.image = UIImage(named: "btn_checkbox2")
		sender.backgroundColor = .darkPurple
		sender.layer.borderColor = UIColor.lightPurple.cgColor
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
