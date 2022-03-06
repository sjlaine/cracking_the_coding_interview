#!/usr/bin/env ruby

# ignoring spaces, the string must have two of each letter
# except one (can also have zero single letters)
def pal_permutation(str)
  i = 0
  chars = {}

  while(i < str.length)
    if(str[i] == ' ') # spaces are excluded
      i += 1
      next
    elsif(chars[str[i].to_sym])
      chars.delete(str[i].to_sym)
    else
      chars[str[i].to_sym] = 1
    end

    puts chars

    i += 1
  end

  # if there's zero or one key, then all other letters have a pair
  chars.keys.length <= 1 ? true : false
end

puts pal_permutation('tact coa')
puts pal_permutation('tactt coa')
