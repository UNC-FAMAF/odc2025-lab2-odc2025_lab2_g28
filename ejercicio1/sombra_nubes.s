    .equ SCREEN_WIDTH,          640
    .equ SCREEN_HEIGHT,         480
    .equ BITS_PER_PIXEL,    32

    .equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
    .equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

.global sombra_nubes
.extern dibujar_circulo

sombra_nubes: 

    sub sp, sp, #24                 // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]          // Guarda FP y LR en la pila
    str x21, [sp, #0]               // Guarda x21 en la pila

    mov x21, x0                     // Guardar base framebuffer al inicio


// -------------- SOMBRA DE LAS NUBES ---------------------

    mov x1, 615                     // centro x
    mov x2, 330                     // centro y
    mov x3, 40                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 590                     // centro x
    mov x2, 290                     // centro y
    mov x3, 20                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 580                     // centro x
    mov x2, 340                     // centro y
    mov x3, 40                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 515                     // centro x
    mov x2, 365                     // centro y
    mov x3, 40                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 480                     // centro x
    mov x2, 370                     // centro y
    mov x3, 30                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 450                     // centro x
    mov x2, 340                     // centro y
    mov x3, 10                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 445                     // centro x
    mov x2, 305                     // centro y
    mov x3, 15                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 430                     // centro x
    mov x2, 310                     // centro y
    mov x3, 5                       // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 410                     // centro x
    mov x2, 315                     // centro y
    mov x3, 5                       // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 400                     // centro x
    mov x2, 325                     // centro y
    mov x3, 10                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 390                     // centro x
    mov x2, 310                     // centro y
    mov x3, 10                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 380                     // centro x
    mov x2, 360                     // centro y
    mov x3, 35                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 420                     // centro x
    mov x2, 370                     // centro y
    mov x3, 20                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 445                     // centro x
    mov x2, 375                     // centro y
    mov x3, 15                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 350                     // centro x
    mov x2, 380                     // centro y
    mov x3, 15                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 280                     // centro x
    mov x2, 290                     // centro y
    mov x3, 5                       // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 267                     // centro x
    mov x2, 285                     // centro y
    mov x3, 12                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 280                     // centro x
    mov x2, 380                     // centro y
    mov x3, 50                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 335                     // centro x
    mov x2, 390                     // centro y
    mov x3, 10                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 260                     // centro x
    mov x2, 310                     // centro y
    mov x3, 15                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 290                     // centro x
    mov x2, 330                     // centro y
    mov x3, 7                       // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 250                     // centro x
    mov x2, 335                     // centro y
    mov x3, 15                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 200                     // centro x
    mov x2, 395                     // centro y
    mov x3, 70                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 85                      // centro x
    mov x2, 240                     // centro y
    mov x3, 30                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 85                      // centro x
    mov x2, 270                     // centro y
    mov x3, 40                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo

    mov x1, 140                     // centro x
    mov x2, 250                     // centro y
    mov x3, 10                      // radio
    movz w4, 0xE5E5         
    movk w4, 0xFFE5, lsl 16         // Color gris
    mov x0, x21                     // framebuffer base
    bl dibujar_circulo




    ldr x21, [sp, #0]               // Restaura x21
    ldp x29, x30, [sp, #8]          // Restaura FP y LR
    add sp, sp, #24                 // Ajusta SP de vuelta

    ret
