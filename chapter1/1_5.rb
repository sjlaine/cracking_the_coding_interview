#!/usr/bin/env ruby

def one_away(str1, str2)
  # length must be one less, one more, or same
  return false unless ((str1.length - 1) <= str2.length <= (str1.length + 1))

  edited = false
  idx1 = 0
  idx2 = 0

  while(idx1 < str1.length && idx2 < str2.length)
    if(str1[idx1] != str2[idx2])
      return false if edited
      if(str1.length < str2.length)
        # move on only in the higher one
        idx2 += 1
      elsif(str2.length < str1.length)
        # move on only in the higher one
        idx1 += 1
      end

      edited = true
    else
      idx1 += 1
      idx2 += 1
    end
  end

  true
end

puts one_away('pale', 'ple')
