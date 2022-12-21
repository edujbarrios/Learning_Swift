import TwitterKit

let client = TWTRAPIClient()

client.loadTimeline(type: .home, success: { (timeline) in
  for tweet in timeline.tweets {
    print("Tweet: \(tweet.text)")
  }
}, failure: { (error) in
  print("Error getting timeline: \(error)")
})
