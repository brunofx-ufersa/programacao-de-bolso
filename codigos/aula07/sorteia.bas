fn.def sorteia(limite)
  fn.rtn floor(rnd() * limite) + 1
fn.end

a = sorteia(9)
b = sorteia(20)
print int$(a) + " x " + int$(b) + " = " + int$(a * b)
end
