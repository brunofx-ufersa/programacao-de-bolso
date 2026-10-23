tts.init
sensors.open 1
pause 1000
anterior$ = ""

do
  sensors.read 1, x, y, z
  if z > 8
    atual$ = "deitado, tela para cima"
  elseif z < -8
    atual$ = "deitado, tela para baixo"
  elseif y > 8
    atual$ = "de pé"
  elseif y < -8
    atual$ = "de cabeça para baixo"
  elseif abs(x) > 8
    atual$ = "de lado"
  else
    atual$ = "inclinado"
  endif

  if atual$ <> anterior$
    print atual$
    tts.speak "Estou " + atual$
    anterior$ = atual$
  endif
  
  pause 500
until 0

sensors.close
tts.stop
end
