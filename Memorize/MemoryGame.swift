//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Ahmed T.Nabarawy on 30/04/2024.
//

import Foundation

struct MemoryGame<CardContent> {
	var cards: Array<Card>
	
	func choose(card: Card){
		
	}
	
	struct Card {
		var isFaceUp: Bool
		var isMatched: Bool
		var content: CardContent
	}
}
