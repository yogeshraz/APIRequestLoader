//
//  ProductViewModel.swift
//  APIRequestLoader
//
//  Created by Yogesh Raj on 04/07/23.
//

import UIKit

final class ProductViewModel {

    
    func fetchProducts() {
        ApiRequestLoader.shared.request(modelType: EventDataModel.self, type: ApiEndPoint.event(Id: "66533")) { response in
            
        }
    }
}
