import Foundation

class Bid {
    
    let user:User
    let value:Double
    
    init(_ user:User, _ value:Double) {
        self.user = user
        self.value = value
    }
}
