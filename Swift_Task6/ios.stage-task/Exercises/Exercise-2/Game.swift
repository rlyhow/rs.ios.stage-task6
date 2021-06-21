//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {
    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        var minTrumpCard: Int?
        var firstAttackPlayer: Player?
        for player in players {
            for card in player.hand ?? [] {
                if card.isTrump && minTrumpCard != nil {
                    if minTrumpCard! > card.value.rawValue {
                        minTrumpCard = card.value.rawValue
                        firstAttackPlayer = player
                    }
                } else if card.isTrump {
                    minTrumpCard = card.value.rawValue
                    firstAttackPlayer = player
                }
            }
        }
        
        return firstAttackPlayer
    }
}
