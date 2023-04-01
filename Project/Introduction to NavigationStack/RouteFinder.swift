//
//  RouteFinder.swift
//  Introduction to NavigationStack
//
//  Created by Tunde Adegoroye on 09/02/2023.
//

import Foundation

enum DeepLinkURLs: String {
    case promo = "promo"
    case product = "product"
}

struct RouteFinder {
    
    func find(from url: URL, productsFetcher: ProductsFetcher) async -> Route? {
        
        guard let host = url.host() else { return nil }
        
        switch DeepLinkURLs(rawValue: host) {
        case .promo:
            
            let queryParams = url.queryParameters
            guard let descQueryVal = queryParams?["desc"] as? String else { return nil }
            let discountQueryVal = queryParams?["discount"] as? String ?? ""
            let discountPct = Decimal(string: discountQueryVal) ?? nil
            
            let promoData = PromoData(desc: descQueryVal, pct: discountPct)
            return .promo(data: promoData, hideTabBar: true)
            
        case .product:
            
            let queryParams = url.queryParameters
            guard let itemQueryVal = queryParams?["item"] as? String,
                  let product = await productsFetcher.fetchProduct(by: itemQueryVal) else { return .invalidProduct(hideTabBar: true) }
            
            return .menuItem(item: product, hideTabBar: true)
        default:
            return nil
            
        }
    }
}

extension URL {
    public var queryParameters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value?.replacingOccurrences(of: "+", with: " ")
        }
    }
}
