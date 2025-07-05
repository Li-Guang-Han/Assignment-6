//
//  ResultViewController.swift
//  Assignment 6
//
//  Created by Garrett Li on 6/29/25.
//


import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultStackView: UIStackView!

    var usdAmount: Int = 0
    var selectedCurrencies: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        displayConvertedResults()
    }

    func displayConvertedResults() {
        let usdLabel = UILabel()
        usdLabel.textColor = .label
        usdLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 16, weight: .medium)
        usdLabel.textAlignment = .center
        usdLabel.text = "Amount in USD: \(usdAmount)"
        resultStackView.addArrangedSubview(usdLabel)

        for currency in selectedCurrencies {
            let label = UILabel()
            label.textColor = .label
            label.font = UIFont.monospacedDigitSystemFont(ofSize: 16, weight: .regular)
            label.textAlignment = .center
            label.text = Currency.formattedLabel(for: currency, usd: usdAmount)
            resultStackView.addArrangedSubview(label)
        }
    }

    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}



