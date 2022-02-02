//
//  ViewController.swift
//  diceGame
//
//  Created by Furkan Erzurumlu on 28.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblGamer1Score: UILabel!
    @IBOutlet weak var lblGamer2Score: UILabel!
    @IBOutlet weak var lblGamer1Point: UILabel!
    @IBOutlet weak var lblGamer2Point: UILabel!
    @IBOutlet weak var imgGamer1Status: UIImageView!
    @IBOutlet weak var imgGamer2Status: UIImageView!
    @IBOutlet weak var imgZar1: UIImageView!
    @IBOutlet weak var imgZar2: UIImageView!
    @IBOutlet weak var lblResult: UILabel!
    
    var gamerPoint = (firstGamerPoint : 0, secondGamerPoint : 0)
    var gamerScore = (firstGamerScore : 0, secondGamerScore : 0)
    var gamerQueue : Int = 1
    
    var maxStatus : Int = 5
    var nowStatus : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "arkaPlan")!)
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if nowStatus > maxStatus{
            
            return
        }
        
        generateValue()
    }
    
    func setResult(zar1 : Int, zar2 : Int){
        
        if gamerQueue == 1{
            gamerPoint.firstGamerPoint = zar1 + zar2
            lblGamer1Point.text = String(gamerPoint.firstGamerPoint)
            imgGamer1Status.image = UIImage(named: "bekle")
            imgGamer2Status.image = UIImage(named: "onay")
            lblResult.text = "Sıra 2. Oyuncuda"
            gamerQueue = 2
            lblGamer2Point.text = "0"
        }else{
            gamerPoint.secondGamerPoint = zar1 + zar2
            lblGamer2Point.text = String(gamerPoint.secondGamerPoint)
            imgGamer1Status.image = UIImage(named: "onay")
            imgGamer2Status.image = UIImage(named: "bekle")
            gamerQueue = 1
            
            if gamerPoint.firstGamerPoint > gamerPoint.secondGamerPoint {
                gamerScore.firstGamerScore += 1
                lblResult.text = "\(nowStatus). Seti 1. Oyunucu Kazandı"
                nowStatus += 1
                
                lblGamer1Score.text = String(gamerScore.firstGamerScore)
                
            }else if gamerPoint.secondGamerPoint > gamerPoint.firstGamerPoint{
                
                gamerScore.secondGamerScore += 1
                lblResult.text = "\(nowStatus). Seti 2. Oyuncu Kazandı"
                nowStatus += 1
                lblGamer2Score.text = String(gamerScore.secondGamerScore)
            }else {
                lblResult.text = "\(nowStatus). Set Berabere Bitti! "
                
            }
            gamerPoint.firstGamerPoint = 0
            gamerPoint.secondGamerPoint = 0
            
            
            
        }
        
    }
    
    
    func generateValue(){
        let zar1 = arc4random_uniform(6) + 1
        let zar2 = arc4random_uniform(6) + 1
        
        imgZar1.image = UIImage(named: String(zar1))
        imgZar2.image = UIImage(named: String(zar2))
        
        setResult(zar1: Int(zar1), zar2: Int(zar2))
        
        if nowStatus > maxStatus{
            if gamerScore.firstGamerScore > gamerScore.secondGamerScore{
                lblResult.text = "Oyunu Birinic 1. Oyuncu Kazandı"
            }else{
                lblResult.text = "Oyunu İkinci 2. Oyuncu Kazandı"
            }
        }
        
    }
}

