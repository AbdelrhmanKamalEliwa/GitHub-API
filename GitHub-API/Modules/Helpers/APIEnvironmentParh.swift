

import Foundation

struct APIService {
    static func baseURL() -> String
    {
        return APIEnvironmentPath.development.scheme() + APIEnvironmentPath.development.host()
    }
}

enum APIEnvironmentPath {
    
    case development
    case testing
    case production
    
    func scheme() -> String
    {
        switch self
        {
        case .development:
            return "http://"
        case .testing:
            return ""
        case .production:
            return ""
        }
    }
    
    func host() -> String
    {
        switch self
        {
            case .development:
                return "api.github.com"
            case .testing:
                return ""
            case .production:
                return ""
        }
    }
}
