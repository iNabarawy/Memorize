//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ahmed T.Nabarawy on 30/04/2024.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
	typealias Card = MemoryGame<String>.Card

	private static let emojis = ["🍔","☃️","🥃","🏀","⚽️","🎪", "🚣‍♀️"]
	@Published private var model = MemoryGame(numberOfPairsOfCards: 2) {
		guard $0 < emojis.count else {
			return "No"
		}
		return emojis[$0]
	}
	
	var cards: Array<Card> {
		model.cards
	}
	
	var color: Color {
		.orange
	}
	// MARK: - Intents
	func shuffle() {
		model.shuffle()
	}
	
	func choose(_ card: Card) {
		model.choose(card)
	}
}
