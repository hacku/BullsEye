//
//  ViewController.swift
//  BullsEye
//
//  Created by Philipp Hackbarth on 14.09.18.
//  Copyright © 2018 Hackbarth GFX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sliderVal = 0
    
    var targetValue = 0
    
    var score = 0
    
    var round = 1
    
    @IBOutlet weak var slider: UISlider!

    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initializeValues()
        
        let thumbNameImage = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbNameImage, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
    
    @IBAction func showAlert() {
       
        let diff = abs(sliderVal.distance(to: targetValue))
        
        let scoreText: String
        
        if(diff <= 1) {
            scoreText = "Perfect!"
            if(diff == 0) {
                score += 100
            }
            else {
                score += 50
            }
            
        }
        else if(diff < 5) {
            scoreText = "Almost!"
        }
        else if(diff < 10) {
            scoreText = "Pretty good!"
        }
        else {
            scoreText = "Not even close..."
        }
        
        score += 100 - diff
        
        let alert = UIAlertController(title: scoreText, message: "Nicer Treffer, du hast \(sliderVal) getroffen", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Weiter", style: .default, handler: {
            action in
            self.startNewRound()
            
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        sliderVal = Int(slider.value.rounded())
    }
    
    @IBAction func restartGame( button: UIButton) {
        initializeValues()
    }
    
    func initializeValues() {
        sliderVal = 50
        slider.value = Float(sliderVal)
        
        targetValue = 0
        
        score = 0
        
        round = 1
        
        targetValue = Int.random(in: 1...100)
        
        updateLabels()
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        sliderVal = 50
        
        round += 1
        
        updateLabels()
    }
    
    func updateLabels() {
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        targetLabel.text = String(targetValue)
    }

}

