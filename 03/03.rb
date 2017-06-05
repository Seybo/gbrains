require 'benchmark'

module L31
  module_function

  def combination1(element_with = nil, result = [], elements)
    if element_with
      elements.each do |e|
        result << [element_with, e]
      end
    end

    if elements.size <= 2
      result << elements
    else
      element_with = elements.shift
      combination(element_with, result, elements)
    end
  end

  def combination2(elements, element_with = nil, result = [], group_size: 2)
    return 'wrong group size' if group_size < 2
    if element_with
      (0..elements.size - group_size + 1).step(1) do |starting_index|
        result << [element_with] + elements[starting_index, group_size - 1]
      end
    end

    if elements.size <= group_size
      result
    else
      element_with = elements.shift
      combination2(elements, element_with, result, group_size: group_size)
    end
  end

  def benchmark(arr, length = 2)
    Benchmark.bm do |bm|
      bm.report('my 2') do
        100000.times { combination2(arr, group_size: length) }
      end
      bm.report('ruby') do
        100000.times { arr.combination(length).to_a }
      end
    end
  end
end
