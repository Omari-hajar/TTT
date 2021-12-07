//
//  ViewController.swift
//  TTT
//
//  Created by Hajar Alomari on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    //Delcare UI elements
    
    @IBOutlet weak var OScore: UILabel!
    @IBOutlet weak var XScore: UILabel!
    // buttons
    
    @IBOutlet var BtnCollection: [UIButton]!
    
 
    
    @IBOutlet weak var XWinner: UILabel!
    @IBOutlet weak var OWinner: UILabel!
    
    @IBOutlet weak var XPlayLabel: UIImageView!
    @IBOutlet weak var OPlayLabel: UIImageView!
    //Images
 
    @IBOutlet weak var image1IV: UIImageView!
    @IBOutlet weak var image2IV: UIImageView!
    @IBOutlet weak var image3IV: UIImageView!
    @IBOutlet weak var image4IV: UIImageView!
    @IBOutlet weak var image5IV: UIImageView!
    @IBOutlet weak var image6IV: UIImageView!
    @IBOutlet weak var image7IV: UIImageView!
    @IBOutlet weak var image8IV: UIImageView!
    @IBOutlet weak var image9IV: UIImageView!
    
    
    var playIndex = 0
    var movesLeft = 9
    
    var imagesList: [UIImageView] = []
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        XPlayLabel.image = UIImage(named: "onX")
        OPlayLabel.image = UIImage(named: "offO")
        imagesList = setImagesList()
       
        
    }


    @IBAction func playChoicePressed(_ sender: UIButton) {
    
        setGame()
        
        if  game.checkWinner() == false && movesLeft > 0{
            if let index = BtnCollection.firstIndex(of: sender) {
                playIndex = index
            }
            let move = game.play(index: playIndex)
            if move == "X"{
            imagesList[playIndex].image = UIImage(named: "onXbtn")
            }else {
            imagesList[playIndex].image = UIImage(named: "onObtn")
            }
            movesLeft -= 1
            sender.isEnabled = false
            
        }
        if game.checkWinner(){
            if game.currentPlayer == "X"{
                XWinner.isHidden = true
                OWinner.isHidden = false
            } else if game.currentPlayer == "O"{
                XWinner.isHidden = false
                OWinner.isHidden = true
            }
            XScore.text = "Score: \(game.xPlayer.score)"
            OScore.text = "Score: \(game.oPlayer.score)"
            resetGame()
        }
        
        if movesLeft <= 0{
            resetGame()
        }
    }
    
    
    //create an array of UIImage
    func setImagesList() -> [UIImageView]{
        var tempList: [UIImageView] = []
        tempList.append(image1IV)
        tempList.append(image2IV)
        tempList.append(image3IV)
        tempList.append(image4IV)
        tempList.append(image5IV)
        tempList.append(image6IV)
        tempList.append(image7IV)
        tempList.append(image8IV)
        tempList.append(image9IV)
        
        return tempList
    }
    
    
    func resetGame(){
        game.resetGame()
        movesLeft = 9
        for btn in BtnCollection{
            btn.isEnabled = true
        }
        for image in imagesList {
            image.image = UIImage(named: "emptyCircle")
        }
        
    }
    
    //set icons for who turn it is
    func setGame(){
        XWinner.isHidden = true
        OWinner.isHidden = true
        if game.currentPlayer == "X"{
            XPlayLabel.image = UIImage(named: "offX")
            OPlayLabel.image = UIImage(named: "onO")
            
        } else if game.currentPlayer == "O"{
            XPlayLabel.image = UIImage(named: "onX")
            OPlayLabel.image = UIImage(named: "offO")
        }
    }
}

