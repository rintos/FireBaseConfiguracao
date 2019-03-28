//
//  ViewController.swift
//  FireBaseConfiguracao
//
//  Created by Victor on 21/03/2019.
//  Copyright © 2019 Rinver. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var pontosLabel:UILabel!
    
    let fireBaseReference = Database.database().reference()
    //reference(withPath: "" )

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("rodando app firebase")
        
       
        let pacoteUser = fireBaseReference.child("pontuacao").child("valor")
        //remover noh
        //pacoteUser.removeValue()
        
        //Recupera dados do FireBase
        pacoteUser.observe(DataEventType.value) { (dados) in
            
            let pontos = dados.value as! String
            self.pontosLabel.text = pontos
        }
    }


}

