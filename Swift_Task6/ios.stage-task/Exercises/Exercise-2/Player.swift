//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        for item in hand ?? [] {
            if item.value == card.value || item.suit == card.suit {
                return true
            }
        }
        return false
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        for item in hand ?? [] {
            for cards in table {
                if cards.key.value == item.value || cards.value.value == item.value {
                    return true
                }
            }
        }
        return false
    }
}
