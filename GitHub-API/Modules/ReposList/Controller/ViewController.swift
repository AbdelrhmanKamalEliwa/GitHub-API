

import UIKit

class ViewController: UIViewController {
    
    
   // let baseUrl = "\(APIService.baseURL())"
    
//    let baseUrl = "https://api.github.com/users/square/repos"
    @IBOutlet weak var listTableView: UITableView!
    let cellIdentifier = "ListTableViewCell"
   // var reposArray = [DataModel]()
 //   var finalData = GitHubDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let networkManager = NetworkManager()
        let _ = networkManager.request(url: EndPointRouter.getRepo, httpMethod: .get, parameters: nil, headers: nil) { (result: APIResult<[DataModel]>) in
            switch result {
                
            case .success(let data):
                print(data)
                break
            case .failure(let error):
                if error != nil {
                    print(error!)
                }
                break
            case .decodingFailure(let error):
                if error != nil {
                    print(error!)
                }
                break
            case .badRequest(let error):
                if error != nil {
                    print(error!)
                }
                break
            }
        }
        
        
        
        
//        finalData.delegate = self
//        listTableView.delegate = self
//        listTableView.dataSource = self
     //   listTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
       // finalData.getData()
    }
    
    
    
}

//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return reposArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ListTableViewCell
//
//        cell.repoNameLabel.text = reposArray[indexPath.row].name
//        cell.ownerNameLabel.text = reposArray[indexPath.row].owner?.login
//        cell.descriptionTextView.text = reposArray[indexPath.row].description
////        cell.avatarImage.kf.indicatorType = .activity
//        let dummyImage = UIImageView()
//        if let imgStringUrl = reposArray[indexPath.row].owner?.avatar_url, let imgUrl = URL(string: imgStringUrl) {
//            dummyImage.kf.setImage(with: imgUrl, placeholder: nil, options: nil, progressBlock: nil) { (result) in
//                switch result {
//
//                case .success(let img):
//                    cell.avatarImage.image = img.image
//                case .failure(_):
//                    cell.avatarImage.image = UIImage(named: "errorImage")
//                }
//            }
//        }
//
//        return cell
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//}



//extension ViewController: GitHubDataProtocol {
//
//    func didLoadData(myData: [DataModel]) {
//        //        load data into table.
//        reposArray.append(contentsOf: myData)
//        DispatchQueue.main.async {
//            self.listTableView.reloadData()
//        }
//    }
//
//    func didFailWithError(error: Error) {
//        //        print error later.
//        print(error)
//    }
//}


