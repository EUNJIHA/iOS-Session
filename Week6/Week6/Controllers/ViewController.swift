//
//  ViewController.swift
//  Week6
//
//  Created by mac on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - 변수, 상수 정의
    private var totalTime: Int = 60
    private var isActive: Bool = false
    
    private var totalScore: Int = 0 {
        didSet {
            scoreLabel.text = "\(totalScore)점"
        }
    }
    
    var model = CardModel()
    var cardArray = [Card]()
    //    var cardArray: [Card]? - 이것과는 무슨 차이인가
    
    var firstFlippedCardIndex: IndexPath?
    
    var testView: UIView?
    
    var timer: DispatchSourceTimer?
    
    
    
    // MARK: - @IBOutlet
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testView = UIView(frame: CGRect(x: cardCollectionView.frame.origin.x, y: cardCollectionView.frame.origin.y, width: cardCollectionView.frame.width, height: cardCollectionView.frame.height))
        testView?.backgroundColor = .brown
        self.view.addSubview(testView!)
        
        timerLabel.text = "\(totalTime)초"
        
        
        
        cardArray = model.getCards()
        
        self.cardCollectionView.delegate = self
        self.cardCollectionView.dataSource = self
        
        
        let cardNib = UINib(nibName: CardCollectionViewCell.identifier, bundle: .main)
        cardCollectionView.register(cardNib, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        
        // MARK: - 시간 초과됐으면 Alert창 띄우기
        //        DispatchQueue.main.async {
        //          let success = self.totalTime == 0
        //          let title = success ? "Level Up!" : "Fail"
        //          let message = success ? "leftTime: \(self.totalTime), Score: \(self.scoreLabel)" : "Try again"
        //
        //          if self.totalTime == 0 {
        //
        //
        //            let alert = UIAlertController(
        //              title: title,
        //              message: message,
        //              preferredStyle: .alert)
        //            alert.addAction(UIAlertAction(
        //                              title: "OK",
        //                              style: UIAlertAction.Style.cancel,
        //                              handler: nil))
        //            self.present(alert, animated: true, completion: nil)
        //          }
        //        }
        
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        let timeInterval: CFTimeInterval = 3
//        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
//        rotateAnimation.fromValue = 0.0
//        rotateAnimation.toValue = CGFloat(Double.pi * 2)
//        rotateAnimation.isRemovedOnCompletion = false
//        rotateAnimation.duration = timeInterval
//        rotateAnimation.repeatCount=Float.infinity
//        cardCollectionView.visibleCells.layer.add(rotateAnimation, forKey: nil)
//
//    }
    
    // MARK: - @IBAction
    @IBAction func startButtonTouchUpInside(_ sender: Any) {
        isActive = !isActive
        if isActive {
                        
//            cardCollectionView.reloadData()
            UIView.transition(with: self.view, duration: 0.5, options: [.transitionCrossDissolve], animations: {
                self.testView?.removeFromSuperview()
            }, completion: nil)
            startButton.setTitle("중단하기", for: .normal)
        }
        else {
            UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                self.view.addSubview(self.testView!)
            }, completion: nil)
            startButton.setTitle("시작하기", for: .normal)
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            if self.isActive && self.totalTime > 0 {
                self.totalTime -= 1
                self.timerLabel.textColor = .none
                self.timerLabel.text = "\(self.totalTime)초"
            }
            else if self.totalTime <= 0 {
                self.startButton.setTitle("게임 종료", for: .normal)
                self.startButton.isEnabled = false
                self.timerLabel.textColor = .red
                
                
                // MARK: Core Animation
                // 점수판 확대하기
                
                
                
                // Alert창
//                let success = self.totalTime == 0
//                let title = success ? "Time ended!" : "Fail"
//                let message = success ? "Score: \(self.totalScore)" : "Try again"
//
//                let alert = UIAlertController(
//                    title: title,
//                    message: message,
//                    preferredStyle: .alert)
//                alert.addAction(UIAlertAction(
//                                    title: "OK",
//                                    style: UIAlertAction.Style.cancel,
//                                    handler: nil))
//                self.present(alert, animated: true, completion: nil)
                
                
            }
            else {
                timer.invalidate()
                self.startButton.setTitle("다시 시작", for: .normal)
                //                self.startButton.isEnabled = false
            }
        }
        
        //        if timer == nil {
        //            // 1
        //            timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        //
        //            // 2
        //            timer?.schedule(deadline: .now(), repeating: 1)
        //
        //            // 3
        //            timer?.setEventHandler(handler: {
        //                print(Date())
        //                if self.isActive && self.totalTime > 0 {
        //                    self.timer?.resume()
        //                    self.totalTime -= 1
        //                    self.timerLabel.text = "\(self.totalTime)초"
        //                } else {
        //                    self.timer?.suspend()
        //                    self.startButton.setTitle("시작하기", for: .normal)
        //                }
        //
        //            })
        //        }
        
    }
    
}

// MARK: - extension
extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cardArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cardCollectionViewCell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let card = cardArray[indexPath.row]
        
        cardCollectionViewCell.setCard(card)
        
        return cardCollectionViewCell
        
    }
    
    // MARK: 눌렀을 때 로직 (didSelectItemAt)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cardCollectionViewCell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell else {
            return
        }
        
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false && card.isMatched == false {
            cardCollectionViewCell.flip()
            
            // 첫 번째 카드인지 두 번째 카드인지
            if firstFlippedCardIndex == nil {
                firstFlippedCardIndex = indexPath
            }
            else {
                // 같은 값 누르면 동작 안되도록 by Me
                if firstFlippedCardIndex == indexPath {
                    return
                }
                // TODO: 두 번째 카드라면, 첫 번째 카드와 비교하는 로직
                checkForMatches(indexPath)
                
            }
            
        }
        //        else {
        //            cardCollectionViewCell.flipBack()
        //        }
        card.isFlipped = !card.isFlipped
        
        
    }
    
    // MARK: 일치하는지 체크하는 함수
    func checkForMatches(_ secondFlippedCardIndex: IndexPath) {
        
        // MARK: View
        guard let cardOneCell = cardCollectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell else {
            return
        }
        
        guard let cardTwoCell = cardCollectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell else {
            return
        }
        
        // MARK: DataSource
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
        // 일치 or 불일치
        if cardOne.imageName == cardTwo.imageName {
            
            // MARK: DataSource 변경
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            // MARK: View 변경
            cardOneCell.remove()
            cardTwoCell.remove()
            // 위에서 guard let을 해줬으니까
            // cardOneCell?.remove() - 이렇게 Optional Chaining 안해도 돼
            
            totalScore += 10
            
        }
        else {
            cardOne.isMatched = false
            cardTwo.isMatched = false
            
            cardOneCell.flipBack()
            cardTwoCell.flipBack()
        }
        
        //        if cardOneCell == nil {
        //            cardCollectionView.reloadItems(at: [firstFlippedCardIndex!])
        //        }
        
        // 변수 초기화
        firstFlippedCardIndex = nil
        
    }
    
    func checkGameEnded() {
        
    }
    
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        cell.transform = CGAffineTransform(rotationAngle: 360)
//        UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
//                cell.transform = CGAffineTransform(rotationAngle: 0.0)
//        })
    }
    
}
