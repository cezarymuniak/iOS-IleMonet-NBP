//
//  ViewController.swift
//  iOS-IleMonet-NBP
//
//  Created by Cezary Muniak on 22/03/2020.
//  Copyright © 2020 Cezary Muniak. All rights reserved.
//

import UIKit
import Rswift
import Alamofire
import SwiftyJSON
import BetterSegmentedControl

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
           let cell = mainTableView.dequeueReusableCell(withIdentifier:  R.reuseIdentifier.tableViewCell, for: indexPath)
        
        return cell!
        
        
    }
    
    
    
    @IBAction func segmentedControl1ValueChanged(_ sender: BetterSegmentedControl) {
        print("The selected index is \(sender.index)")
    }
    
    
    @IBOutlet weak var topBar: TopBar!
    
    
    
    @IBOutlet weak var mainTableView: UITableView!
    
//
//    @IBOutlet weak var segmentedControl: UIView!
//
    

    
    
    @IBOutlet weak var segmentedControl: BetterSegmentedControl!
    
    
    

    override func viewWillAppear(_ animated: Bool) {
        //getRates()
        
        self.mainTableView.register(UINib(nibName: R.nib.tableViewCell.name, bundle: nil ),
                                    forCellReuseIdentifier: R.reuseIdentifier.tableViewCell.identifier )

        
        
        segmentedControl.segments = LabelSegment.segments(withTitles: ["A", "B", "C"],
        normalFont: UIFont(name: "HelveticaNeue-Light", size: 13.0)!,
        selectedFont: UIFont(name: "HelveticaNeue-Medium", size: 13.0)!)
        
        
        
        
//
//        let appleStyledControl: BetterSegmentedControl = .appleStyled(frame: CGRect(x: 0 ,
//                                                                                    y: 0,
//                                                                                    width: segmentedControl.bounds.width ,
//                                                                                    height: segmentedControl.bounds.height),
//                                                                      titles: ["Tabela A", "Tabela B", "Tabela C"])
//        segmentedControl.addSubview(appleStyledControl)
        
        
        
        
        
        
        
        
        
        mainTableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
     
        
        return 25
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

