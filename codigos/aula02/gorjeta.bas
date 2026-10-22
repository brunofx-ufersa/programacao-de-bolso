input "Valor da conta? ", conta
input "Porcentagem da gorjeta? ", pct
input "Quantas pessoas? ", pessoas

gorjeta = conta * pct / 100
total = conta + gorjeta
porcab = total / pessoas

print using$("br", "Gorjeta ........... R$ %.2f", gorjeta)
print using$("br", "Total ............. R$ %.2f", total)
print using$("br", "Por pessoa ........ R$ %.2f", porcab)