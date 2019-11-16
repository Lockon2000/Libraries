function indexOfMin(arr) {
    if (arr.length === 0) {
        return -1;
    }

    var minIndex = 0;

    for (var i = 1; i < arr.length; i++) {
        if (arr[i] < arr[minIndex]) {
            minIndex = i;
        }
    }

    return minIndex;
}

