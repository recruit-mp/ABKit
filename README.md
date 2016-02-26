# ABKit

![Build Status](https://www.bitrise.io/app/6dbad8f8a5cf175f.svg?token=XbnTW4n4ZLo01_00ePqSbw)

Split Testing for Swift.

ABKit is a library for implementing a simple Split Test that:

- Doesn't require an HTTP client
- written in Pure Swift

# Installation

## CocoaPods

To integrate ABKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```rb
pod 'ABKit'
```

Then, run the following command:

```
$ pod install
```

# Usage

## A/B Test

```swift
let defaultVersion = Version(name: "A") { version in print("Pattern \(version.name)") }
let test = SplitTest(name: "Sample A/B test", defaultVersion: defaultVersion)

let b = Version(name: "B") { version in print("Pattern \(version.name)") }
test.addVersion(b, weight: 0.5)

test.run() // A(Default Version) = 50%, B = 50%
```

## Split Test with Weighted Probabilities

```swift
let defaultVersion = Version(name: "A") { version in print("Pattern \(version.name)") }
let test = SplitTest(name: "Sample split test", defaultVersion: defaultVersion)

let b = Version(name: "B") { version in print("Pattern \(version.name)") }
test.addVersion(b, weight: 0.2)

let c = Version(name: "C") { version in print("Pattern \(version.name)") }
test.addVersion(c, weight: 0.3)

test.run() // A(Default Version) = 50%, B = 20%, C = 30%
```

## Conditional Test

```swift
let defaultVersion = Version(name: "A") { version in print("Pattern \(version.name)") }
let test = ConditionalTest<User>(name: "Sample conditional test", defaultVersion: defaultVersion)

let b = Version(name: "B") { version in print("Pattern \(version.name)" }
test.addVersion(b) { user in user.age < 20 }

let user = User(name: "naoty", age: 28)
test.run(user) // If user.age < 20 is true, B will be run otherwise A will be run.
```

## Pro Tips
* `ABKit` selects one of the versions using a random number, which is saved in `RandomNumberRepository`. By default, `ABKit` uses `NSUserDefault` as `RandomNumberRepository`. You can save it in any storage by implementing `RandomNumberRepository` protocol.
*  You can specify an arbitrary number as the random number using `-setRandomNumber(_:)` and reset a random number using `-deleteRandomNumber()` for `SplitTest`.

## License

ABKit is available under the MIT license. See the LICENSE file for more info.
