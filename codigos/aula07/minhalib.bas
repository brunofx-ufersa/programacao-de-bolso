fn.def circulo(x, y, raio, r, g, b)
  gr.color 255, r, g, b
  gr.circle obj, x, y, raio
fn.end

fn.def linha(x1, y1, x2, y2, r, g, b)
  gr.color 255, r, g, b
  gr.line obj, x1, y1, x2, y2
fn.end

fn.def rebate(pos, vel, raio, limite)
  if (pos < raio & vel < 0) | (pos > limite - raio & vel > 0)
    fn.rtn -vel
  endif
  fn.rtn vel
fn.end

fn.def accel(th, g, L)
  fn.rtn -(g / L) * th
fn.end

fn.def get_x(cx, L, th)
  fn.rtn cx + L * sin(th)
fn.end

fn.def get_y(cy, L, th)
   fn.rtn cy + L * cos(th)
fn.end
