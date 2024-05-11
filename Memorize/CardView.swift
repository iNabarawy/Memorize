//
//  CardView.swift
//  Memorize
//
//  Created by Ahmed T.Nabarawy on 02/05/2024.
//

import SwiftUI

struct CardView: View {
	typealias Card = MemoryGame<String>.Card
	let card: Card
	
	init(_ card: Card) {
		self.card = card
	}
	
	var body: some View {
		ZStack {
			let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
			Group {
				base.foregroundColor(.white)
				base.strokeBorder(lineWidth: Constants.lineWidth)
				Text(card.content)
					.font(.system(size: Constants.FontSize.largest))
					.minimumScaleFactor(Constants.FontSize.scaleFactor)
					.multilineTextAlignment(.center)
					.aspectRatio(1, contentMode: .fit)
					.padding(Constants.inset)
			}
			.opacity(card.isFaceUp ? 1 : 0)
			
			base.fill().opacity(card.isFaceUp ? 0 : 1)
		}
		.opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
	}
	
	private struct Constants {
		static let cornerRadius: CGFloat = 12
		static let lineWidth: CGFloat = 2
		static let inset: CGFloat = 5
		struct FontSize {
			static let largest: CGFloat = 200
			static let smallest: CGFloat = 10
			static let scaleFactor = smallest / largest
		}
	}
}

#Preview {
	VStack {
		HStack {
			CardView(CardView.Card(isFaceUp: true,content: "X", id: "test"))
				.aspectRatio(4/3, contentMode: .fit)
			CardView(CardView.Card(isFaceUp: false,content: "X", id: "test1"))
		}
		HStack {
			CardView(CardView.Card(isFaceUp: true, isMatched: true, content: "This is a very long text and i hope it fits", id: "test"))
			CardView(CardView.Card(isMatched: true,content: "X", id: "test1"))
		}
	}
		.padding()
		.foregroundColor(.green)
}
