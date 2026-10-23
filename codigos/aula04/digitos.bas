n = 4729
soma = 0

while n > 0
  soma = soma + mod(n, 10)
  n = floor(n / 10)
repeat

print "Soma dos dígitos: " + int$(soma)