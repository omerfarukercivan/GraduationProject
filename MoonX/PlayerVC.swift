//
//  PlayerVC.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 31.08.2023.
//

import UIKit
import NeonSDK
import SnapKit

class PlayerVC: UIViewController {

    private let maxView = UIView()
    private let backgroundImage = UIImageView()
    private let closeButton = UIButton()
    private let nameLabel = UILabel()
    private let currentTimeSlider = UISlider()
    private let cureentTimeLabel = UILabel()
    private let durationLabel = UILabel()
    private let refreshButton = UIButton()
    private let backButton = UIButton()
    private let playPauseButton = UIButton()
    private let nextButton = UIButton()
    private let favButton = UIButton()
    
    private let miniView = UIView()
    private let miniPlayPause = UIButton()
    private let miniNameLabel = UILabel()
    private let miniArtistLabel = UILabel()
    private let miniCloseButton = UIButton()
    private let miniSlider = UISlider()
    
    var music: MusicModel!
    var panGesture: UIPanGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        
//        maxStackView.axis = .vertical
//        view.addSubview(maxStackView)
//        maxStackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//
//        maxStackView.addArrangedSubview(backgroundImage)
//        maxStackView.addArrangedSubview(closeButton)
//        maxStackView.addArrangedSubview(nameLabel)
//        maxStackView.addArrangedSubview(currentTimeSlider)
//        maxStackView.addArrangedSubview(cureentTimeLabel)
//        maxStackView.addArrangedSubview(durationLabel)
//        maxStackView.addArrangedSubview(refreshButton)
//        maxStackView.addArrangedSubview(backButton)
//        maxStackView.addArrangedSubview(playPauseButton)
//        maxStackView.addArrangedSubview(nextButton)
//        maxStackView.addArrangedSubview(favButton)
        
        view.addSubview(maxView)
        maxView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundImage.image = UIImage(named: music!.backgroundImage)
//        view.addSubview(backgroundImage)
        maxView.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
                
        closeButton.setImage(UIImage(named: "btn_dropdown_arrow"), for: .normal)
//        view.addSubview(closeButton)
        maxView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.left.equalToSuperview().offset(16)
        }
        
        playPauseButton.setImage(UIImage(named: "btn_play_playlist"), for: .normal)
//        view.addSubview(playPauseButton)
        maxView.addSubview(playPauseButton)
        playPauseButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-64)
            make.centerX.equalToSuperview()
        }
        
        backButton.setImage(UIImage(named: "btn_back_playlist"), for: .normal)
//        view.addSubview(backButton)
        maxView.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(playPauseButton.snp.centerY)
//            make.centerX.equalTo(view.snp.centerX).multipliedBy(0.65)
            make.centerX.equalTo(maxView.snp.centerX).multipliedBy(0.65)
        }
        
        refreshButton.setImage(UIImage(named: "btn_refresh_playlist"), for: .normal)
//        view.addSubview(refreshButton)
        maxView.addSubview(refreshButton)
        refreshButton.snp.makeConstraints { make in
            make.centerY.equalTo(playPauseButton.snp.centerY)
//            make.centerX.equalTo(view.snp.centerX).multipliedBy(0.35)
            make.centerX.equalTo(maxView.snp.centerX).multipliedBy(0.35)
        }
        
        nextButton.setImage(UIImage(named: "btn_next_playlist"), for: .normal)
//        view.addSubview(nextButton)
        maxView.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerY.equalTo(playPauseButton.snp.centerY)
//            make.centerX.equalTo(view.snp.centerX).multipliedBy(1.35)
            make.centerX.equalTo(maxView.snp.centerX).multipliedBy(1.35)
        }
        
        favButton.setImage(UIImage(named: "btn_fav_playlist"), for: .normal)
//        view.addSubview(favButton)
        maxView.addSubview(favButton)
        favButton.snp.makeConstraints { make in
            make.centerY.equalTo(playPauseButton.snp.centerY)
//            make.centerX.equalTo(view.snp.centerX).multipliedBy(1.65)
            make.centerX.equalTo(maxView.snp.centerX).multipliedBy(1.65)
        }

        durationLabel.text = "02.34"
        durationLabel.textColor = .white
        durationLabel.font = .systemFont(ofSize: 14)
//        view.addSubview(durationLabel)
        maxView.addSubview(durationLabel)
        durationLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-8)
//            make.bottom.equalTo(playPauseButton.snp.top).offset(-48)
//            make.centerY.equalTo(view.snp.centerY).multipliedBy(1.6)
            make.centerY.equalTo(maxView.snp.centerY).multipliedBy(1.6)
        }
        
        cureentTimeLabel.text = "00.45"
        cureentTimeLabel.textColor = .white
        cureentTimeLabel.font = .systemFont(ofSize: 14)
//        view.addSubview(cureentTimeLabel)
        maxView.addSubview(cureentTimeLabel)
        cureentTimeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
//            make.centerY.equalTo(view.snp.centerY).multipliedBy(1.6)
            make.centerY.equalTo(maxView.snp.centerY).multipliedBy(1.6)
        }
        
        currentTimeSlider.value = 0.5
//        view.addSubview(currentTimeSlider)
        maxView.addSubview(currentTimeSlider)
        currentTimeSlider.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalTo(durationLabel.snp.top).offset(-16)
        }
        
        nameLabel.text = music?.musicName
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 22)
//        view.addSubview(nameLabel)
        maxView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(currentTimeSlider.snp.top).offset(-24)
            make.centerX.equalToSuperview()
        }
        
        //MARK: MiniPlayer
        
        miniView.backgroundColor = .lightBlack
        view.addSubview(miniView)
        miniView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(miniView.snp.width).multipliedBy(0.15)
        }
        
        miniPlayPause.setImage(UIImage(systemName: "heart"), for: .normal)
        miniView.addSubview(miniPlayPause)
        miniPlayPause.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.height.equalToSuperview().multipliedBy(0.7)
            make.centerY.equalToSuperview()
        }
        
        miniNameLabel.text = "Lorem ipsum dolor sit amet, consectetur..."
        miniNameLabel.textColor = .white
        miniNameLabel.font = .systemFont(ofSize: 12)
        miniView.addSubview(miniNameLabel)
        miniNameLabel.snp.makeConstraints { make in
            make.top.equalTo(miniPlayPause.snp.top)
            make.left.equalTo(miniPlayPause.snp.right).offset(16)
        }
        
        miniArtistLabel.text = "Lorem ipsum"
        miniArtistLabel.textColor = .white
        miniArtistLabel.font = .systemFont(ofSize: 10)
        miniView.addSubview(miniArtistLabel)
        miniArtistLabel.snp.makeConstraints { make in
            make.top.equalTo(miniNameLabel.snp.bottom).offset(8)
            make.left.equalTo(miniPlayPause.snp.right).offset(16)
        }
        
        miniCloseButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        miniView.addSubview(miniCloseButton)
        miniCloseButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.height.equalToSuperview().multipliedBy(0.7)
            make.centerY.equalToSuperview()
        }
        
        miniSlider.value = 0.5
        miniView.addSubview(miniSlider)
        miniSlider.snp.makeConstraints { make in
            make.bottom.equalTo(miniView.snp.bottom)
            make.left.equalToSuperview().offset(2)
            make.right.equalToSuperview().offset(-2)
        }
    }
}
