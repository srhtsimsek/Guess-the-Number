//
//  ResultScene.swift
//  Guess the Number
//
//  Created by Serhat  Şimşek  on 30.03.2023.
//

import UIKit

class ResultScene: UIViewController {

    @IBOutlet weak var resimAlanimOutlet: UIImageView!
    
    @IBOutlet weak var sonucLabel: UILabel!
    
    var sonuc:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        print(sonuc!)
        
        if sonuc! {
            sonucLabel.text = "Kazandın!"
            resimAlanimOutlet.image = UIImage(named: "dogruCevapFotosu")
            
            
        } else {
            sonucLabel.text = "Kaybettin!"
            resimAlanimOutlet.image = UIImage(named: "yanlisCevapFotosu")
        }
    }
    

    @IBAction func tekrarOynaButton(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
}
