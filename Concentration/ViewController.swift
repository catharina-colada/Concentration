import UIKit

class ViewController: UIViewController
{
    lazy var game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
 
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            print("cardNumber = \(cardNumber)")
        }
        
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.6989120801, blue: 0.3105216284, alpha: 0) : #colorLiteral(red: 1, green: 0.6989120801, blue: 0.3105216284, alpha: 1)
            }
        }
    }
    
    
    
    var emojiChoices = ["🦄","👻","🎃","🐛"]
    
    var emoji = Dictionary<Int, String>()
    
    func emoji(for card: Card) ->  String {
        if emoji[card.indentifier] == nil {
            if emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.indentifier] = emojiChoices.remove(at: randomIndex)
                print(emojiChoices)
            }
        }
        
        if emoji[card.indentifier] != nil{
            return emoji[card.indentifier]!
        } else {
            return "?"
        }
    }
    
        
    
}

