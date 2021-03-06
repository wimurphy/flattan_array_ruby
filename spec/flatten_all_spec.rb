require 'spec_helper'
require_relative '../flatten_all_types'

describe 'flatten_all_type' do
  it 'flattens a multidimensional array into a 1D array ' do
    expect(flatten_all_type([1,2,[3,[4,5]]])).to eq [1,2,3,4,5]
    expect(flatten_all_type([[1,2,[3]],4])).to eq [1,2,3,4]
  end

  it 'removes any empty sub-arrays from the array' do
    expect(flatten_all_type([1,2,[],[3,[[], 4,5]]])).to eq [1,2,3,4,5]
  end

  it 'returns empty array if array is empty' do
    expect(flatten_all_type([])).to eq []
  end

  it 'handles multiple variables types' do
    expect(flatten_all_type([{b: 1},["a",[1]],:a, [{"c" => 12}]])).to eq [{b: 1},"a",1,:a, {"c" => 12}]
  end

  it 'retains any nil elements' do
    expect(flatten_all_type([nil, [nil], ["a"]])).to eq [nil, nil, "a"]
  end
end
