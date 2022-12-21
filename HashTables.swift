struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]

    init(capacity: Int) {
        buckets = Array<Bucket>(repeating: [], count: capacity)
    }

    private func index(for key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }

    subscript(key: Key) -> Value? {
        get {
            return value(for: key)
        }
        set {
            if let value = newValue {
                update(value: value, for: key)
            } else {
                removeValue(for: key)
            }
        }
    }

    func value(for key: Key) -> Value? {
        let index = self.index(for: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }

    mutating func update(value: Value, for key: Key) {
        let index = self.index(for: key)
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index][i].value = value
                return
            }
        }
        buckets[index].append((key: key, value: value))
    }

    mutating func removeValue(for key: Key) {
        let index = self.index(for: key)
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                return
            }
        }
    }
}
// Having these conditions

var hashTable = HashTable<String, Int>(capacity: 10)
hashTable["key1"] = 1
hashTable["key2"] = 2
hashTable["key3"] = 3

let value1 = hashTable["key1"]
let value2 = hashTable["key2"]
let value3 = hashTable["key3"]

hashTable["key2"] = nil
