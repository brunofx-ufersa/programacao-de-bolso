include "minhalib.bas"

gr.open 255, 11, 42, 91
gr.orientation 1
gr.screen w, h

L = 250 : g = 9.81 : th = 0.2
dt = 0.3 : om = 0
cx = w / 2 : cy = 150
raio = 20

do
  al = accel(th, g, L)
  om = om + al * dt
  th = th + om * dt

  px = get_x(cx, L, th)
  py = get_y(cy, L, th)

  gr.cls
  call linha(cx, cy, px, py, 100, 100, 100)
  call circulo(px, py, raio, 245, 158, 11)
  gr.render
  pause 16
until 0
end