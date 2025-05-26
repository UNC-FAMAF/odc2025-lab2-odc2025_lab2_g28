    .equ SCREEN_WIDTH,          640
    .equ SCREEN_HEIGHT,         480
    .equ BITS_PER_PIXEL,    32

    .equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
    .equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

    .globl montaña_gris
    .extern dibujar_circulo
    .extern dibujar_rectangulo

montaña_gris:

    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x21, [sp, #0]        // Guarda x21 en la pila

    mov x21, x0              // Guardar base framebuffer al inicio

// DETALLES MONTAÑAS

    movz x12, 0xFF70, lsl 16   // *** COLOR (parte alta) ***
    movk x12, 0x8898, lsl 0  // *** COLOR (parte baja) ***
    mov x2, 310             // *** POSICIÓN X inicial rectángulo (columna) ***
    mov x3, 382              // *** POSICIÓN Y inicial rectángulo (fila) ***
    mov x4, 20               // ancho
    mov x5, 5               // alto
    bl dibujar_rectangulo

    movz x12, 0xFF70, lsl 16   // *** COLOR (parte alta) ***
    movk x12, 0x8898, lsl 0  // *** COLOR (parte baja) ***
    mov x2, 190             // *** POSICIÓN X inicial rectángulo (columna) ***
    mov x3, 375              // *** POSICIÓN Y inicial rectángulo (fila) ***
    mov x4, 20               // ancho
    mov x5, 5               // alto
    bl dibujar_rectangulo

    movz x12, 0xFF70, lsl 16   // *** COLOR (parte alta) ***
    movk x12, 0x8898, lsl 0  // *** COLOR (parte baja) ***
    mov x2, 370             // *** POSICIÓN X inicial rectángulo (columna) ***
    mov x3, 381              // *** POSICIÓN Y inicial rectángulo (fila) ***
    mov x4, 20               // ancho
    mov x5, 5               // alto
    bl dibujar_rectangulo

// PRIMER MONTAÑA
    
    mov x1, 205              // *** POSICIÓN X centro del círculo ***
    mov x2, 415              // *** POSICIÓN Y centro del círculo ***
    mov x3, 40               // radio
    movz x4, 0xFF70, lsl 16    // *** COLOR (parte alta) ***
    movk x4, 0x8898, lsl 0   // *** COLOR (parte baja) ***
    mov x0, x21              // framebuffer base
    bl dibujar_circulo

    // SEGUNDA MONTAÑA

    mov x1, 250              // *** POSICIÓN X centro del círculo ***
    mov x2, 420              // *** POSICIÓN Y centro del círculo ***
    mov x3, 40               // radio
    movz x4, 0xFF70, lsl 16    // *** COLOR (parte alta) ***
    movk x4, 0x8898, lsl 0   // *** COLOR (parte baja) ***
    mov x0, x21              // framebuffer base
    bl dibujar_circulo

    // TERCERER MONTAÑA

    mov x1, 290              // *** POSICIÓN X centro del círculo ***
    mov x2, 410              // *** POSICIÓN Y centro del círculo ***
    mov x3, 40               // radio
    movz x4, 0xFF70, lsl 16    // *** COLOR (parte alta) 0x69BD2F ***
    movk x4, 0x8898, lsl 0   // *** COLOR (parte baja) ***
    mov x0, x21              // framebuffer base
    bl dibujar_circulo


    // CUARTA MONTAÑA

    mov x1, 335              // *** POSICIÓN X centro del círculo ***
    mov x2, 415              // *** POSICIÓN Y centro del círculo ***
    mov x3, 33               // radio
    movz x4, 0xFF70, lsl 16    // *** COLOR (parte alta) ***
    movk x4, 0x8898, lsl 0   // *** COLOR (parte baja) ***
    mov x0, x21              // framebuffer base
    bl dibujar_circulo

    //  QUINTA MONTAÑA

    mov x1, 368              // *** POSICIÓN X centro del círculo ***
    mov x2, 415              // *** POSICIÓN Y centro del círculo ***
    mov x3, 37               // radio
    movz x4, 0xFF70, lsl 16    // *** COLOR (parte alta) ***
    movk x4, 0x8898, lsl 0   // *** COLOR (parte baja) ***
    mov x0, x21              // framebuffer base
    bl dibujar_circulo

    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta

    ret

