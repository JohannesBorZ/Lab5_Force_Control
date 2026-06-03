##4.2. Simulate P Control: Resultados y Análisis

Se realiza el siguiente diaframa en Simulink:
!(Diagrama_4_2.jpg)

Obteniendo estos resultados:
!(Resultados_4_2.jpg)

####1. Is the proposed controller correct? Why?
El esquema de control propuesto presenta una arquitectura conceptualmente válida para el control de impedancia y fuerza; sin embargo, resulta incorrecto e insuficiente para cumplir con el objetivo de diseño establecido.
Justificación: Al emplear una matriz constante $\mathbf{C}_F$, el lazo exterior opera como un controlador puramente proporcional. Se observa en la simulación que el sistema presenta un severo error en estado estacionario, estabilizándose en una fuerza de tracción de $\approx -13.72\text{ N}$ en lugar de los $10\text{ N}$ deseados. Matemáticamente, una acción estrictamente proporcional carece de la capacidad para integrar y anular la perturbación constante generada por la posición de referencia del entorno elástico ($\mathbf{x}_r = 1.2\text{ m}$). Para corregir esta deficiencia y garantizar convergencia hacia la fuerza de referencia, se requiere la implementación de una acción integral.

####2. What is happening in the Y axis? Why?
En el eje Y, el manipulador no ejerce ni percibe ninguna fuerza de contacto, comportándose de manera equivalente a un sistema sometido exclusivamente a un control de posición. El efector final se mantiene de forma estática en la coordenada $y = 0.7\text{ m}$.
Justificación: Este fenómeno se debe a la nulidad de los parámetros dinámicos y de control definidos para dicho eje (correspondientes a la componente $(2,2)$ de las matrices y al segundo elemento de los vectores).
Específicamente, la rigidez del entorno es nula ($K{2,2} = 0$), la fuerza de referencia solicitada es nula ($f{d,y} = 0$) y la ganancia proporcional de fuerza es nula ($C{F{2,2}} = 0$). En consecuencia, el lazo exterior de fuerza se desacopla por completo en la componente Y. La dinámica del sistema en este eje queda gobernada de manera exclusiva por el lazo interno de impedancia ($\mathbf{M}_d$, $\mathbf{K}_D$, $\mathbf{K}_P$), el cual regula el sistema para mantener la posición inicial sin generar interacción de fuerzas.

##4.3. Simulate PI Control: Resultados y Análisis

####1. Does this produce any improvement in the controller? Why?
Sí, se produce una mejora fundamental en el sistema: la eliminación completa del error en estado estacionario.
Justificación: Al sustituir la matriz de ganancia constante por una acción Proporcional-Integral ($\mathbf{C}_F = \mathbf{K}_F + \mathbf{K}_I \int_0^t (\cdot)d\varsigma$), el controlador adquiere la capacidad matemática de acumular el error de fuerza ($\mathbf{f}_d - \mathbf{f}_e$) a lo largo del tiempo. Mientras exista una discrepancia entre la referencia y la fuerza medida, el término integral ajustará continuamente la consigna enviada al lazo interno de posición. Esto garantiza que, en régimen permanente, el error se reduzca exactamente a cero, logrando que el manipulador ejerza los $10\text{ N}$ requeridos contra el entorno elástico.

####2. Can you improve it more? How?
Sí, es posible introducir mejoras adicionales para optimizar el comportamiento dinámico y la seguridad del sistema, especialmente durante la fase transitoria:
Implementación de un mecanismo Anti-Windup: Dado que se emplea una acción integral, si el efector final realiza un movimiento de aproximación prolongado en el espacio libre (donde $\mathbf{f}_e = 0$), el término integral acumulará un error masivo. Esto puede resultar en la saturación de la señal de control y en un impacto severo (sobreimpulso) contra la superficie. Incorporar lógica para detener o limitar la integración antes del contacto mitigaría este fenómeno.
Inclusión de Acción Derivativa (Control PID): Se podría añadir una matriz derivativa de fuerza al esquema de control. El término derivativo evalúa la tasa de cambio del error, actuando como un amortiguador dinámico. Su implementación permitiría anticipar el impacto y reducir significativamente las oscilaciones mecánicas al entrar en contacto con el entorno.
Sintonización de Ganancias (Tuning): Aunque los valores propuestos ($\mathbf{K}_F = 0.03, \mathbf{K}_I = 0.03$) logran la convergencia, se puede realizar un ajuste fino mediante técnicas de sintonización para optimizar la relación de compromiso entre el tiempo de establecimiento (rapidez de respuesta) y la reducción del sobreimpulso transitorio.
