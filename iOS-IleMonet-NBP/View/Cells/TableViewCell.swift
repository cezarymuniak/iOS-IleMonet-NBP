//
//  TableViewCell.swift
//  iOS-IleMonet-NBP
//
//  Created by Cezary Muniak on 22/03/2020.
//  Copyright © 2020 Cezary Muniak. All rights reserved.
//

import Foundation
import UIKit


class TableViewCell: UITableViewCell {
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencyShortName: UILabel!
    @IBOutlet weak var currencyPrice: UILabel!
    @IBOutlet weak var cellDate: UILabel!
    @IBOutlet weak var currencyFlag: UIImageView!
}
