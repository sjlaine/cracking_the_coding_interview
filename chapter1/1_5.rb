#!/usr/bin/env ruby

def one_away(str1, str2)
  # length must be one less, one more, or same
  unless ((str1.length - 1) <= str2.length) && (str2.length <= (str1.length + 1))
    return false
  end

  edited = false
  idx1 = 0
  idx2 = 0

  while(idx1 < str1.length && idx2 < str2.length)
    if(str1[idx1] != str2[idx2])
      return false if edited

      # move up only in the longer str; move up in both if length same
      if(str1.length < str2.length)
        idx2 += 1
      elsif(str2.length < str1.length)
        idx1 += 1
      else
        idx1 += 1
        idx2 += 1
      end

      edited = true
    else
      idx1 += 1
      idx2 += 1
    end
  end

  true
end

puts "expect true: #{one_away('pale', 'ple')}"
puts "expect true: #{one_away('pales', 'pale')}"
puts "expect true: #{one_away('pale', 'bale')}"
puts "expect false: #{one_away('pale', 'bake')}"
