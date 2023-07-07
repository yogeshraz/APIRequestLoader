//
//  ViewController.swift
//  APIRequestLoader
//
//  Created by Yogesh Raj on 04/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lable: UILabel!
    // MARK: - Variables
    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchProducts { [self] data in
            lable.text = data.events?.first?.name
        }
    }


    override func viewWillAppear(_ animated: Bool) {
        
    }
}

