def heapify(sequence, size, index):


    largest = index
    left = 2 * index + 1
    right = 2 * index + 2
    print(f"checking {sequence}\n index:{index}\n branches:{left, right}")

    if left < size and sequence[left] > sequence[largest]:
        largest = left

    if right < size and sequence[right] > sequence[largest]:
        largest = right


    if largest != index:
        sequence[index], sequence[largest] = sequence[largest], sequence[index]
        heapify(sequence, size, largest)
    

def heap_sort(sequence):

    size = len(sequence)

    for i in range(size//2-1, -1, -1):
        heapify(sequence, size, i)

    for i in range(size-1, 0, -1):
        sequence[i], sequence[0] = sequence[0], sequence[i]
        heapify(sequence, i, 0)

    return sequence
