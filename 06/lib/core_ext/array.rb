class Array
  def my_each
    raise ArgumentError unless block_given?

    for i in self
      yield(self[i - 1])
    end

    self
  end


end
