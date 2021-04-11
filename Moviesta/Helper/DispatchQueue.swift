import UIKit

class DispatchQueueHelper {
    static func HelperDispatchQueue(seconds : Double = 0 , level : DispatchLevel = .main , completion : @escaping ()->()) {
        let time = DispatchTime.now() + seconds
        level.dispatchqueue.asyncAfter(deadline: time, execute: completion)
    }
    
    enum DispatchLevel {
        case main , background
        var dispatchqueue : DispatchQueue {
            switch self {
            case.main :               return DispatchQueue.main
            case .background :        return DispatchQueue.global(qos: .background)
            }
        }
    }
}
