fn.def posicao$(x, y, z)
  if z > 8
    fn.rtn "deitado, tela para cima"
  endif
  if z < -8
    fn.rtn "deitado, tela para baixo"
  endif
  if y > 8
    fn.rtn "de pé"
  endif
  if y < -8
    fn.rtn "de cabeça para baixo"
  endif
  if abs(x) > 8
    fn.rtn "de lado"
  endif
  fn.rtn "inclinado"
fn.end

print posicao$(0, 9.7, 0.5)     
