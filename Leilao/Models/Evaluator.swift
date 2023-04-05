import Foundation

class Evaluator {
    
    private(set) var greaterThanAll = Double.leastNonzeroMagnitude
    private(set) var minorThanAll = Double.greatestFiniteMagnitude
    private var greaters: [Bid] = []
    
    func evaluate(_ auction: Auction) {
        guard let bids = auction.bids else { return }
        for bid in bids {
            if bid.value > greaterThanAll {
                greaterThanAll = bid.value
            }
            
            if bid.value < minorThanAll {
                minorThanAll = bid.value
            }
        }
        getAllGreaterBidsValuesFromAuction(auction)
    }
    
    private func getAllGreaterBidsValuesFromAuction(_ auction: Auction) {
        guard let auctionBids = auction.bids else { return }
        
         greaters = auctionBids.sorted { listOne, listTwo in
            return listOne.value > listTwo.value
        }
        
        let greatersBids = greaters.prefix(3)
        greaters = Array(greatersBids)
        
    }
    
    func greaterBid() -> Double {
        return greaterThanAll
    }
    
    func minorBid() -> Double {
        return minorThanAll
    }
    
    func threeMajorThan() -> [Bid] {
        return greaters
    }
}
