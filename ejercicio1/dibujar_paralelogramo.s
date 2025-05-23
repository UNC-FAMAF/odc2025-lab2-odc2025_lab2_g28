    .equ SCREEN_WIDTH,          640
    .equ SCREEN_HEIGHT,         480
    .equ BITS_PER_PIXEL,        32

    .equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
    .equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

.global dibujar_paralelogramo

dibujar_paralelogramo:

    stp x29, x30, [sp, -16]! // Guardar FP y LR
    mov x7, 0               // fila actual
    mov x8, x0               // x8 = framebuffer base (copia local)

fila_loop:
    cmp x7, x4               // si fila >= alto, termina
    bge paralelogramo_done

    // Calcular desplazamiento horizontal
    mul x9, x6, x7           // x9 = dx * fila

    mov x10, 0              // columna actual
columna_loop:
    cmp x10, x3              // si columna >= ancho, siguiente fila
    bge siguiente_fila

    // x = x inicial + columna + desplazamiento
    add x11, x1, x10
    add x11, x11, x9         // x desplazado

    // y = y inicial + fila
    add x12, x2, x7

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x13, SCREEN_WIDTH
    mul x14, x12, x13
    add x14, x14, x11
    lsl x14, x14, 2

    add x15, x8, x14
    str w5, [x15]

    add x10, x10, 1
    b columna_loop

siguiente_fila:
    add x7, x7, 1
    b fila_loop

paralelogramo_done:
    ldp x29, x30, [sp], 16
    
    ret
