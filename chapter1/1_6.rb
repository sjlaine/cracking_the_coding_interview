#!/usr/bin/env ruby

require 'benchmark'

def compress_str(str)
  val = ''

  time = Benchmark.measure {
    prev = str[0]
    compressed = prev
    i = 1
    count = 1

    while(i < str.length)
      if(str[i] == prev)
        count += 1
      else
        compressed += count.to_s
        prev = str[i]
        compressed += prev
        count = 1
      end

      i += 1
    end

    compressed += count.to_s
    val = compressed.length < str.length ? compressed : str
  }

  puts "time: #{time.real}, val: #{val}"
end

compress_str('aabcccccaaa')
compress_str('a')

def compress_2(str)
  val = ''
  time = Benchmark.measure {
    count_idx = 0
    prev = str[0]
    counts = [[prev, 1]]
    i = 1

    while(i < str.length)
      if(str[i] == prev)
        counts[count_idx][1] += 1
      else
        count_idx += 1
        prev = str[i]
        counts[count_idx] = [prev, 1]
      end

      i += 1
    end

    val = counts.flatten.length < str.length ? counts.flatten.join : str
  }

  puts "time: #{time.real}, val: #{val}"
end

compress_2('aabcccccaaa')
compress_2('a')

def compressed_len(str)
  len = 2
  i = 1
  prev = str[0]

  while(i < str.length)
    if(prev != str[i])
      len += 2
      prev = str[i]
    end

    i += 1
  end

  len
end

def compress_optimized(str)
  val = ''
  time = Benchmark.measure {
    # check if the original str will be shorter than compressed
    if (compressed_len(str) > str.length)
      val = str
    else
      count_idx = 0
      prev = str[0]
      counts = [[prev, 1]]
      i = 1

      while(i < str.length)
        if(str[i] == prev)
          counts[count_idx][1] += 1
        else
          count_idx += 1
          prev = str[i]
          counts[count_idx] = [prev, 1]
        end

        i += 1
      end

      val = counts.flatten.join
    end
  }

  puts "time: #{time.real}, val: #{val}"
end

compress_optimized('aabcccccaaa')
compress_optimized('a')
