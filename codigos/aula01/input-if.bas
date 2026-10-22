input "Como você se chama?", nome$
input "Em que ano você nasceu?", nasc
idade = 2026 - nasc
saudacao$ = "Olá, " + nome$ + "! Você tem " + int$(idade) + " anos."

if idade < 18
  comentario$ = "Você tem a vida inteira pela frente."
elseif idade < 30
  comentario$ = "Hora de programar no ônibus!"
else
  comentario$ = "Experiência vale ouro na programação."
endif

tts.init
tts.speak saudacao$
tts.speak comentario$
tts.stop

print saudacao$
print comentario$