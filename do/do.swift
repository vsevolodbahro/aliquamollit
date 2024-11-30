struct MyStruct {
    var rawValue: String

    init(rawValue: String = "") {
        self.rawValue = rawValue
    }
}

// Creating instances of MyStruct
let instance1 = MyStruct() // rawValue will be an empty string
let instance2 = MyStruct(rawValue: "Hello, World!") // rawValue will be "Hello, World!"
