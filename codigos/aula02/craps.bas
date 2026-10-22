
input "Aposte na soma dos dois dados (2 a 12): ", palpite

dado1 = floor(6 * rnd()) + 1
dado2 = floor(6 * rnd()) + 1
soma = dado1 + dado2

print "Dado 1: " + int$(dado1)
print "Dado 2: " + int$(dado2)
print "Soma final: " + int$(soma)

if palpite = soma 
    print "PARABÉNS! Você acertou a soma exata!"
else
    print "Que pena! A sorte não estava com você desta vez."
endif

end