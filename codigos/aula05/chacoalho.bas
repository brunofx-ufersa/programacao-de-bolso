tts.init
sensors.open 1
pause 1000
total = 0
chacoalhando = 0

do
  sensors.read 1, x, y, z
  forca = sqr(x^2 + y^2 + z^2)
  
  if forca > 15 & chacoalhando = 0
    total = total + 1
    chacoalhando = 1
    print "Chacoalhadas: " + int$(total)
    tts.speak int$(total)
  endif
  
  if forca < 11
    chacoalhando = 0
  endif
  
  pause 50
until 0

sensors.close
tts.stop
end
