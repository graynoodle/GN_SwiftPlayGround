//
//  ViewController.swift
//  GN_SwiftPlayGround
//
//  Created by graynoodle on 2019/5/7.
//  Copyright © 2019 graynoodle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (GN_CardButtons.count + 1) / 2)
    
    
    
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
    
    
//    @IBAction func GN_TouchCard2(_ sender: UIButton) {
//        flipCount += 1
//        print("it's a dragon")
//        GN_FlipCard(withEmoji: "🐉", on: sender)
//    }
    @IBAction func GN_TouchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = GN_CardButtons.index(of: sender) {
            print("cardNumber = \(cardNumber)")
            
//            GN_FlipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        } else {
            print("chosen card was not in cardButtons")

        }
        
//        GN_FlipCard(withEmoji: "👻", on: sender)
     
    }
    
    func updateViewFromModel() {
        for index in GN_CardButtons.indices {
            let button = GN_CardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 1, green: 0.5709328082, blue: 0.1269869765, alpha: 1)
            }
        }
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
    
    var emojiChoices: Array<String> = ["🐉","🦑","🦞","🐇","👻","😈","🤡","👺"]
    
    var emoji = [Int:String]()
    func emoji(for card: Card) -> String {
            if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at:randomIndex)
            }
            return emoji[card.identifier] ?? "?"
    }
}


