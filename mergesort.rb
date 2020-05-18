
def mergesort(arr)
  return arr if arr.length <= 1

  # if the array is greater than 1, split it into two halves
  barr = arr[0..arr.length/2 - 1]
  carr = arr[arr.length/2.. -1]

  # sort the left half
  mergesort(barr)
  # sort the right half
  mergesort(carr)

  # put the halves together

  ia=0; ib=0; ic = 0;
  while ib < barr.length && ic < carr.length
    if barr[ib] < carr[ic]
      arr[ia] = barr[ib]
      ib += 1
    else
      arr[ia] = carr[ic]
      ic += 1
    end
    ia += 1
  end

  if ib == barr.length
    for i in ic...carr.length
      arr[ia] = carr[i]
      ia += 1
    end
  else
    for i in ib...barr.length
      arr[ia] = barr[i]
      ia += 1
    end
  end

  return arr

end


mergesort([8,7,5,4,3,2,1,6,9])
