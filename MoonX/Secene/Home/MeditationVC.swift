//
//  Meditation.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 29.08.2023.
//

import UIKit
import NeonSDK
import SnapKit

final class MeditationVC: UIViewController {

    private let backButton = UIButton()
//    let musicSegment = UISegmentedControl()
    private var collectionView = NeonCollectionView<MusicModel, MeditationCell>()

    private var musics: [MusicModel] = [
        MusicModel(musicName: "Müzik 1", artistName: "Müzik 1", duration: "3.49", image: "img_meditation", backgroundImage: "img_background1"),
        MusicModel(musicName: "Müzik 2", artistName: "Müzik 2", duration: "3.49", image: "img_meditation", backgroundImage: "img_background1"),
        MusicModel(musicName: "Müzik 2", artistName: "Müzik 2", duration: "3.49", image: "img_meditation", backgroundImage: "img_background1")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setupUI()
    }

    private func setupUI() {
        backButton.setImage(UIImage(named: "btn_back"), for: .normal)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.left.equalToSuperview().offset(16)
        }

        let items = ["Meditation", "Yoga", "Music"]
        let musicSegment = UISegmentedControl(items: items)
        let textAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        musicSegment.setTitleTextAttributes(textAttributes, for: .normal)
        musicSegment.backgroundColor = .lightPurple
        musicSegment.selectedSegmentTintColor = .darkPurple
        musicSegment.selectedSegmentIndex = 0
        view.addSubview(musicSegment)
        musicSegment.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }

        collectionView = NeonCollectionView<MusicModel, MeditationCell>(
            objects: musics,
            itemsPerRow: 2,
            leftPadding: 10,
            rightPadding: 10,
            horizontalItemSpacing: 10,
            verticalItemSpacing: 20
        )

        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(musicSegment.snp.bottom).offset(48)
            make.right.left.bottom.equalToSuperview()
        }
        
        collectionView.didSelect = { object, indexPath in
                let vc = PlayerVC()
            vc.music = object
            self.present(destinationVC: vc, slideDirection: .up)
        }
    }
    
        
//    collectionView.didSelect = { object, indexPath in
//        let vc = AppDetail()
////            vc.app = self.apps[indexPath.row]
//        vc.app = object
//        self.navigationController?.pushViewController(vc, animated: true)
//    }

}
