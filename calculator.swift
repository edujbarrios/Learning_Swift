import UIKit

class CalculatorViewController: UIViewController {
    // MARK: - Properties

    private var currentNumber = ""
    private var leftValue = ""
    private var rightValue = ""
    private var result = ""
    private var currentOperator: Operator?

    // MARK: - Outlets

    @IBOutlet weak var resultLabel: UILabel!

    // MARK: - Actions

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        // Get the text of the button that was tapped
        let number = sender.title(for: .normal)!
        currentNumber += number
        resultLabel.text = currentNumber
    }

    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        // Get the operator of the button that was tapped
        let op = Operator(rawValue: sender.title(for: .normal)!)!
        currentOperator = op
        leftValue = currentNumber
        currentNumber = ""
    }

    @IBAction func equalButtonTapped(_ sender: UIButton) {
        rightValue = currentNumber
        currentNumber = ""
      
      // Perform the calculation
        switch currentOperator! {
        case .plus:
            result = "\(Double(leftValue)! + Double(rightValue)!)"
        case .minus:
            result = "\(Double(leftValue)! - Double(rightValue)!)"
        case .times:
            result = "\(Double(leftValue)! * Double(rightValue)!)"
        case .dividedBy:
            result = "\(Double(leftValue)! / Double(rightValue)!)"
        }

        // Update the result label
        resultLabel.text = result
    }

    @IBAction func clearButtonTapped(_ sender: UIButton) {
        // Reset all the values and the result label
        currentNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperator = nil
        resultLabel.text = "0"
    }
}

// MARK: - Operator

enum Operator: String {
    case plus = "+"
    case minus = "-"
    case times = "×"
    case dividedBy = "÷"
}
