
recorde = 0
continuar = 1

while continuar = 1
  acertos = 0
  limite = 9
  jogando = 1

  while jogando = 1
    a = floor(rnd() * limite) + 1
    b = floor(rnd() * limite) + 1
    input int$(a) + " x " + int$(b) + " = ", resp

    if resp = a * b
      acertos = acertos + 1
      limite = 9 + 2 * acertos
    else
      jogando = 0
    endif
  repeat

  if acertos > recorde
    recorde = acertos
    msg$ = "Novo recorde: " + int$(recorde) + "!"
  else
    msg$ = "Sequência: " + int$(acertos) + "." 
  endif

  print msg$$
  dialog.message "Fim de jogo", "Jogar de novo?", escolha, "Sim", "Não"
  if escolha <> 1 then continuar = 0
repeat

end