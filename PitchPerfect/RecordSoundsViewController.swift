//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Gareth O'Sullivan on 27/05/2018.
//  Copyright © 2018 Locust Redemption. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(false)
    }
    
    @IBAction func recordSound() {
        configureUI(true)
    }
    
    @IBAction func stopRecording() {
        configureUI(false)
    }
    
    func configureUI( _ isRecording: Bool) {
        if isRecording {
            recordingLabel.text = "Recording in Progress."
            recordButton.isEnabled = false
            stopRecordingButton.isEnabled = true
        } else {
            recordingLabel.text = "Tap to Record."
            recordButton.isEnabled = true
            stopRecordingButton.isEnabled = false
        }
    }

}

