module PagesHelper

  def caesar_cipher(input="")
    # input = '"What a string!", 5'
    # output = "Bmfy f xywnsl!"

    arr = input.split(",")
    s = arr[0].strip
    n = arr[1].to_i

    t = s.split("").map do |l|

       if (l>="a" && l<="z") || (l>="A" && l<="Z")

         lord = l.ord + n
         lord -= 26  if (lord>"Z".ord && lord<"a".ord)  ||  (lord>"z".ord)

          l = lord.chr
       else
         l = l
       end

    end

    return t.join
  end



####################################################



  def stock_picker(input="")
    # input = "17,3,6,9,15,8,6,1,10"
    # output = [1,4] # for a profit of $15 - $3 == $12
    arr = input.split(",")
    arr = arr.map { |num| num.to_i }

    high = arr[0]
    low = arr[0]
    diff = high - low

    for i in (0...arr.length)
      for j in (i+1)...arr.length
        if (arr[i] - arr[j]) < diff
          low = arr[i]
          high = arr[j]
          diff = low - high
        end
      end
    end

    ans = Hash.new
    ans[:high] = high
    ans[:low] = low
    ans[:diff] = diff

    buy = arr.index(low)
    sell = arr.index(high)

    return "[#{buy}, #{sell}] # for a profit of $#{high} - $#{low} == $#{diff.abs}"
  end



###################################################



  def substrings(input="")
    # input = '"below", ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]'
    # input = %("Howdy partner, sit down! How's it going?", ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"])

    output = Hash.new(0)

    input.downcase!
    arr = input.split("[")
    str = arr[0].split(" ")
    str.map { |e| e.gsub!(/[^0-9a-z']/i, '')}

    dict = arr[1].split(",")
    dict.map { |e| e.gsub!(/[^0-9a-z']/i, '')}

    str.each do |key|
      dict.each do |word|
        if key.include? word
          output[word] += 1
        end
      end
    end
    return output
  end


end
