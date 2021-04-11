import UIKit
import Alamofire

class GeneircAPIS {
    //MARK: - Movies - TV APIS
    func Generic_Request <T : Codable> (page : Int , url : String , method : HTTPMethod = .get , completion : @escaping (_ error : Error? ,_ result : T?) -> Void) {
        AF.request(url , method: method , parameters: ["api_key" : API_KEYS.API_KEY , "page" : page])
            .responseJSON { (response) in
                switch response.result {
                case .failure(let error) :
                    completion(error , nil)
                case .success(_) :
                    guard let data = response.data else { print("Error 20331") ; return }
                    do {
                        let container = try JSONDecoder().decode(T.self, from: data)
                        completion(nil , container)
                    } catch {
                        print("Error 20056")
                        completion(error , nil)
                    }
                }
        }
    }
    
    
    //MARK: - Credits API
    func Generic_Credits <T : Codable> (url : String , method : HTTPMethod = .get , completion : @escaping (_ error : Error? ,_ result : T?) -> Void) {
        AF.request(url , method: method , parameters: ["api_key" : API_KEYS.API_KEY])
            .responseJSON { (response) in
                switch response.result {
                case .failure(let error) :
                    completion(error , nil)
                case .success(_) :
                    guard let data = response.data else { print("Error 123324") ; return }
                    do {
                        let container = try JSONDecoder().decode(T.self, from: data)
                        completion(nil , container)
                    } catch {
                        
                    }
                }
        }
    }
}
