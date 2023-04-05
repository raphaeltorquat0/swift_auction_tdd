import Foundation

class Auction {
    
    let description:String
    let image:String?
    var bids:[Bid]?
    
    init(description:String, image:String? = nil, bids:[Bid] = []) {
        self.description = description
        self.image = image
        self.bids = bids
    }
    
    func propose(bid:Bid) {
        bids?.append(bid)
    }
}

