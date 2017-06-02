require 'benchmark'

module L22
  PLAYER = { name: 'johnny', color: :red }.freeze
  COLORS = %i[blue white green red orange].freeze

  module_function

  def player_color_check
    if PLAYER[:color] == pick_color
      'Gotcha!'
    elsif PLAYER[:color].length == pick_color.length
      'Same size'
    else
      'No good...'
    end
  end

  def pick_color
    COLORS[rand(5)]
  end
end

module L23
  NAMES = %w[ambientsketchbook Erik\ Wollo Brian\ Eno Evangelos\
             Papathanassiou Shulman].freeze

  module_function

  def check
    NAMES.select { |name| small?(name, 10) && capital?(name[0]) }
  end

  def small?(name, size)
    name.length < size
  end

  def capital?(letter)
    letter == letter.upcase
  end
end

module L24
  module_function

  def do_it
    names = %w[Ruby Python JavaScript Java .NET HTML Clojure]
    names.each_with_object({}) { |word, result| result[word] = word.length }
  end
end

module L25
  module_function

  def fibonacci1(length, result = [0, 1])
    return result if result.length == length
    result << result[result.length - 1] + result[result.length - 2]
    fibonacci1(length, result)
  end

  def fibonacci2(length)
    result = [0, 1]
    while result.length < length
      result << result[result.length - 1] + result[result.length - 2]
    end
    result
  end

  def benchmark(length)
    Benchmark.bm do |bm|
      bm.report('with recursion') do
        1000.times { fibonacci1(length) }
      end
      bm.report('with iteration') do
        1000.times { fibonacci2(length) }
      end
    end
  end
end

module L25
  module_function

  def code(string)
    string.chars.map { |c| converted_letter_for(c) }.join('')
  end

  def converted_letter_for(c)
    if ('a'..'m').cover?(c) || ('A'..'M').cover?(c)
      (c.ord + 13).chr
    elsif ('n'..'z').cover?(c) || ('N'..'Z').cover?(c)
      (c.ord - 13).chr
    else
      c
    end
  end
end
