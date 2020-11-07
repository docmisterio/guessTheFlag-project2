import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = ["estonia", "france", "germany", "ireland", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    var score = 0
    var correctAnswer = 0
    var scoreCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRightBarButtonItem()
        setUpButtons()
        
        askQuestion()
    }
    
    func setRightBarButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "score", style: .plain, target: self, action: #selector(showScoreTapped))
    }
    
    func setUpButtons() {
        let buttons = [button1, button2, button3]
        
        for button in buttons {
            button?.layer.borderWidth = 1
            button?.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        scoreCount += 1
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased())?"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            message = "Your score is \(score)"
            score += 1
        } else {
            title = "Wrong"
            message = "The correct answer was \(countries[correctAnswer].localizedCapitalized). Your score is \(score)"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let acGameOver = UIAlertController(title: "Game Over", message: "That's the game. You've played 10 times. Your final score is \(score)", preferredStyle: .alert)
        
        if scoreCount == 10 {
            acGameOver.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
            present(acGameOver, animated: true)
        } else {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
    }
    
    @objc func showScoreTapped() {
        let scoreAlert = UIAlertController(title: "Score", message: "Your Score is \(score).", preferredStyle: .alert)
        scoreAlert.addAction(UIAlertAction(title: "mmmk", style: .default, handler: nil))
        
        present(scoreAlert, animated: true)
    }
}

