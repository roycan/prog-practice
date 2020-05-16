=begin

I will get the 10 largest files inside a directory using Ruby
I will use Dir.glob to look into my Downloads folder
For each file, I will output the file size


=end


DIRNAME = "Downloads"

sorted =  Dir.glob('*').sort_by { |f|  -File.size(f)}
sorted[0..9].each {|f| puts f + " " + File.size(f).to_s }

puts Dir.glob("/home/roy/#{DIRNAME}/**/*").length

sorted = Dir.glob("/home/roy/#{DIRNAME}/**/*").sort_by { |f| -File.size(f)}
sorted[0..9].each {|f| puts f + " " + File.size(f).to_s}
