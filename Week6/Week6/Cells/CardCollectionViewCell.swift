//
//  CardCollectionViewCell.swift
//  Week6
//
//  Created by mac on 2021/02/25.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    // 외부에서 접근할 수 있도록 static
    static let identifier: String = "CardCollectionViewCell"
    
    var card: Card?
    
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var frontImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setCard(_ card: Card) {
        self.card = card
        frontImageView.image = UIImage(named: card.imageName)
        
        // MARK: 재사용 문제를 해결하기 위한 코드
        // 재사용 할 때, 속성 값들이 남아있는 것을 setCard 하기 때문에, setCard에서 한 번 더 체크를 해주는 거지
        if card.isMatched == true {
            backImageView.alpha = 0
            frontImageView.alpha = 0
            
            // 다음 로직 실행 안되도록
            return
        }
        else {
            print("else")

            backImageView.alpha = 1
            frontImageView.alpha = 1
        }
        
        
        
        if card.isFlipped == true  {
            print("isFlipped true")
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        else {
            print("isFlipped false")
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
    }
    
    func flip() {
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipBack() {
        
        // MARK: DispatchQueue.main
        // MARK: 일치하지 않으면 다른 쓰레드에서 동시에 flipBack 할 수 있도록
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
//        UIView.transition(from: frontImageView, to: backImageView, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
    }
    
    func remove() {
        backImageView.alpha = 0
        
        // MARK: UIView.animate
        // MARK: 서서히 사라지도록 애니메이션 효과
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0

        }, completion: nil)

    }
    
}

