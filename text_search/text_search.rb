pattern = Regexp.new(ARGV[0].encode("UTF-8"))
filename = ARGV[1]
len = ARGV[2].to_i

count = 0
File.open(filename,"r:UTF-8") do |file|
  file.each_line do |line|
    line.scan(pattern) do |s|
      pre = "\u3000" * len + $'
      post = $'
      puts "#{pre[-len, len]}<<#{s}>>#{post[0, len]}"
      count += 1
    end
  end
end
puts "count: #{count}"