require "open-uri"




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



p big_types = storage_use.select { |k,v| v[:bits] > 100_000_000 }.reject { |k,v| k == nil}

p labels = big_types.sort_by{ |k,v| -v[:bits]}.map{ |k,v| k.capitalize }.join("|")
p sizes = big_types.sort_by{ |k,v| -v[:bits]}.map{ |k,v| v[:bits]}.join(",")


p uri = URI.encode("https://image-charts.com/chart\
?cht=p3\
&chs=700x700\
&chd=a:#{sizes}\
&chl=#{labels}\
&chan\
&chf=ps0-0,lg,45,ffeb3b,0.2,f44336,1|ps0-1,lg,45,8bc34a,0.2,009688,1")



open(uri) do |image|
  File.open("file-pie-chart.jpg", "wb") do |file|
    file.write(image.read)
  end
end
