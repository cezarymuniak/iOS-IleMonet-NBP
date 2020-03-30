//
//  TopBar.swift
//  iOS-IleMonet-NBP
//
//  Created by Cezary Muniak on 22/03/2020.
//  Copyright © 2020 Cezary Muniak. All rights reserved.
//

import Foundation
import UIKit

class TopBar: UIView {
    
    @IBOutlet weak var topBar: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var backButtonWidthConstraint: NSLayoutConstraint!
    @IBAction func backButtonTapped(_ sender: Any) {
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            (appDelegate.window?.rootViewController as? UINavigationController)?.popToRootViewController(animated: true)
        }
    }
    
    override func awakeFromNib() {
        Bundle.main.loadNibNamed(R.nib.topBar.name, owner: self, options: nil)
        addSubview(topBar)
    }
    
    func showBackButton() {
        backButtonWidthConstraint.constant = 30
    }
}

