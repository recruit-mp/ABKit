# ABKit

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

```
let defaultVersion = Version(name: "a") { print("Pattern A") }

let test = SplitTest(defaultVersion: defaultVersion)

let b = Version(name: "b") { print("Pattern B") }
test.addVersion(b, weight: 0.5)

test.run() // A(Default Version) = 50%, B = 50%
```

## Split Test with Weighted Probabilities

```
let defaultVersion = Version(name: "a") { print("Pattern A") }

let test = SplitTest(defaultVersion: defaultVersion)

let b = Version(name: "b") { print("Pattern B") }
test.addVersion(b, weight: 0.2)

let c = Version(name: "c") { print("Pattern C") }
test.addVersion(c, weight: 0.3)

test.run() // A(Default Version) = 50%, B = 20%, C = 30%
```

## License

ABKit is available under the MIT license. See the LICENSE file for more info.
