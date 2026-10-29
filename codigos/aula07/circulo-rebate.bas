include "minhalib.bas"

gr.open 255, 11, 42, 91
gr.orientation 1
gr.screen w, h

raio = 40
x = w / 2 : y = h / 3
vx = 12 : vy = 9

do
  x += vx : y += vy
  vx = rebate(x, vx, raio, w)
  vy = rebate(y, vy, raio, h)

  gr.cls
  call circulo(x, y, raio, 245, 158, 11)
  gr.render

  gr.touch toque, tx, ty
  pause 15
until toque

gr.close
