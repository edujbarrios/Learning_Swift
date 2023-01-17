import Foundation

func signDocument(document: URL) {
    // Load document data
    let documentData = try? Data(contentsOf: document)

    // Sign the document using your private key
    let signature = try? RSA.sign(documentData, with: privateKey)

    // Save the signed document to a new file
    let signedDocument = document.deletingPathExtension().appendingPathExtension("signed")
    try? signature?.write(to: signedDocument)
}
