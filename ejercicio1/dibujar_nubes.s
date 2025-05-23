    .equ SCREEN_WIDTH,          640
    .equ SCREEN_HEIGHT,         480
    .equ BITS_PER_PIXEL,    32

    .equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
    .equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

.global dibujar_nubes
.extern dibujar_circulo

dibujar_nubes:

    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x21, [sp, #0]        // Guarda x21 en la pila

    mov x21, x0          // Guardar base framebuffer al inicio

    mov x1, 633         // centro x
    mov x2, 298         // centro y
    mov x3, 20          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo
    
    mov x1, 620        // centro x
    mov x2, 303       // centro y
    mov x3, 15        // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 585         // centro x
    mov x2, 280         // centro y
    mov x3, 30          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 550         // centro x
    mov x2, 298         // centro y
    mov x3, 20          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 550         // centro x
    mov x2, 270         // centro y
    mov x3, 10          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
	bl dibujar_circulo

    mov x1, 525         // centro x
    mov x2, 260        // centro y
    mov x3, 10          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo


    mov x1, 520         // centro x
    mov x2, 255         // centro y
    mov x3, 10          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 510         // centro x
    mov x2, 260         // centro y
    mov x3, 9          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 510         // centro x
    mov x2, 285         // centro y
    mov x3, 9          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo
    
    mov x1, 520         // centro x
    mov x2, 380			 // centro y
    mov x3, 70          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 600         // centro x
    mov x2, 380			 // centro y
    mov x3, 90          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo
    
    mov x1, 480         // centro x
    mov x2, 310			 // centro y
    mov x3, 15          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 460         // centro x
    mov x2, 345			 // centro y
    mov x3, 30          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 420         // centro x
    mov x2, 320			 // centro y
    mov x3, 40          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 430         // centro x
    mov x2, 280			 // centro y
    mov x3, 10          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 410         // centro x
    mov x2, 290			 // centro y
    mov x3, 20          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 520         // centro x
    mov x2, 380			 // centro y
    mov x3, 70          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 400         // centro x
    mov x2, 380			 // centro y
    mov x3, 70          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 360         // centro x
    mov x2, 310			 // centro y
    mov x3, 20          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 330         // centro x
    mov x2, 285         // centro y
    mov x3, 9          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 320         // centro x
    mov x2, 280         // centro y
    mov x3, 10          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 285        // centro x
    mov x2, 290         // centro y
    mov x3, 30          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 320         // centro x
    mov x2, 255         // centro y
    mov x3, 5          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 300         // centro x
    mov x2, 380         // centro y
    mov x3, 80          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 250         // centro x
    mov x2, 300         // centro y
    mov x3, 20          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 170         // centro x
    mov x2, 370         // centro y
    mov x3, 80          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 170         // centro x
    mov x2, 270         // centro y
    mov x3, 60          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 120         // centro x
    mov x2, 370         // centro y
    mov x3, 90          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 200         // centro x
    mov x2, 210        // centro y
    mov x3, 20          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 175         // centro x
    mov x2, 200         // centro y
    mov x3, 5          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 80         // centro x
    mov x2, 370         // centro y
    mov x3, 90          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 80         // centro x
    mov x2, 200         // centro y
    mov x3, 40          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 120         // centro x
    mov x2, 270         // centro y
    mov x3, 70          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 100         // centro x
    mov x2, 160         // centro y
    mov x3, 10          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 90         // centro x
    mov x2, 150         // centro y
    mov x3, 5          // radio
    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta

    ret
