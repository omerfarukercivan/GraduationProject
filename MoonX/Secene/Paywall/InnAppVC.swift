//
//  InnApp.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK
import SnapKit
import RevenueCat

final class InnAppVC: UIViewController, RevenueCatManagerDelegate {

    let closeButton = UIButton()
    let label = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let image1 = UIImageView()
    let image2 = UIImageView()
    let image3 = UIImageView()
    let weeklyButton = UIButton()
    let weeklyCheck = UIImageView()
    let weeklyLabel = UILabel()
    let weeklyPrice = UILabel()
    let monthlyButton = UIButton()
    let popularView = UIView()
    let popularLabel = UILabel()
    let popularImage = UIImageView()
    let monthlyCheck = UIImageView()
    let monthlyLabel = UILabel()
    let monthlyPrice = UILabel()
    let annualButton = UIButton()
    let annualCheck = UIImageView()
    let annualLabel = UILabel()
    let annualPrice = UILabel()
    let purchaseButton = UIButton()
    let legalView = NeonLegalView()

    var productID = "com.neonapps.education.SwiftyStoreKitDemo.Annual"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        RevenueCatManager.delegate = self

        packageFetched()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isUserPremium()
    }

    private func setupUI() {
        label.text = "Lorem Ipssum Dolar Sit"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(24)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(120)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(120)
            make.centerX.equalToSuperview()
        }

        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchDown)
        closeButton.contentMode = .scaleAspectFit
//        closeButton.foreground =
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(8)
            make.width.height.equalTo(50)
        }

        label2.text = "Why do I need to pay?"
        label2.font = .systemFont(ofSize: 16)
        label2.textColor = .white
        view.addSubview(label2)
        label2.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }

        label3.text = "Experience a virtual presence like never before, crafted just for you. despite the computational demands, we offer this innovative solution at an affordable price."
        label3.font = .systemFont(ofSize: 12)
        label3.textColor = .white
        label3.numberOfLines = 0
        label3.textAlignment = .center
        view.addSubview(label3)
        label3.snp.makeConstraints { make in
            make.top.equalTo(label2.snp.bottom).offset(16)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(16)
            make.centerX.equalToSuperview()
        }

        image1.image = UIImage(named: "img_inapp1")
        view.addSubview(image1)
        image1.snp.makeConstraints { make in
            make.top.equalTo(label3.snp.bottom).offset(40)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
        }

        image3.image = UIImage(named: "img_inapp3")
        view.addSubview(image3)
        image3.snp.makeConstraints { make in
            make.top.equalTo(label3.snp.bottom).offset(40)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }

        image2.image = UIImage(named: "img_inapp2")
        view.addSubview(image2)
        image2.snp.makeConstraints { make in
            make.top.equalTo(label3.snp.bottom).offset(16)
            make.right.equalTo(image3.snp.left).offset(-16)
            make.left.equalTo(image1.snp.right).offset(16)
        }

        weeklyButton.backgroundColor = .mainBlack
        weeklyButton.layer.borderColor = UIColor.mainBlack.cgColor
        weeklyButton.layer.borderWidth = 1
        weeklyButton.addTarget(self, action: #selector(weeklyButtonTapped), for: .touchDown)
        weeklyButton.layer.cornerRadius = 16
        view.addSubview(weeklyButton)
        weeklyButton.snp.makeConstraints { make in
            make.top.equalTo(image2.snp.bottom).offset(48)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
            make.height.equalTo(64)
        }

        weeklyCheck.image = UIImage(named: "btn_checkbox1")
        weeklyButton.addSubview(weeklyCheck)
        weeklyCheck.snp.makeConstraints { make in
            make.left.equalTo(weeklyButton.snp.left).offset(8)
            make.width.equalTo(20)
            make.centerY.equalToSuperview()
        }

        weeklyLabel.text = "Weekly"
        weeklyLabel.textColor = .white
        weeklyButton.addSubview(weeklyLabel)
        weeklyLabel.snp.makeConstraints { make in
            make.left.equalTo(weeklyCheck.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }

        weeklyPrice.textColor = .white
        weeklyButton.addSubview(weeklyPrice)
        weeklyPrice.snp.makeConstraints { make in
            make.left.equalTo(weeklyButton.snp.right).inset(80)
            make.centerY.equalToSuperview()
        }

        monthlyButton.backgroundColor = .mainBlack
        monthlyButton.layer.borderColor = UIColor.mainBlack.cgColor
        monthlyButton.layer.borderWidth = 1
        monthlyButton.addTarget(self, action: #selector(monthlyButtonTapped), for: .touchDown)
        monthlyButton.layer.cornerRadius = 16
        view.addSubview(monthlyButton)
        monthlyButton.snp.makeConstraints { make in
            make.top.equalTo(weeklyButton.snp.bottom).offset(16)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
            make.height.equalTo(64)
        }

        monthlyCheck.image = UIImage(named: "btn_checkbox1")
        monthlyButton.addSubview(monthlyCheck)
        monthlyCheck.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(weeklyButton.snp.left).offset(8)
            make.width.equalTo(20)
        }

        monthlyLabel.text = "Monthly"
        monthlyLabel.textColor = .white
        monthlyButton.addSubview(monthlyLabel)
        monthlyLabel.snp.makeConstraints { make in
            make.left.equalTo(monthlyCheck.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }

        monthlyPrice.textColor = .white
        monthlyButton.addSubview(monthlyPrice)
        monthlyPrice.snp.makeConstraints { make in
            make.left.equalTo(monthlyButton.snp.right).inset(80)
            make.centerY.equalToSuperview()
        }

        popularView.backgroundColor = .lightPurple
        view.addSubview(popularView)
        popularView.snp.makeConstraints { make in
            make.top.equalTo(monthlyButton.snp.top).offset(-8)
            make.right.equalTo(monthlyButton.snp.right).inset(16)
            make.width.equalTo(120)
            make.height.equalTo(16)
        }


        popularImage.image = UIImage(named: "img_moon3")
        popularView.addSubview(popularImage)
        popularImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().offset(-2)
            make.left.equalTo(popularView.snp.left).offset(4)
            make.width.equalTo(popularImage.snp.height)
        }

        popularLabel.text = "MOST POPULAR"
        popularLabel.textColor = .white2
        popularLabel.font = .systemFont(ofSize: 12)
        popularView.addSubview(popularLabel)
        popularLabel.snp.makeConstraints { make in
            make.right.equalTo(popularView.snp.right).inset(4)
            make.centerY.equalToSuperview()
        }

        annualButton.backgroundColor = .darkPurple
        annualButton.layer.borderColor = UIColor.lightPurple.cgColor
        annualButton.layer.borderWidth = 1
        annualButton.addTarget(self, action: #selector(annualButtonTapped), for: .touchDown)
        annualButton.layer.cornerRadius = 16
        view.addSubview(annualButton)
        annualButton.snp.makeConstraints { make in
            make.top.equalTo(monthlyButton.snp.bottom).offset(16)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
            make.height.equalTo(64)
        }

        annualCheck.image = UIImage(named: "btn_checkbox2")
        annualButton.addSubview(annualCheck)
        annualCheck.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(weeklyButton.snp.left).offset(8)
            make.width.equalTo(20)
        }

        annualLabel.text = "Annual"
        annualLabel.textColor = .white
        annualButton.addSubview(annualLabel)
        annualLabel.snp.makeConstraints { make in
            make.left.equalTo(annualCheck.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }

        annualPrice.textColor = .white
        annualButton.addSubview(annualPrice)
        annualPrice.snp.makeConstraints { make in
            make.left.equalTo(annualButton.snp.right).inset(80)
            make.centerY.equalToSuperview()
        }

        purchaseButton.setTitle("Purchase for \(annualPrice.text!)", for: .normal)
        purchaseButton.backgroundColor = .lightPurple
        purchaseButton.layer.cornerRadius = 16
        purchaseButton.addTarget(self, action: #selector(purchaseButtonTapped), for: .touchDown)
        view.addSubview(purchaseButton)
        purchaseButton.snp.makeConstraints { make in
            make.top.equalTo(annualButton.snp.bottom).offset(16)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(64)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(64)
            make.height.equalTo(64)
        }

        legalView.termsURL = "[https://www.neonapps.co/terms-of-use](https://www.neonapps.co/terms-of-use)"
        legalView.privacyURL = "[https://www.neonapps.co/privacy-policy](https://www.neonapps.co/privacy-policy)"
        legalView.restoreButtonClicked = {
        }
        legalView.textColor = .white
        view.addSubview(legalView)
        legalView.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(56)
        }
    }

    func packageFetched() {
        if let weekly = RevenueCatManager.getPackagePrice(id: "com.neonapps.education.SwiftyStoreKitDemo.Weekly") {
            weeklyPrice.text = "\(weekly)"
        }
        if let monthly = RevenueCatManager.getPackagePrice(id: "com.neonapps.education.SwiftyStoreKitDemo.Montly") {
            monthlyPrice.text = "\(monthly)"
        }
        if let annual = RevenueCatManager.getPackagePrice(id: "com.neonapps.education.SwiftyStoreKitDemo.Annual") {
            annualPrice.text = "\(annual)"
        }
    }

    func isUserPremium() {
        if Neon.isUserPremium {
            present(destinationVC: HomeVC(), slideDirection: .up)
        }
    }

    @objc private func closeButtonTapped() {
        present(destinationVC: TabBarController(), slideDirection: .up)
    }

    @objc private func weeklyButtonTapped() {
        weeklyCheck.image = UIImage(named: "btn_checkbox2")
        monthlyCheck.image = UIImage(named: "btn_checkbox1")
        annualCheck.image = UIImage(named: "btn_checkbox1")

        weeklyButton.backgroundColor = .darkPurple
        weeklyButton.layer.borderColor = UIColor.lightPurple.cgColor

        monthlyButton.backgroundColor = .mainBlack
        monthlyButton.layer.borderColor = UIColor.mainBlack.cgColor

        annualButton.backgroundColor = .mainBlack
        annualButton.layer.borderColor = UIColor.mainBlack.cgColor

        purchaseButton.setTitle("Purchase for \(weeklyPrice.text!)", for: .normal)
        productID = "com.neonapps.education.SwiftyStoreKitDemo.Weekly"
        print(productID)
    }

    @objc private func monthlyButtonTapped() {
        weeklyCheck.image = UIImage(named: "btn_checkbox1")
        monthlyCheck.image = UIImage(named: "btn_checkbox2")
        annualCheck.image = UIImage(named: "btn_checkbox1")

        weeklyButton.backgroundColor = .mainBlack
        weeklyButton.layer.borderColor = UIColor.mainBlack.cgColor

        monthlyButton.backgroundColor = .darkPurple
        monthlyButton.layer.borderColor = UIColor.lightPurple.cgColor

        annualButton.backgroundColor = .mainBlack
        annualButton.layer.borderColor = UIColor.mainBlack.cgColor

        purchaseButton.setTitle("Purchase for \(monthlyPrice.text!)", for: .normal)
        productID = "com.neonapps.education.SwiftyStoreKitDemo.Montly"
        print(productID)
    }

    @objc private func annualButtonTapped() {
        weeklyCheck.image = UIImage(named: "btn_checkbox1")
        monthlyCheck.image = UIImage(named: "btn_checkbox1")
        annualCheck.image = UIImage(named: "btn_checkbox2")

        weeklyButton.backgroundColor = .mainBlack
        weeklyButton.layer.borderColor = UIColor.mainBlack.cgColor

        monthlyButton.backgroundColor = .mainBlack
        monthlyButton.layer.borderColor = UIColor.mainBlack.cgColor

        annualButton.backgroundColor = .darkPurple
        annualButton.layer.borderColor = UIColor.lightPurple.cgColor

        purchaseButton.setTitle("Purchase for \(annualPrice.text!)", for: .normal)
        productID = "com.neonapps.education.SwiftyStoreKitDemo.Annual"
        print(productID)
    }

    @objc private func purchaseButtonTapped() {
        RevenueCatManager.selectPackage(id: productID)
        RevenueCatManager.purchase(animation: .loadingBar) {
            self.present(destinationVC: HomeVC(), slideDirection: .up)
        } completionFailure: {
            //MARK: Failure'a düşüyor kontrol et!
            self.present(destinationVC: TabBarController(), slideDirection: .up)
            print("purchase error")
        }
    }
}
