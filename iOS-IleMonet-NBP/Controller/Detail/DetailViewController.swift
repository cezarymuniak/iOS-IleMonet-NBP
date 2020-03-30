//
//  DetailViewController.swift
//  iOS-IleMonet-NBP
//
//  Created by Cezary Muniak on 25/03/2020.
//  Copyright © 2020 Cezary Muniak. All rights reserved.
//

import Foundation
import UIKit
import DatePickerDialog
import Alamofire
import SwiftyJSON
import IHProgressHUD


class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var dateFrom: UIButton!
    @IBOutlet weak var dateTo: UIButton!
    @IBOutlet weak var startDateView: UIView!
    @IBOutlet weak var endDateView: UIView!
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var topBar: TopBar!
    @IBOutlet weak var rateNameLabel: UILabel!
    @IBAction func fromDateButtonTapped(_ sender: Any) {
        datePickerFrom()
    }
    @IBAction func toDateButtonTapped(_ sender: Any) {
        datePickerTo()
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        startDate = dateFrom.titleLabel!.text!
        endDate = dateTo.titleLabel!.text!
        getData(startDate: startDate, endDate: endDate)
    }
    
    
    let date = Date()
    let format = DateFormatter()
    let lastWeekDate = NSCalendar.current.date(byAdding: .weekOfYear, value: -1, to: NSDate() as Date)
    let dateFormatter = DateFormatter()
    var currencies: [Currencies] = []
    var currencyName = ""
    var tableType: String = ""
    var rateCode: String = ""
    var startDate: String = ""
    var endDate: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        doBindings()
        getData(startDate: startDate, endDate: endDate)
        detailTableView.reloadData()
    }
    
    func setupUI() {
        topBar.showBackButton()
        startDateView.layer.cornerRadius = 15
        endDateView.layer.cornerRadius = 15
        self.startDateView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        self.endDateView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    func doBindings() {
        self.detailTableView.register(UINib(nibName: R.nib.tableViewCell.name, bundle: nil ),
                                      forCellReuseIdentifier: R.reuseIdentifier.tableViewCell.identifier )
        format.dateFormat = "yyyy-MM-dd"
        let formattedDate = format.string(from: date)
        let previousDate =  format.string(from: lastWeekDate!)
        startDate =  previousDate
        endDate = formattedDate
        dateFrom.setTitle(previousDate, for: .normal)
        dateTo.setTitle(formattedDate, for: .normal)
    }
    
    func datePickerTo() {
        DatePickerDialog(locale: Locale(identifier: "pl_PL")).show("Wybierz Datę", doneButtonTitle: "OK", cancelButtonTitle: "Wróć", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                self.dateTo.titleLabel?.text = formatter.string(from: dt)
            }
        }
    }
    
    func datePickerFrom(){
        DatePickerDialog(locale: Locale(identifier: "pl_PL")).show("Wybierz Datę", doneButtonTitle: "OK", cancelButtonTitle: "Wróć", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                self.dateFrom.titleLabel?.text =   formatter.string(from: dt)
            }
        }
    }
    
    
    func getData(startDate: String, endDate: String){
        DispatchQueue.global(qos: .utility).async {
            IHProgressHUD.show()
        }
        
        DispatchQueue.main.async {
            let apiUrl = "https://api.nbp.pl/api/exchangerates/rates/\(self.tableType)/\(self.rateCode)/\(startDate)/\(endDate)/"
            print(apiUrl)
            
            AF.request(apiUrl, method: .get).responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    self.currencies.removeAll()
                    let data = JSON(value)
                    
                    switch (self.tableType) {
                    case "A", "B":
                        data["rates"].array?.forEach({(currency) in
                            let currency = Currencies(currencyShortName: self.rateCode, currencyFullName: self.currencyName, price: currency["mid"].doubleValue, date: currency["effectiveDate"].stringValue, rateCode: self.rateCode, tableType: self.tableType)
                            
                            DispatchQueue.global(qos: .utility).async {
                                IHProgressHUD.dismiss()
                            }
                            self.currencies.append(currency)
                            }
                        )
                        self.rateNameLabel.text = self.currencyName
                        self.detailTableView.reloadData()
                        
                    default:
                        data["rates"].array?.forEach({(currency) in
                            let currency = Currencies(currencyShortName: self.rateCode, currencyFullName: self.currencyName, price: currency["bid"].doubleValue, date: currency["effectiveDate"].stringValue, rateCode: self.rateCode, tableType: self.tableType)
                            
                            DispatchQueue.global(qos: .utility).async {
                                IHProgressHUD.dismiss()
                            }
                            self.currencies.append(currency)
                            }
                        )
                        self.rateNameLabel.text = self.currencyName
                        self.detailTableView.reloadData()

                    }
                    
                case .failure(let error):
                    
                    DispatchQueue.global(qos: .utility).async {
                        IHProgressHUD.showInfowithStatus("Błąd: \(error.localizedDescription)")
                    }
                    print(error.localizedDescription)
                }
            }
            )
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTableView.dequeueReusableCell(withIdentifier:  R.reuseIdentifier.tableViewCell, for: indexPath)
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
