//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ahmed T.Nabarawy on 29/04/2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
	@StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
			EmojiMemoryGameView(viewModel: game)
        }
    }
}
