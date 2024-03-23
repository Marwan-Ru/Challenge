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
    var etape : Int = 0
    var niveau : Int = 1
    
    var secret : String = ""
    
    @IBOutlet weak var vignette : UIImageView!

    @IBOutlet weak var mot: UILabel!
    
    @IBOutlet weak var message: UILabel!
    
    @IBAction func clic(_ sender: UIButton) {
        let lettre : String  = sender.titleLabel!.text!
        let previousLAD = lettresADeviner
        var i = 0
        for char in secret{
            if char == Character(lettre) && i >= first && i <= last{
                lettresADeviner -= 1
                // On remplace le char à un certain index
                let indexValue = mot.text!.index(mot.text!.startIndex, offsetBy: i)
                mot.text!.replaceSubrange(indexValue...indexValue, with: lettre)
            }
            i += 1
        }
        if lettresADeviner == 0 {
            finPartie("Gagné !")
        } else if lettresADeviner == previousLAD {
            //potence
            etape+=1
            vignette.image = UIImage(named: "pendu\(etape)")
            if(etape >= 11){
                //perdu
                finPartie("Perdu :(")
            }
            print(etape)
        }
    }
    
    @IBOutlet var clavier: [UIButton]!
    
    func finPartie(_ chaine: String) {
        message.text = chaine
        for touche in clavier {
            touche.isEnabled = false
        }
    }


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
        print("Le mot a deviner est \(secret)")
        
        var i = 0
        mot.text! = ""
        for char in secret{
            if i >= first && i <= last{
                mot.text!.insert("-", at: mot.text!.endIndex)
            }else{
                mot.text!.insert(char, at: mot.text!.endIndex)
            }
            i += 1
        }
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
