//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ahmed T.Nabarawy on 30/04/2024.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
	private static let emojis = ["🍔","☃️","🥃","🏀","⚽️","🎪", "🚣‍♀️"]
	@Published private var model = MemoryGame(numberOfPairsOfCards: 10) {
		guard $0 < emojis.count else {
			return "No"
		}
		return emojis[$0]
	}
	
	var cards: Array<MemoryGame<String>.Card> {
		return model.cards
	}
	// MARK: - Intents
	
	func shuffle() {
		model.shuffle()
	}
	
	func choose(_ card: MemoryGame<String>.Card) {
		model.choose(card)
	}
}
