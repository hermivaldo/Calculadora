//
//  ViewController.swift
//  Calculadora
//
//  Created by hermivaldo braga on 07/03/2018.
//  Copyright © 2018 hermivaldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbConta: UILabel!
    
    @IBAction func btnClickNumber(_ sender: UIButton) {
        
        if (lbConta.text!.elementsEqual("0")){
            lbConta.text = sender.titleLabel?.text!
        }else{
            
            lbConta.text = "\(lbConta.text!)\(sender.titleLabel!.text!)"
        }
        
    }
    
    @IBAction func zerarValores(_ sender: Any) {
        lbConta.text = "0"
    }
    
    @IBAction func btnOperation(_ sender: UIButton) {
        let operationSignal = sender.titleLabel?.text!
        let wordList = ["+", "-", "*", "/"]
        var operationExists: String = ""
        let sucess = wordList.contains(where: {
            if (lbConta.text!.contains($0) == true){
                operationExists = $0
            }
            return lbConta.text!.contains($0)
        });
        
        if (operationSignal!.elementsEqual("=")){
            if (sucess){
                var resultado = 0.0
                switch operationExists {
                case "+":
                     resultado = lbConta.text!.split(separator: operationExists.first!).reduce(0, {$0 + Double($1)!})
                case "-":
                     resultado = lbConta.text!.split(separator: operationExists.first!).reduce(0, {$0 - Double($1)!})
                case "*":
                     resultado = lbConta.text!.split(separator: operationExists.first!).reduce(0, { Double($1)! * $0 })
                case"/":
                     resultado = lbConta.text!.split(separator: operationExists.first!).reduce(0, { Double($1)! / $0})
                default:
                    resultado = 0.0
                }
                
                
                lbConta.text = "\(resultado)"
            }
        }else{
            
            
            if (!sucess){
                lbConta.text = "\(lbConta.text!)\(operationSignal!)"
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

