

import UIKit

class ViewController: UIViewController {
    
    var reposArray = [DataModel]()
   
    @IBOutlet weak var listTableView: UITableView!
    let cellIdentifier = "RepoListCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        listTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
       fetchData()
    }
    
    
    func fetchData() {
        
        let networkManager = NetworkManager()
        let _ = networkManager.request(url: EndPointRouter.getRepos, httpMethod: .get, parameters: nil, headers: nil) { (result: APIResult<[DataModel]>) in
            switch result {
                
            case .success(let data):
                self.reposArray = data
//                lma 3mlt reload lel TavleView hena l App drb bs msh fahem l error
                self.listTableView.reloadData()
                print(self.reposArray)
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
        
        
    }
}



//MARK: - Setup TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reposArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RepoListCell

        cell.repoNameLabel.text = reposArray[indexPath.row].name
        cell.repoOwnerNameLabel.text = reposArray[indexPath.row].owner?.login
        cell.descriptionTextView.text = reposArray[indexPath.row].description
//        cell.userImage.kf.indicatorType = .activity
        let dummyImage = UIImageView()
        if let imgStringUrl = reposArray[indexPath.row].owner?.avatar_url, let imgUrl = URL(string: imgStringUrl) {
            dummyImage.kf.setImage(with: imgUrl, placeholder: nil, options: nil, progressBlock: nil) { (result) in
                switch result {

                case .success(let img):
                    cell.userImage.image = img.image
                case .failure(_):
                    cell.userImage.image = UIImage(named: "errorImage")
                }
            }
        }

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

