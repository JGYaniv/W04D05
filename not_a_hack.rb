# Hey Paloma, you mentioned to reach out with Big O questions, so got one for you! Could you essentially refactor (albeit inefficiently) any function to technically be o(n) as per the code snippets below?
#Hi Jonathan. So, both of these are still O(n**2) -> both functions have to do n * n operations no matter what. These also make their best and worst case scenarios the same as there continues to be an iteration even if no switches need to be made. "n" should reference the initial input - in this case, the arr - and the loop, even though only looping 1x - loops for arr.length * arr.length times. Does that make sense?

def bubble_sort_hack(arr)
    (arr.length * arr.length).times do |idx|
        i = arr[idx % arr.length]
        j = arr[idx % arr.length + 1]
        next unless j
        if i > j
            arr[idx % arr.length], arr[idx % arr.length + 1] = arr[idx % arr.length + 1], arr[idx % arr.length]
        end
    end
    arr
end

p bubble_sort_hack([4,3,1,6,2])


def bubble_sort_hack2(arr)
    counter = arr.length * arr.length
    while true
        counter -= 1 unless arr[counter % arr.length + 1]
        idx = counter % arr.length
        i = arr[idx]
        j = arr[idx + 1]
        if i > j
            arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        end
        counter -= 1
        return arr if counter == 0
    end
end

p bubble_sort_hack2([4,3,1,6,2])