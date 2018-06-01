//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Gareth O'Sullivan on 27/05/2018.
//  Copyright © 2018 Locust Redemption. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    // MARK:- Outlets
    
    @IBOutlet weak var halfSpeedButton: UIButton!
    @IBOutlet weak var doubleSpeedButton: UIButton!
    @IBOutlet weak var thirdSpeedButton: UIButton!
    @IBOutlet weak var tripleSpeedButton:UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var playButton: UIButton!

    // MARK:- Variables
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    var rate: Float!
    var pitch: Float!
    var echo: Bool!
    var reverb: Bool!
    
    // MARK:- Enumerations
    
    enum ButtonType: Int {
        case halfSpeed = 0, doubleSpeed, thirdSpeed, tripleSpeed, lowPitch, highPitch, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        setSoundEffectDefaults()
        configureUI(.notPlaying)
        halfSpeedButton.contentMode = .center
        halfSpeedButton.imageView?.contentMode = .scaleAspectFit
        doubleSpeedButton.contentMode = .center
        doubleSpeedButton.imageView?.contentMode = .scaleAspectFit
        thirdSpeedButton.contentMode = .center
        thirdSpeedButton.imageView?.contentMode = .scaleAspectFit
        tripleSpeedButton.contentMode = .center
        tripleSpeedButton.imageView?.contentMode = .scaleAspectFit
        lowPitchButton.contentMode = .center
        lowPitchButton.imageView?.contentMode = .scaleAspectFit
        highPitchButton.contentMode = .center
        highPitchButton.imageView?.contentMode = .scaleAspectFit
        echoButton.contentMode = .center
        echoButton.imageView?.contentMode = .scaleAspectFit
        reverbButton.contentMode = .center
        reverbButton.imageView?.contentMode = .scaleAspectFit
    }
    
    // MARK:- Button Actions
    
    @IBAction func setSoundEffect(_ sender: UIButton) {
        //Changes the default sound effects
        switch(ButtonType(rawValue: sender.tag)!) {
        case .halfSpeed:
            rate = 0.5
        case .doubleSpeed:
            rate = 1.5
        case .thirdSpeed:
            rate = 0.33
        case .tripleSpeed:
            rate = 2
        case .lowPitch:
            pitch = -1000
        case .highPitch:
            pitch = 1000
        case .echo:
            echo = true
        case .reverb:
            reverb = true
        }
        configureUI(.effectAdded)
    }
    
    @IBAction func stopPlayingAudio () {
        //Stops audio and clears effects set
        stopAudio()
        setSoundEffectDefaults()
    }
    
    @IBAction func playAudio() {
        //Plays audio with set sound effects
        playSound(rate: rate, pitch: pitch, echo: echo, reverb: reverb)
        configureUI(.playing)
        setSoundEffectDefaults()
    }
    
    func setSoundEffectDefaults () {
        rate = 1
        pitch = 0
        echo = false
        reverb = false
    }
    
    // MARK:- UI Functions
    
    func setEffectButtons(_ enabled: Bool) {
        //Manages whether the effect buttons are enabled or not
        if rate == 1 {
            halfSpeedButton.isEnabled = enabled
            doubleSpeedButton.isEnabled = enabled
            thirdSpeedButton.isEnabled = enabled
            tripleSpeedButton.isEnabled = enabled
        } else {
            halfSpeedButton.isEnabled = false
            doubleSpeedButton.isEnabled = false
            thirdSpeedButton.isEnabled = false
            tripleSpeedButton.isEnabled = false
        }
        if pitch == 0 {
            highPitchButton.isEnabled = enabled
            lowPitchButton.isEnabled = enabled
        } else {
            highPitchButton.isEnabled = false
            lowPitchButton.isEnabled = false
        }
        if echo == false {
            echoButton.isEnabled = enabled
        } else {
            echoButton.isEnabled = false
        }
        if reverb == false {
            reverbButton.isEnabled = enabled
        } else {
            reverbButton.isEnabled = false
        }
    }

}
