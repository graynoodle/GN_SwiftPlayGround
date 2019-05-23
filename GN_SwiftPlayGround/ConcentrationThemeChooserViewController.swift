//
//  ConcentrationThemeViewController.swift
//  GN_SwiftPlayGround
//
//  Created by graynoodle on 2019/5/23.
//  Copyright © 2019 graynoodle. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {

    let theme = [
        "Sports":"⚽️🏀🏈⚾️🥎🎾🏐🏉🥏🎱🏓",
        "Animals":"🐶🐱🐭🐹🐰🦊🐻🐼🐨🐯🦁",
        "Faces":"😥😓🤗🤔🤭🤫🤥🤢🤐🤒🤕"
    ]
    
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    // back to original viewController
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = theme[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }

}
