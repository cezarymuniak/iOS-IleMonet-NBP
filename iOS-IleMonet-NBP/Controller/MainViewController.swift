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

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
           let cell = mainTableView.dequeueReusableCell(withIdentifier:  R.reuseIdentifier.tableViewCell, for: indexPath)
        
        return cell!
        
        
    }
    
    
    
    
    @IBOutlet weak var topBar: TopBar!
    
    
    
    @IBOutlet weak var mainTableView: UITableView!
    
    
    
    
    
    
    
    
    

    override func viewWillAppear(_ animated: Bool) {
        //getRates()
        
        self.mainTableView.register(UINib(nibName: R.nib.tableViewCell.name, bundle: nil ),
                                    forCellReuseIdentifier: R.reuseIdentifier.tableViewCell.identifier )

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

