//
//  CardSelectionVC.swift
//  CardGame
//
//  Created by Mariola Hullings on 7/22/23.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    var cards: [UIImage] = Card.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        startTimer()
        super.viewDidLoad()
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AH")
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        UIView.animate(withDuration: 0.5,
                       animations: {
            sender.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
        },
                       completion: { finish in
            UIView.animate(withDuration: 0.6, animations: {
                sender.transform = CGAffineTransform.identity
            })
        })
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
        UIView.animate(withDuration: 0.1,
                       animations: {
            sender.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
        },
                       completion: { finish in
            UIView.animate(withDuration: 0.1, animations: {
                sender.transform = CGAffineTransform.identity
            })
        })
    }
    @IBAction func factsButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
            sender.transform = CGAffineTransform(scaleX: 0.25, y: 0.25)
        },
                       completion: { finish in
            UIView.animate(withDuration: 0.1, animations: {
                sender.transform = CGAffineTransform.identity
            })
        })
        
    }
}
