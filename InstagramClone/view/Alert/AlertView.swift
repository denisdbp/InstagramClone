//
//  AlertView.swift
//  InstagramClone
//
//  Created by Admin on 26/08/22.
//

import Foundation
import UIKit

class AlertView {
    
    // Funcao de alerta com handler podendo ser ou nao utilizado, por isso esta usando um opcional "?"
    public func alertLogin(title:String, message:String, controller:UIViewController, handler: ((UIAlertAction)->Void)?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: handler)
        alert.addAction(okButton)
        controller.present(alert, animated: true, completion: nil)
    }
}
