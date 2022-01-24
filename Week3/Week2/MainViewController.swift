//
//  HomeController.swift
//  Week2
//
//  Created by mac on 2021/01/28.
//

import UIKit


class MainViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var todayNumLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    func labelAnimation() {
        UIView.animate(withDuration: 0.3) {
            self.label.layer.opacity = 1
        }
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 1.0
        pulse.toValue = 0.8
        pulse.autoreverses = true
        pulse.initialVelocity = 0.8
        label.layer.add(pulse, forKey: nil)
        label.isHidden = false
    }
    
    @IBAction func editButton(_ sender: Any) {
        let alert = UIAlertController(title: "Do you want to learn swift well?", message: "Why not?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: goodAnswerHandler))
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: badAnswerHandler))

        self.present(alert, animated: true)
    }
    lazy var goodAnswerHandler: ((UIAlertAction) -> Void) = { [weak self] action in
          self?.labelAnimation()
      }
      
      lazy var badAnswerHandler: ((UIAlertAction) -> Void) = { [weak self] action in
          let alert = UIAlertController(title: "Do you love swift?", message: "Strengthen your faith!", preferredStyle: .alert)
          
          alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: self?.goodAnswerHandler))
          alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: self?.worseAnswerHandler))
          
          self?.present(alert, animated: true)
      }
    
    
    lazy var worseAnswerHandler: ((UIAlertAction) -> Void) = { [weak self] action in
        let alert = UIAlertController(title: "Forget it, let me help you make a decision!", message: "...", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Only yes!", style: .default, handler: self?.goodAnswerHandler))
        
        self?.present(alert, animated: true)
    }
    
    
    
    
    @objc func showLabel(_ notification: Notification){
        if let data = notification.userInfo as? [String: String]
        {

            for (_, value) in data
            {
                searchBar.text = "[NotificationCenter] - \(value)"
               
//                todayNumLabel.text = "\(score)"

                // print("\(name) scored \(score) points!")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
            selector: #selector(showLabel),
            name: NSNotification.Name(rawValue: "PostButton"),
            object: nil)
        
        
        
        // Do any additional setup after loading the view.
    }


}

