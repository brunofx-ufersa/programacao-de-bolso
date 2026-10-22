a = floor(rnd() * 9) + 1
b = floor(rnd() * 9) + 1
input int$(a) + " x " + int$(b) + " = ", resp

if resp = a * b
  print "Acertou!"
else
  print "Errou!"
endif

end