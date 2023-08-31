//
//  ViewController.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK
import SnapKit

final class HomeVC: UIViewController, UIScrollViewDelegate {

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView()
    private let backgroundImage = UIImageView()
    private let dateButton = UIButton()
    private let label = UILabel()
    private let locationLabel = UILabel()
    private let image = UIImageView()
    private let dateLabel = UILabel()
    private let weatherLabel = UILabel()
    private let moon1View = UIView()
    private let moon2View = UIView()
    private let sun1View = UIView()
    private let sun2View = UIView()
    private let moon1Image = UIImageView()
    private let moon2Image = UIImageView()
    private let sun1Image = UIImageView()
    private let sun2Image = UIImageView()
    private let moon1Label = UILabel()
    private let moon2Label = UILabel()
    private let sun1Label = UILabel()
    private let sun2Label = UILabel()
    private let label2 = UILabel()
    private let horoscopeView = UIImageView()
    private let horoscopeImage = UIImageView()
    private let horoscopeName = UILabel()
    private let label3 = UILabel()
    private let horoscopeView2 = UIView()
    private let horoscopeLabel = UILabel()
    private let tipLabel = UILabel()
    private let stackView2 = UIStackView()
    private let scrollView2 = UIScrollView()
    private let businesButton = UIButton()
    private let foodButton = UIButton()
    private let relationsButton = UIButton()
    private let businesImage = UIImageView()
    private let foodImage = UIImageView()
    private let relationsImage = UIImageView()
    private let businesLabel = UILabel()
    private let foodLabel = UILabel()
    private let relationsLabel = UILabel()
    private let horoscopeView3 = UIView()
    private let selectedTipImage = UIImageView()
    private let selectedTipLabel = UILabel()
    private let selectedTipHoroscope = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupUI()
    }

    private func setupUI() {
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(2)
        }

        backgroundImage.image = UIImage(named: "img_background_home")
        contentView.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }

        dateButton.setTitle("2 Aug 2023", for: .normal)
        dateButton.setTitleColor(.darkPurple, for: .normal)
        dateButton.backgroundColor = .lightPurple2
        dateButton.layer.cornerRadius = 10
        contentView.addSubview(dateButton)
        dateButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.right.equalTo(contentView.snp.right).inset(8)
            make.width.equalTo(100)
        }

        label.text = "Good Morning!"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.bottom.equalTo(dateButton.snp.bottom)
            make.centerX.equalToSuperview()
        }

        locationLabel.text = "Istanbul, Turkey"
        locationLabel.font = .systemFont(ofSize: 14)
        locationLabel.textColor = .white
        contentView.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }

        image.image = UIImage(named: "img_moon")
        contentView.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }

        dateLabel.text = "2 May 11.49"
        dateLabel.textColor = .white
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }

        weatherLabel.text = "Sunny , 17 C"
        weatherLabel.textColor = .white
        weatherLabel.font = .systemFont(ofSize: 14)
        contentView.addSubview(weatherLabel)
        weatherLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }

        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(weatherLabel.snp.bottom).offset(32)
            make.right.equalTo(contentView.snp.right).offset(-8)
            make.left.equalTo(contentView.snp.left).offset(8)
            make.height.equalTo(50)
        }

        moon1View.backgroundColor = .mainBlack2
        stackView.addArrangedSubview(moon1View)
        moon1View.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.21)
        }

        moon1Image.image = UIImage(named: "img_moon2")
        moon1View.addSubview(moon1Image)
        moon1Image.snp.makeConstraints { make in
            make.left.equalTo(moon1View.snp.left).offset(2)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(moon1Image.snp.height)
            make.centerY.equalToSuperview()
        }

        moon1Label.text = "04.34"
        moon1Label.textColor = .white
        moon1View.addSubview(moon1Label)
        moon1Label.snp.makeConstraints { make in
            make.left.equalTo(moon1Image.snp.right).offset(2)
            make.centerY.equalToSuperview()
        }

        moon2View.backgroundColor = .mainBlack2
        stackView.addArrangedSubview(moon2View)
        moon2View.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.21)
        }

        moon2Image.image = UIImage(named: "img_moon3")
        moon2View.addSubview(moon2Image)
        moon2Image.snp.makeConstraints { make in
            make.left.equalTo(moon2View.snp.left).offset(2)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(moon2Image.snp.height)
            make.centerY.equalToSuperview()
        }

        moon2Label.text = "16.39"
        moon2Label.textColor = .white
        moon2View.addSubview(moon2Label)
        moon2Label.snp.makeConstraints { make in
            make.left.equalTo(moon2Image.snp.right).offset(2)
            make.centerY.equalToSuperview()
        }

        sun1View.backgroundColor = .mainBlack2
        stackView.addArrangedSubview(sun1View)
        sun1View.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.21)
        }

        sun1Image.image = UIImage(named: "img_sun")
        sun1View.addSubview(sun1Image)
        sun1Image.snp.makeConstraints { make in
            make.left.equalTo(sun1View.snp.left).offset(2)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(sun1Image.snp.height)
            make.centerY.equalToSuperview()
        }

        sun1Label.text = "06.01"
        sun1Label.textColor = .white
        sun1View.addSubview(sun1Label)
        sun1Label.snp.makeConstraints { make in
            make.left.equalTo(sun1Image.snp.right).offset(2)
            make.centerY.equalToSuperview()
        }

        sun2View.backgroundColor = .mainBlack2
        stackView.addArrangedSubview(sun2View)
        sun2View.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.21)
        }

        sun2Image.image = UIImage(named: "img_sun2")
        sun2View.addSubview(sun2Image)
        sun2Image.snp.makeConstraints { make in
            make.left.equalTo(sun2View.snp.left).offset(2)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalTo(sun2Image.snp.height)
            make.centerY.equalToSuperview()
        }

        sun2Label.text = "06.01"
        sun2Label.textColor = .white
        sun2View.addSubview(sun2Label)
        sun2Label.snp.makeConstraints { make in
            make.left.equalTo(sun2Image.snp.right).offset(2)
            make.centerY.equalToSuperview()
        }

        label2.text = "What is for Today?"
        label2.textColor = .white
        label2.font = .systemFont(ofSize: 18)
        contentView.addSubview(label2)
        label2.snp.makeConstraints { make in
            make.top.equalTo(moon1View.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
        }

        horoscopeView.image = UIImage(named: "img_horoscopeBanner")
        contentView.addSubview(horoscopeView)
        horoscopeView.snp.makeConstraints { make in
            make.top.equalTo(label2.snp.bottom).offset(8)
            make.right.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
        }

        horoscopeImage.image = UIImage(named: "img_aries")
        horoscopeView.addSubview(horoscopeImage)
        horoscopeImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
        }

        horoscopeName.text = "Aries"
        horoscopeName.textColor = .white
        horoscopeName.font = .systemFont(ofSize: 22)
        contentView.addSubview(horoscopeName)
        horoscopeName.snp.makeConstraints { make in
            make.top.equalTo(horoscopeImage.snp.top)
            make.left.equalTo(horoscopeImage.snp.right).offset(20)
        }

        label3.text = "Your Daily Horoscope"
        label3.textColor = .white
        label3.font = .systemFont(ofSize: 16)
        contentView.addSubview(label3)
        label3.snp.makeConstraints { make in
            make.top.equalTo(horoscopeName.snp.bottom).offset(8)
            make.left.equalTo(horoscopeImage.snp.right).constraint.update(offset: 20)
        }

        horoscopeView2.backgroundColor = .mainBlack
        horoscopeView2.layer.cornerRadius = 10
        contentView.addSubview(horoscopeView2)
        horoscopeView2.snp.makeConstraints { make in
            make.top.equalTo(horoscopeView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(horoscopeView2.snp.width)
        }

        horoscopeLabel.text = "Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit ontacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit"
        horoscopeLabel.textColor = .white
        horoscopeLabel.numberOfLines = 0
        horoscopeView2.addSubview(horoscopeLabel)
        horoscopeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }

        tipLabel.text = "Lunar Tips"
        tipLabel.textColor = .white
        tipLabel.font = .systemFont(ofSize: 18)
        contentView.addSubview(tipLabel)
        tipLabel.snp.makeConstraints { make in
            make.top.equalTo(horoscopeView2.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
        }

        scrollView2.delegate = self
        scrollView2.isScrollEnabled = true
        contentView.addSubview(scrollView2)
        scrollView2.snp.makeConstraints { make in
            make.top.equalTo(tipLabel.snp.bottom).offset(16)
            make.right.left.equalToSuperview()
            make.height.equalTo(50)
        }

        stackView2.axis = .horizontal
        stackView2.distribution = .equalSpacing
        scrollView2.addSubview(stackView2)
        stackView2.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(1.2)
        }

        businesButton.backgroundColor = .darkPurple
        businesButton.layer.cornerRadius = 10
        businesButton.addTarget(self, action: #selector(businesButtonTapped), for: .touchDown)
        stackView2.addArrangedSubview(businesButton)
        businesButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.3)
        }

        businesImage.image = UIImage(named: "img_business")
        businesButton.addSubview(businesImage)
        businesImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        businesLabel.text = "Business"
        businesLabel.textColor = .white
        businesButton.addSubview(businesLabel)
        businesLabel.snp.makeConstraints { make in
            make.left.equalTo(businesImage.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }

        foodButton.backgroundColor = .orange
        foodButton.layer.cornerRadius = 10
        stackView2.addArrangedSubview(foodButton)
        foodButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.3)
        }

        foodImage.image = UIImage(named: "img_food")
        foodButton.addSubview(foodImage)
        foodImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        foodLabel.text = "Food"
        foodLabel.textColor = .white
        foodButton.addSubview(foodLabel)
        foodLabel.snp.makeConstraints { make in
            make.left.equalTo(foodImage.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }

        relationsButton.backgroundColor = .systemPink
        relationsButton.layer.cornerRadius = 10
        stackView2.addArrangedSubview(relationsButton)
        relationsButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.3)
        }

        relationsImage.image = UIImage(named: "img_relations")
        relationsButton.addSubview(relationsImage)
        relationsImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }

        relationsLabel.text = "Reletions"
        relationsLabel.textColor = .white
        relationsButton.addSubview(relationsLabel)
        relationsLabel.snp.makeConstraints { make in
            make.left.equalTo(relationsImage.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }

        horoscopeView3.backgroundColor = .mainBlack
        horoscopeView3.layer.borderColor = UIColor.lightPurple.cgColor
        horoscopeView3.layer.borderWidth = 3
        horoscopeView3.layer.cornerRadius = 10
        contentView.addSubview(horoscopeView3)
        horoscopeView3.snp.makeConstraints { make in
            make.top.equalTo(stackView2.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(horoscopeView3.snp.width).multipliedBy(1.5)
        }

        selectedTipImage.image = UIImage(named: "img_business2")
        horoscopeView3.addSubview(selectedTipImage)
        selectedTipImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(24)
        }

        selectedTipLabel.text = "Business"
        selectedTipLabel.textColor = .white
        horoscopeView3.addSubview(selectedTipLabel)
        selectedTipLabel.snp.makeConstraints { make in
            make.left.equalTo(selectedTipImage.snp.right).offset(16)
            make.centerY.equalTo(selectedTipImage.snp.centerY)
        }

        selectedTipHoroscope.text = "Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profitPlan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and meetings in accordance with the lunar events to gain the most profit. Plan your negotiations, contacts and"
        selectedTipHoroscope.textColor = .white
        selectedTipHoroscope.numberOfLines = 0
        horoscopeView3.addSubview(selectedTipHoroscope)
        selectedTipHoroscope.snp.makeConstraints { make in
            make.top.equalTo(selectedTipImage.snp.bottom).offset(16)
            make.right.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }

    }

    @objc private func businesButtonTapped() {
        print("sa")
    }
}
