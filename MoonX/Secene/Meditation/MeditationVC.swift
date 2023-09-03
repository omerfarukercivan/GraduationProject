//
//  MeditationVC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 29.08.2023.
//

import UIKit
import NeonSDK
import SnapKit
import AVFAudio

final class MeditationVC: UIViewController {

	private let backButton = UIButton()
	private var musicSegment: UISegmentedControl!
	private var musicTitle = UILabel()
	private var collectionView = NeonCollectionView<MusicModel, MeditationCell>()

	private var musics = [MusicModel]()
	private var filteredMusic = [MusicModel]()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black

		musicAppend()
		setupUI()
	}

	override func viewWillAppear(_ animated: Bool) {
		musicSegmentValueChanged()
	}

	private func setupUI() {
		backButton.setImage(UIImage(named: "btn_back"), for: .normal)
		backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchDown)
		view.addSubview(backButton)
		backButton.snp.makeConstraints { make in
			make.top.equalToSuperview().offset(32)
			make.left.equalToSuperview().offset(16)
		}

		let items = ["Meditation", "Yoga", "Music"]
		musicSegment = UISegmentedControl(items: items)
		let textAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
		musicSegment.setTitleTextAttributes(textAttributes, for: .normal)
		musicSegment.backgroundColor = .lightPurple
		musicSegment.selectedSegmentTintColor = .darkPurple
		musicSegment.selectedSegmentIndex = 0
		musicSegment.addTarget(self, action: #selector(musicSegmentValueChanged), for: .valueChanged)
		view.addSubview(musicSegment)
		musicSegment.snp.makeConstraints { make in
			make.top.equalTo(backButton.snp.bottom).offset(24)
			make.left.equalToSuperview().offset(24)
			make.right.equalToSuperview().offset(-24)
		}

		musicTitle.textColor = .white
		musicTitle.font = .systemFont(ofSize: 22)
		view.addSubview(musicTitle)
		musicTitle.snp.makeConstraints { make in
			make.top.equalTo(musicSegment.snp.bottom).offset(24)
			make.left.equalToSuperview().offset(16)
		}

		collectionView = NeonCollectionView<MusicModel, MeditationCell>(
			objects: filteredMusic,
			itemsPerRow: 2,
			leftPadding: 10,
			rightPadding: 10,
			horizontalItemSpacing: 20,
			verticalItemSpacing: 20
		)

		collectionView.backgroundColor = .black
		view.addSubview(collectionView)
		collectionView.snp.makeConstraints { make in
			make.top.equalTo(musicTitle.snp.bottom).offset(24)
			make.right.left.bottom.equalToSuperview()
		}

		collectionView.didSelect = { object, indexPath in
			let vc = PlayerVC()
			vc.music = object
			vc.filteredMusic = self.filteredMusic

			self.present(destinationVC: vc, slideDirection: .up)
		}
	}

	private func musicAppend() {
		let music1 = Bundle.main.url(forResource: "music1", withExtension: ".mp3")!
		let music2 = Bundle.main.url(forResource: "music2", withExtension: ".mp3")!
		let music3 = Bundle.main.url(forResource: "music3", withExtension: ".mp3")!
		let music4 = Bundle.main.url(forResource: "music4", withExtension: ".mp3")!

		// MEDITATION
		musics.append(MusicModel(music: music1, musicName: "Music1", artistName: "God of War", duration: "4:07", image: "img_meditation", backgroundImage: "img_background1", segment: 0))
		musics.append(MusicModel(music: music2, musicName: "Music2", artistName: "RDR II", duration: "6:01", image: "img_meditation", backgroundImage: "img_background1", segment: 0))

		musics.append(MusicModel(music: music3, musicName: "Music3", artistName: "Akame ga Kill", duration: "2:44", image: "img_meditation2", backgroundImage: "img_background1", segment: 0))
		musics.append(MusicModel(music: music4, musicName: "Music4", artistName: "Dark Souls III", duration: "2:41", image: "img_meditation2", backgroundImage: "img_background1", segment: 0))

		// YOGA
		musics.append(MusicModel(music: music1, musicName: "Music1", artistName: "God of War", duration: "4:07", image: "img_meditation", backgroundImage: "img_background2", segment: 1))
		musics.append(MusicModel(music: music2, musicName: "Music2", artistName: "RDR II", duration: "6:01", image: "img_meditation", backgroundImage: "img_background2", segment: 1))


		// MUSIC
		musics.append(MusicModel(music: music1, musicName: "Music1", artistName: "God of War", duration: "4:07", image: "img_music1", backgroundImage: "img_background3", segment: 2))
		musics.append(MusicModel(music: music2, musicName: "Music2", artistName: "RDR II", duration: "6:01", image: "img_music2", backgroundImage: "img_background3", segment: 2))
		musics.append(MusicModel(music: music3, musicName: "Music3", artistName: "Akame ga Kill", duration: "2:44", image: "img_music3", backgroundImage: "img_background3", segment: 2))
		musics.append(MusicModel(music: music4, musicName: "Music4", artistName: "Dark Souls III", duration: "2:41", image: "img_music4", backgroundImage: "img_background3", segment: 2))
	}

	@objc private func backButtonTapped() {
		self.dismiss(animated: true)
	}

	@objc private func musicSegmentValueChanged() {
		if musicSegment.selectedSegmentIndex == 0 {
			musicTitle.text = "Feng Shui"
		} else if musicSegment.selectedSegmentIndex == 1 {
			musicTitle.text = "Yoga"
		} else {
			musicTitle.text = "Mantras"
		}

		filteredMusic = musics.filter({ $0.segment == musicSegment.selectedSegmentIndex })
		collectionView.objects = filteredMusic
	}
}
