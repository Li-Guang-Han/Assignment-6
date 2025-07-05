//
//  ViewController.swift
//  Assignment 6
//
//  Created by Garrett Li on 6/29/25.
//


import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var eurSwitch: UISwitch!
    @IBOutlet weak var jpySwitch: UISwitch!
    @IBOutlet weak var cadSwitch: UISwitch!
    @IBOutlet weak var gbpSwitch: UISwitch!
    var selectedCurrencies: [String] = []
    var usdAmount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
        usdTextField.delegate = self

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func convertTapped(_ sender: UIButton) {
        errorLabel.text = ""

        guard let text = usdTextField.text, let amount = Int(text) else {
            errorLabel.text = "Please enter a valid integer."
            return
        }

        selectedCurrencies = []
        usdAmount = amount

        if eurSwitch.isOn { selectedCurrencies.append("EUR") }
        if jpySwitch.isOn { selectedCurrencies.append("JPY") }
        if cadSwitch.isOn { selectedCurrencies.append("CAD") }
        if gbpSwitch.isOn { selectedCurrencies.append("GBP") }

        if selectedCurrencies.isEmpty {
            errorLabel.text = "Please select at least one currency."
            return
        }

        performSegue(withIdentifier: "showResults", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults",
           let destination = segue.destination as? ResultViewController {
            destination.usdAmount = usdAmount
            destination.selectedCurrencies = selectedCurrencies
        }
    }
}

