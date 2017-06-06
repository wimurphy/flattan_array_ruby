
def recursive_flatten_all_type(array, flatten)
  array.each do |element|
    element.kind_of?(Array) ? recursive_flatten_all_type(element, flatten) : flatten << element
  end
end

def flatten_all_type(array)
  recursive_flatten_all_type(array, flatten = [])
  flatten
end
