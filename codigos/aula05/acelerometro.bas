sensors.open 1
pause 1000

do
  sensors.read 1, x, y, z
  x$ = str$(round(x*10)/10)
  y$ = str$(round(y*10)/10)
  z$ = str$(round(z*10)/10)

  print x$, y$, z$
  pause 500
until 0

sensors.close
end
