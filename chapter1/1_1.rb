#!/usr/bin/env ruby

# with additional data structure
def is_unique(str)
  i = 0
  chars = {}

  while(i < str.length)
    if(chars[str[i].to_sym])
      return false
    else
      chars[str[i].to_sym] = 1
    end
    i += 1
  end

  true
end

# without: sort string, then iterate over string
def is_unique_no_ds(str)
  sorted = str.split('').sort.join
  prev = sorted[0]
  i = 1

  while(i < sorted.length)
    if(sorted[i] == prev)
      return false
    else
      prev = sorted[i]
    end

    i += 1
  end

  true
end


puts is_unique('hello')
puts is_unique_no_ds('hello')
puts is_unique('buick')
puts is_unique_no_ds('buick')

