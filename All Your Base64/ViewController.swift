//
//  ViewController.swift
//  All Your Base64
//
//  Created by Jim Zajkowski on 1/9/20.
//  Copyright © 2020 University of Michigan. All rights reserved.
//

import Cocoa
import Carbon.HIToolbox

class ViewController: NSViewController, NSTextFieldDelegate {

    @IBOutlet weak var humanTextField: NSTextField!
    @IBOutlet weak var base64TextField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        humanTextField.delegate = self
        base64TextField.delegate = self
    }

    func controlTextDidChange(_ obj: Notification) {
        if let textField = obj.object as? NSTextField, textField == humanTextField {
            let input = humanTextField.stringValue.data(using: .utf8)
            if let base64Encoded = input?.base64EncodedString() {
                base64TextField.stringValue = base64Encoded
            }

        } else if let textField = obj.object as? NSTextField, textField == base64TextField {
            if let data = Data(base64Encoded: base64TextField.stringValue),
                let decoded = String(data: data, encoding: .utf8){
                humanTextField.stringValue = decoded
            } else {
                humanTextField.stringValue = "[can't decode]"
            }
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

