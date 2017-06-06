require 'benchmark'
require 'base64'
require 'find'

module L41
  module_function

  def base64(str)
    encoded = Base64.encode64(str)
    puts encoded
    decoded = Base64.decode64(encoded)
    puts decoded
  end

  def f(path)
    Find.find(path) do |p|
      puts p
    end
  end
end

class Class

  def class_name
#     # %(This class called "#{self}") # => ""
    "This class called \"#{self}\""
  end

end

class Ship
  def test
    puts("I am #{object_id}")
  end
end
