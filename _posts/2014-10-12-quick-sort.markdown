---
layout: post
title: "Quick Sort"
tags: []
---

Swift implementation of [quick-sort](http://en.wikipedia.org/wiki/Quicksort)
algorithm, choosing the right end item as pivot.

```swift
func quicksort(inout arr: [Int], left: Int, right: Int) {
	if left < right {
		var p = partion(&arr, left, right)
		quicksort(&arr, left, p - 1)
		quicksort(&arr, p + 1, right)
	}
}

func swap(inout arr: [Int], a: Int, b: Int) {
	var temp = arr[a]
	arr[a] = arr[b]
	arr[b] = temp
}

func partion(inout arr: [Int], left: Int, right: Int) -> Int {
	var pivotValue = arr[right]
	var storeIndex = left
	for i in left..<right {
		if arr[i] < pivotValue {
			swap(&arr, i, storeIndex)
			storeIndex += 1
		}
	}
	swap(&arr, storeIndex, right)
	return storeIndex
}

var test = [1, 3, 2, 5, 4]
quicksort(&test, 0, 4)
println(test) // [1, 2, 3, 4, 5]
```

The code above is only for type `Int`. Swift also support generic type like
template in C++ does.

```swift
func quicksort<T: Comparable>(inout arr: [T], left: Int, right: Int) {
	if left < right {
		var p = partion(&arr, left, right)
		quicksort(&arr, left, p - 1)
		quicksort(&arr, p + 1, right)
	}
}

func swap<T: Comparable>(inout arr: [T], a: Int, b: Int) {
	var temp = arr[a]
	arr[a] = arr[b]
	arr[b] = temp
}

func partion<T: Comparable>(inout arr: [T], left: Int, right: Int) -> Int {
	var pivotValue = arr[right]
	var storeIndex = left
	for i in left..<right {
		if arr[i] < pivotValue {
			swap(&arr, i, storeIndex)
			storeIndex += 1
		}
	}
	swap(&arr, storeIndex, right)
	return storeIndex
}

var test = [1, 3, 2, 5, 4]
quicksort(&test, 0, 4)
println(test)


var test_strs = ["a", "c", "b", "e", "d"]
quicksort(&test_strs, 0, 4)
println(test_strs)
```

Notice that we used `Comparable` for the generic type `T`. It is because the
*partion* function compared the items. Swift have to make sure the input is
comparable. See http://nshipster.com/swift-comparison-protocols/
