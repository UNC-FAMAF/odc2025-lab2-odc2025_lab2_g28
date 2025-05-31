.global delay_us

// delay_us: Función de retardo calibrada en microsegundos (usando bucle de conteo)
// Entrada: x0 = Número de microsegundos a esperar
//
// NOTA IMPORTANTE PARA QEMU:
// Este delay se basa en un bucle de conteo (busy-wait).
// Su duración REAL dependerá de la velocidad de la CPU emulada en QEMU.
// El factor de calibración 'x1' es una estimación.
// Para un delay de N microsegundos:
// 1. x0 recibe N.
// 2. x0 se multiplica por un factor de calibración (ej. 10).
//    Esto convierte los 'microsegundos' en un número de 'iteraciones' del bucle.
// 3. El bucle cuenta regresivamente ese número de iteraciones.

delay_us:
    mov x1, #10           // x1 = Factor de calibración.
                          // Ajusta este valor:
                          //  - Un valor MÁS ALTO hará el delay MÁS LARGO.
                          //  - Un valor MÁS BAJO hará el delay MÁS CORTO.
                          // Empieza con 10 o 50 para probar, luego ajusta finamente.
    mul x0, x0, x1        // x0 = x0 (microsegundos deseados) * x1 (factor de calibración)
                          // Esto da el número total de "ciclos de bucle" a esperar.

delay_loop:
    subs x0, x0, #1       // Decrementa el contador. 'subs' actualiza los flags.
    bne delay_loop        // Si x0 no es cero, continúa el bucle.
    ret                   // Retorna de la función cuando el contador llega a cero.
    