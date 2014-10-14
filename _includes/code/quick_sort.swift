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
println(test)

