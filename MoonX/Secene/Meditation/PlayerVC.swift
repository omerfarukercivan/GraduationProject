//
//  PlayerVC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 31.08.2023.
//

import UIKit
import NeonSDK
import SnapKit
import AVFAudio

class PlayerVC: UIViewController {

	private let backgroundImage = UIImageView()
	private let closeButton = UIButton()
	private let nameLabel = UILabel()
	private let currentTimeSlider = UISlider()
	private let currentTimeLabel = UILabel()
	private let durationLabel = UILabel()
	private let refreshButton = UIButton()
	private let backButton = UIButton()
	private let playPauseButton = UIButton()
	private let nextButton = UIButton()
	private let favButton = UIButton()

	var music: MusicModel!
	var filteredMusic = [MusicModel]()
	var favMusic: [MusicModel] = []

	var currentTime: Double! = 0
	var audioPlayer: AVAudioPlayer?
	var isPlay = true

	override func viewDidLoad() {
		super.viewDidLoad()

		musicPlay(music: music.music)
		Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)

		currentTime = 0

		favMusic2()

		setupUI()
	}

	private func setupUI() {
		backgroundImage.image = UIImage(named: music!.backgroundImage)
		view.addSubview(backgroundImage)
		backgroundImage.snp.makeConstraints { make in
			make.edges.equalToSuperview()
		}

		closeButton.setImage(UIImage(named: "btn_dropdown_arrow"), for: .normal)
		closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchDown)
		view.addSubview(closeButton)
		closeButton.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(32)
			make.left.equalToSuperview().offset(16)
		}

		playPauseButton.setImage(UIImage(named: "btn_play_playlist"), for: .normal)
		playPauseButton.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchDown)
		view.addSubview(playPauseButton)
		playPauseButton.snp.makeConstraints { make in
			make.bottom.equalToSuperview().offset(-64)
			make.centerX.equalToSuperview()
		}

		backButton.setImage(UIImage(named: "btn_back_playlist"), for: .normal)
		backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchDown)
		view.addSubview(backButton)
		backButton.snp.makeConstraints { make in
			make.centerY.equalTo(playPauseButton.snp.centerY)
			make.centerX.equalTo(view.snp.centerX).multipliedBy(0.65)
		}

		refreshButton.setImage(UIImage(named: "btn_refresh_playlist"), for: .normal)
		refreshButton.addTarget(self, action: #selector(refreshButtonTapped), for: .touchDown)
		view.addSubview(refreshButton)
		refreshButton.snp.makeConstraints { make in
			make.centerY.equalTo(playPauseButton.snp.centerY)
			make.centerX.equalTo(view.snp.centerX).multipliedBy(0.35)
		}

		nextButton.setImage(UIImage(named: "btn_next_playlist"), for: .normal)
		nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchDown)
		view.addSubview(nextButton)
		nextButton.snp.makeConstraints { make in
			make.centerY.equalTo(playPauseButton.snp.centerY)
			make.centerX.equalTo(view.snp.centerX).multipliedBy(1.35)
		}

		favButton.setImage(UIImage(named: "btn_fav_playlist"), for: .normal)
		favButton.addTarget(self, action: #selector(favButtonTapped), for: .touchDown)
		view.addSubview(favButton)
		favButton.snp.makeConstraints { make in
			make.centerY.equalTo(playPauseButton.snp.centerY)
			make.centerX.equalTo(view.snp.centerX).multipliedBy(1.65)
		}

		durationLabel.textColor = .white
		durationLabel.font = .systemFont(ofSize: 14)
		view.addSubview(durationLabel)
		durationLabel.snp.makeConstraints { make in
			make.right.equalToSuperview().offset(-8)
			make.centerY.equalTo(view.snp.centerY).multipliedBy(1.6)
		}

		currentTimeLabel.textColor = .white
		currentTimeLabel.font = .systemFont(ofSize: 14)
		view.addSubview(currentTimeLabel)
		currentTimeLabel.snp.makeConstraints { make in
			make.left.equalToSuperview().offset(8)
			make.centerY.equalTo(view.snp.centerY).multipliedBy(1.6)
		}


		currentTimeSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
		view.addSubview(currentTimeSlider)
		currentTimeSlider.snp.makeConstraints { make in
			make.left.equalToSuperview().offset(8)
			make.right.equalToSuperview().offset(-8)
			make.bottom.equalTo(durationLabel.snp.top).offset(-16)
		}

		nameLabel.text = music?.musicName
		nameLabel.textColor = .white
		nameLabel.font = .systemFont(ofSize: 22)
		view.addSubview(nameLabel)
		nameLabel.snp.makeConstraints { make in
			make.bottom.equalTo(currentTimeSlider.snp.top).offset(-24)
			make.centerX.equalToSuperview()
		}
	}

	private func musicPlay(music: URL) {
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: music)

//			if currentTime != nil {
//				audioPlayer?.currentTime = currentTime
//			}

			audioPlayer?.currentTime = currentTime

			audioPlayer!.prepareToPlay()

			currentTimeSlider.maximumValue = Float(audioPlayer!.duration)

			let totalSecond = audioPlayer!.duration
			let minutes = Int(totalSecond / 60)
			let second = totalSecond.truncatingRemainder(dividingBy: 60)

			durationLabel.text = String(format: "%02d:%02d", minutes, Int(second))
		} catch {
			print("Ses çalarken bir hata oluştu: \(error.localizedDescription)")
		}

		if isPlay {
			audioPlayer?.play()
		}
	}

	@objc private func closeButtonTapped() {
		let vc = HomeVC()

		vc.music = self.music
		vc.filteredMusic = self.filteredMusic
		vc.currentTime = self.audioPlayer?.currentTime

		self.isPlay = false

		if let player = audioPlayer {
			if player.isPlaying {
				player.stop()
				vc.isPlay = true
			} else {
				vc.isPlay = false
			}
		}

		present(destinationVC: vc, slideDirection: .down)
	}

	@objc private func playPauseButtonTapped() {
		if let player = audioPlayer {
			if player.isPlaying {
				player.pause()
			} else {
				player.play()
			}
		}
	}

	@objc private func refreshButtonTapped() {
		if let player = audioPlayer {
			player.currentTime = 0
		}
	}

	@objc private func backButtonTapped() {
		changeTrack(moveForward: false)
		audioPlayer?.stop()
		musicPlay(music: music.music)
		nameLabel.text = music.musicName
		currentTime = 0
	}

	@objc private func nextButtonTapped() {
		changeTrack(moveForward: true)
		audioPlayer?.stop()
		musicPlay(music: music.music)
		nameLabel.text = music.musicName
		currentTime = 0
	}

	fileprivate func changeTrack(moveForward: Bool) {
		if filteredMusic.count == 0 { return }

		let offset = moveForward ? 1 : filteredMusic.count - 1

		let currentMusicIndex = filteredMusic.firstIndex { music in
			return self.music.musicName == music.musicName
		}

		guard let index = currentMusicIndex else { return }

		self.music = filteredMusic[(index + offset) % filteredMusic.count]
	}

	@objc private func updateSlider() {
		let totalSecond = audioPlayer!.currentTime
		let minutes = Int(totalSecond / 60)
		let second = totalSecond.truncatingRemainder(dividingBy: 60)

		currentTimeSlider.value = Float(audioPlayer!.currentTime)
		currentTimeLabel.text = String(format: "%02d:%02d", minutes, Int(second))
	}

	@objc private func sliderValueChanged() {
		audioPlayer?.stop()
		audioPlayer?.currentTime = TimeInterval(currentTimeSlider.value)
		audioPlayer?.prepareToPlay()
		audioPlayer?.play()
	}

	@objc private func favButtonTapped() {
		if !favMusic.contains(where: { $0.musicName == music.musicName && $0.segment == music.segment }) {
			favMusic.append(music)

			do {
				let encodedData = try JSONEncoder().encode(favMusic)
				UserDefaults.standard.set(encodedData, forKey: "favMusic")
			} catch {
				print("Dizi kodlanamadı: \(error)")
			}
		}
		print("\(favMusic.map({ $0.musicName })), \(favMusic.map({ $0.segment }))")
	}

	private func favMusic2() {
		if let storedData = UserDefaults.standard.data(forKey: "favMusic") {
			do {
				let decodedData = try JSONDecoder().decode([MusicModel].self, from: storedData)

				favMusic = decodedData
			} catch {
				print("Dizi çözülemedi: \(error)")
			}
		}
	}
}
