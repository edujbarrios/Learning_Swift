import Security

func generateRandomPassword() -> String {
  let length = 69 //Desired length of the keyword
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  var randomPassword = ""
  //"repeating" stating the below showed reference, means the number of letters/numbers and if they could be repeted over the generated key
  var randomBytes = [UInt8](repeating: 0, count: length)
  let result = SecRandomCopyBytes(kSecRandomDefault, length, &randomBytes)
  if result == errSecSuccess {
    for randomByte in randomBytes {
      let randomIndex = Int(randomByte) % letters.count
      let randomCharacter = letters[letters.index(letters.startIndex, offsetBy: randomIndex)]
      randomPassword.append(randomCharacter)
    }
  }
  return randomPassword
}

print(generateRandomPassword())  // Imprime una contraseña aleatoria de 8 caracteres
