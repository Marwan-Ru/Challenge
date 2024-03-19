//
//  PenduViewController.swift
//  TD2-Pendu
//
//  Created by Marwan Ait Addi on 19/03/2024.
//

import UIKit

class PenduViewController: UIViewController {

    var mots = [
        "HELICOPTERE",
        "BANANE",
        "PROGRAMME",
        "CODER",
        "BUT"
    ]
    
    var first : Int = 0
    var last : Int = 0
    var lettresADeviner : Int = 0
    
    var secret : String = ""
    
    @IBOutlet weak var vignette : UIImageView!

    @IBOutlet weak var mot: UILabel!
    
    @IBOutlet weak var message: UILabel!
    
    @IBAction func clic(_ sender: UIButton) {
    }
    var niveau : Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Nous sommes au niveau \(niveau)")
        
        secret = mots.randomElement()!
        
        switch niveau {
            case 1: first = 1; last = secret.count - 2 ; break
            case 2: first = 1; last = secret.count - 1 ; break
            case 3: first = 0; last = secret.count - 0 ; break
        default: break
        }
        lettresADeviner = last - first + 1
        print("lettres à deviner \(lettresADeviner)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
