    .equ SCREEN_WIDTH,      640
    .equ SCREEN_HEIGHT,     480
    .equ BITS_PER_PIXEL,    32

.globl dibujar_triangulo_dir

dibujar_triangulo_dir:
    stp x29, x30, [sp, #-16]!   // Prologo
    mov x29, sp

    mov x7, #0      // fila o columna segun orientación

loop_principal:
    cmp x7, x4      // mientras fila/columna < tamaño
    bge fin

    // cantidad de pixels a pintar en esta fila (según orientación)
    mov x8, x7      // por defecto
    mov x9, x4
    sub x9, x9, x7

    // dependiendo de orientación
    cmp x5, #0      // arriba (△)
    beq tri_arriba

    cmp x5, #1      // abajo (▽)
    beq tri_abajo

    cmp x5, #2      // izquierda (◁)
    beq tri_izq

    cmp x5, #3      // derecha (▷)
    beq tri_der

    b fin

//-------------------------------------
// △ Triángulo hacia arriba (vértice abajo)
tri_arriba:
    mov x10, x4
    sub x10, x10, x7   // y = y_inicial + (altura - fila actual)
    add x10, x3, x10

    add x11, x2, x9     // x inicio desplazado
    mov x12, x7         // ancho = fila actual

    b pintar_linea_horizontal

//-------------------------------------
// ▽ Triángulo hacia abajo (vértice arriba)
tri_abajo:
    add x10, x3, x7
    add x11, x2, x9
    mov x12, x7

    b pintar_linea_horizontal

//-------------------------------------
// ◁ Triángulo hacia la izquierda
tri_izq:
    mov x10, x4
    sub x10, x10, x7
    add x10, x2, x10    // x = x_inicial + (base - columna actual)

    add x11, x3, x9     // y inicio desplazado
    mov x12, x7

    b pintar_linea_vertical

//-------------------------------------
// ▷ Triángulo hacia la derecha
tri_der:
    add x10, x2, x7
    add x11, x3, x9
    mov x12, x7

    b pintar_linea_vertical

//-------------------------------------
// Pinta línea horizontal con relleno y borde
// x10 = y, x11 = x inicio, x12 = ancho
pintar_linea_horizontal:
    mov x14, #0
linea_h:
    cmp x14, x12
    bge siguiente

    // color: borde si en los extremos o en las primeras/últimas filas
    mov w15, w13        // por defecto: relleno

    cmp x6, #0
    beq pintar_pixel_h

    // borde superior/inferior
    cmp x7, x6
    blt borde_h
    sub x16, x4, x6
    cmp x7, x16
    bge borde_h

    // borde lateral
    cmp x14, x6
    blt borde_h
    sub x17, x12, x6
    cmp x14, x17
    bge borde_h

    b pintar_pixel_h

borde_h:
    mov w15, w12

pintar_pixel_h:
    add x18, x11, x14   // x = x11 + i
    mov x19, x10        // y = fijo

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x20, #SCREEN_WIDTH
    mul x21, x19, x20
    add x21, x21, x18
    lsl x21, x21, #2

    add x22, x0, x21
    str w15, [x22]

    add x14, x14, #1
    b linea_h

//-------------------------------------
// Pinta línea vertical (igual que horizontal pero invierte X/Y)
pintar_linea_vertical:
    mov x14, #0
linea_v:
    cmp x14, x12
    bge siguiente

    mov w15, w13

    cmp x6, #0
    beq pintar_pixel_v

    // borde vertical/horizontal
    cmp x7, x6
    blt borde_v
    sub x16, x4, x6
    cmp x7, x16
    bge borde_v

    cmp x14, x6
    blt borde_v
    sub x17, x12, x6
    cmp x14, x17
    bge borde_v

    b pintar_pixel_v

borde_v:
    mov w15, w12

pintar_pixel_v:
    add x18, x10, x14   // x = base + i
    mov x19, x11        // y = fijo

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x20, #SCREEN_WIDTH
    mul x21, x19, x20
    add x21, x21, x18
    lsl x21, x21, #2

    add x22, x0, x21
    str w15, [x22]

    add x14, x14, #1
    b linea_v

siguiente:
    add x7, x7, #1
    b loop_principal

fin:
    ldp x29, x30, [sp], #16
    ret
