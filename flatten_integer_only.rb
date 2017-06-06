def recursive_flatten_integer(array, flatten)
  array.each do |element|
    next unless element.kind_of?(Array) || element.kind_of?(Fixnum)
    element.kind_of?(Array) ? recursive_flatten_integer(element, flatten) : flatten << element
  end
end

def flatten_integer(array)
  recursive_flatten_integer(array, flatten = [])
  flatten
end

