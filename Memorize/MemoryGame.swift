//
//  MemoryGame.swift
//  Memory
//
//  Created by Ahmed T.Nabarawy on 30/04/2024.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
	private(set) var cards: Array<Card>
	
	init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
		cards = []
		for pairIndex in 0..<numberOfPairsOfCards {
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content, id: "\(pairIndex)a"))
			cards.append(Card(content: content, id: "\(pairIndex)b"))
		}
	}
	
	mutating func shuffle() {
		cards.shuffle()
	}

	var indexOfTheOneAndOnlyFaceUpCard: Int? {
		get { cards.indices.filter { cards[$0].isFaceUp }.only }
		set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
	}
	
	mutating func choose(_ card: Card){
		if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
			if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
				if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
					if cards[potentialMatchIndex].content == cards[chosenIndex].content {
						cards[potentialMatchIndex].isMatched = true
						cards[chosenIndex].isMatched = true
					}
				} else {
					indexOfTheOneAndOnlyFaceUpCard = chosenIndex
				}
				cards[chosenIndex].isFaceUp = true
			}
		}
	}
	
	struct Card: Equatable, Identifiable {
		
		static func == (lhs: Card, rhs: Card) -> Bool {
			lhs.isFaceUp == rhs.isFaceUp &&
			lhs.isMatched == rhs.isMatched &&
			lhs.content == rhs.content
		}
		
		var isFaceUp = false
		var isMatched = false
		let content: CardContent
		
		var id: String
	}
}

extension Array {
	var only: Element? {
		count == 1 ? first : nil
	}
}
