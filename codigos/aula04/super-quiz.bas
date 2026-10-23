acertos = 0
jogando = 1

while jogando = 1
  a = floor(rnd() * 9) + 1
  b = floor(rnd() * 9) + 1
  input "int$(a) + " x " + int$(b) + " = ", resp

  if resp = a * b
    acertos = acertos + 1
    print "Acertou!"
  else
    print "Errou! Era " + int$(a * b)
    jogando = 0
  endif
repeat

print "Fim de jogo! Sua sequência: " + int$(acertos)
end