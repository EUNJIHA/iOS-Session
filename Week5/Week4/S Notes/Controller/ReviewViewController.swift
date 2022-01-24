//
//  ReviewViewController.swift
//  Week4
//
//  Created by mac on 2021/02/18.
//

import UIKit
import Cosmos

class ReviewViewController: UIViewController{
    
    @IBOutlet weak var cosmosView: CosmosView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cosmosView.didTouchCosmos = { rating in
            self.ratingLabel.text = String(format: "%.0f", rating)
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        cosmosView.rating = UserDefaults.standard.double(forKey: "rating")
        self.ratingLabel.text = String(format: "%.0f", UserDefaults.standard.double(forKey: "rating"))
   }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        UserDefaults.standard.set(cosmosView.rating, forKey: "rating")

        
    }
    
}
