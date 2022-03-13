#!/usr/bin/env ruby

def is_substring?(str2, str1)
  str1.include?(str2)
end

# start at the end of str1 & str2
# start checking when str2 gets to a matching letter with str1
# track index of that letter
# if get to beginning of str2 with matching on str1
# check if substring of str1.include?(str2(saved_idx + 1, str2.length))

def is_rotation?(str2, str1)
  return false if (str1.length != str2.length)

  idx1 = str1.length - 1
  idx2 = str2.length - 1
  rot_start = nil

  while(idx2 >= 0)
    if(str2[idx2] == str1[idx1])
      rot_start = idx2 if rot_start.nil?
      idx1 -= 1
    else
      rot_start = nil unless rot_start.nil?
    end

    idx2 -= 1
  end

  return false if rot_start.nil?

  is_substring?(str2.slice(rot_start + 1, str2.length), str1)
end

str1 = 'waterbottle'
str2 = 'erbottlewater'

def is_rotation_2?(str2, str1)
  return false if (str1.length != str2.length)
  doublestr = str2 + str2

  is_substring?(str1, doublestr)
end

puts is_rotation?(str2, str1)
puts is_rotation_2?(str2, str1)
