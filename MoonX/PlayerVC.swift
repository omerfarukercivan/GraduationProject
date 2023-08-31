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
    
    var music: MusicModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        backgroundImage.image = UIImage(named: music!.backgroundImage)
        view.addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
                
        closeButton.setImage(UIImage(named: "btn_dropdown_arrow"), for: .normal)
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.left.equalToSuperview().offset(16)
        }
        
        playPauseButton.setImage(UIImage(named: "btn_play_playlist"), for: .normal)
        view.addSubview(playPauseButton)
        playPauseButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-64)
            make.centerX.equalToSuperview()
        }
        
        backButton.setImage(UIImage(named: "btn_back_playlist"), for: .normal)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(playPauseButton.snp.centerY)
            make.centerX.equalTo(view.snp.centerX).multipliedBy(0.65)
        }
        
        refreshButton.setImage(UIImage(named: "btn_refresh_playlist"), for: .normal)
        view.addSubview(refreshButton)
        refreshButton.snp.makeConstraints { make in
            make.centerY.equalTo(playPauseButton.snp.centerY)
            make.centerX.equalTo(view.snp.centerX).multipliedBy(0.35)
        }
        
        nextButton.setImage(UIImage(named: "btn_next_playlist"), for: .normal)
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerY.equalTo(playPauseButton.snp.centerY)
            make.centerX.equalTo(view.snp.centerX).multipliedBy(1.35)
        }
        
        favButton.setImage(UIImage(named: "btn_fav_playlist"), for: .normal)
        view.addSubview(favButton)
        favButton.snp.makeConstraints { make in
            make.centerY.equalTo(playPauseButton.snp.centerY)
            make.centerX.equalTo(view.snp.centerX).multipliedBy(1.65)
        }

        durationLabel.text = "02.34"
        durationLabel.textColor = .white
        durationLabel.font = .systemFont(ofSize: 14)
        view.addSubview(durationLabel)
        durationLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-8)
//            make.bottom.equalTo(playPauseButton.snp.top).offset(-48)
            make.centerY.equalTo(view.snp.centerY).multipliedBy(1.6)
        }
        
        cureentTimeLabel.text = "00.45"
        cureentTimeLabel.textColor = .white
        cureentTimeLabel.font = .systemFont(ofSize: 14)
        view.addSubview(cureentTimeLabel)
        cureentTimeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
//            make.bottom.equalTo(playPauseButton.snp.top).offset(-48)
            make.centerY.equalTo(view.snp.centerY).multipliedBy(1.6)
        }
        
        currentTimeSlider.value = 0.5
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
}
