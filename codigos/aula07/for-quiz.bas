fn.def sorteia(limite)
  fn.rtn floor(rnd() * limite) + 1
fn.end

acertos = 0
total = 10

for i = 1 to total
  a = sorteia(9)
  b = sorteia(19)
  input int$(a) + " x " + int$(b) + " = ?", resp
  if resp = a * b
    acertos = acertos + 1
  endif
next i

print "Você acertou " + int$(acertos) + " de " + int$(total)
end
