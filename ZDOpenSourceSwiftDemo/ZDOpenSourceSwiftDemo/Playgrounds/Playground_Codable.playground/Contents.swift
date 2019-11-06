//: Playground - noun: a place where people can play

/*:
   + [Swift4 终极解析方案：基础篇](http://www.rockerhx.com/2017/09/25/2017-09-25-Swift4-Codable-Basic/)
   + [Swift4 终极解析方案：进阶篇](http://www.rockerhx.com/2017/09/26/2017-09-26-Swift4-Codable-Ultimate/)
 */

import UIKit
import Foundation

var str = "Hello, playground"

//------------------------------------------------

struct Person: Codable {
    let name: String
    let age: UInt
    let gender: String
    let weibo: URL
    
    // 只有在 CodingKeys 中指定的属性名才会进行编码;
    // 如果使用了 CodingKeys,那些没有在 CodingKeys 中声明的属性就必须要要有一个默认值
    // 对于可能为nil的字段,归解档时需要用encodeIfPresent、decodeIfPresent归解档
    enum CodingKeys: String, CodingKey {
        case name = "fullName"
        case gender = "sex"
        case weibo = "twitter"
        case age
    }
}

extension Person {
    // 该对象又有三种类型：
    //Keyed Container：键值对字典类型
    //Unkeyed Container：数值类型
    //Single Value Container：仅仅输出 raw value
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(UInt.self, forKey: CodingKeys.age)
        gender = try container.decode(String.self, forKey: CodingKeys.gender)
        weibo = try container.decode(URL.self, forKey: CodingKeys.weibo)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(gender, forKey: .gender)
        try container.encode(weibo, forKey: .weibo)
    }
}

let person = Person(name: "符现超", age: 28, gender: "男", weibo: URL(string: "http://img05.tooopen.com/images/20160121/tooopen_sy_155168162826.jpg")!)

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
let data = try encoder.encode(person)
let encodeString = String(data: data, encoding: .utf8) ?? ""
print("对象转json字符串: " + encodeString)


let jsonData1 = """
{
    "fullName": "Federico Zanetello",
    "age": 26,
    "sex": "femal"
    "twitter": "http://twitter.com/zntfdr"
}
""".data(using: .utf8);

let decoder = JSONDecoder()
let myStruct1 = try decoder.decode(Person.self, from: jsonData1!)
print(myStruct1)

////------------------自定义映射------------------------------
//
//enum MyStructKeys: String, CodingKey {
//    case name = "fullName"
//    case myId = "id"
//    case myTwitter = "twitter"
//}
//
//let decoder = JSONDecoder()
//let container = try decoder.container(keyedBy: MyStructKeys.self)

//------------------------------------------------

enum BeerStyle: String, Codable {
    case ipa
    case stout
    case kolsch
}
struct Beer: Codable {
    let name: String
    let brewery: String
    let style: BeerStyle
}

let jsonData2 = """
{
    "name": "Endeavor",
    "abv": 8.9,
    "brewery": "Saint Arnold",
    "style": "ipa"
}
""".data(using: .utf8)
let myStruct2 = try JSONDecoder().decode(Beer.self, from: jsonData2!)
print(myStruct2)

