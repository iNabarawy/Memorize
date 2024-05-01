//
//  EmojiMemoryView.swift
//  Memorize
//
//  Created by Ahmed T.Nabarawy on 29/04/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	
	var viewModel: EmojiMemoryGame

	var body: some View {
			ScrollView {
				cards
		}
		.padding()
	}

	var cards: some View {
		LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
			ForEach(viewModel.cards.indices, id:\.self) {
				CardView(content: viewModel.cards[$0].content)
					.aspectRatio(2/3, contentMode: .fit)
			}
		}
		.foregroundColor(.orange)
	}
}

struct CardView: View {
	let content: String
	@State var isFaceUp = true
	var body: some View {
		ZStack {
			let base = RoundedRectangle(cornerRadius: 12)
			Group {
				base.foregroundColor(.white)
				base.strokeBorder(lineWidth: 2)
				Text(content).font(.largeTitle)
			}
			.opacity(isFaceUp ? 1 : 0)
			
			base.fill().opacity(isFaceUp ? 0 : 1)
		}
		.onTapGesture {
			isFaceUp.toggle()
		}
	}
}

#Preview {
    EmojiMemoryGameView()
}
