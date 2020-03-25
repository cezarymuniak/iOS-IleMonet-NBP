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
    
    override func awakeFromNib() {
        Bundle.main.loadNibNamed(R.nib.topBar.name, owner: self, options: nil)
        addSubview(topBar)
    }
}
