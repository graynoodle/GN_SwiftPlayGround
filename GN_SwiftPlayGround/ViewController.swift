//
//  ViewController.swift
//  GN_SwiftPlayGround
//
//  Created by graynoodle on 2019/5/7.
//  Copyright © 2019 graynoodle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet {
            GN_FlipCountLabel.text = "Flips:\(flipCount)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var GN_FlipCountLabel: UILabel!
    @IBOutlet var GN_CardButtons: [UIButton]!
    
    var emojiChoices: Array<String> = ["🐉","🐇","🐉","🐇"]
    
//    @IBAction func GN_TouchCard2(_ sender: UIButton) {
//        flipCount += 1
//        print("it's a dragon")
//        GN_FlipCard(withEmoji: "🐉", on: sender)
//    }
    @IBAction func GN_TouchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = GN_CardButtons.index(of: sender) {
            print("cardNumber = \(cardNumber)")
                    GN_FlipCard(withEmoji: emojiChoices[cardNumber], on: sender)

        } else {
            print("chosen card was not in cardButtons")

        }
        
//        GN_FlipCard(withEmoji: "👻", on: sender)
     
    }
    func GN_FlipCard(withEmoji emoji: String, on button: UIButton) {
        print("GN_FlipCard \(emoji)")
        if button.currentTitle == emoji  {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5709328082, blue: 0.1269869765, alpha: 1)
            
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

