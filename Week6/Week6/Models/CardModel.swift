//
//  CardModel.swift
//  Week6
//
//  Created by mac on 2021/02/25.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        var generatedCardsArray = [Card]()
        
        // 같은 짝으로 카드 18개 뽑기
        for _ in 1...9 {
            
            // 1 ~ 13 사이 난수 반환
            let randomNumber = arc4random_uniform(13) + 1
            print(randomNumber)
            
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardOne)
            
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            generatedCardsArray.append(cardTwo)
            
        }
        
        // 카드 랜덤하게 섞기
        for i in 0...generatedCardsArray.count - 1 {
            
            // 랜덤한 숫자 뽑아서
            let randomNumber = arc4random_uniform(UInt32(generatedCardsArray.count))
            
            // 바꿔치기
            let temporaryCard = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[Int(randomNumber)]
            generatedCardsArray[Int(randomNumber)] = temporaryCard
        }
        
        return generatedCardsArray
    } 
}
