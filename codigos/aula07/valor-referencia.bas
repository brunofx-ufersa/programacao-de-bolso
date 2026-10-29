fn.def incrementa(n)
  n = n + 1
fn.end

resultado = 100

incrementa(resultado)
print resultado       

incrementa(&resultado)
print resultado       
