acertos = 0
total = 10

for i = 1 to total
  a = floor(rnd() * 9) + 1
  b = floor(rnd() * 9) + 1
  input "int$(a) + " x " + int$(b) + " = ", resp

  if resp = a * b
    acertos = acertos + 1
    print "Acertou!"
  else
    print "Errou!"
  endif
next i

porcentagem = round(acertos / total * 100)
print "Você acertou " + int$(acertos) + " de " + int$(total);
print " (" + int$(porcentagem) + "%)"

end