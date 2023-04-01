//
//  RouteFinderTests.swift
//  Introduction to NavigationStackTests
//
//  Created by Tunde Adegoroye on 11/02/2023.
//

import XCTest
@testable import Introduction_to_NavigationStack

@MainActor
final class RouteFinderTests: XCTestCase {

    private var sut: RouteFinder!
    private var fetcher: ProductsFetcher!
    
    override func setUp() {
        sut = RouteFinder()
        fetcher = ProductsFetcher()
    }
    
    override func tearDown() {
        sut = nil
        fetcher = nil
    }
    
    func testPromoLinkRouteIsParsedCorrectly() async throws {
        
        let deeplinkURL = try XCTUnwrap(URL(string: "myfoodapp://promo?discount=0.3&desc=enjoy+this+great+discount"))
        let route = await sut.find(from: deeplinkURL, productsFetcher: fetcher)
        let promoData = PromoData(desc: "enjoy this great discount", pct: 0.3)
        XCTAssertEqual(route, .promo(data: promoData, hideTabBar: true), "This should be a valid path to a promotion")
    }
    
    func testPromoLinkRouteWithoutDescIsNotParsedCorrectly() async throws {
        
        let deeplinkURL = try XCTUnwrap(URL(string: "myfoodapp://promo?discount=0.3"))
        let route = await sut.find(from: deeplinkURL, productsFetcher: fetcher)
        XCTAssertNil(route, "This should be nil since it's missing a description")
    }
    
    func testProductLinkRouteIsParsedCorrectly() async throws {
        let iceCream = try XCTUnwrap(desserts.first(where: { $0.id == "🍦_Ice Cream" }))
        let deeplinkURL = try XCTUnwrap(Route.buildDeepLink(from: .menuItem(item: iceCream)))
        let route = await sut.find(from: deeplinkURL, productsFetcher: fetcher)
        XCTAssertEqual(route, .menuItem(item: iceCream, hideTabBar: true), "The route should be to ice cream")
    }
    
    func testInvalidLinkIsNotParsedCorrectly() async throws {
        
        let url =  try XCTUnwrap(URL(string: "myfoodapp://product?item=xxx"))
        let route = await sut.find(from: url, productsFetcher: fetcher)
        XCTAssertEqual(route, .invalidProduct(hideTabBar: true),"The product path should be invalid product")
    }
}
