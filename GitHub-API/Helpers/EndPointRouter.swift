
import Foundation

struct EndPointRouter {
    static var getRepos: URL { return URL(string: APIService.baseURL() + "/users/square/repos")! }
//    add new url for test
    static var getRepo: URL { return URL(string: "https://api.github.com/users/square/repos")! }
}
