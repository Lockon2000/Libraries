function indexOfMin(arr) {
    if (arr.length === 0) {
        return -1;
    }

    let minIndex = 0;

    for (let i = 1 in arr) {
        if (arr[i] < arr[minIndex]) {
            minIndex = i;
        }
    }

    return minIndex;
}

