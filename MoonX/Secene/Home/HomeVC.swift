//
//  ViewController.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK
import SnapKit
import Alamofire
import ChatGPTSwift

final class HomeVC: UIViewController, UIScrollViewDelegate {

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView()
    private let backgroundImage = UIImageView()
    private let calenderButton = UIButton()
    private let calender = UIDatePicker()
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
    private let horoscopeButton = UIButton()
    private let horoscopeImage = UIImageView()
    private let horoscopeName = UILabel()
    private let label3 = UILabel()
    private let horoscopeView2 = UIView()
    private let horoscopeLoading = LottieManager.createLottie(animation: .loadingCircle3)
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
    private var selectedTipImage = UIImageView()
    private let selectedHoroscopeLoading = LottieManager.createLottie(animation: .loadingCircle3)
    private let selectedTipLabel = UILabel()
    private let selectedTipHoroscope = UILabel()

    private let gptApi = ChatGPTAPI(apiKey: "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")
    private var isCalenderOpen = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        let key = "CZMGSHZDK65BQXPVXGVWW3QJ6"
        let adress = UserDefaults.standard.value(forKey: "location")! as! String

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: Date())

        fetchWeatherData(adress: adress, date: date, key: key)
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
            make.height.equalToSuperview().multipliedBy(2.1)
        }

        backgroundImage.image = UIImage(named: "img_background_home")
        contentView.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }

        //MARK: date işlemleri

        calenderButton.setTitle("2 Aug 2023", for: .normal)
        calenderButton.setTitleColor(.lightPurple2, for: .normal)
        calenderButton.backgroundColor = .dateButton
        calenderButton.layer.cornerRadius = 10
        calenderButton.addTarget(self, action: #selector(calenderButtonTapped), for: .touchDown)
        contentView.addSubview(calenderButton)
        calenderButton.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.right.equalTo(contentView.snp.right).inset(8)
            make.width.equalTo(100)
        }

        calender.datePickerMode = .date
        calender.preferredDatePickerStyle = .inline
        calender.backgroundColor = .lightBlack
        calender.isHidden = true
        contentView.addSubview(calender)
        calender.snp.makeConstraints { make in
            make.top.equalTo(calenderButton.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }

        label.text = "Good Morning!"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.bottom.equalTo(calenderButton.snp.bottom)
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

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM HH.mm"

        dateLabel.text = dateFormatter.string(from: Date())
        dateLabel.textColor = .white
        contentView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }

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

        horoscopeButton.setImage(UIImage(named: "img_horoscopeBanner"), for: .normal)
        horoscopeButton.addTarget(self, action: #selector(horoscopeButtonTapped), for: .touchDown)
        contentView.addSubview(horoscopeButton)
        horoscopeButton.snp.makeConstraints { make in
            make.top.equalTo(label2.snp.bottom).offset(8)
            make.right.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
        }

        horoscopeImage.image = UIImage(named: "img_aries")
        horoscopeButton.addSubview(horoscopeImage)
        horoscopeImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
        }

        horoscopeName.text = findZodiacSign(for: UserDefaults.standard.value(forKey: "date")! as! String)
        horoscopeName.textColor = .white
        horoscopeName.font = .systemFont(ofSize: 22)
        horoscopeButton.addSubview(horoscopeName)
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
            make.top.equalTo(horoscopeButton.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(horoscopeView2.snp.width).multipliedBy(1.5)
        }

        horoscopeLoading.isHidden = true
        horoscopeLoading.stop()
        horoscopeView2.addSubview(horoscopeLoading)
        horoscopeLoading.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalToSuperview().multipliedBy(0.2)
        }

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
        foodButton.addTarget(self, action: #selector(foodButtonTapped), for: .touchDown)
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
        relationsButton.addTarget(self, action: #selector(relationsButtonTapped), for: .touchDown)
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

        horoscopeView3.addSubview(selectedTipImage)
        selectedTipImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(24)
            make.width.equalToSuperview().multipliedBy(0.15)
            make.height.equalTo(selectedTipImage.snp.width)
        }

        selectedHoroscopeLoading.isHidden = true
        selectedHoroscopeLoading.stop()
        horoscopeView3.addSubview(selectedHoroscopeLoading)
        selectedHoroscopeLoading.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalToSuperview().multipliedBy(0.2)
        }

        selectedTipLabel.textColor = .white
        horoscopeView3.addSubview(selectedTipLabel)
        selectedTipLabel.snp.makeConstraints { make in
            make.left.equalTo(selectedTipImage.snp.right).offset(16)
            make.centerY.equalTo(selectedTipImage.snp.centerY)
        }

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

    func fetchWeatherData(adress: String, date: String, key: String) {
        let url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(adress)/\(date)?unitGroup=metric&key=\(key)&include=days&elements=datetime,sunrise,sunset,moonset,moonrise,temp,conditions"

        AF.request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let days = json["days"] as? [[String: Any]] {
                    self.locationLabel.text = (json["resolvedAddress"] as! String)

                    for dayData in days {
                        self.moon1Label.text = self.convertTimeFormat(dayData["moonset"]! as! String)
                        self.moon2Label.text = self.convertTimeFormat(dayData["moonrise"]! as! String)
                        self.sun1Label.text = self.convertTimeFormat(dayData["sunset"]! as! String)
                        self.sun2Label.text = self.convertTimeFormat(dayData["sunrise"]! as! String)
                        self.weatherLabel.text = "\((dayData["conditions"]! as! String)) , \((dayData["temp"]! as! NSNumber).stringValue) C"
                    }
                }
            case .failure(let error):
                print("Veri çekme hatası: \(error)")
            }
        }
    }

    func convertTimeFormat(_ timeString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"

        if let date = dateFormatter.date(from: timeString) {
            dateFormatter.dateFormat = "HH.mm"
            let formattedTime = dateFormatter.string(from: date)
            return formattedTime
        }

        return nil
    }

    @objc private func businesButtonTapped() {
        selectedTipLabel.text = ""
        selectedTipHoroscope.text = ""
        selectedTipImage.isHidden = true
        selectedHoroscopeLoading.isHidden = false
        selectedHoroscopeLoading.play()

        Task {
            do {
                let response = try await gptApi.sendMessage(text: "If I am a \(horoscopeName.text!), pretend you are a fortune teller, please generate my horoscope for today for business. Please try to limit it 100 words")
                selectedHoroscopeLoading.stop()
                selectedHoroscopeLoading.isHidden = true
                selectedTipImage.isHidden = false

                selectedTipImage.image = UIImage(named: "img_business2")
                selectedTipLabel.text = "Business"
                selectedTipHoroscope.text = response
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @objc private func foodButtonTapped() {
        selectedTipLabel.text = ""
        selectedTipHoroscope.text = ""
        selectedTipImage.isHidden = true
        selectedHoroscopeLoading.isHidden = false
        selectedHoroscopeLoading.play()

        Task {
            do {
                let response = try await gptApi.sendMessage(text: "If I am a \(horoscopeName.text!), pretend you are a fortune teller, please generate my horoscope for today for food. Please try to limit it 100 words")
                selectedHoroscopeLoading.stop()
                selectedHoroscopeLoading.isHidden = true
                selectedTipImage.isHidden = false

                selectedTipImage.image = UIImage(named: "img_food")
                selectedTipLabel.text = "Food"
                selectedTipHoroscope.text = response
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @objc private func relationsButtonTapped() {
        selectedTipLabel.text = ""
        selectedTipHoroscope.text = ""
        selectedTipImage.isHidden = true
        selectedHoroscopeLoading.isHidden = false
        selectedHoroscopeLoading.play()

        Task {
            do {
                let response = try await gptApi.sendMessage(text: "If I am a \(horoscopeName.text!), pretend you are a fortune teller, please generate my horoscope for today for horoscope. Please try to limit it 100 words")
                selectedHoroscopeLoading.stop()
                selectedHoroscopeLoading.isHidden = true
                selectedTipImage.isHidden = false

                selectedTipImage.image = UIImage(named: "img_relations")
                selectedTipLabel.text = "Relations"
                selectedTipHoroscope.text = response
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @objc private func horoscopeButtonTapped() {
        horoscopeLabel.text = ""
        horoscopeLoading.isHidden = false
        horoscopeLoading.play()

        Task {
            do {
                let response = try await gptApi.sendMessage(text: "If I am a \(horoscopeName.text!), pretend you are a fortune teller, please generate my horoscope for today. Please try to limit it 130 words")
                horoscopeLoading.stop()
                horoscopeLoading.isHidden = true

                horoscopeLabel.text = response
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    @objc private func calenderButtonTapped() {
        if isCalenderOpen {
            calender.isHidden = true
            label.isHidden = false
            locationLabel.isHidden = false
            image.isHidden = false
            dateLabel.isHidden = false
            weatherLabel.isHidden = false
            moon1View.isHidden = false

            label2.snp.makeConstraints { make in
                make.top.equalTo(moon1View.snp.bottom).offset(16)
                make.left.equalToSuperview().offset(16)
            }

            moon2View.isHidden = false
            sun1View.isHidden = false
            sun2View.isHidden = false
            moon1Image.isHidden = false
            moon2Image.isHidden = false
            sun1Image.isHidden = false
            sun2Image.isHidden = false
            moon1Label.isHidden = false
            moon2Label.isHidden = false
            sun1Label.isHidden = false
            sun2Label.isHidden = false
        } else {
            calender.isHidden = false

            label2.snp.remakeConstraints { make in
                make.top.equalTo(calender.snp.bottom).offset(48)
                make.left.equalToSuperview().offset(16)
            }

            label.isHidden = true
            locationLabel.isHidden = true
            image.isHidden = true
            dateLabel.isHidden = true
            weatherLabel.isHidden = true
            moon1View.isHidden = true
            moon2View.isHidden = true
            sun1View.isHidden = true
            sun2View.isHidden = true
            moon1Image.isHidden = true
            moon2Image.isHidden = true
            sun1Image.isHidden = true
            sun2Image.isHidden = true
            moon1Label.isHidden = true
            moon2Label.isHidden = true
            sun1Label.isHidden = true
            sun2Label.isHidden = true
        }

        isCalenderOpen.toggle()
    }

    func findZodiacSign(for dateOfBirth: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"

        if let birthDate = dateFormatter.date(from: dateOfBirth) {
            let components = Calendar.current.dateComponents([.day, .month], from: birthDate)

            if let day = components.day, let month = components.month {
                switch (day, month) {
                case (21...31, 3), (1...19, 4):
                    return "Aries"
                case (20...30, 4), (1...20, 5):
                    return "Taurus"
                case (21...31, 5), (1...20, 6):
                    return "Gemini"
                case (21...30, 6), (1...22, 7):
                    return "Cancer"
                case (23...31, 7), (1...22, 8):
                    return "Leo"
                case (23...31, 8), (1...22, 9):
                    return "Virgo"
                case (23...30, 9), (1...22, 10):
                    return "Libra"
                case (23...31, 10), (1...21, 11):
                    return "Scorpio"
                case (22...30, 11), (1...19, 12):
                    return "Sagittarius"
                case (20...31, 12), (1...19, 1):
                    return "Capricorn"
                case (20...31, 1), (1...18, 2):
                    return "Aquarius"
                default:
                    return "Pisces"
                }
            }
        }

        return nil
    }
}
