import UIKit
import Foundation

var str = "Hello, playground"

//: #### PropertyWrapper
@propertyWrapper
struct SomeWrapper {
    var wrappedValue: Int
    var someValue: Double
    
    init() {
        self.wrappedValue = 100
        self.someValue = 12.3
    }
    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
        self.someValue = 45.6
    }
    init(wrappedValue value: Int, custom: Double) {
        self.wrappedValue = value
        self.someValue = custom
    }
}

struct SomeStruct {
    // 使用 init()
    @SomeWrapper var a: Int

    // 使用 init(wrappedValue:)
    @SomeWrapper var b = 10

    // 两个都是使用 init(wrappedValue:custom:)
    @SomeWrapper(custom: 98.7) var c = 30
    @SomeWrapper(wrappedValue: 30, custom: 98.7) var d
}

let d = SomeStruct().d
print(d)


@propertyWrapper
struct WrapperWithProjection {
    var wrappedValue: Int
    var projectedValue: SomeProjection {
        return SomeProjection(wrapper: self)
    }
}
struct SomeProjection {
    var wrapper: WrapperWithProjection
}

struct SomeStruct2 {
    @WrapperWithProjection var x = 123
}
let s = SomeStruct2()
s.x           // Int value
s.$x          // SomeProjection value
s.$x.wrapper  // WrapperWithProjection value

//: #### enum
enum UnboxPath {
    case key(String)
    case keyPath(String)
}

struct UserSchema {
    static let name = key("name")
    static let age = key("age")
    static let posts = key("posts")
    
    static let key = UnboxPath.key
}

let foo = UserSchema.key
print(foo("name"))
