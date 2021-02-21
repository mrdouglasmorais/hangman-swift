//
//  WelcomeViewController.swift
//  Hangman Game
//
//  Created by Ben Clarke on 17/04/2020.
//  Copyright © 2020 Ben Clarke. All rights reserved.
//

import UIKit
import AVFoundation

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var howToPlayBtn: UIButton!
    
    var player: AVAudioPlayer?
    
    let defaults = UserDefaults.standard
    var totalScore = 0 {
        didSet {
            totalScoreLabel.text = "Total de pontos: \(totalScore)"
        }
    }
    var soundFXOn = true
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        setNeedsStatusBarAppearanceUpdate()
        
        if let score = defaults.integer(forKey: K.scoreKey) as? Int {
            totalScore = score
        } else {
            totalScore = 0
        }
        
        if let soundFXStatus = defaults.bool(forKey: K.Audio.fxSoundKey) as? Bool {
            soundFXOn = soundFXStatus
        } else {
            soundFXOn = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the  line below if you want to play Background music
        // MusicPlayer.sharedHelper.playBGMusic()
        
        formatUI()
        
        animateLoadScreen()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle  {
        .lightContent
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = " "
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func playBtnPressed(_ sender: UIButton) {
        //playButtonSound()
        sender.pulsateBtn()
        
        DispatchQueue.main.asyncAfter(deadline: .now()  + 0.6) {
            [weak self] in
            self?.performSegue(withIdentifier: K.gameSeugue, sender: self)
        }
    }
    
    @IBAction func settingsBtnPressed(_ sender: UIButton) {
        //playButtonSound()
        sender.pulsateBtn()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            [weak self] in
            self?.performSegue(withIdentifier: K.settingsSegue, sender: self)
        }
    }
    
    @IBAction func howToPlayPressed(_ sender: UIButton) {
        //playButtonSound()
        sender.pulsateBtn()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            [weak self] in
            self?.performSegue(withIdentifier: K.howToPlaySegue, sender: self)
        }
    }
    
    // Uncomment for button sound
    /*func playButtonSound() {
     MusicPlayer.sharedHelper.playSound(soundURL: K.Audio.buttonPressedSound)
     }*/
    
    private func animateLoadScreen() {
        // Button animations
        titleLabel.typingTextAnimation(text: K.appName.uppercased(), timeInterval: 0.2)
        playBtn.fadeInBtn(duration: 1.0)
        settingsBtn.fadeInBtn(duration: 1.0)
        howToPlayBtn.fadeInBtn(duration: 1.0)
    }
    
    private func formatUI() {
        view.backgroundColor = UIColor(named: K.Colours.bgColour)
        
        titleLabel.textColor = UIColor(named: K.Colours.labelColour)
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = .zero
        titleLabel.layer.shadowRadius = 2.0
        titleLabel.layer.shadowOpacity = 1.0
        titleLabel.layer.masksToBounds = false
        titleLabel.layer.shouldRasterize = true
        titleLabel.font = UIFont(name: K.Fonts.retroGaming, size: 46.0)
        
        totalScoreLabel.font = UIFont(name: K.Fonts.rainyHearts, size: 22)
        totalScoreLabel.textColor = UIColor(named: K.Colours.labelColour)
        
        playBtn.titleLabel?.font = UIFont(name: K.Fonts.retroGaming, size: 20.0)
        settingsBtn.titleLabel?.font = UIFont(name: K.Fonts.retroGaming, size: 20.0)
        howToPlayBtn.titleLabel?.font = UIFont(name: K.Fonts.retroGaming, size: 20.0)
        
        playBtn.setTitleColor(UIColor(named: K.Colours.labelColour), for: .normal)
        settingsBtn.setTitleColor(UIColor(named: K.Colours.labelColour), for: .normal)
        howToPlayBtn.setTitleColor(UIColor(named: K.Colours.labelColour), for: .normal)
    }
    
    
}
