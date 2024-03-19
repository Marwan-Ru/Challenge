//
//  ViewController.swift
//  TD2-Pendu
//
//  Created by Marwan Ait Addi on 19/03/2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pvc = segue.destination as! PenduViewController
        let b = sender as! UIButton
        pvc.niveau = b.tag
    }


}

