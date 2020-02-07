
import Foundation

struct DataModel: Codable {
    let name: String
    let description: String?
    let owner: owner?
    let avatarUrl: owner?
}

struct owner: Codable {
    let login: String?
    let avatar_url: String?
}


