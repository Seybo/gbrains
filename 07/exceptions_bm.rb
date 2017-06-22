equire 'benchmark'

module ExBM
  def self.benchmark
    Benchmark.bm do |bm|
      bm.report('long') do
        1000.times do
          begin
            no_method
          rescue
            nil
          end
        end
      end
      bm.report('short') do
        1000.times do
          no_method rescue nil
        end
      end
    end
  end
end

