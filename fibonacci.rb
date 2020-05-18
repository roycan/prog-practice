
def fib(n)
  return [0] if n == 0
  return [0, 1] if n == 1

  last = 1
  lastlast = 0
  result = Array([0, 1])
  nextval = 0
  for i in 2..n
    nextval = last + lastlast
    result << nextval
    lastlast = last
    last = nextval
  end
  return result
end


p fib(7)





def fib_rec(n)
  result = []
  return result << 0 if n == 0
  return result = fib_rec(0) << 1  if n == 1
  result = fib_rec(n-1)
  result << (result[n-2] + result[n-1])

p fib_rec(7)
