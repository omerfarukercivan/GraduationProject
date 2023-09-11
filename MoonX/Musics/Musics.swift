//
//  Musics.swift
//  MoonX
//
//  Created by Ömer Faruk Ercivan on 9.09.2023.
//

import Foundation

class Musics {
	static let shared = Musics()

	var musics: [MusicModel] = []

	private init() {
		let music1 = Bundle.main.url(forResource: "music1", withExtension: ".mp3")!
		let music2 = Bundle.main.url(forResource: "music2", withExtension: ".mp3")!
		let music3 = Bundle.main.url(forResource: "music3", withExtension: ".mp3")!
		let music4 = Bundle.main.url(forResource: "music4", withExtension: ".mp3")!

		// MEDITATION
		musics.append(MusicModel(music: music1, musicName: "Music1", artistName: "God of War", duration: "4:07", image: "img_meditation", backgroundImage: "img_background1", segment: 0, section: 0))
		musics.append(MusicModel(music: music2, musicName: "Music2", artistName: "RDR II", duration: "6:01", image: "img_meditation", backgroundImage: "img_background1", segment: 0, section: 0))
		musics.append(MusicModel(music: music3, musicName: "Music3", artistName: "Akame ga Kill", duration: "2:44", image: "img_meditation", backgroundImage: "img_background1", segment: 0, section: 0))
		musics.append(MusicModel(music: music4, musicName: "Music4", artistName: "Dark Souls III", duration: "2:41", image: "img_meditation", backgroundImage: "img_background1", segment: 0, section: 0))

		musics.append(MusicModel(music: music1, musicName: "Music1", artistName: "God of War", duration: "4:07", image: "img_meditation2", backgroundImage: "img_background2", segment: 0, section: 1))
		musics.append(MusicModel(music: music2, musicName: "Music2", artistName: "RDR II", duration: "6:01", image: "img_meditation2", backgroundImage: "img_background2", segment: 0, section: 1))
		musics.append(MusicModel(music: music3, musicName: "Music3", artistName: "Akame ga Kill", duration: "2:44", image: "img_meditation2", backgroundImage: "img_background1", segment: 0, section: 1))
		musics.append(MusicModel(music: music4, musicName: "Music4", artistName: "Dark Souls III", duration: "2:41", image: "img_meditation2", backgroundImage: "img_background1", segment: 0, section: 1))

		// YOGA
		musics.append(MusicModel(music: music1, musicName: "Music1", artistName: "God of War", duration: "4:07", image: "img_meditation", backgroundImage: "img_background2", segment: 1, section: 0))
		musics.append(MusicModel(music: music2, musicName: "Music2", artistName: "RDR II", duration: "6:01", image: "img_meditation", backgroundImage: "img_background2", segment: 1, section: 0))

		// MUSIC
		musics.append(MusicModel(music: music1, musicName: "Music1", artistName: "God of War", duration: "4:07", image: "img_music1", backgroundImage: "img_background3", segment: 2, section: 0))
		musics.append(MusicModel(music: music2, musicName: "Music2", artistName: "RDR II", duration: "6:01", image: "img_music2", backgroundImage: "img_background3", segment: 2, section: 0))
		musics.append(MusicModel(music: music3, musicName: "Music3", artistName: "Akame ga Kill", duration: "2:44", image: "img_music3", backgroundImage: "img_background3", segment: 2, section: 0))
		musics.append(MusicModel(music: music4, musicName: "Music4", artistName: "Dark Souls III", duration: "2:41", image: "img_music4", backgroundImage: "img_background3", segment: 2, section: 0))
	}
}
