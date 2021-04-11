import UIKit

class HomeInteractor {
    
//    func Get_Movies( url : String , page : Int , completion : @escaping (_ error : Error? ,_ result : Movies?) -> Void) {
//        Geneircs.Generic_Request(page: page , url: url) { (error, result: Movies?) in
//            if error != nil {
//                completion(error , nil)
//            } else {
//                completion(nil , result)
//            }
//        }
//    }
    
    func Get_Movies <T : Codable>( url : String , page : Int , completion : @escaping (_ error : Error? ,_ result : T?) -> Void) {
        Geneircs.Generic_Request(page: page , url: url) { (error, result: T?) in
            if error != nil {
                completion(error , nil)
            } else {
                completion(nil , result)
            }
        }
    }
}

