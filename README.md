4.2. Simulate P Control: Resultados y Análisis

1. Is the proposed controller correct? Why?
El esquema de control propuesto presenta una arquitectura conceptualmente válida para el control de impedancia y fuerza; sin embargo, resulta incorrecto e insuficiente para cumplir con el objetivo de diseño establecido.
Justificación: Al emplear una matriz constante $\mathbf{C}_F$, el lazo exterior opera como un controlador puramente proporcional. Se observa en la simulación que el sistema presenta un severo error en estado estacionario, estabilizándose en una fuerza de tracción de $\approx -13.72\text{ N}$ en lugar de los $10\text{ N}$ deseados. Matemáticamente, una acción estrictamente proporcional carece de la capacidad para integrar y anular la perturbación constante generada por la posición de referencia del entorno elástico ($\mathbf{x}_r = 1.2\text{ m}$). Para corregir esta deficiencia y garantizar convergencia hacia la fuerza de referencia, se requiere la implementación de una acción integral.

2. What is happening in the Y axis? Why?
En el eje Y, el manipulador no ejerce ni percibe ninguna fuerza de contacto, comportándose de manera equivalente a un sistema sometido exclusivamente a un control de posición. El efector final se mantiene de forma estática en la coordenada $y = 0.7\text{ m}$.
Justificación: Este fenómeno se debe a la nulidad de los parámetros dinámicos y de control definidos para dicho eje (correspondientes a la componente $(2,2)$ de las matrices y al segundo elemento de los vectores).
Específicamente, la rigidez del entorno es nula ($K{2,2} = 0$), la fuerza de referencia solicitada es nula ($f{d,y} = 0$) y la ganancia proporcional de fuerza es nula ($C{F{2,2}} = 0$). En consecuencia, el lazo exterior de fuerza se desacopla por completo en la componente Y. La dinámica del sistema en este eje queda gobernada de manera exclusiva por el lazo interno de impedancia ($\mathbf{M}_d$, $\mathbf{K}_D$, $\mathbf{K}_P$), el cual regula el sistema para mantener la posición inicial sin generar interacción de fuerzas.

