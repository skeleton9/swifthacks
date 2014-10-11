---
layout: post
title: "Swift Language Basics"
tags: []
---

Find the detailed document [The Swift Programming Language]
(https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html)

Generally speaking, `Swift` is quite similar to `Python` or `Ruby`, but it keeps
some `C` styles. It is more *strong typed*. If you are familiar with `Python` or
`Ruby`, you can find many familiar features, like `Array`, `Dictionary`, `Tuple`.

You can have a look at the [cheetsheet(pdf)](http://cdn2.raywenderlich.com/wp-content/uploads/2014/06/RW-Swift-Cheatsheet-0_3.pdf)
to get a brief view of the Swift language.

### Types

- Int, Float, Double
- Bool: true/false
- String, Character
- Array, Dictionary, Tuple

### Variable and Constants

Use `var` to declare variables, and use `let` to declare constants.

```swift
var mutableVar = 10
var mutableDouble: Double = 1.0
let constVar = 10
```
Constant and variable names can contain almost any character, including Unicode characters:

```swift
var 电脑 = "computer"
```

### Comments

Similar to `C/C++` style comments, using `//` and `/* */`, but `/* */` can bet nested.

```
// this is comment

/* this is commet */

/* this is comment
/* nested comment */
some more comment */
```

### String and Character

Strings are collection of `Character`. Always use double quote to define string
literals.

Use `\(var_name)` to include variable in string literals.

Use `countElements` to get the count of `Character` in a `String`.

```swift
var name = "Jack"
prinln("Your name is \(name)")
for ch in name {
  println(ch)
}
println(countElements(name))
```

Will produce:

```
Your name is Jack
J
a
c
k
4
```
### Array and Dictionary

Arrays store ordered lists of values of the **same type**. Dictionaries store
unordered collections of values of the **same type**, which can be referenced
and looked up through a unique identifier (also known as a key).

Tuples group multiple values into a single compound value. The values within a
tuple can be of any type and do not have to be of the same type as each other.

- Array

```swift
// declare
var empty = [Int]()
var numbers: [Int] = [1, 2, 3]
var cities = ["beijing", "shanghai", "tianjin", "chongqing"]

// append item
cities.append("guangzhou")
// add more items
cities += ["shengzhen", "qingdao"]
// access item by index
println(cities[0])  // beijing
// remove item by index
cities.removeAtIndex(2) // tianjin removed

// iterate array items
for city in cities {
  println(city)
}

// iterate with index
// 0: beijing
// ...
for (index, name) in enumerate(cities) {
  println("\(index): \(name)")"
}
```

- Dictionary<KeyType, ValueType>

```swift
var dict: [String, Int] = ["jack": 12, "bob": 14]
```

- Tuple

Items in tuple can be different types. It is very useful for function return values.

```swift
let http404error = (404, "Not Found")
var code = http404error.0
var text = http404error.1
let (code, text) = http404error
```

You can name the individual elements in a tuple when the tuple is defined:

```swift
let http200Status = (statusCode: 200, description: "OK")
var code = http200status.statusCode
```

### Enum

### Method

### Class
