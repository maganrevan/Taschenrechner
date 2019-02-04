//
//  ViewController.swift
//  Taschenrechner
//
//  Created by Magnus Kruschwitz on 22.01.19.
//  Copyright © 2019 Magnus Kruschwitz. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    
    @IBOutlet weak var closeButton: NSButton!
    @IBOutlet weak var eingabeZahl1: NSTextField!
    @IBOutlet weak var eingabeZahl2: NSTextField!
    @IBOutlet weak var labelErgebnis: NSTextField!
    @IBOutlet weak var opAddition: NSButton!
    @IBOutlet weak var opSubtraktion: NSButton!
    @IBOutlet weak var opMultiplikation: NSButton!
    @IBOutlet weak var opDivision: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func closeButtonAction(_ sender: NSButtonCell) {
        NSApplication.shared.terminate(self)
    }
    
    @IBAction func berechnenClicked(_ sender: NSButton) {
        let aOptions = [opDivision, opMultiplikation, opAddition, opSubtraktion]
        let aCalculator = [changeInDouble(sInput: (eingabeZahl1?.stringValue)!), changeInDouble(sInput: (eingabeZahl2?.stringValue)!)]
        let sErrorMessage = "Nicht definiert!"
        
        for (index, op) in aOptions.enumerated(){
            if(op?.state == NSControl.StateValue.on){
                switch(index){
                    case 2:
                        labelErgebnis.doubleValue = aCalculator[0] + aCalculator[1]
                        break
                    case 3:
                        labelErgebnis.doubleValue = aCalculator[0] - aCalculator[1]
                        break
                    case 1:
                        labelErgebnis.doubleValue = aCalculator[0] * aCalculator[1]
                        break
                    case 0:
                        if(aCalculator[1] != 0){
                            labelErgebnis.doubleValue = aCalculator[0] / aCalculator[1]
                        }
                        else{
                            labelErgebnis.stringValue = sErrorMessage
                        }
                        break
                    default:
                        break
                }
                labelErgebnis.sizeToFit()
            }
        }
    }
}


func changeInDouble(sInput:String) -> Double{
    var result = ""
    var counter = 0
    
    for char in sInput{
        if(char == "," || char == "."){
            counter += 1
            if(counter <= 1){
                result += "."
                //replaced first solution
            }
            else{
                result += ""
                //cleared every other solutions
            }
        }
        else{
            result += String(char)
        }
    }
    
    if(result.count > 0){
        return Double(result)!
    }
    else{
        return 0
    }
}
