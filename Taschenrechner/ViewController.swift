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
        let aCalculator = [Double(eingabeZahl1.stringValue.replaceFirst(of: ",", with: ".").replaceAll(of: ",", with: "")), Double(eingabeZahl2.stringValue.replaceFirst(of: ",", with: ".").replaceAll(of: ",", with: ""))]
        let sErrorMessage = "Nicht definiert!"
        
        for (index, op) in aOptions.enumerated(){
            if(op?.state == NSControl.StateValue.on){
                switch(index){
                    case 2:
                        labelErgebnis.doubleValue = aCalculator[0]! + aCalculator[1]!
                        break
                    case 3:
                        labelErgebnis.doubleValue = aCalculator[0]! - aCalculator[1]!
                        break
                    case 1:
                        labelErgebnis.doubleValue = aCalculator[0]! * aCalculator[1]!
                        break
                    case 0:
                        if(aCalculator[1] != 0){
                            labelErgebnis.doubleValue = aCalculator[0]! / aCalculator[1]!
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


extension String {
    
    public func replaceFirst(of pattern:String,
                             with replacement:String) -> String {
        if let range = self.range(of: pattern){
            return self.replacingCharacters(in: range, with: replacement)
        }else{
            return self
        }
    }
    
    public func replaceAll(of pattern:String,
                           with replacement:String,
                           options: NSRegularExpression.Options = []) -> String{
        do{
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let range = NSRange(0..<self.utf16.count)
            return regex.stringByReplacingMatches(in: self, options: [],
                                                  range: range, withTemplate: replacement)
        }catch{
            NSLog("replaceAll error: \(error)")
            return self
        }
    }
    
}

//source String extension https://gist.github.com/mcxiaoke/b03f8c989c0cb36ccde50555b596f0f0
