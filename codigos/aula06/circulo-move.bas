gr.open 255, 11, 42, 91
gr.orientation 1
gr.screen w, h

raio = 40
x = raio
y = h / 2
vx = 6

while x - raio < w
  x = x + vx

  gr.cls
  gr.color 255, 66, 165, 245, 1
  gr.circle bolha, x, y, raio
  gr.render
  pause 15
repeat

pause 1000
gr.close
end