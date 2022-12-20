import Foundation

// Create a struct to represent the player's character
struct Character {
    var name: String
    var health: Int
    var attackPower: Int
}

// Create a function to handle player attacks
func attack(attacker: Character, defender: inout Character) {
    defender.health -= attacker.attackPower
    print("\(attacker.name) attacked with \(attacker.attackPower) power and deals \(attacker.attackPower) damage to \(defender.name).")
    if defender.health <= 0 {
        print("\(defender.name) has been defeated!")
    } else {
        print("\(defender.name) has \(defender.health) health remaining.")
    }
}

// Create the player's character
var player = Character(name: "Player", health: 100, attackPower: 10)

// Create the enemy character
var enemy = Character(name: "Enemy", health: 50, attackPower: 5)

// Start the game loop
while player.health > 0 && enemy.health > 0 {
    print("1. Attack\n2. Defend\n3. Use a potion")
    let input = readLine()
    if input == "1" {
        attack(attacker: player, defender: &enemy)
        attack(attacker: enemy, defender: &player)
    } else if input == "2" {
        // Add code for defending here
    } else if input == "3" {
        // Add code for using a potion here
    } else {
        print("Invalid input.")
    }
}

if player.health <= 0 {
    print("Game over. You have been defeated.")
} else {
    print("You have defeated the enemy and won the game!")
}
