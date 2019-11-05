//
//  ViewController.swift
//  josnswifty
//
//  Created by Vishnu on 05/11/19.
//  Copyright © 2019 Vishnu.json. All rights reserved.
//


import UIKit
struct jsonstruct:Decodable{
    let name:String
    let capital:String
    let alpha2Code:String
    let alpha3Code:String
    let region:String
    let subregion:String
}

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableVw: UITableView!
    var arrdata = [jsonstruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
    }
    func getdata(){
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data,response,error) in
            do{if error == nil{
                self.arrdata = try
                    JSONDecoder().decode([jsonstruct].self, from: data!)
                
                for mainarr in self.arrdata{
                    print(mainarr.name,":",mainarr.capital,":",mainarr.alpha3Code)
                    DispatchQueue.main.async {
                          self.tableVw.reloadData()
                    }
                }
                }
            }catch{
                print("Error in get json data")
            }
            }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lblName.text = "Name : \(arrdata[indexPath.row].name)"
        cell.lblCapital.text = "Capital : \(arrdata[indexPath.row].capital)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail:DetailedVC = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailedVC
        detail.strregion = "Region :\(arrdata[indexPath.row].region)"
        detail.strsubregion = "SubRegion :\(arrdata[indexPath.row].subregion)"
        detail.stralpha2 = "Alpha2Code :\(arrdata[indexPath.row].alpha2Code)"
        detail.stralpha3 = "Alpha3Code :\(arrdata[indexPath.row].alpha3Code)"
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
}


