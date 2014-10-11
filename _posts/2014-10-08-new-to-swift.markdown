---
layout: post
title:  "New to Swift"
date:   2014-10-08 15:46:04
---
I'm starting this blog to track the learning of Apple's [swift language]
(https://developer.apple.com/swift).

> Swift is a new programming language for iOS and OS X apps that builds on the
> best of C and Objective-C, without the constraints of C compatibility.

Do not get confused with the http://swift-lang.org, they are different projects.

### Prepare tools

- XCode

To develop with swift, you should have XCode 6.1_gm_seed_2. Get it from [Apple]
(http://developer.apple.com/devcenter/download.action?path=/Developer_Tools/xcode_6.1_gm_seed_2_ofnue4/xcode_6.1_gm_seed_2.dmg)
or from http://pan.baidu.com/s/1kTyvsAb (which is faster in China)

When you installed the new XCode, you can enable developer mode by:

```
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
```

Then you can do one of these two to start the swift command line:

```
xcrun swift
lldb --repl
```
You can add alias in your `.profile` or `.bashrc` for swift:

```
alias swift="xcrun swift"
```

- Vim Syntax Highlighting

For vim user, you can use https://github.com/toyamarinyon/vim-swift for syntax
highlighting.

### Hello World

Create your file `hello.swift`:

```swift
println("Hello World!")
```

And run it by `xcrun swift hello.swift`. If you have added the alias mentioned
above, just run `swift test.swift`. you will get the output in console:

```
Hello World!
```


### Video for how to build a Swift app

Apple has just released a video for how to build a `swift` app in XCode, check
it out: https://developer.apple.com/swift/blog/?id=16
