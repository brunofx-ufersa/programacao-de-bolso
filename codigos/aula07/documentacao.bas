!! 
===================================================================
Função: distancia
Calcula a distância euclidiana entre dois pontos (x1, y1) e (x2, y2). 
Parâmetros:
x1, y1 - Coordenadas do Ponto A
x2, y2 - Coordenadas do Ponto B
Retorno: Distância direta em pixels (número real).
 ===================================================================
!!

fn.def distancia(x1, y1, x2, y2)
  ! Aplicação da fórmula da distância (Pitágoras)
  fn.rtn sqr((x2 - x1)^2 + (y2 - y1)^2)
fn.end