#!/usr/bin/env ruby

def URLify(str)
  i = 0

  while(i < str.length)
    if(str[i] == ' ')
      str[i] = '%20'
    end

    i += 1
  end

  str
end

puts URLify('hello my name is sarah')
