//
//  ViewController.swift
//  textFieldMask
//
//  Created by Edilson Borges on 29/03/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textFieldCpfCnpj: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.maskCpfCnpj()
    }
    
    
  
    private func maskCpfCnpj(){
        self.textFieldCpfCnpj.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        let orinalText = textField.text?.onlyNumber ?? ""
        if let text = textField.text, text.clearMaskCpfCnpj.count <= 11 {
            textField.text = orinalText
            textField.applyFilterMask(mask: "NNN.NNN.NNN-NN", textField: textField)
        }else{
            textField.text = orinalText
            textField.applyFilterMask(mask: "NN.NNN.NNN/NNNN-NN", textField: textField)
        }
    }
    

    @IBAction func button(_ sender: Any) {
        
        print(self.textFieldCpfCnpj.text!.clearMaskCpfCnpj)
    }
    
}

