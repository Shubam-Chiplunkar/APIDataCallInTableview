//
//  ViewController.swift
//  APIDataCallInTableview
//
//  Created by mayank ranka on 29/03/23.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,GetDataToMainView{
  
   
    var arrayData : [testData]!
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayData = [testData]()
        let dataDemo = testdataParser()
        dataDemo.getTestData()
        dataDemo.delegate = self
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.labelTitle.text = arrayData[indexPath.row].title
        print("indexpath : \(indexPath.row)")
        
        return cell
    }
    func didRecieveData(testDataArr: [testData]) {
        arrayData = testDataArr
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
        
    }
    
    func didRecieveError() {
        print("Error Occured")
    }
    
}

