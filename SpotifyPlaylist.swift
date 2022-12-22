import Foundation

let accessToken = "YOUR_ACCESS_TOKEN"
let userId = "YOUR_USER_ID"
let playlistName = "YOUR_PLAYLIST_NAME"

let url = URL(string: "https://api.spotify.com/v1/users/\(userId)/playlists")!
let headers: [String: String] = [
    "Authorization": "Bearer \(accessToken)",
    "Content-Type": "application/json"
]

let body: [String: Any] = [
    "name": playlistName,
    "public": true
]

var request = URLRequest(url: url)
request.httpMethod = "POST"
request.allHTTPHeaderFields = headers
request.httpBody = try! JSONSerialization.data(withJSONObject: body)

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let error = error {
        print(error)
        return
    }

    if let data = data,
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
        print(json)
    }
}

task.resume()
