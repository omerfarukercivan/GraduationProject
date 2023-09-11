//
//  MusicTableViewCell.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 9.09.2023.
//

import UIKit
import NeonSDK

class MusicTableViewCell: NeonTableViewCell<MusicModel> {

	static var didSelectMusic: ((MusicModel) -> Void)?
	private var musics = Musics.shared.musics
	var collectionView = NeonCollectionView<MusicModel, MeditationCell>()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		setupSubviews()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupSubviews() {
		collectionView = NeonCollectionView<MusicModel, MeditationCell>(
			objects: musics.filter({ $0.segment == 0 && $0.section == 1 }),
			leftPadding: 10,
			rightPadding: 10,
			horizontalItemSpacing: 12,
			widthForItem: UIScreen.main.bounds.width / 2 - 16
		)

		collectionView.showsHorizontalScrollIndicator = false
		collectionView.backgroundColor = .black
		contentView.addSubview(collectionView)
		collectionView.snp.makeConstraints { make in
			make.top.right.left.bottom.equalToSuperview()
		}

		collectionView.didSelect = { object, indexPath in
			MusicTableViewCell.didSelectMusic?(object)
		}
	}
}
