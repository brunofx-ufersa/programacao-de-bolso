gr.open 255, 11, 42, 91
gr.orientation 1
gr.screen w, h

raio = 40
x = w / 2
y = h / 3
vx = 12
vy = 9

do
  x = x + vx
  y = y + vy

  if x > w - raio | x < raio
    vx = -vx
  endif
  if y > h - raio | y < raio
    vy = -vy
  endif

  gr.cls
  gr.color 255, 245, 158, 11
  gr.circle bolha, x, y, raio
  gr.render

  gr.touch toque, tx, ty
  pause 15
until toque

gr.close
end