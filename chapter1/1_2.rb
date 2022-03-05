#!/usr/bin/env ruby

def check_perm(str1, str2)
  return false if (str1.length != str2.length)

  sort1 = str1.split('').sort.join
  sort2 = str2.split('').sort.join

  sort1 == sort2
end

puts check_perm('ale', 'lae')
puts check_perm('hello', 'ollehh')
puts check_perm('hello', 'ollea')


def check_perm_const(str1, str2)
  return false if (str1.length != str2.length)

  chars1 = {}
  chars2 = {}

  i = 0
  while(i < str1.length)
    if(chars1[str1[i].to_sym])
      chars1[str1[i].to_sym] += 1
    else
      chars1[str1[i].to_sym] = 1
    end

    i += 1
  end

  i = 0
  while(i < str2.length)
    if(chars2[str2[i].to_sym])
      chars2[str2[i].to_sym] += 1
    else
      chars2[str2[i].to_sym] = 1
    end

    i += 1
  end

  return false if (chars1.keys.length != chars2.keys.length)

  chars1.keys.each do |key|
    return false if (chars1[key.to_sym] != chars2[key.to_sym])
  end

  return true
end

puts "expect true: #{check_perm_const('ale', 'lae')}"
puts "expect false:#{check_perm_const('hello', 'ollehh')}"
puts "expect false:#{check_perm_const('hello', 'ollea')}"
