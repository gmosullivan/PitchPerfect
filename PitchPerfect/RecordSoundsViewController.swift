//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Gareth O'Sullivan on 27/05/2018.
//  Copyright © 2018 Locust Redemption. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    // MARK: - Variables
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(false)
    }
    
    // MARK: - Button Actions
    
    @IBAction func recordSound() {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        let session = AVAudioSession.sharedInstance()
        if (session.responds(to: #selector(AVAudioSession.requestRecordPermission(_:)))) {
            AVAudioSession.sharedInstance().requestRecordPermission({(granted: Bool)-> Void in
                if granted {print("granted")
                    do {
                        try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
                        try session.setActive(true)
                    }
                    catch {
                        print("Couldn't set Audio session category")
                    }
                } else{
                    print("not granted")
                }
            })
        }
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        configureUI(true)
    }
    
    @IBAction func stopRecording() {
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        configureUI(false)
    }
    
    // MARK: - UI Functions
    
    func configureUI(_ isRecording: Bool) {
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
    
    // MARK: - Delegate Methods
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "playRecording", sender: audioRecorder.url)
        } else {
            print("The recording was not successful.")
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }

}

