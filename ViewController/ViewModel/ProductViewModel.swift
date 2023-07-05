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
            switch response {
            case .success(let event):
                print(event.events?.count as Any)
            case .failure(let error):
                UIAlertController.showAlert(title: "Alert", msg: error.description)
            }
        }
    }
    
    func ee()  {
        ApiRequestLoader.shared.request(modelType: [EventDataModel].self, type: ApiEndPoint.addProduct(product: AddProduct(id: 1, title: "jjdjdk"))) { response in
            
        }
    }
}
