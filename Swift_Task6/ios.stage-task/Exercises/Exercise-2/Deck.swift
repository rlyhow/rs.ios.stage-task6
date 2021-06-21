import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {
    
    //MARK: - Properties
    
    var cards = [Card]()
    var type: DeckType
    var trump: Suit?
    
    var total:Int {
        return type.rawValue
    }
}

extension Deck {
    
    init(with type: DeckType) {
        self.type = type
        cards = self.createDeck(suits: Suit.allCases, values: Value.allCases)
    }
    
    public mutating func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var newCard: Card
        for suit in suits {
            for value in values {
                newCard = Card(suit: suit, value: value)
                cards.append(newCard)
            }
        }
        return cards
    }
    
    public mutating func shuffle() {
        cards.shuffle()
    }
    
    public mutating func defineTrump() {
        trump = cards.first?.suit
        for i in cards.indices where cards[i].suit == trump  {
            cards[i].isTrump = true
        }
    }
    
    public mutating func initialCardsDealForPlayers(players: [Player]) {
        for i in players.indices {
            for _ in 0...5  {
                if players[i].hand != nil {
                    players[i].hand?.append(cards[0])
                } else {
                    players[i].hand = [cards[0]]
                }
                cards.removeFirst()
            }
        }
    }
    
    public func setTrumpCards(for suit:Suit) {
        
    }
}

