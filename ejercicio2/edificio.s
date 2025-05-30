.equ SCREEN_WIDTH,          640
.equ SCREEN_HEIGHT,         480
.equ BITS_PER_PIXEL,    32

.equ GPIO_BASE,      0x3f200000
.equ GPIO_GPFSEL0,   0x00
.equ GPIO_GPLEV0,    0x34

.globl edificio
.extern dibujar_circulo
.extern dibujar_rectangulo

edificio:

    sub sp, sp, #24                     // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]              // Guarda FP y LR en la pila
    str x21, [sp, #0]                   // Guarda x21 en la pila

    mov x21, x0                         // Guardar base framebuffer al inicio (el fb base de la llamada a 'edificio')

//------------------- VENTANAS SEGUNDO PISO  ---------------------------

    // Círculo 1
    mov x0, x21                         // framebuffer base
    mov x1, 65                          // centro x
    mov x2, 50                          // centro y
    mov x3, 35                          // radio
    movz w4, 0x366B         
    movk w4, 0xFF33, lsl 16             // Color celeste
    bl dibujar_circulo

    // Círculo 2
    mov x0, x21                         // framebuffer base
    mov x1, 65                          // centro x
    mov x2, 50                          // centro y
    mov x3, 25                          // radio
    movz w4, 0x264F                     // Color azul oscuro
    movk w4, 0xFF24, lsl 16             
    bl dibujar_circulo

    // Círculo 3
    mov x0, x21                         // framebuffer base
    mov x1, 180                         // centro x
    mov x2, 50                          // centro y
    mov x3, 35                          // radio
    movz w4, 0x366B         
    movk w4, 0xFF33, lsl 16             // Color celeste
    bl dibujar_circulo

    // Círculo 4
    mov x0, x21                         // framebuffer base
    mov x1, 180                         // centro x
    mov x2, 50                          // centro y
    mov x3, 25                          // radio
    movz w4, 0x264F                     // Color azul oscuro
    movk w4, 0xFF24, lsl 16             // Color azul
    bl dibujar_circulo

    // Rectángulo 1
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 103                         // x inicial 
    mov x2, 50                          // y inicial 
    mov x3, 40                          // Ancho 
    mov x4, 10                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 2
    mov x0, x21                         // framebuffer base
    movz w5, 0x264F                     // Color azul 
    movk w5, 0xFF24, lsl 16
    mov x1, 0                           // x inicial 
    mov x2, 60                          // y inicial 
    mov x3, 250                         // Ancho 
    mov x4, 50                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 3
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 0                           // x inicial 
    mov x2, 50                          // y inicial 
    mov x3, 28                          // Ancho 
    mov x4, 10                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 4
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 218                         // x inicial 
    mov x2, 50                          // y inicial 
    mov x3, 20                          // Ancho 
    mov x4, 10                          // Alto 
    bl dibujar_rectangulo

    // Círculo 5
    mov x0, x21                         // framebuffer base
    mov x1, 65                          // centro x
    mov x2, 50                          // centro y
    mov x3, 22                          // radio
    movz w4, 0x366B                     // Color CELESTE
    movk w4, 0xFF33, lsl 16             // Color azul
    bl dibujar_circulo

    // Rectángulo 5
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 44                          // x inicial 
    mov x2, 57                          // y inicial 
    mov x3, 43                          // Ancho 
    mov x4, 70                          // Alto 
    bl dibujar_rectangulo

    // Círculo 6
    mov x0, x21                         // framebuffer base
    mov x1, 180                         // centro x
    mov x2, 50                          // centro y
    mov x3, 22                          // radio
    movz w4, 0x366B                     // Color CELESTE
    movk w4, 0xFF33, lsl 16             // Color azul
    bl dibujar_circulo

    // Rectángulo 6
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 159                         // x inicial 
    mov x2, 57                          // y inicial 
    mov x3, 43                          // Ancho 
    mov x4, 70                          // Alto 
    bl dibujar_rectangulo

// ---------------------- DETALLES ENTRE MEDIO DE LAS VENTANAS -------------------

    // Rectángulo 7
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 0                           // x inicial 
    mov x2, 135                         // y inicial 
    mov x3, 235                         // Ancho 
    mov x4, 2                           // Alto 
    bl dibujar_rectangulo

    // Rectángulo 8
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 0                           // x inicial 
    mov x2, 140                         // y inicial 
    mov x3, 235                         // Ancho 
    mov x4, 20                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 9
    mov x0, x21                         // framebuffer base
    movz w5, 0x264F                     // Color AZUL 
    movk w5, 0xFF24, lsl 16
    mov x1, 45                          // x inicial 
    mov x2, 142                         // y inicial 
    mov x3, 5                           // Ancho 
    mov x4, 15                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 10
    mov x0, x21                         // framebuffer base
    movz w5, 0x264F                     // Color AZUL 
    movk w5, 0xFF24, lsl 16
    mov x1, 55                          // x inicial 
    mov x2, 142                         // y inicial 
    mov x3, 5                           // Ancho 
    mov x4, 15                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 11
    mov x0, x21                         // framebuffer base
    movz w5, 0x264F                     // Color celeste 
    movk w5, 0xFF24, lsl 16
    mov x1, 65                          // x inicial 
    mov x2, 142                         // y inicial 
    mov x3, 5                           // Ancho 
    mov x4, 15                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 12
    mov x0, x21                         // framebuffer base
    movz w5, 0x264F                     // Color celeste 
    movk w5, 0xFF24, lsl 16
    mov x1, 75                          // x inicial 
    mov x2, 142                         // y inicial 
    mov x3, 5                           // Ancho 
    mov x4, 15                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 13
    mov x0, x21                         // framebuffer base
    movz w5, 0x264F                     // Color celeste 
    movk w5, 0xFF24, lsl 16
    mov x1, 85                          // x inicial 
    mov x2, 142                         // y inicial 
    mov x3, 5                           // Ancho 
    mov x4, 15                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 14
    mov x0, x21                         // framebuffer base
    movz w5, 0x264F                     // Color celeste 
    movk w5, 0xFF24, lsl 16
    mov x1, 159                         // x inicial 
    mov x2, 142                         // y inicial 
    mov x3, 5                           // Ancho 
    mov x4, 15                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 15
    mov x0, x21                         // framebuffer base
    movz w5, 0x264F                     // Color celeste 
    movk w5, 0xFF24, lsl 16
    mov x1, 169                         // x inicial 
    mov x2, 142                         // y inicial 
    mov x3, 5                           // Ancho 
    mov x4, 15                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 16
    mov x0, x21                         // framebuffer base
    movz w5, 0x264F                     // Color celeste 
    movk w5, 0xFF24, lsl 16
    mov x1, 179                         // x inicial 
    mov x2, 142                         // y inicial 
    mov x3, 5                           // Ancho 
    mov x4, 15                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 17
    mov x0, x21                         // framebuffer base
    movz w5, 0x264F                     // Color celeste 
    movk w5, 0xFF24, lsl 16
    mov x1, 189                         // x inicial 
    mov x2, 142                         // y inicial 
    mov x3, 5                           // Ancho 
    mov x4, 15                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 18
    mov x0, x21                         // framebuffer base
    movz w5, 0x264F                     // Color celeste 
    movk w5, 0xFF24, lsl 16
    mov x1, 199                         // x inicial 
    mov x2, 142                         // y inicial 
    mov x3, 5                           // Ancho 
    mov x4, 15                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 19
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 0                           // x inicial 
    mov x2, 163                         // y inicial 
    mov x3, 235                         // Ancho 
    mov x4, 2                           // Alto 
    bl dibujar_rectangulo

    // Rectángulo 20
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 0                           // x inicial 
    mov x2, 168                         // y inicial 
    mov x3, 235                         // Ancho 
    mov x4, 1                           // Alto 
    bl dibujar_rectangulo

// --------------------- VENTANAS PRIMER PISO ---------------------------

    // Círculo 7
    mov x0, x21                         // framebuffer base
    mov x1, 65                          // centro x
    mov x2, 210                         // centro y
    mov x3, 35                          // radio
    movz w4, 0x366B         
    movk w4, 0xFF33, lsl 16             // Color celeste
    bl dibujar_circulo

    // Círculo 8
    mov x0, x21                         // framebuffer base
    mov x1, 65                          // centro x
    mov x2, 210                         // centro y
    mov x3, 25                          // radio
    movz w4, 0x264F                     // Color azul oscuro
    movk w4, 0xFF24, lsl 16             // Color azul
    bl dibujar_circulo

    // Círculo 9
    mov x0, x21                         // framebuffer base
    mov x1, 180                         // centro x
    mov x2, 210                         // centro y
    mov x3, 35                          // radio
    movz w4, 0x366B         
    movk w4, 0xFF33, lsl 16             // Color celeste
    bl dibujar_circulo

    // Círculo 10
    mov x0, x21                         // framebuffer base
    mov x1, 180                         // centro x
    mov x2, 210                         // centro y
    mov x3, 25                          // radio
    movz w4, 0x264F                     // Color azul oscuro
    movk w4, 0xFF24, lsl 16             // Color azul
    bl dibujar_circulo

    // Rectángulo 21
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 103                         // x inicial 
    mov x2, 210                         // y inicial 
    mov x3, 40                          // Ancho 
    mov x4, 10                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 22
    mov x0, x21                         // framebuffer base
    movz w5, 0x264F                     // Color azul 
    movk w5, 0xFF24, lsl 16
    mov x1, 0                           // x inicial 
    mov x2, 220                         // y inicial 
    mov x3, 250                         // Ancho 
    mov x4, 50                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 23
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 0                           // x inicial 
    mov x2, 210                         // y inicial 
    mov x3, 28                          // Ancho 
    mov x4, 10                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 24
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 218                         // x inicial 
    mov x2, 210                         // y inicial 
    mov x3, 20                          // Ancho 
    mov x4, 10                          // Alto 
    bl dibujar_rectangulo

    // Círculo 11
    mov x0, x21                         // framebuffer base
    mov x1, 65                          // centro x
    mov x2, 210                         // centro y
    mov x3, 22                          // radio
    movz w4, 0x366B                     // Color CELESTE
    movk w4, 0xFF33, lsl 16             // Color azul
    bl dibujar_circulo

    // Rectángulo 25
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 44                          // x inicial 
    mov x2, 217                         // y inicial 
    mov x3, 43                          // Ancho 
    mov x4, 70                          // Alto 
    bl dibujar_rectangulo

    // Círculo 12
    mov x0, x21                         // framebuffer base
    mov x1, 180                         // centro x
    mov x2, 210                         // centro y
    mov x3, 22                          // radio
    movz w4, 0x366B                     // Color CELESTE
    movk w4, 0xFF33, lsl 16             // Color azul
    mov x0, x21                         // framebuffer base
    bl dibujar_circulo

    // Rectángulo 26
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 159                         // x inicial 
    mov x2, 217                         // y inicial 
    mov x3, 43                          // Ancho 
    mov x4, 70                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 27
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 0                         // x inicial 
    mov x2, 290                         // y inicial 
    mov x3, 235                          // Ancho 
    mov x4, 4                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 28
    mov x0, x21                         // framebuffer base
    movz w5, 0x366B                     // Color celeste 
    movk w5, 0xFF33, lsl 16
    mov x1, 0                         // x inicial 
    mov x2, 296                         // y inicial 
    mov x3, 235                          // Ancho 
    mov x4, 2                          // Alto 
    bl dibujar_rectangulo


// -------------------- PUERTA DEL EDIFICIO -----------------

    // Rectángulo 29
    mov x0, x21                         // framebuffer base
    movz w5, 0x1428                     // Color azul oscuro 
    movk w5, 0xFF13, lsl 16
    mov x1, 65                         // x inicial 
    mov x2, 305                         // y inicial 
    mov x3, 110                          // Ancho 
    mov x4, 115                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 30
    mov x0, x21                         // framebuffer base
    movz w5, 0x2741                     // Color morado 
    movk w5, 0xFF37, lsl 16
    mov x1, 70                         // x inicial 
    mov x2, 310                         // y inicial 
    mov x3, 100                          // Ancho 
    mov x4, 20                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 31
    mov x0, x21                         // framebuffer base
    movz w5, 0x2741                     // Color morado 
    movk w5, 0xFF37, lsl 16
    mov x1, 70                         // x inicial 
    mov x2, 335                         // y inicial 
    mov x3, 49                          // Ancho 
    mov x4, 85                          // Alto 
    bl dibujar_rectangulo

    // Rectángulo 32
    mov x0, x21                         // framebuffer base
    movz w5, 0x2741                     // Color morado 
    movk w5, 0xFF37, lsl 16
    mov x1, 123                         // x inicial 
    mov x2, 335                         // y inicial 
    mov x3, 47                          // Ancho 
    mov x4, 85                          // Alto 
    bl dibujar_rectangulo


    ldr x21, [sp, #0]                   // Restaura x21
    ldp x29, x30, [sp, #8]              // Restaura FP y LR
    add sp, sp, #24                     // Ajusta SP de vuelta

    ret
