input "Como você se chama?", nome$
input "Em que ano você nasceu?", nasc
idade = 2026 - nasc
frase$ = nome$ + ", você tem cerca de " + int$(idade) + " anos."
tts.init
tts.speak frase$
tts.stop
print frase$
end
