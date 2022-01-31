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
    
    var gamerPoint = (firstGamerPoimt : 0, secondGamerPoint : 0)
    var gamerScore = (firstGamerScore : 0, secondGamerScore : 0)
    var gamerQueue : Int = 1
    
    var maxStatus : Int = 5
    var nowStatus : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "arkaPlan")!)
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        <#code#>
    }
    
}

