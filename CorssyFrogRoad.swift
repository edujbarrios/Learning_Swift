import SpriteKit

class GameScene: SKScene {
    // Create a sprite for the frog character
    let frog = SKSpriteNode(imageNamed: "frog")

    // Create an array to hold the car sprites
    var cars = [SKSpriteNode]()

    override func didMove(to view: SKView) {
        // Set the background color to grass green
        self.backgroundColor = .green

        // Add the frog to the center of the screen
        frog.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.addChild(frog)

        // Create and add the car sprites to the scene
        for i in 0..<5 {
            let car = SKSpriteNode(imageNamed: "car")
            car.position = CGPoint(x: CGFloat(i) * 100 + 50, y: 0)
            self.addChild(car)
            cars.append(car)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Get the location of the touch
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)

        // Move the frog to the touch location
        let action = SKAction.move(to: touchLocation, duration: 1)
        frog.run(action)
    }

    override func update(_ currentTime: TimeInterval) {
        // Move the cars across the screen
        for car in cars {
            car.position.x += 10
            if car.position.x > self.size.width {
                car.position.x = -50
            }
        }

        // Check for collision between frog and cars
        for car in cars {
            if car.frame.intersects(frog.frame) {
                print("Game over!")
            }
        }
    }
}
