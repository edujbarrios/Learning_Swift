
import Foundation

print("Enter a name: ")

if let name = readLine() {
    print("Picking petals off a Loves Me Not flower for \(name)...")

    let love = true
    for _ in 1...69 {
        if love {
            print("Loves me")
        } else {
            print("Loves me not")
        }
        love = !love
    }
}
