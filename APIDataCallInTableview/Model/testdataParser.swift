//
//  testdataParser.swift
//  APIDataCallInTableview
//
//  Created by mayank ranka on 29/03/23.
//

import UIKit
protocol GetDataToMainView {
    func didRecieveData(testDataArr: [testData])
    func didRecieveError()
}
class testdataParser: NSObject, URLSessionDelegate , URLSessionDownloadDelegate{
   
  
    var delegate    : GetDataToMainView!
    var webData     : Data?
    var session     : URLSession{
        
        let defaultConfig = URLSessionConfiguration.default
        defaultConfig.requestCachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        
        let session1 = URLSession(configuration: defaultConfig, delegate: self, delegateQueue: nil)
        
        return session1
    }
    
    func getTestData(){
        
        let url = URL(string: "https://testffc.nimapinfotech.com/testdata.json")
        let task = session.downloadTask(with: url!)
        task.resume()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        do{
            webData = try Data(contentsOf: location)
            let result = try JSONSerialization.jsonObject(with: webData!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : Any]
            
            let data = result["data"] as! [String : Any]
            
            let records = data["Records"] as! [[String : Any]]
            
            var emptyArr = [testData]()
            for i in 0..<records.count{
                let user = testData(dictionary: records[i])
                emptyArr.append(user)
            }
            delegate?.didRecieveData(testDataArr: emptyArr)
            
        }catch{
            print("Exception occured")
        }
    }

}
