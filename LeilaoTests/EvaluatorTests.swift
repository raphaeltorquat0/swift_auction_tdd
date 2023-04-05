import XCTest
@testable import Leilao

final class AvaliadorTests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}
    
    func testUnderstandingBidsWithOrderGrowing() {
        
        let john = User(name: "John")
        let joseph = User(name: "Joseph")
        let mary = User(name: "Mary")
        
        let auction = Auction(description:  "Playstation 4")
        auction.propose(bid:  Bid(mary, 250.0))
        auction.propose(bid:  Bid(john, 300.0))
        auction.propose(bid:  Bid(joseph, 400.0))
        
        let evaluator = Evaluator()
        evaluator.evaluate(auction)
        
        XCTAssertEqual(250.0, evaluator.minorBid())
        XCTAssertEqual(400.0, evaluator.greaterBid())
    }
    
    func testUnderstandingAuctionWithJustOneBid() {
        
        let john = User(name: "John")
        let auction = Auction(description: "Playstation 4")
        
        auction.propose(bid: Bid(john, 1000.0))
        
        let evaluator = Evaluator()
        evaluator.evaluate(auction)
        
        XCTAssertEqual(1000.0, evaluator.minorBid())
        XCTAssertEqual(1000.0, evaluator.greaterBid())
        
    }
    
    func testFindTheThreeGreatersBids() {
        let john = User(name: "Jon")
        let mary = User(name: "Mary")
        
        let auction = Auction(description: "PS5")
        auction.propose(bid: Bid(john, 300.0))
        auction.propose(bid: Bid(mary, 400.0))
        auction.propose(bid: Bid(john, 500.0))
        auction.propose(bid: Bid(mary, 600.0))
        
        let evaluator = Evaluator()
        evaluator.evaluate(auction)
        
        let listBids = evaluator.threeMajorThan()
        
        XCTAssertEqual(3, listBids.count)
        XCTAssertEqual(600, listBids[0].value)
        XCTAssertEqual(500, listBids[1].value)
        XCTAssertEqual(400, listBids[2].value)
    }
}
