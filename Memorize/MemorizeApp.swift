//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Omer Cagri Sayir on 11.12.2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @State var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
