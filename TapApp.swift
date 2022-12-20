import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBAction func buttonTapped(_ sender: Any) {
        label.text = "Button was tapped!"
    }
}