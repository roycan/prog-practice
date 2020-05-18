# require "pry"


=begin
  my base case is when the number is down to 0
  i find the modulus of the number with each of the
=end

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}


def integer_to_roman(roman_mapping, number, result = "")
  return result if number == 0

  roman_mapping.keys.each do |divisor|
    quotient, remainder = number.divmod divisor
    result << roman_mapping[divisor] * quotient
    # binding.pry
    return integer_to_roman(roman_mapping, remainder, result) if quotient > 0

  end


end

p integer_to_roman(roman_mapping, 1985)



roman_mapping = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def roman_to_integer(roman_mapping, numerals, result = 0)

  return result if numerals.empty?

  roman_mapping.keys.each do |numeral|
    if numeral.length == 1
      if numerals[0] == numeral
        result += roman_mapping[numeral]
        numerals = numerals[1..-1]
        return roman_to_integer(roman_mapping, numerals, result)
      end
    elsif numeral.length == 2
      if numerals[0] == numeral[0] && numerals[1] == numeral[1]
        result += roman_mapping[numeral]
        numerals = numerals[2..-1]
        return roman_to_integer(roman_mapping, numerals, result)
      end

    end
  end
end


p roman_to_integer(roman_mapping , "CV")

=begin
the base case is when there are no longer any numerals to convert
i will be using the sequence in the roman_mapping to my advantage
i will go ever each of the keys starting with M
if the leftmost character is M, then we add it's mapped value to the result
then we slice it off the numerals
whenever we slice, we do recursion on the remainder
=end
