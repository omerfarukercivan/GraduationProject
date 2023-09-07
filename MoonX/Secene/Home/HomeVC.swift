//
//  HomeVC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 28.08.2023.
//

import UIKit
import NeonSDK
import Alamofire
import AVFAudio

final class HomeVC: UIViewController, UIScrollViewDelegate {

	private let scrollView = UIScrollView()
	private let contentView = UIView()
	private let stackView = UIStackView()
	private let backgroundImage = UIImageView()
	private let calenderButton = UIButton()
	private let calender = UIDatePicker()
	private let calenderView = UILabel()
	private let label = UILabel()
	private let locationLabel = UILabel()
	private let moonImage = UIImageView()
	private let dateLabel = UILabel()
	private let weatherLabel = UILabel()
	private let moonSetView = UIView()
	private let moonRiseView = UIView()
	private let sunSetView = UIView()
	private let sunRiseView = UIView()
	private let moonSetImage = UIImageView()
	private let moonRiseImage = UIImageView()
	private let sunSetImage = UIImageView()
	private let sunRiseImage = UIImageView()
	private let moonSetLabel = UILabel()
	private let moonRiseLabel = UILabel()
	private let sunSetLabel = UILabel()
	private let sunRiseLabel = UILabel()
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
	private let tabbar = UIView()
	private let tabbarView = UIView()
	private let homeButton = UIImageView()
	private let homeLabel = UILabel()
	private let meditationButton = UIButton()
	private let meditationLabel = UILabel()
	private let settingsButton = UIButton()
	private let settingsLabel = UILabel()
	private let miniView = UIView()
	private let miniPlayPause = UIButton()
	private let miniNameLabel = UILabel()
	private let miniArtistLabel = UILabel()
	private let miniCloseButton = UIButton()
	private let miniSlider = UISlider()

	private var isCalenderOpen = false

	var music: MusicModel!
	var filteredMusic = [MusicModel]()
	var currentTime: Double!
	var isPlay = false

	private var audioPlayer: AVAudioPlayer?

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black

		if music != nil {
			musicPlay(music: music.music)

			Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
		}

		changeDate()
		fetchWeather()
		setupUI()
	}

	private func setupUI() {
		scrollView.delegate = self
		scrollView.showsVerticalScrollIndicator = false
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.isScrollEnabled = true
		view.addSubview(scrollView)
		scrollView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}

//		scrollView.delegate = self

////		scrollView.isDirectionalLockEnabled = false
////		scrollView.isScrollEnabled = true
//		view.addSubview(scrollView)
//		scrollView.snp.makeConstraints { make in
//			make.edges.equalToSuperview()
//		}

		scrollView.addSubview(contentView)
		contentView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
//			make.width.equalToSuperview()
//			make.centerX.equalToSuperview()
			make.height.greaterThanOrEqualTo(view.snp.height)
//			make.height.equalToSuperview().multipliedBy(2.2)
		}

		scrollView.addSubview(contentView)
		contentView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
			make.width.equalToSuperview()
//			make.height.equalToSuperview().multipliedBy(2.2)
		}

		// MARK: Tabbar
		tabbar.backgroundColor = .black
		view.addSubview(tabbar)
		tabbar.snp.makeConstraints { make in
			make.width.equalToSuperview()
			make.height.equalTo(tabbar.snp.width).multipliedBy(0.25)
			make.bottom.equalToSuperview()
		}

		tabbar.addSubview(tabbarView)
		tabbarView.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}

		homeButton.image = UIImage(named: "btn_home")
		tabbarView.addSubview(homeButton)
		homeButton.snp.makeConstraints { make in
			make.centerY.equalToSuperview().offset(-24)
			make.left.equalToSuperview().offset(32)
		}

		homeLabel.text = "Home"
		homeLabel.font = .systemFont(ofSize: 12)
		homeLabel.textColor = .lightPurple
		tabbarView.addSubview(homeLabel)
		homeLabel.snp.makeConstraints { make in
			make.top.equalTo(homeButton.snp.bottom)
			make.centerX.equalTo(homeButton.snp.centerX)
		}

		meditationButton.setImage(UIImage(named: "btn_meditation"), for: .normal)
		meditationButton.addTarget(self, action: #selector(meditationButtonTapped), for: .touchDown)
		tabbarView.addSubview(meditationButton)
		meditationButton.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview().offset(-24)
		}

		meditationLabel.text = "Meditation"
		meditationLabel.font = .systemFont(ofSize: 12)
		meditationLabel.textColor = .white
		tabbarView.addSubview(meditationLabel)
		meditationLabel.snp.makeConstraints { make in
			make.top.equalTo(meditationButton.snp.bottom)
			make.centerX.equalTo(meditationButton.snp.centerX)
		}

		settingsButton.setImage(UIImage(named: "btn_settings"), for: .normal)
		settingsButton.addTarget(self, action: #selector(settingsButtonTapped), for: .touchDown)
		tabbarView.addSubview(settingsButton)
		settingsButton.snp.makeConstraints { make in
			make.centerY.equalToSuperview().offset(-24)
			make.right.equalToSuperview().offset(-32)
		}

		settingsLabel.text = "Settings"
		settingsLabel.font = .systemFont(ofSize: 12)
		settingsLabel.textColor = .white
		tabbarView.addSubview(settingsLabel)
		settingsLabel.snp.makeConstraints { make in
			make.top.equalTo(settingsButton.snp.bottom)
			make.centerX.equalTo(settingsButton.snp.centerX)
		}

		// MARK: MiniPlayer
		miniView.backgroundColor = .lightBlack
		miniView.isHidden = music == nil ? true : false
		miniView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
		miniView.isUserInteractionEnabled = true
		tabbar.addSubview(miniView)
		miniView.snp.makeConstraints { make in
			make.width.equalToSuperview()
			make.height.equalTo(tabbar.snp.width).multipliedBy(0.2)
		}

		miniPlayPause.setImage(UIImage(named: isPlay ? "btn_pause2" : "btn_play2"), for: .normal)
		miniPlayPause.addTarget(self, action: #selector(miniPlayPauseTapped), for: .touchDown)
		miniView.addSubview(miniPlayPause)
		miniPlayPause.snp.makeConstraints { make in
			make.left.equalToSuperview().offset(16)
			make.height.equalToSuperview().multipliedBy(0.7)
			make.width.equalTo(miniPlayPause.snp.height)
			make.centerY.equalToSuperview()
		}

		miniNameLabel.textColor = .white
		miniNameLabel.font = .systemFont(ofSize: 12)
		miniView.addSubview(miniNameLabel)
		miniNameLabel.snp.makeConstraints { make in
			make.top.equalTo(miniPlayPause.snp.top)
			make.left.equalTo(miniPlayPause.snp.right).offset(16)
		}

		miniArtistLabel.textColor = .white
		miniArtistLabel.font = .systemFont(ofSize: 10)
		miniView.addSubview(miniArtistLabel)
		miniArtistLabel.snp.makeConstraints { make in
			make.top.equalTo(miniNameLabel.snp.bottom).offset(8)
			make.left.equalTo(miniPlayPause.snp.right).offset(16)
		}

		miniCloseButton.setImage(UIImage(named: "btn_close2"), for: .normal)
		miniCloseButton.addTarget(self, action: #selector(miniCloseButtonTapped), for: .touchDown)
		miniView.addSubview(miniCloseButton)
		miniCloseButton.snp.makeConstraints { make in
			make.right.equalToSuperview().offset(-16)
			make.height.equalToSuperview().multipliedBy(0.7)
			make.centerY.equalToSuperview()
		}

		miniSlider.setThumbImage(UIImage(), for: .normal)
		miniSlider.maximumTrackTintColor = .white
		miniSlider.minimumTrackTintColor = .lightPurple
		miniView.addSubview(miniSlider)
		miniSlider.addTarget(self, action: #selector(miniSliderValueChanged), for: .valueChanged)
		miniSlider.snp.makeConstraints { make in
			make.bottom.equalTo(miniView.snp.bottom)
			make.left.equalToSuperview().offset(2)
			make.right.equalToSuperview().offset(-2)
		}

		backgroundImage.image = UIImage(named: "img_background_home")
		contentView.addSubview(backgroundImage)
		backgroundImage.snp.makeConstraints { make in
			make.top.equalToSuperview()
		}

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
		calender.locale = Locale(identifier: "en_US")
		calender.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
		calender.isHidden = true
		contentView.addSubview(calender)
		calender.snp.makeConstraints { make in
			make.top.equalTo(calenderButton.snp.bottom).offset(24)
			make.left.equalToSuperview().offset(16)
			make.right.equalToSuperview().offset(-16)
		}

		contentView.addSubview(calenderView)
		calenderView.snp.makeConstraints { make in
			make.top.right.left.bottom.equalTo(backgroundImage)
		}

		label.text = "Good Morning!"
		label.font = .systemFont(ofSize: 18)
		label.textColor = .white
		calenderView.addSubview(label)
		label.snp.makeConstraints { make in
			make.bottom.equalTo(calenderButton.snp.bottom)
			make.centerX.equalToSuperview()
		}

		locationLabel.font = .systemFont(ofSize: 14)
		locationLabel.textColor = .white
		calenderView.addSubview(locationLabel)
		locationLabel.snp.makeConstraints { make in
			make.top.equalTo(label.snp.bottom).offset(8)
			make.centerX.equalToSuperview()
		}

		moonImage.image = UIImage(named: "img_moon")
		calenderView.addSubview(moonImage)
		moonImage.snp.makeConstraints { make in
			make.top.equalTo(locationLabel.snp.bottom).offset(24)
			make.centerX.equalToSuperview()
		}

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "d MMM HH.mm"

		dateLabel.text = dateFormatter.string(from: Date())
		dateLabel.textColor = .white
		calenderView.addSubview(dateLabel)
		dateLabel.snp.makeConstraints { make in
			make.top.equalTo(moonImage.snp.bottom).offset(24)
			make.centerX.equalToSuperview()
		}


		weatherLabel.textColor = .white
		weatherLabel.font = .systemFont(ofSize: 14)
		calenderView.addSubview(weatherLabel)
		weatherLabel.snp.makeConstraints { make in
			make.top.equalTo(dateLabel.snp.bottom).offset(8)
			make.centerX.equalToSuperview()
		}

		// MARK: Ay ve Güneş doğum batımı
		stackView.axis = .horizontal
		stackView.distribution = .equalSpacing
		calenderView.addSubview(stackView)
		stackView.snp.makeConstraints { make in
			make.top.equalTo(weatherLabel.snp.bottom).offset(32)
			make.right.equalTo(contentView).offset(-8)
			make.left.equalTo(contentView).offset(8)
			make.height.equalTo(50)
		}

		moonSetView.backgroundColor = .mainBlack2
		stackView.addArrangedSubview(moonSetView)
		moonSetView.snp.makeConstraints { make in
			make.width.equalToSuperview().multipliedBy(0.21)
		}

		moonSetImage.image = UIImage(named: "img_moon2")
		moonSetView.addSubview(moonSetImage)
		moonSetImage.snp.makeConstraints { make in
			make.left.equalTo(moonSetView).offset(2)
			make.height.equalToSuperview().multipliedBy(0.5)
			make.width.equalTo(moonSetImage.snp.height)
			make.centerY.equalToSuperview()
		}

		moonSetLabel.textColor = .white
		moonSetView.addSubview(moonSetLabel)
		moonSetLabel.snp.makeConstraints { make in
			make.left.equalTo(moonSetImage.snp.right).offset(2)
			make.centerY.equalToSuperview()
		}

		moonRiseView.backgroundColor = .mainBlack2
		stackView.addArrangedSubview(moonRiseView)
		moonRiseView.snp.makeConstraints { make in
			make.width.equalToSuperview().multipliedBy(0.21)
		}

		moonRiseImage.image = UIImage(named: "img_moon3")
		moonRiseView.addSubview(moonRiseImage)
		moonRiseImage.snp.makeConstraints { make in
			make.left.equalTo(moonRiseView).offset(2)
			make.height.equalToSuperview().multipliedBy(0.5)
			make.width.equalTo(moonRiseImage.snp.height)
			make.centerY.equalToSuperview()
		}

		moonRiseLabel.textColor = .white
		moonRiseView.addSubview(moonRiseLabel)
		moonRiseLabel.snp.makeConstraints { make in
			make.left.equalTo(moonRiseImage.snp.right).offset(2)
			make.centerY.equalToSuperview()
		}

		sunSetView.backgroundColor = .mainBlack2
		stackView.addArrangedSubview(sunSetView)
		sunSetView.snp.makeConstraints { make in
			make.width.equalToSuperview().multipliedBy(0.21)
		}

		sunSetImage.image = UIImage(named: "img_sun")
		sunSetView.addSubview(sunSetImage)
		sunSetImage.snp.makeConstraints { make in
			make.left.equalTo(sunSetView).offset(2)
			make.height.equalToSuperview().multipliedBy(0.5)
			make.width.equalTo(sunSetImage.snp.height)
			make.centerY.equalToSuperview()
		}

		sunSetLabel.textColor = .white
		sunSetView.addSubview(sunSetLabel)
		sunSetLabel.snp.makeConstraints { make in
			make.left.equalTo(sunSetImage.snp.right).offset(2)
			make.centerY.equalToSuperview()
		}

		sunRiseView.backgroundColor = .mainBlack2
		stackView.addArrangedSubview(sunRiseView)
		sunRiseView.snp.makeConstraints { make in
			make.width.equalToSuperview().multipliedBy(0.21)
		}

		sunRiseImage.image = UIImage(named: "img_sun2")
		sunRiseView.addSubview(sunRiseImage)
		sunRiseImage.snp.makeConstraints { make in
			make.left.equalTo(sunRiseView).offset(2)
			make.height.equalToSuperview().multipliedBy(0.5)
			make.width.equalTo(sunRiseImage.snp.height)
			make.centerY.equalToSuperview()
		}

		sunRiseLabel.textColor = .white
		sunRiseView.addSubview(sunRiseLabel)
		sunRiseLabel.snp.makeConstraints { make in
			make.left.equalTo(sunRiseImage.snp.right).offset(2)
			make.centerY.equalToSuperview()
		}

		label2.text = "What is for Today?"
		label2.textColor = .white
		label2.font = .systemFont(ofSize: 18)
		contentView.addSubview(label2)
		label2.snp.makeConstraints { make in
			make.top.equalTo(moonSetView.snp.bottom).offset(16)
			make.left.equalToSuperview().offset(16)
		}

		// MARK: Burç Yorumu
		horoscopeButton.setImage(UIImage(named: "img_horoscopeBanner"), for: .normal)
		horoscopeButton.addTarget(self, action: #selector(horoscopeButtonTapped), for: .touchDown)
		contentView.addSubview(horoscopeButton)
		horoscopeButton.snp.makeConstraints { make in
			make.top.equalTo(label2.snp.bottom).offset(8)
			make.right.equalToSuperview().offset(-16)
			make.left.equalToSuperview().offset(16)
		}

		horoscopeImage.image = UIImage(named: HoroscopeManager.findZodiacSign(for: UserDefaults.standard.value(forKey: "date")! as! String)!)
		horoscopeButton.addSubview(horoscopeImage)
		horoscopeImage.snp.makeConstraints { make in
			make.left.equalToSuperview().offset(16)
			make.centerY.equalToSuperview()
			make.width.equalToSuperview().multipliedBy(0.15)
			make.height.equalTo(horoscopeImage.snp.width)
		}

		horoscopeName.text = HoroscopeManager.findZodiacSign(for: UserDefaults.standard.value(forKey: "date")! as! String)
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
//			make.height.equalTo(horoscopeView2.snp.width).multipliedBy(1.5)
//			make.height.greaterThanOrEqualTo(100)
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

//		horoscopeLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem"
		horoscopeLabel.textColor = .white
		horoscopeLabel.numberOfLines = 0
		horoscopeLabel.lineBreakMode = .byWordWrapping
		horoscopeView2.addSubview(horoscopeLabel)
		horoscopeLabel.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(16)
			make.right.equalToSuperview().offset(-16)
			make.left.equalToSuperview().offset(16)
			make.bottom.equalToSuperview().offset(-16)
		}



		// MARK: Burç Yorumu 2
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
		businesButton.addTarget(self, action: #selector(lunarButtonTapped), for: .touchDown)
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
		foodButton.addTarget(self, action: #selector(lunarButtonTapped), for: .touchDown)
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
		relationsButton.addTarget(self, action: #selector(lunarButtonTapped), for: .touchDown)
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

		relationsLabel.text = "Relations"
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

		let offset = view.frame.size.width * 0.25

		contentView.snp.makeConstraints { make in
			make.bottom.equalTo(horoscopeView3).offset(offset)
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

	@objc private func lunarButtonTapped(_ sender: UIButton) {
		selectedTipLabel.text = ""
		selectedTipHoroscope.text = ""
		selectedTipImage.isHidden = true
		selectedHoroscopeLoading.isHidden = false
		selectedHoroscopeLoading.play()

		let lunar = "\((sender.subviews.first(where: { $0 is UILabel }) as? UILabel)!.text!)"

		APIManager.shared.lunarTip = "for \(lunar)"

		APIManager.shared.getHoroscope(horoscopeName: horoscopeName.text!) { result in
			DispatchQueue.main.async {
				switch result {
				case .success(let response):
					self.selectedHoroscopeLoading.stop()
					self.selectedHoroscopeLoading.isHidden = true
					self.selectedTipImage.isHidden = false

					self.selectedTipImage.image = UIImage(named: "img_\(lunar.lowercased())2")
					self.selectedTipLabel.text = lunar
					self.selectedTipHoroscope.text = response
				case .failure(let error):
					print(error.localizedDescription)
				}
			}
		}
	}

	@objc private func horoscopeButtonTapped() {
//		horoscopeLabel.text = ""
//		horoscopeLoading.isHidden = false
//		horoscopeLoading.play()

		horoscopeLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem IpsumLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem"

//		APIManager.shared.getHoroscope(horoscopeName: horoscopeName.text!) { result in
//			DispatchQueue.main.async {
//				switch result {
//				case .success(let response):
//					self.horoscopeLoading.stop()
//					self.horoscopeLoading.isHidden = true
//					self.horoscopeLabel.text = response
//				case .failure(let error):
//					print(error.localizedDescription)
//				}
//			}
//		}
	}

	@objc private func calenderButtonTapped() {
		if isCalenderOpen {
			calender.isHidden = true
			calenderView.isHidden = false

			label2.snp.makeConstraints { make in
				make.top.equalTo(moonSetView.snp.bottom).offset(16)
				make.left.equalToSuperview().offset(16)
			}
		} else {
			calender.isHidden = false
			calenderView.isHidden = true

			label2.snp.remakeConstraints { make in
				make.top.equalTo(calender.snp.bottom).offset(48)
				make.left.equalToSuperview().offset(16)
			}
		}
		isCalenderOpen.toggle()
	}

	@objc private func dateChanged(_ datePicker: UIDatePicker) {
		let dateFormatter = DateFormatter()
		let dateFormatter2 = DateFormatter()

		dateFormatter.dateFormat = "dd MMMM"
		dateFormatter2.dateFormat = "yyyy-MM-dd"

		APIManager.shared.weatherDate = dateFormatter2.string(from: calender.date)
		APIManager.shared.gptDate = dateFormatter.string(from: calender.date)


		horoscopeLabel.text = ""
		selectedTipHoroscope.text = ""

		fetchWeather()
	}

	@objc private func meditationButtonTapped() {
		present(destinationVC: MeditationVC(), slideDirection: .up)
	}

	@objc private func settingsButtonTapped() {
		present(destinationVC: SettingsVC(), slideDirection: .up)
	}

	@objc private func miniCloseButtonTapped() {
		if let player = audioPlayer {
			if player.isPlaying {
				player.pause()
			}
			miniView.isHidden = true
			tabbarView.isHidden = false
		}
	}

	@objc private func miniPlayPauseTapped() {
		if let player = audioPlayer {
			if player.isPlaying {
				player.pause()
				miniPlayPause.setImage(UIImage(named: "btn_play2"), for: .normal)
			} else {
				player.play()
				miniPlayPause.setImage(UIImage(named: "btn_pause2"), for: .normal)
			}
		}
	}

	@objc private func miniSliderValueChanged() {
		audioPlayer?.stop()
		audioPlayer?.currentTime = TimeInterval(miniSlider.value)
		audioPlayer?.prepareToPlay()
		audioPlayer?.play()
	}

	private func musicPlay(music: URL) {
		if self.music == nil {
			miniView.isHidden = true
			tabbarView.isHidden = false
		} else {
			miniView.isHidden = false
			tabbarView.isHidden = true

			do {
				audioPlayer = try AVAudioPlayer(contentsOf: music)
				audioPlayer?.currentTime = currentTime
				audioPlayer!.prepareToPlay()

				miniSlider.maximumValue = Float(audioPlayer!.duration)
			} catch {
				print("Ses çalarken bir hata oluştu: \(error.localizedDescription)")
			}

			if isPlay {
				audioPlayer?.play()
			}

			miniNameLabel.text = self.music.musicName
			miniArtistLabel.text = self.music.artistName
		}
	}

	@objc private func updateSlider() {
		miniSlider.value = Float(audioPlayer!.currentTime)
	}

	@objc func handleTap(_ sender: UITapGestureRecognizer) {
		let vc = PlayerVC()

		vc.currentTime = audioPlayer?.currentTime
		vc.music = self.music
		vc.filteredMusic = self.filteredMusic

		if let player = audioPlayer {
			if player.isPlaying {
				player.stop()
				vc.isPlay = true
			} else {
				vc.isPlay = false
			}
		}

		present(destinationVC: vc, slideDirection: .up)
	}

	func fetchWeather() {
		APIManager.shared.fetchWeatherData() { [weak self] (data, error) in
			if let data = data {
				DispatchQueue.main.async {
					self?.locationLabel.text = (data["resolvedAddress"] as? String) ?? ""
					if let days = data["days"] as? [[String: Any]] {
						for dayData in days {
							self?.moonSetLabel.text = self?.convertTimeFormat(dayData["moonset"] as? String ?? "--.--")
							self?.moonRiseLabel.text = self?.convertTimeFormat(dayData["moonrise"] as? String ?? "--.--")
							self?.sunSetLabel.text = self?.convertTimeFormat(dayData["sunset"] as? String ?? "--.--")
							self?.sunRiseLabel.text = self?.convertTimeFormat(dayData["sunrise"] as? String ?? "--.--")
							self?.weatherLabel.text = "\(dayData["conditions"] as? String ?? ""), \((dayData["temp"] as? NSNumber)?.stringValue ?? "") C"
						}
					}
				}
			} else if let error = error {
				print("Veri çekme hatası: \(error)")
			}
		}
	}

	private func changeDate() {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		APIManager.shared.weatherDate = dateFormatter.string(from: Date())
	}
}
