=begin
for each file in the directory,
  get the extension
  unless the extension is a key in the files hash
    make the extension a key in the hash
    the value of the hash is another hash
    the hash has a :count key that has the number of files of that extension
    the hash has a :bits key that has the number of bits of all files with that extension
    initialize :bits and :count to 0

  add 1 to the :count
  add the File.size to the :bits

=end

DIRNAME = "Downloads"
DIR_PATH = "/home/roy/Downloads/**/*"

Dir.glob('*').length
Dir.glob("*").inject(0) {|s, f| s + File.size(f).to_i }
# Dir.glob('*').each {|f| puts File.size(f)}


storage_use = Hash.new
Dir.glob(DIR_PATH).each do |f|
  unless f.match(/[\.]+\w*/).to_s.strip == ""
    key = f.match(/[\.]+\w*$/).to_s
    key = key.downcase
    key = key[1...key.size]

    if storage_use[key] == nil
      storage_use.update( key => {
                              bits: 0 ,
                              count: 0
                              })
    end
    storage_use.update( key => {
                            bits: File.size(f) + storage_use[key][:bits] ,
                            count: 1 + storage_use[key][:count]
                            })

  end
end

storage_use.sort_by{ |k,v| v[:bits]}
storage_use.sort_by{ |k,v| -v[:bits]}.each{|k,v| puts k.to_s + " " + v.to_s}

puts "Filetype\tCount\tBytes"
storage_use.each do |k,v|
  print k + "\t" + v[:count].to_s + "\t" + v[:bits].to_s + "\n"  if k
end


File.open("storage_use.csv", "w") do |f|
  f.puts "Filetype\tCount\tBytes"

  storage_use.each do |k,v|
    f.print k + "\t" + v[:count].to_s + "\t" + v[:bits].to_s + "\n"  if k
  end
end
