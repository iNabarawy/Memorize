//
//  EmojiMemoryView.swift
//  Memorize
//
//  Created by Ahmed T.Nabarawy on 29/04/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	
	@ObservedObject var viewModel: EmojiMemoryGame
	
	private let aspectRatio: CGFloat = 2/3
	
	var body: some View {
		VStack {
			cards
				.foregroundColor(viewModel.color)
				.animation(.default, value: viewModel.cards)
			
			Button("Shuffle") {
				viewModel.shuffle()
			}
		}
		.padding()
	}
	
	private var cards: some View {
		AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
			CardView(card)
				.padding(4)
				.onTapGesture {
					viewModel.choose(card)
				}
		}
	}
}

#Preview {
	EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
