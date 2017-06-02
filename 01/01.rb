module L1
  @results = [10, 2, 5, 12, 11, 11, 4]

  def self.func
    @results.each.with_index do |e, i|
      puts "game #{i + 1}: points #{e}"
    end
  end
end

class String
  def -(other)
    delete(other)
  end
end
