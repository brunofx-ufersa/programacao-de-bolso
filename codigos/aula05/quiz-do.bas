erros = 0
acertos = 0
do
  a = floor(rnd() * 9) + 1
  b = floor(rnd() * 9) + 1
  input int$(a) + " x " + str$(b) + " = ", resp

  if resp = a * b 
    acertos += 1
  else
    erros++
  endif    
until erros >= 3

total = erros + acertos
porcentagem = round(acertos / total * 100)
print "Você acertou " + int$(acertos) + " de " + int$(total);
print " (" + int$(porcentagem) + "%)"

end