struct Point {
  let x: Int
  let y: Int
}

func escapeLabyrinth(labyrinth: [[Int]], start: Point, end: Point) -> Bool {
  var labyrinth = labyrinth
  var stack: [Point] = [start]

  while !stack.isEmpty {
    let currentPoint = stack.removeLast()

    // Check if we have reached the end point
    if currentPoint.x == end.x && currentPoint.y == end.y {
      return true
    }

    // Mark the current point as visited
    labyrinth[currentPoint.x][currentPoint.y] = 1

    // Check the points to the north, east, south, and west of the current point
    let northPoint = Point(x: currentPoint.x-1, y: currentPoint.y)
    if isValidMove(point: northPoint, labyrinth: labyrinth) {
      stack.append(northPoint)
    }

    let eastPoint = Point(x: currentPoint.x, y: currentPoint.y+1)
    if isValidMove(point: eastPoint, labyrinth: labyrinth) {
      stack.append(eastPoint)
    }

    let southPoint = Point(x: currentPoint.x+1, y: currentPoint.y)
    if isValidMove(point: southPoint, labyrinth: labyrinth) {
      stack.append(southPoint)
    }

    let westPoint = Point(x: currentPoint.x, y: currentPoint.y-1)
    if isValidMove(point: westPoint, labyrinth: labyrinth) {
      stack.append(westPoint)
    }
  }

  return false
}

func isValidMove(point: Point, labyrinth: [[Int]]) -> Bool {
  // Check if the point is within the bounds of the labyrinth
  if point.x < 0 || point.x >= labyrinth.count || point.y < 0 || point.y >= labyrinth[0].count {
    return false
  }

  // Check if the point is an obstacle or has already been visited
  if labyrinth[point.x][point.y] != 0 {
    return false
  }

  return true
}
