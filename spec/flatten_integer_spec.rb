require 'spec_helper'
require_relative '../flatten_integer_only'

describe 'flatten_integer_only' do
  it 'flattens a multidimensional array into a 1D array ' do
    expect(flatten_integer([1,2,[3,[4,5]]])).to eq [1,2,3,4,5]
    expect(flatten_integer([[1,2,[3]],4])).to eq [1,2,3,4]
  end

  it 'removes any empty sub-arrays elements from the array' do
    expect(flatten_integer([1,2,[],[3,[[], 4,5]]])).to eq [1,2,3,4,5]
  end

  it 'returns empty array if array is empty' do
    expect(flatten_integer([])).to eq []
  end

  it 'ignores non-integer variables types' do
    expect(flatten_integer([{b: 1},["a",[1]],:a, [{"c" => 12}]])).to eq [1]
  end

  it 'removes any nil elements' do
    expect(flatten_integer([nil, [nil], [1]])).to eq [1]
  end
end