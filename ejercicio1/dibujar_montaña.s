    .equ SCREEN_WIDTH,          640
    .equ SCREEN_HEIGHT,         480
    .equ BITS_PER_PIXEL,    32

    .equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
    .equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

    .globl dibujar_montaña
    
dibujar_montaña:

    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x21, [sp, #0]        // Guarda x21 en la pila

    mov x21, x0              // Guardar base framebuffer al inicio

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl montaña_gris

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl montaña1_clara

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl montaña1_sombra2

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl montaña2_clara

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl montaña2_sombra2


    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta


ret
