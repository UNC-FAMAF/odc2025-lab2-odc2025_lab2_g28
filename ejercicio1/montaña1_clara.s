    .equ SCREEN_WIDTH,          640
    .equ SCREEN_HEIGHT,         480
    .equ BITS_PER_PIXEL,    32

    .equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
    .equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

    .globl montaña1_clara
    .extern dibujar_circulo
    .extern dibujar_rectangulo

montaña1_clara:

    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x21, [sp, #0]        // Guarda x21 en la pila

    mov x21, x0              // Guardar base framebuffer al inicio

//PARTE ILUMINADA (verde claro)
    
    mov x1, 125              // centro x
    mov x2, 401              // centro y
    mov x3, 62               // radio
    movz x4, 0x69, lsl 16    // Color Verde claro 0x69BD2F 
	movk x4, 0xBD2F, lsl 0   
    mov x0, x21              // framebuffer base
    bl dibujar_circulo

    movz x5, 0x69, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0xBD2F, lsl 0
    mov x1, 50               // x inicial
    mov x2, 390              // y inicial
    mov x3, 200              // ancho del paralelogramo
    mov x4, 22               // alto
    mov x6, 10               // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 404              // x inicial
    mov x2, 379              // y inicial
    mov x3, 20               // ancho del paralelogramo
    mov x4, 23               // alto
    mov x6, -5               // desplazamiento
    bl dibujar_paralelogramo
 
    mov x1, 400              // x inicial
    mov x2, 379              // y inicial
    mov x3, 20               // ancho del paralelogramo
    mov x4, 15               // alto
    mov x6, 5                // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 640              // x inicial
    mov x2, 353              // y inicial
    mov x3, 160              // ancho del paralelogramo
    mov x4, 60               // alto
    mov x6, -5               // desplazamiento
    bl dibujar_paralelogramo


    // RELLENO DE FORMA

    //"triangulo"
    mov x1, 402              // x inicial
    mov x2, 382              // y inicial
    mov x3, 33               // ancho del paralelogramo
    mov x4, 23               // alto
    mov x6, -5               // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 420              // x inicial
    mov x2, 385              // y inicial
    mov x3, 30               // ancho del paralelogramo
    mov x4, 23               // alto
    mov x6, -5               // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 433              // x inicial
    mov x2, 388              // y inicial
    mov x3, 32               // ancho del paralelogramo
    mov x4, 18               // alto
    mov x6, -5               // desplazamiento
    bl dibujar_paralelogramo

    //"ladera de colina"
	movz x12, 0x69, lsl 16   // Color Verde claro 0x69BD2F  
	movk x12, 0xBD2F, lsl 0
	mov x2, 185              // x inicial (columna)
	mov x3, 400              // y inicial (fila)
	mov x4, 75               // Ancho
	mov x5, 12               // Alto
	bl dibujar_rectangulo

    movz x5, 0x69, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0xBD2F, lsl 0
    mov x1, 128              // x inicial
    mov x2, 370              // y inicial
    mov x3, 55               // ancho del paralelogramo
    mov x4, 20               // alto
    mov x6, 3                // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 620              // x inicial
    mov x2, 380              // y inicial
    mov x3, 240              // ancho del paralelogramo
    mov x4, 50               // alto
    mov x6, -6               // desplazamiento
    bl dibujar_paralelogramo
    

    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta


    ret
