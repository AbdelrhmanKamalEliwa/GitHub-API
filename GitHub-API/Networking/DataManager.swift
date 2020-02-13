
import Foundation


class NetworkManager {
    
//    delegate
//    var delegate: NetworkManagerProtocol?
    
    public let session = URLSession(configuration: .default)
    
    //MARK: - DataTask Request
    func request<T: Codable>(url: URL, httpMethod: httpMethod, parameters: [String : String]?, headers: [String : String]?, completionHandler: @escaping(_ result: APIResult<T>) -> () ) -> URLSessionTask {
        
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        // add parameters to request body
        if parameters != nil
        {
            do {
                let dataParameters = try JSONSerialization.data(withJSONObject: parameters!)
                urlRequest.httpBody = dataParameters
            } catch (let error) {
                completionHandler(.badRequest(error))
            }
        }
        
        if headers != nil
        {
            for header in headers! {
                urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
    
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                completionHandler(.failure(error))
                return
            }
            
            if let safeData = data {
                do {
                    let stringResponse = String.init(data: safeData, encoding: .utf8)
                    guard let jsonData = stringResponse?.data(using: .utf8) else
                    {
                        completionHandler(.decodingFailure(nil))
                        return
                    }
                    
                    let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
                    completionHandler(.success(decodedData))
//                    self.delegate?.didLoadData(myData: r)
                    
                } catch (let error) {
                    completionHandler(.decodingFailure(error))
                }
            }
        }

        
        task.resume()
        return task
    }
    
}

// add delegate to the class
//protocol NetworkManagerProtocol {
//    func didLoadData(myData: APIResult<DataModel>)
//    func didFailWithError(error: Error)
//}

