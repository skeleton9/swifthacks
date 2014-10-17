---
layout: post
title: "Quick Sort"
tags: [code, algorithm]
---

Swift implementation of [quick-sort](http://en.wikipedia.org/wiki/Quicksort)
algorithm, choosing the right end item as pivot.

```swift
{% include code/quick_sort.swift %}
```

The code above is only for type `Int`. Swift also support generic type like
template in C++ does.

```swift
{% include code/quick_sort_generic.swift %}
```

Notice that we used `Comparable` for the generic type `T`. It is because the
*partion* function compared the items. Swift have to make sure the input is
comparable. See http://nshipster.com/swift-comparison-protocols/
