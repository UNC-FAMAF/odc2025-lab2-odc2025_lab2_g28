.global edificio2_detalle
.extern dibujar_rectangulo 

// ------------------- DETALLE BORDE DEL EDIFICIO --------------------

edificio2_detalle:

    sub sp, sp, #72

    // Guardar x29 (FP) y x30 (LR) en el offset 56
    stp x29, x30, [sp, #56]

    // Guardar x19 a x25 (el resto de los callee-saved que usaremos)
    stp x19, x20, [sp, #0]
    stp x21, x22, [sp, #16]
    stp x23, x24, [sp, #32]
    str x25, [sp, #48] // x25 va solo

    mov x19, x0 // x19 = framebuffer base

    // Define el color azul (ARGB: 0x1D1D4F)
    // Usos x20 como registro para almacenar el color
    movz x20, 0x1D4F           
    movk x20, 0xFF1D, lsl 16   

    // Define las dimensiones y la posición X inicial de los rectángulos
    mov x21, 320               // x21 = x inicio
    mov x22, 25                // x22 = ancho
    mov x23, 16                // x23 = alto 
    mov x24, 2                 // x24 = separacion entre cada uno

    mov x25, 0                 // x25 = y actual (variable de bucle para la y inicio, comienza en 0)

loop_rects_func:

    mov x0, x19                 // x0 = framebuffer base
    mov x1, x21                 // x1 = x inicio
    mov x2, x25                 // x2 = y inicio (toma el valor de y actual)
    mov x3, x22                 // x3 = ancho
    mov x4, x23                 // x4 = alto
    mov w5, w20                 // w5 = color

    // Verificar si el rectángulo actual se saldría del límite (y=420)
    // El fin del rectángulo actual sería y actual + alto.
    // Si y actual (x25) ya hace que y actual + alto (x25 + x23) exceda 425, salimos.
    add x26, x25, x23           // x26 = y actual + alto
    cmp x26, 420                // Compara si el final del rectángulo es 420 o más.
                                // Si es 419, el último píxel es 224. Si el último píxel
                                // permitido es 419, deberíamos parar si el inicio es 419 o más.
                                // (y actual + alto > 419, o y_actual + alto >= 419)
    bge end_loop_rects_func     // Si x26 >= 420, salta al final del bucle

    bl dibujar_rectangulo       // Llama a la función para dibujar un rectángulo

    // Calcula la siguiente posición Y para el siguiente rectángulo
    add x25, x25, x23           // y actual += alto (mueve al final del rectángulo actual)
    add x25, x25, x24           // y actual += separacion y (añade la separación de 2 píxeles)

    // Comprueba la condición de continuación del bucle
    cmp x25, 425                // Compara y actual (inicio del PROXIMO rectángulo) con 419
    blt loop_rects_func         // Si y actual (para el próximo) es menor que 419, sigue.

end_loop_rects_func:

    ldr x25, [sp, #48]
    ldp x23, x24, [sp, #32]
    ldp x21, x22, [sp, #16]
    ldp x19, x20, [sp, #0]
    ldp x29, x30, [sp, #56]      // Restaura FP y LR

    add sp, sp, #72             // Ajusta SP de vuelta a lo que se restó

    ret
