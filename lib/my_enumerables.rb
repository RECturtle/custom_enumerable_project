module Enumerable
  # Your code goes here.
  def my_each_with_index
    idx = 0
    my_each do |val|
      yield(val, idx)
      idx +=1
    end
    
    return self
  end

  def my_select
    selected = my_each { |val| val if yield(val) }
    return selected
  end

  def my_all?
    my_each { |val| return false if !yield(val) }  
    return true
  end

  def my_any?
    my_each { |val| return true if yield(val) }  
    return false
  end

  def my_none?
    my_each { |val| return false if yield(val) }

    return true
  end

  def my_count
    return self.size unless block_given?
    count = 0
    my_each { |val| count += 1 if yield(val) }  
    return count
  end

  def my_map
    mapped_arr = []
    my_each { |val| mapped_arr << yield(val)}   
    return mapped_arr
  end

  def my_inject(initial_value=0)
    total = initial_value
    my_each do |val|
      total = yield(total, val)
    end
    
    return total
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for val in self
      yield(val)
    end

    self
  end
end
