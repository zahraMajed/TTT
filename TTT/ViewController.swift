//
//  ViewController.swift
//  TTT
//
//  Created by admin on 05/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    var isWin = false
    var playArray = [0,0,0,0,0,0,0,0,0]
    let  winningCombination = [
        [ 0, 1, 2 ],[ 3, 4, 5 ],
        [ 6, 7, 8 ],[ 0, 3, 6 ],
        [ 1, 4, 7 ],[ 2, 5, 8 ],
        [ 0, 4, 8 ],[ 2, 4, 6 ],
    ]
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.isHidden = true
    }
    

    @IBAction func play(_ sender: UIButton) {
        if playArray[sender.tag - 1] == 0 && isWin == false {
            playArray[sender.tag - 1] = activePlayer
            if activePlayer == 1 {
                sender.backgroundColor = UIColor.red
                activePlayer = 2
            } else {
                sender.backgroundColor = UIColor.blue
                activePlayer = 1
            }
        }
        
        for combination in winningCombination {
            if playArray[combination[0]] != 0 && playArray[combination[0]] == playArray[combination[1]] && playArray[combination[1]] == playArray[combination[2]] {
                isWin = true
                if playArray[combination[0]] == 1 {
                    winnerLabel.text = "Congtars Red won"
                }else {
                    winnerLabel.text = "Congtars Blue won"
                }
                winnerLabel.isHidden = false
            }
        }
        
    }
    
    @IBAction func reGame(_ sender: Any) {
        activePlayer = 1
        isWin = false
        playArray = [0,0,0,0,0,0,0,0,0]
        winnerLabel.isHidden = true
        
        for i in 1...9 {
            let btn = view.viewWithTag(i) as? UIButton
            btn?.backgroundColor = UIColor.systemFill
        }
        
    }
}

