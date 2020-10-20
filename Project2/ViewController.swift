import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
//    var countries = [String]()
    var countries = ["estonia", "france", "germany", "ireland", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

    var score = 0
    var correctAnswer = 0
    var scoreCount = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor =  UIColor.lightGray.cgColor
        button2.layer.borderColor =  UIColor.lightGray.cgColor
        button3.layer.borderColor =  UIColor.lightGray.cgColor

        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        scoreCount += 1

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased())? | Score: \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        print(scoreCount)
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        let acGameOver = UIAlertController(title: "Game Over", message: "That's the game. You've played 10 times. Your final score is \(score)", preferredStyle: .alert)
        
        if scoreCount == 10 {
            acGameOver.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
            present(acGameOver, animated: true)
        } else {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
    
    
    

}

