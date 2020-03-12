# frozen_string_literal: true

# The answers for checking are from the original Enumerable methods

require './my_ruby_enumerable_methods.rb'

describe '#my_each' do
  it 'handles array' do
    sum = 0
    [1, 2, 3, 4, 5].my_each { |number| sum += number }
    expect(sum).to eql(15)
  end

  it 'handles range' do
    sum = 0
    (1..5).my_each { |number| sum += number }
    expect(sum).to eql(15)
  end
end

describe '#my_each_with_index' do
  it 'handles array' do
    hash = {}
    %w[cat dog wombat].my_each_with_index do |item, index|
      hash[item] = index
    end
    expect(hash).to eql({ 'cat' => 0, 'dog' => 1, 'wombat' => 2 })
  end

  it 'handles range' do
    hash = {}
    ('A'..'Z').my_each_with_index do |item, index|
      hash[item] = index + 1
    end
    answer = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6,
               'G' => 7, 'H' => 8, 'I' => 9, 'J' => 10, 'K' => 11,
               'L' => 12, 'M' => 13, 'N' => 14, 'O' => 15, 'P' => 16,
               'Q' => 17, 'R' => 18, 'S' => 19, 'T' => 20, 'U' => 21,
               'V' => 22, 'W' => 23, 'X' => 24, 'Y' => 25, 'Z' => 26 }
    expect(hash).to eql(answer)
  end
end

describe '#my_select' do
  it 'handles array' do
    expect([1, 2, 3, 4, 5].my_select(&:even?)).to eql([2, 4])
  end

  it 'handles empty array' do
    expect([].my_select(&:even?)).to eql([])
  end

  it 'handles range' do
    expect((1..5).my_select(&:even?)).to eql([2, 4])
  end
end

describe '#my_all?' do
  it 'handles array' do
    expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to eql(true)
  end

  it 'handles empty array' do
    expect([].my_all?(&:even?)).to eql(true)
  end

  it 'handles range' do
    expect((5..10).my_all? { |number| number >= 5 }).to eql(true)
  end
end

describe '#my_any?' do
  it 'handles array' do
    expect([1, 2, 3, 4, 5].my_any? { |number| number >= 3 }).to eql(true)
  end

  it 'handles empty array' do
    expect([].my_any?(&:even?)).to eql(false)
  end

  it 'handles range' do
    expect((1..5).my_any?(&:even?)).to eql(true)
  end
end

describe '#my_none?' do
  it 'handles array' do
    expect(%w[ant bear cat].my_none? { |word| word.length == 5 }).to eql(true)
  end

  it 'handles empty array' do
    expect([].my_none?(&:even?)).to eql(true)
  end

  it 'handles range' do
    expect((1..10).my_none? { |number| number <= 0 }).to eql(true)
  end
end

describe '#my_count' do
  arr = [1, 2, 4, 2]
  it 'returns the length of an array' do
    expect(arr.my_count).to eql(4)
  end

  it 'handles empty array' do
    expect([].my_count).to eql(0)
  end

  it 'returns the occurrence of an item' do
    expect(arr.my_count(2)).to eql(2)
  end

  it 'handles block' do
    expect(arr.my_count(&:even?)).to eql(3)
  end
end

describe '#my_map' do
  it 'handles array' do
    expect([1, 2, 3, 4].my_map { |i| i * i }).to eql([1, 4, 9, 16])
  end

  it 'handles empty array' do
    expect([].my_map { |i| i * i }).to eql([])
  end

  it 'handles range' do
    expect((1..4).my_map { 'cat' }).to eql(%w[cat cat cat cat])
  end

  it 'handles procs' do
    double = proc { |i| i * i }
    expect((1..4).my_map(&double)).to eql([1, 4, 9, 16])
  end
end

describe '#my_inject' do
  it 'handles array' do
    expect([5, 6, 7, 8, 9, 10].my_inject(&:+)).to eql(45)
  end

  it 'handles empty array' do
    expect([].my_inject(&:*)).to eql(nil)
  end

  it 'handles range' do
    expect((5..10).my_inject(&:+)).to eql(45)
  end
end

describe '#multiply_els' do
  it 'multiplies all the elements of the array together by using #my_inject' do
    expect(multiply_els([5, 6, 7, 8, 9, 10])).to eql(151_200)
  end

  it 'handles an empty array' do
    expect(multiply_els([])).to eql(nil)
  end
end
