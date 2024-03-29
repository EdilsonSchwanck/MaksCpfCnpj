//
//  StringUltis.swift
//  textFieldMask
//
//  Created by Edilson Borges on 29/03/24.
//

import Foundation
import UIKit

extension UITextField {
    
    func applyFilterMask(mask: String, textField: UITextField){
        var index = mask.startIndex
        var textWithMask = ""
        
        var i = text!.startIndex
        while index < mask.endIndex{
            if i >= text!.endIndex {
                break
            }
            
            let char = mask[index]
            switch char {
            case "N" :
                if text![i].isNumber {
                    textWithMask.append(text![i])
                }
                i = text!.index(after: i)
                
            case "C":
                if text![i].isLetter {
                    textWithMask.append(text![i].uppercased())
                }
                i = text!.index(after: i)
                
            case "c":
                if text![i].isLetter {
                    textWithMask.append(text![i].lowercased())
                }
                i = text!.index(after: i)
                
            case "X":
                if text![i].isLetter || text![i].isNumber{
                    textWithMask.append(text![i])
                }
                i = text!.index(after: i)
                
            case "%":
                if text![i].isLetter || text![i].isNumber{
                    textWithMask.append(text![i])
                }
                i = text!.index(after: i)
                
            case "U":
                if text![i].isUppercase || text![i].isNumber{
                    textWithMask.append(text![i].uppercased())
                }
                i = text!.index(after: i)
                
            case "u":
                if text![i].isLowercase || text![i].isNumber{
                    textWithMask.append(text![i].lowercased())
                }
                i = text!.index(after: i)
                
            case "*":
                textWithMask.append(text![i])
                i = text!.index(after: i)
                
            default:
                textWithMask.append(char)
            }
            index = mask.index(after: index)
        }
        self.text = textWithMask
        
    }
    
}

extension String {
     
    var clearMaskCpf: String {
        var clean = self
        clean.removeAll { $0 == "." || $0 == "-" }
        clean.removeAll { $0 == "-" || $0 == " " }
        
        return clean
    }
    
    var clearMaskCnpj: String {
        var clean = self
        clean.removeAll { $0 == "." || $0 == "/" ||  $0 == "-"}
        return clean
    }
    
    var clearMaskCpfCnpj : String {
        let trimmedSelf = (self as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedSelf.count == 14 {
            return trimmedSelf.clearMaskCpf
        }
        return trimmedSelf.clearMaskCnpj
    }
    
    
    var onlyNumber : String {
        let okayChars = Set("1234567890")
        return self.filter {okayChars.contains($0)}
    }
    
}
