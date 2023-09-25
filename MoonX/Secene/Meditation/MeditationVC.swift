//
//  MeditationVC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 29.08.2023.
//

import UIKit
import NeonSDK

final class MeditationVC: UIViewController {

	private var musicSegment: UISegmentedControl!
	private var musicTitle = UILabel()
	private var tableView = MusicTableView()
	private var collectionView = NeonCollectionView<MusicModel, MeditationCell>()

	private var musics = Musics.shared.musics
	private var filteredMusic = [MusicModel]()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .black

		setupUI()
		selectedMusic()
	}

	override func viewWillAppear(_ animated: Bool) {
		musicSegmentValueChanged()
	}

	private func setupUI() {
		let backButton = UIButton()
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
		musicTitle.font = Font.custom(size: 20, fontWeight: .SemiBold)
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

		tableView.backgroundColor = .black
		view.addSubview(tableView)
		tableView.snp.makeConstraints { make in
			make.top.equalTo(musicSegment.snp.bottom).offset(24)
			make.left.right.bottom.equalToSuperview()
		}
	}

	func selectedMusic() {
		MusicTableViewCell.didSelectMusic = { object in
			let vc = PlayerVC()

			vc.music = object
			vc.filteredMusic = self.musics.filter({ $0.segment == object.segment && $0.section == object.section })

			self.present(destinationVC: vc, slideDirection: .up)
		}
	}

	@objc private func backButtonTapped() {
		self.dismiss(animated: true)
	}

	@objc private func musicSegmentValueChanged() {
		if musicSegment.selectedSegmentIndex == 0 {
			musicTitle.isHidden = true
			collectionView.isHidden = true
			tableView.isHidden = false

		} else if musicSegment.selectedSegmentIndex == 1 {
			musicTitle.text = "Yoga"
		} else {
			musicTitle.text = "Mantras"
		}

		filteredMusic = musics.filter({ $0.segment == musicSegment.selectedSegmentIndex && $0.section == 0 })

		if musicSegment.selectedSegmentIndex != 0 {
			musicTitle.isHidden = false
			collectionView.isHidden = false
			tableView.isHidden = true
		}

		collectionView.objects = filteredMusic
		tableView.objects = filteredMusic
	}
}
