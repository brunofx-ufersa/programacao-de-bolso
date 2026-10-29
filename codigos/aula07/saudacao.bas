fn.def apresenta(nome$)
  print "Olá, " + nome$ + "!"
  tts.speak "Olá, " + nome$ + "!"
fn.end

tts.init
call apresenta("Ana")
apresenta("Bruno")
pause 3000
end