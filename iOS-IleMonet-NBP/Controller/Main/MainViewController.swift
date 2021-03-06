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
import IHProgressHUD


class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var topBar: TopBar!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var segmentedControl: BetterSegmentedControl!
    @IBAction func refreshButtonClicked(_ sender: Any) {
        self.currencies.removeAll()
        
        if table == "A" || table == "B" {
            getDataAB()
        } else {
            getDataC()
        }
    }
    
    @IBAction func segmentedControl1ValueChanged(_ sender: BetterSegmentedControl) {
        
        switch(sender.index) {
        case 0 :
            table = "A"
            self.currencies.removeAll()
            getDataAB()
        case 1:
            self.currencies.removeAll()
            table = "B"
            getDataAB()
        case 2:
            table = "C"
            self.currencies.removeAll()
            getDataC()
        default:
            getDataAB()
        }
    }
    
    var currencies: [Currencies] = []
    var currency: String = ""
    var code: String = ""
    var table: String = "A"
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        getDataAB()
        self.mainTableView.register(UINib(nibName: R.nib.tableViewCell.name, bundle: nil ),
                                    forCellReuseIdentifier: R.reuseIdentifier.tableViewCell.identifier )
        segmentedControl.segments = LabelSegment.segments(withTitles: ["Tabela A", "Tabela B", "Tabela C"],
                                                          normalFont: UIFont(name: R.font.adventProMedium.fontName, size: 20.0)!,
                                                          selectedFont: UIFont(name: R.font.adventProBold.fontName, size: 20.0)!)
        mainTableView.reloadData()
    }
    
    func getDataAB(){
        DispatchQueue.global(qos: .utility).async {
            IHProgressHUD.show()
        }
        DispatchQueue.main.async {
            let nbpURL = "https://api.nbp.pl/api/exchangerates/tables/\(self.table)/"
            
            AF.request(nbpURL, method: .get).responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let data = json[0]
                    let effectiveDateString = json[0, "effectiveDate"].stringValue
                    data["rates"].array?.forEach({(currency) in
                        let currency = Currencies( currencyShortName: currency["code"].stringValue, currencyFullName: currency["currency"].stringValue, price: currency["mid"].doubleValue, date: effectiveDateString, rateCode: self.code, tableType: self.table)
                        
                        DispatchQueue.global(qos: .utility).async {
                            IHProgressHUD.dismiss()
                        }
                        self.currencies.append(currency)
                    })
                    self.mainTableView.reloadData()
                case .failure(let error):
                    DispatchQueue.global(qos: .utility).async {
                        IHProgressHUD.showInfowithStatus("Błąd: \(error.localizedDescription)")
                    }
                    print(error.localizedDescription)
                }
            })
        }
    }
    
    func getDataC(){
        DispatchQueue.global(qos: .utility).async {
            IHProgressHUD.show()
        }
        DispatchQueue.main.async {
            let nbpURL = "https://api.nbp.pl/api/exchangerates/tables/\(self.table)/"
            
            AF.request(nbpURL, method: .get).responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let data = json[0]
                    let effectiveDate = json[0, "effectiveDate"].stringValue
                    data["rates"].array?.forEach({(currency) in
                        let currency = Currencies( currencyShortName: currency["code"].stringValue, currencyFullName: currency["currency"].stringValue, price: currency["bid"].doubleValue, date: effectiveDate, rateCode: self.code, tableType: "C")
                        
                        DispatchQueue.global(qos: .utility).async {
                            IHProgressHUD.dismiss()
                        }
                        self.currencies.append(currency)
                    })
                    self.mainTableView.reloadData()
                case .failure(let error):
                    DispatchQueue.global(qos: .utility).async {
                        IHProgressHUD.showInfowithStatus("Błąd: \(error.localizedDescription)")
                    }
                    print(error.localizedDescription)
                }
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailView" {
            if let detailViewController = segue.destination as? DetailViewController {
                if let row = mainTableView.indexPathForSelectedRow?.row {
                    detailViewController.currencyName  = currencies[row].currencyFullName
                    detailViewController.tableType = currencies[row].tableType
                    detailViewController.rateCode = currencies[row].currencyShortName
                    detailViewController.currencyName = currencies[row].currencyFullName
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currencies.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailView", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier:  R.reuseIdentifier.tableViewCell, for: indexPath)
        cell?.selectionStyle = .none
        let presentCurrency : Currencies
        presentCurrency  = self.currencies[indexPath.row]
        let price = String( describing: presentCurrency.price)
        let shortName = String ( describing: presentCurrency.currencyShortName)
        let longName = String( describing: presentCurrency.currencyFullName)
        cell?.currencyShortName.text = shortName
        cell?.currencyName.text = longName
        let date = String( describing: presentCurrency.date)
        cell?.currencyPrice.text = price
        cell?.cellDate.text = date
        switch (shortName.description) {
            
        case "THB" :
            cell?.currencyFlag.image = R.image.thailandThb()
            
        case "RON" :
            cell?.currencyFlag.image = R.image.romaniaRon()
            
        case "USD" :
            cell?.currencyFlag.image = R.image.unitedStatesOfAmericaUsd()
            
        case "DKK" :
            cell?.currencyFlag.image = R.image.denmarkDkk()
            
        case "SEK" :
            cell?.currencyFlag.image = R.image.swedenSek()
            
        case "NOK" :
            cell?.currencyFlag.image = R.image.norwayNok()
            
        case "AUD" :
            cell?.currencyFlag.image = R.image.australiaAud()
            
        case "CAD" :
            cell?.currencyFlag.image = R.image.canadaCad()
            
        case "HUF" :
            cell?.currencyFlag.image = R.image.hungaryHuf()
            
        case "ZAR" :
            cell?.currencyFlag.image = R.image.southAfricaZar()
            
        case "KRW" :
            cell?.currencyFlag.image = R.image.southKoreaKrw()
            
        case "MXN" :
            cell?.currencyFlag.image = R.image.mexicoMxn()
            
        case "BRL" :
            cell?.currencyFlag.image = R.image.brazilBrl()
            
        case "IDR" :
            cell?.currencyFlag.image = R.image.indonesiaIdr()
            
        case "SGD" :
            cell?.currencyFlag.image = R.image.singaporeSgd()
            
        case "MYR" :
            cell?.currencyFlag.image = R.image.malaysiaMyr()
            
        case "CHF" :
            cell?.currencyFlag.image = R.image.switzerlandChf()
            
        case "HKD" :
            cell?.currencyFlag.image = R.image.hongKongHkd()
            
        case "ISK" :
            cell?.currencyFlag.image = R.image.icelandIsk()
            
        case "INR" :
            cell?.currencyFlag.image = R.image.indiaInr()
            
        case "HRK" :
            cell?.currencyFlag.image = R.image.croatiaHrk()
            
        case "RUB" :
            cell?.currencyFlag.image = R.image.russiaRub()
            
        case "NZD" :
            cell?.currencyFlag.image = R.image.newZealandNzd()
            
        case "BGN" :
            cell?.currencyFlag.image = R.image.bulgariaBgn()
            
        case "GBP" :
            cell?.currencyFlag.image = R.image.unitedKingdomGbp()
            
        case "TRY" :
            cell?.currencyFlag.image = R.image.turkeyTry()
            
        case "CZK" :
            cell?.currencyFlag.image = R.image.czechRepublicCzk()
            
        case "PLN" :
            cell?.currencyFlag.image = R.image.republicOfPolandPln()
            
        case "PHP" :
            cell?.currencyFlag.image = R.image.philippinesPhp()
            
        case "ILS" :
            cell?.currencyFlag.image = R.image.israelIls()
            
        case "CNY" :
            cell?.currencyFlag.image = R.image.chinaCny()
            
        case "JPY" :
            cell?.currencyFlag.image = R.image.japanJpy()
            
        case "EUR" :
            cell?.currencyFlag.image = R.image.europeanUnion()
            
        default:
            cell?.currencyFlag.image = R.image.circle()
        }
        return cell!
    }
}
