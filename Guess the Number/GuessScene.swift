//
//  GuessScene.swift
//  Guess the Number
//
//  Created by Serhat  Şimşek  on 30.03.2023.
//

import UIKit

class GuessScene: UIViewController {
    
    @IBOutlet weak var kalanHakLabel: UILabel!
    @IBOutlet weak var talimalLabel: UILabel!
    @IBOutlet weak var girdiAlaniOutlet: UITextField!
    
    var rastgeleSayi:Int?
    var kalanHak:Int = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rastgeleSayi = Int.random(in: 0...100)
        print("----------------------rastgele sayım: \(rastgeleSayi!)------------------")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultData = sender as? Bool {
            let gidilecekVC = segue.destination as! ResultScene
            gidilecekVC.sonuc = resultData
            
        }
    }
    
    @IBAction func tahminEtButton(_ sender: Any) {
        if let girilenSayi = girdiAlaniOutlet.text, !girilenSayi.isEmpty{
            
            if let tahmin = Int(girilenSayi) {
                kalanHak -= 1
                talimalLabel.isHidden = false
                kalanHakLabel.text = "Kalan Hak: \(kalanHak)"
                
                    if tahmin == rastgeleSayi! {
                        // sayfa geçişi olcak
                        let sonuc = true
                        performSegue(withIdentifier: "guessToResult", sender: sonuc)
                        return
                      
                    }
                    if tahmin > rastgeleSayi! {
                        
                        talimalLabel.text = "Daha Düşük Gir"
                        girdiAlaniOutlet.text = ""
                    }
                    if tahmin < rastgeleSayi! {
                        
                        talimalLabel.text = "Daha Yüksek Gir"
                        girdiAlaniOutlet.text = ""
                    }
                    if (kalanHak < 1) {
                        let sonuc = false
                        performSegue(withIdentifier: "guessToResult", sender: sonuc)
                    }
                girdiAlaniOutlet.text = ""
                
            } else {
               
                talimalLabel.text = "Sayı Giriniz!"
                talimalLabel.isHidden = false
                
                if (kalanHak < 1) {
                    let sonuc = false
                    performSegue(withIdentifier: "guessToResult", sender: sonuc)
                }
            }
        } else {
            talimalLabel.text = "Boş Bırakmayınız"
            talimalLabel.isHidden = false
        }
        
    }
}
