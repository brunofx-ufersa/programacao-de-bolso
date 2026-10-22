tts.init

for i = 5 to 1 step -1
  tts.speak int$(i)
  pause 500
next i

tts.speak "Asas batendo,"
tts.speak "Marcha de decolagem,"
tts.speak "Turbinas e"
tts.speak "Já"
tts.stop

end
