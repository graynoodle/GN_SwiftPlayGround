//
//  ViewController.swift
//  GN_SwiftPlayGround
//
//  Created by graynoodle on 2019/5/7.
//  Copyright © 2019 graynoodle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    func reverseString(_ s: inout [Character]) {
        
        
        
        var first:Character = s[0]
        var t:Character
        for index in 1...s.count {
            t = s[index]
            s[index] = first
            s[index - 1] = t
            first = t
            if index == s.count {
                s[index] = t
            }
        }
    }
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        get {
            return (GN_CardButtons.count + 1) / 2
        }
    }
    
    
    
    private(set) var flipCount = 0 {
        didSet {
            GN_FlipCountLabel.text = "Flips:\(flipCount)"
        }
    }

    override func viewDidLoad() {
        var time = 10
        print("time before add =\(time)")
        
        func addTime(_ t: inout Int, num: Int) {
            t += num
        }
        
        addTime(&time, num: 90)
        
        print("time after add = \(time)")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet private weak var GN_FlipCountLabel: UILabel!
    @IBOutlet private var GN_CardButtons: [UIButton]!
    
    
//    @IBAction func GN_TouchCard2(_ sender: UIButton) {
//        flipCount += 1
//        print("it's a dragon")
//        GN_FlipCard(withEmoji: "🐉", on: sender)
//    }
    @IBAction private func GN_TouchCard(_ sender: UIButton) {
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
    
    private var emojiChoices: Array<String> = ["🐉","🦑","🦞","🐇","👻","😈","🤡","👺"]
    
    private var emoji = [Card:String]()
    private func emoji(for card: Card) -> String {
            if emoji[card] == nil, emojiChoices.count > 0 {
//                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
//                emoji[card.identifier] = emojiChoices.remove(at:randomIndex)
                emoji[card] = emojiChoices.remove(at:emojiChoices.count.arc4random)
            }
            return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

