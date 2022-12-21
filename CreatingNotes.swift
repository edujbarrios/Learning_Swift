
import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let noteText = "Este es un ejemplo de una nota"
    
    let fileName = "nota.txt"
    let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    let fileURL = dir?.appendingPathComponent(fileName)
    
    do {
      try noteText.write(to: fileURL!, atomically: false, encoding: .utf8)
    } catch {
      print("Error al escribir la nota")
    }
  }
}
