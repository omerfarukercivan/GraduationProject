//
//  MusicTableView.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 9.09.2023.
//

import UIKit
import NeonSDK

class MusicTableView: NeonTableView<MusicModel, MusicTableViewCell> {
	override init(objects: [MusicModel] = [], heightForRows: CGFloat = 44.0, style: UITableView.Style = .plain) {
		super.init()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	var musics = Musics.shared.musics

	override func numberOfSections(in tableView: UITableView) -> Int {
		return musics.filter { $0.segment == 0 && $0.section == 0 }.count
	}

	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let label = UILabel()

		if (section == 0) {
			label.text = "Feng Shui"
		} else if (section == 1) {
			label.text = "XYZ"
		}

		label.textColor = .white
		label.font = Font.custom(size: 20, fontWeight: .Medium)
		label.backgroundColor = .black

		return label
	}

	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 50
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 175
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 1

		case 1:
			return 1

		default:
			return 0
		}
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = MusicTableViewCell()

		if indexPath.section == 0 {
			cell.collectionView.objects = musics.filter({ $0.segment == 0 && $0.section == 0 })
		} else if indexPath.section == 1 {
			cell.collectionView.objects = musics.filter({ $0.segment == 0 && $0.section == 1 })
		}

		return cell
	}
}
