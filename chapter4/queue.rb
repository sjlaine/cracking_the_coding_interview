#!/usr/bin/env ruby

# FIFO (first in, first out)
class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def add(item)
    queue.push(item)
  end

  def remove
    queue.shift
  end

  def is_empty?
    queue.empty?
  end
end
