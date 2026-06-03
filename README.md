1. Is the proposed controller correct? Why?

Sí, la arquitectura del controlador es válida como un esquema de control de impedancia/fuerza, pero presenta un error en estado estacionario.
Al observar la gráfica de fuerza en el eje X, verás que la fuerza real $\mathbf{f}_e$ se estabiliza en un valor inferior a los $10N$ deseados ($\mathbf{f}_d$). Esto ocurre porque la matriz $\mathbf{C}_F$ solo aplica una acción Proporcional. Un controlador puramente proporcional siempre requiere un error remanente (la diferencia entre $\mathbf{f}_d$ y $\mathbf{f}e$) para generar una señal de control que venza la resistencia constante del muelle (el entorno $\mathbf{K}$).

2. What is happening in the Y axis? Why?En el eje Y, la fuerza aplicada es exactamente $0$ y el robot se mantiene en la posición $y = 0.7m$.

Fíjate en las matrices de este eje (la fila 2 y columna 2). La rigidez del entorno en Y es nula ($K{2,2} = 0$), la referencia de fuerza es nula ($f{d,y} = 0$), y la ganancia de fuerza es nula ($C{F_{2,2}} = 0$). Como resultado, todo el lazo exterior de fuerza se cancela en la componente Y. El sistema se reduce puramente al lazo interno de posición dictado por $\mathbf{M}_d$, $\mathbf{K}_D$ y $\mathbf{K}_P$, que simplemente mantiene el efector final en su condición inicial $y = 0.7m$ sin interactuar con el entorno.