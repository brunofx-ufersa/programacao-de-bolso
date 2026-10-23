gr.open 255, 11, 42, 91
gr.orientation 1
gr.screen w, h

raio = 40
x = raio
y = h / 2
vx = 8

do
  x = x + vx

  if x > w - raio | x < raio
    vx = -vx
  endif

  gr.cls
  gr.color 255, 66, 165, 245
  gr.circle bolha, x, y, raio
  gr.render

  gr.touch toque, tx, ty
  pause 15
until toque

gr.close
end