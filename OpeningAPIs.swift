import SpotifyAuthentication

let credentials = SpotifyClientCredentials(clientId: "client-id", clientSecret: "client-secret")

SpotifyAuthentication.shared.clientCredentials = credentials

SpotifyAuthentication.shared.renewSession { (error) in
  if let error = error {
    print("Error renewing session: \(error)")
  } else {
    let session = SpotifyAuthentication.shared.session
    let accessToken = session?.accessToken

    // Now you can use the access token to make requests to the Spotify API
    let headers = ["Authorization": "Bearer \(accessToken!)"]
    let request = HTTP.request(.get, "https://api.spotify.com/v1/me", headers: headers) { response in
      if let error = response.error {
        print("Error getting user profile: \(error)")
      } else {
        let userProfile = try! JSONDecoder().decode(UserProfile.self, from: response.data)
        print("User profile: \(userProfile)")
      }
    }
    request.end()
  }
}
