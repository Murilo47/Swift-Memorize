//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Murilo Favero Oliveira on 11/05/22.
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
