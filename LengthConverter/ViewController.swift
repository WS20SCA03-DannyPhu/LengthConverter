//
//  ViewController.swift
//  LengthConverter
//
//  Created by danny phu on 4/23/20.
//  Copyright © 2020 BMCC. All rights reserved.
//

import UIKit;

/*
struct Unit {
    var centimeter: Double;
    
    init(centimeter: Double) {
        self.centimeter = centimeter;
    }
    
    init(inch: Double) {
        centimeter = inch / 2.54;
    }
    
    init(meter: Double) {
        centimeter = meter / 100;
    }
    
    init(yard: Double) {
        centimeter = yard / 91.44;
    }
    
    mutating func inch() {
        centimeter *= 2.54;
    }
    
    mutating func meter()  {
        centimeter *= 100;
    }
    
    mutating func yard() {
        centimeter *= 91.44;
    }
}  */

class ViewController: UIViewController, UITextFieldDelegate {
    
    let unit: [Double] = [
        2.54,   //0  cent and inch
        100,    //1  cent and meter
        91.44,  //2  cent and yard
        39.37,  //3  inch and meter
        36,     //4  inch and yard
        1.094,  //5  meter and yard
    ];
    
    @IBOutlet weak var centButton: UIButton!
    @IBOutlet weak var inchButton: UIButton!;
    @IBOutlet weak var yardButton: UIButton!;
    @IBOutlet weak var metrButton: UIButton!;
    
    @IBOutlet weak var centLabel: UILabel!;
    @IBOutlet weak var inchLabel: UILabel!;
    @IBOutlet weak var metrLabel: UILabel!;
    @IBOutlet weak var yardLabel: UILabel!;
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder();
            return true;
        }
    
        func textFieldDidEndEditing(_ textField: UITextField) {
            let s: String = textField.text!;
            let num: Double = Double(s)!;
            //let conv: Unit = Unit(centimeter: num)

            if centButton.isSelected == true{
            /*  centLabel.text = "\(conv.centimeter)";
                inchLabel.text = "\(conv.inch)";
                metrLabel.text = "\(conv.meter)";
                yardLabel.text = "\(conv.yard)"; */
                centLabel.text = String(format: "%.4f", num);
                inchLabel.text = String(format: "%.4f", num / unit[0]);
                metrLabel.text = String(format: "%.4f", num / unit[1]);
                yardLabel.text = String(format: "%.4f", num / unit[2]);

            } else if inchButton.isSelected == true {
                inchLabel.text = String(format: "%.4f", num);
                centLabel.text = String(format: "%.4f", num * unit[0]);
                metrLabel.text = String(format: "%.4f", num / unit[3]);
                yardLabel.text = String(format: "%.4f", num / unit[4]);
                
            } else if metrButton.isSelected == true {
                metrLabel.text = String(format: "%.4f", num);
                centLabel.text = String(format: "%.4f", num * unit[1]);
                inchLabel.text = String(format: "%.4f", num * unit[3]);
                yardLabel.text = String(format: "%.4f", num * unit[5]);
                
            } else if yardButton.isSelected == true {
                yardLabel.text = String(format: "%.4f", num);
                centLabel.text = String(format: "%.4f", num * unit[2]);
                inchLabel.text = String(format: "%.4f", num * unit[4]);
                metrLabel.text = String(format: "%.4f", num / unit[5]);
            }
//            else if num = nil {
//                errorLabel.text = "Not a valid entry";
        
            else {
            errorLabel.text = "Must select unit above"
            }
            
            
    } //closing bracket for textFieldDidEndEditing

    
    @IBAction func centButton(_ sender: UIButton) {
        centButton.isSelected = true;
        inchButton.isSelected = false;
        metrButton.isSelected = false;
        yardButton.isSelected = false;
        textField.text = "";
        errorLabel.text = "";
        centLabel.text = "";
        inchLabel.text = "";
        metrLabel.text = "";
        yardLabel.text = "";
    }
    
    @IBAction func inchButton(_ sender: UIButton) {
        centButton.isSelected = false;
        inchButton.isSelected = true;
        metrButton.isSelected = false;
        yardButton.isSelected = false;
        textField.text = "";
        errorLabel.text = "";
        centLabel.text = "";
        inchLabel.text = "";
        metrLabel.text = "";
        yardLabel.text = "";
    }

    @IBAction func metrButton(_ sender: UIButton) {
        centButton.isSelected = false;
        inchButton.isSelected = false;
        metrButton.isSelected = true;
        yardButton.isSelected = false;
        textField.text = "";
        errorLabel.text = "";
        centLabel.text = "";
        inchLabel.text = "";
        metrLabel.text = "";
        yardLabel.text = "";
    }
    
    @IBAction func yardButton(_ sender: UIButton) {
        centButton.isSelected = false;
        inchButton.isSelected = false;
        metrButton.isSelected = false;
        yardButton.isSelected = true;
        textField.text = "";
        errorLabel.text = "";
        centLabel.text = "";
        inchLabel.text = "";
        metrLabel.text = "";
        yardLabel.text = "";
    }
    
} // last bracket, closing for class




