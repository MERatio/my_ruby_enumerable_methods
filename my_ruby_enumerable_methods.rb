# frozen_string_literal: true

module Enumerable
  def my_each
    type = self.class
    if type == Array || type == Range
      arr = to_a
      (0..arr.length - 1).each do |i|
        yield(arr[i])
      end
    elsif type == Hash
      keys = self.keys
      values = self.values
      (0..length - 1).each do |i|
        yield(keys[i], values[i])
      end
    else
      puts 'Error: incorrect data type'
    end
  end

  def my_each_with_index
    type = self.class
    if type == Array || type == Hash || type == Range
      arr = to_a
      (0..arr.length - 1).each do |i|
        yield(arr[i], i)
      end
    else
      puts 'Error: incorrect data type'
    end
  end

  def my_select
    type = self.class
    if type == Array || type == Range
      arr = to_a
      output = []
      arr.my_each do |item|
        output.push(item) if yield(item)
      end
      output
    elsif type == Hash
      output = {}
      arr.my_each do |key, value|
        output[key] = value if yield(key, value)
      end
      output
    else
      puts 'Error: incorrect data type'
    end
  end

  def my_all?
    type = self.class
    if type == Array || type == Range
      arr = to_a
      arr.my_each do |item|
        return false unless yield(item)
      end
      true
    elsif type == Hash
      keys = self.keys
      values = self.values
      (0..length - 1).each do |i|
        return false unless yield(keys[i], values[i])
      end
      nil
    else
      puts 'Error: incorrect data type'
    end
  end

  def my_any?
    type = self.class
    if type == Array || type == Range
      arr = to_a
      arr.my_each do |item|
        return true if yield(item)
      end
      false
    elsif type == Hash
      keys = self.keys
      values = self.values
      (0..length - 1).each do |i|
        return true if yield(keys[i], values[i])
      end
      false
    else
      puts 'Error: incorrect data type'
    end
  end

  def my_none?
    type = self.class
    if type == Array || type == Range
      arr = to_a
      arr.my_each do |item|
        return false if yield(item)
      end
      true
    elsif type == Hash
      keys = self.keys
      values = self.values
      (0..length - 1).each do |i|
        return false if yield(keys[i], values[i])
      end
      true
    else
      puts 'Error: incorrect data type'
    end
  end

  def my_count(arg = nil)
    type = self.class
    counter = 0
    if type == Array || type == Range
      arr = to_a
      return arr.length if !block_given? && arg.nil?

      arr.my_each do |item|
        counter += 1 if block_given? && yield(item) || item == arg
      end
    else
      puts 'Error: incorrect data type'
    end
    counter
  end

  def my_map
    type = self.class
    result = []
    if type == Array || type == Range
      arr = to_a
      arr.my_each do |item|
        result.push(yield(item))
      end
    elsif type == Hash
      keys = self.keys
      values = self.values
      (0..size - 1).each do |i|
        result.push(yield(keys[i], values[i]))
      end
    else
      puts 'Error: incorrect data type'
    end
    result
  end

  # Only accepts this = my_inject(initial) { |memo, obj| block } → obj
  def my_inject(initial = nil)
    type = self.class
    if type == Array || type == Range
      arr = to_a
      acc = initial || arr[0]
      (0..arr.length - 1).each do |i|
        acc = initial ? yield(acc, arr[i]) : yield(acc, arr[i]) if i != 0
      end
    else
      puts 'Error: incorrect data type'
    end
    acc
  end
end

def multiply_els(arr)
  arr.my_inject do |acc, cur|
    acc * cur
  end
end
