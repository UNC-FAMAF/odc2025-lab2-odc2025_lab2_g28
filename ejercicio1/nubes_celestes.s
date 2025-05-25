    .equ SCREEN_WIDTH,          640
    .equ SCREEN_HEIGHT,         480
    .equ BITS_PER_PIXEL,    32

    .equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
    .equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

.global nubes_celestes
.extern dibujar_circulo

nubes_celestes:

    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x21, [sp, #0]        // Guarda x21 en la pila

    mov x21, x0          // Guardar base framebuffer al inicio

    mov x1, 50         // centro x
    mov x2, 270        // centro y
    mov x3, 80          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 40         // centro x
    mov x2, 180        // centro y
    mov x3, 40          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 60         // centro x
    mov x2, 140        // centro y
    mov x3, 20          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 90         // centro x
    mov x2, 170        // centro y
    mov x3, 40          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 35    // centro x
    mov x2, 120        // centro y
    mov x3, 5          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 120      // centro x
    mov x2, 210  // centro y
    mov x3, 60        // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 170         // centro x
    mov x2, 200  // centro y
    mov x3, 30         // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 165         // centro x
    mov x2, 150        // centro y
    mov x3, 10          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 220         // centro x
    mov x2, 280        // centro y
    mov x3, 50          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 260         // centro x
    mov x2, 250        // centro y
    mov x3, 30          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 290         // centro x
    mov x2, 260        // centro y
    mov x3, 20          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 320         // centro x
    mov x2, 300        // centro y
    mov x3, 50          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 240         // centro x
    mov x2, 220        // centro y
    mov x3, 7          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 465         // centro x
    mov x2, 310        // centro y
    mov x3, 40          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 510         // centro x
    mov x2, 280        // centro y
    mov x3, 50          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 500         // centro x
    mov x2, 225        // centro y
    mov x3, 15          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 475         // centro x
    mov x2, 230        // centro y
    mov x3, 5          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 570         // centro x
    mov x2, 250        // centro y
    mov x3, 30          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 620         // centro x
    mov x2, 280        // centro y
    mov x3, 40          // radio
    movz w4, 0x9AFF          // parte baja: azul y parte del verde
    movk w4, 0xFF62, lsl 16  // parte alta: alfa y resto del verde
    mov x0, x21          // framebuffer base
    bl dibujar_circulo
    

    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta

    ret
