////
////  GitHubDataManager.swift
////  GitHub-API
////
////  Created by Abdelrhman Eliwa on 1/17/20.
////  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
////
//
//import Foundation
//
//class GitHubDataManager {
//    
//    var delegate: GitHubDataProtocol?
//    
////    var dataManager = DataManager()
//    
//    let baseUrl = "https://api.github.com/users/square/repos"
//    
//    
//    func getData() {
//        if let url = URL(string: baseUrl) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
////                print(response)
////                print(error)
//                if error != nil {
//                    self.delegate?.didFailWithError(error: error!)
//                    return
//                }
//                if let safeData = data {
//                    if let myFinalData = self.parseJSON(safeData) {
//                        self.delegate?.didLoadData(myData: myFinalData)
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
//    
//    
//    
//    func parseJSON(_ myData: Data) -> [DataModel]? {
//        
//        let decoder = JSONDecoder()
//        
//        do {
//            let decodedData = try decoder.decode([DataModel].self , from: myData)
////            print(decodedData)
////            let repoName = decodedData[0].name
////            print(repoName)
////            let description = decodedData[0].description
////            print(description)
////            if let owner = decodedData[0].owner {
////                print(owner.login)
////                print(owner.avatar_url)
////            }
//            
//            
////            let finalData = repoName + description + username + avatarImage
//            return decodedData
//            
//        } catch {
//            delegate?.didFailWithError(error: error)
//            return nil
//        }
//    }
//}
//
//
//
//protocol GitHubDataProtocol {
//    func didLoadData(myData: [DataModel])
//    func didFailWithError(error: Error)
//}
