//
//  InnApp.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK
import SnapKit

final class InnApp: UIViewController {

    let label = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    let purchaseImage1 = UIImageView()
    let purchaseImage2 = UIImageView()
    let purchaseImage3 = UIImageView()
//    let purchaseCheck = UIImageView()
    let purchase1Label = UILabel()
    let purchase1 = UILabel()
    let purchase2Label = UILabel()
    let purchase2 = UILabel()
    let purchase3Label = UILabel()
    let purchase3 = UILabel()
    let closeButton = UIButton()
    let purchase1Button = UIButton()
    let purchase2Button = UIButton()
    let purchase3Button = UIButton()
    let purchaseButton = UIButton()
    let image1 = UIImageView()
    let image2 = UIImageView()
    let image3 = UIImageView()
    let legalView = NeonLegalView()
    let popularView = UIView()
    let popularLabel = UILabel()
    let popularImage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupUI()
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

        purchase1Button.backgroundColor = .mainBlack
        purchase1Button.layer.borderColor = UIColor.mainBlack.cgColor
        purchase1Button.layer.borderWidth = 1
        purchase1Button.addTarget(self, action: #selector(purchase1ButtonTapped), for: .touchDown)
        purchase1Button.layer.cornerRadius = 16
        view.addSubview(purchase1Button)
        purchase1Button.snp.makeConstraints { make in
            make.top.equalTo(image2.snp.bottom).offset(48)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
            make.height.equalTo(64)
        }

        purchaseImage1.image = UIImage(named: "btn_checkbox1")
        purchase1Button.addSubview(purchaseImage1)
        purchaseImage1.snp.makeConstraints { make in
            make.left.equalTo(purchase1Button.snp.left).offset(8)
            make.width.equalTo(20)
            make.centerY.equalToSuperview()
        }

        purchase1Label.text = "Weekly"
        purchase1Label.textColor = .white
        purchase1Button.addSubview(purchase1Label)
        purchase1Label.snp.makeConstraints { make in
            make.left.equalTo(purchaseImage1.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }

        purchase1.text = "$6.99"
        purchase1.textColor = .white
        purchase1Button.addSubview(purchase1)
        purchase1.snp.makeConstraints { make in
            make.left.equalTo(purchase1Button.snp.right).inset(80)
            make.centerY.equalToSuperview()
        }

        purchase2Button.backgroundColor = .mainBlack
        purchase2Button.layer.borderColor = UIColor.mainBlack.cgColor
        purchase2Button.layer.borderWidth = 1
        purchase2Button.addTarget(self, action: #selector(purchase2ButtonTapped), for: .touchDown)
        purchase2Button.layer.cornerRadius = 16
        view.addSubview(purchase2Button)
        purchase2Button.snp.makeConstraints { make in
            make.top.equalTo(purchase1Button.snp.bottom).offset(16)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
            make.height.equalTo(64)
        }

        purchaseImage2.image = UIImage(named: "btn_checkbox1")
        purchase2Button.addSubview(purchaseImage2)
        purchaseImage2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(purchase1Button.snp.left).offset(8)
            make.width.equalTo(20)
        }
        
        purchase2Label.text = "Monthly"
        purchase2Label.textColor = .white
        purchase2Button.addSubview(purchase2Label)
        purchase2Label.snp.makeConstraints { make in
            make.left.equalTo(purchaseImage2.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }

        purchase2.text = "$9.99/m"
        purchase2.textColor = .white
        purchase2Button.addSubview(purchase2)
        purchase2.snp.makeConstraints { make in
            make.left.equalTo(purchase2Button.snp.right).inset(80)
            make.centerY.equalToSuperview()
        }
        
        popularView.backgroundColor = .lightPurple
        view.addSubview(popularView)
        popularView.snp.makeConstraints { make in
            make.top.equalTo(purchase2Button.snp.top).offset(-8)
            make.right.equalTo(purchase2Button.snp.right).inset(16)
            make.width.equalTo(120)
            make.height.equalTo(16)
        }
        
        
        popularImage.image = UIImage(named: "img_moon3")
        popularView.addSubview(popularImage)
        popularImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.bottom.equalToSuperview().offset(-2)
            make.left.equalTo(popularView.snp.left).offset(4)
//            make.height.equalToSuperview()
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

        purchase3Button.backgroundColor = .darkPurple
        purchase3Button.layer.borderColor = UIColor.lightPurple.cgColor
        purchase3Button.layer.borderWidth = 1
        purchase3Button.addTarget(self, action: #selector(purchase3ButtonTapped), for: .touchDown)
        purchase3Button.layer.cornerRadius = 16
        view.addSubview(purchase3Button)
        purchase3Button.snp.makeConstraints { make in
            make.top.equalTo(purchase2Button.snp.bottom).offset(16)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(40)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(40)
            make.height.equalTo(64)
        }

        purchaseImage3.image = UIImage(named: "btn_checkbox2")
        purchase3Button.addSubview(purchaseImage3)
        purchaseImage3.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(purchase1Button.snp.left).offset(8)
            make.width.equalTo(20)
        }
        
        purchase3Label.text = "Annual"
        purchase3Label.textColor = .white
        purchase3Button.addSubview(purchase3Label)
        purchase3Label.snp.makeConstraints { make in
            make.left.equalTo(purchaseImage3.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }

        purchase3.text = "$10.99"
        purchase3.textColor = .white
        purchase3Button.addSubview(purchase3)
        purchase3.snp.makeConstraints { make in
            make.left.equalTo(purchase3Button.snp.right).inset(80)
            make.centerY.equalToSuperview()
        }
        
        purchaseButton.setTitle("Purchase for $10.99", for: .normal)
        purchaseButton.backgroundColor = .lightPurple
        purchaseButton.layer.cornerRadius = 16
        view.addSubview(purchaseButton)
        purchaseButton.snp.makeConstraints { make in
            make.top.equalTo(purchase3Button.snp.bottom).offset(16)
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
    
    @objc private func closeButtonTapped() {
        
    }
    
    @objc private func purchase1ButtonTapped() {
        purchaseImage1.image = UIImage(named: "btn_checkbox2")
        purchaseImage2.image = UIImage(named: "btn_checkbox1")
        purchaseImage3.image = UIImage(named: "btn_checkbox1")
        
        purchase1Button.backgroundColor = .darkPurple
        purchase1Button.layer.borderColor = UIColor.lightPurple.cgColor
        
        purchase2Button.backgroundColor = .mainBlack
        purchase2Button.layer.borderColor = UIColor.mainBlack.cgColor
        
        purchase3Button.backgroundColor = .mainBlack
        purchase3Button.layer.borderColor = UIColor.mainBlack.cgColor
        
        purchaseButton.setTitle("Purchase for $6.99", for: .normal)
    }
    
    @objc private func purchase2ButtonTapped() {
        purchaseImage1.image = UIImage(named: "btn_checkbox1")
        purchaseImage2.image = UIImage(named: "btn_checkbox2")
        purchaseImage3.image = UIImage(named: "btn_checkbox1")
        
        purchase1Button.backgroundColor = .mainBlack
        purchase1Button.layer.borderColor = UIColor.mainBlack.cgColor
        
        purchase2Button.backgroundColor = .darkPurple
        purchase2Button.layer.borderColor = UIColor.lightPurple.cgColor
        
        purchase3Button.backgroundColor = .mainBlack
        purchase3Button.layer.borderColor = UIColor.mainBlack.cgColor
        
        purchaseButton.setTitle("Purchase for $9.99", for: .normal)
    }

    @objc private func purchase3ButtonTapped() {
        purchaseImage1.image = UIImage(named: "btn_checkbox1")
        purchaseImage2.image = UIImage(named: "btn_checkbox1")
        purchaseImage3.image = UIImage(named: "btn_checkbox2")
        
        purchase1Button.backgroundColor = .mainBlack
        purchase1Button.layer.borderColor = UIColor.mainBlack.cgColor
        
        purchase2Button.backgroundColor = .mainBlack
        purchase2Button.layer.borderColor = UIColor.mainBlack.cgColor
        
        purchase3Button.backgroundColor = .darkPurple
        purchase3Button.layer.borderColor = UIColor.lightPurple.cgColor
        
        purchaseButton.setTitle("Purchase for $10.99", for: .normal)
    }
}
