// draw_circle: Dibuja un círculo en el framebuffer
// x0: framebuffer base
// x1: centro x
// x2: centro y
// x3: radio
// w4: color

.global dibujar_circulo
dibujar_circulo:
    // Guardar registros temporales
    mov x10, x1          // centro_x
    mov x11, x2          // centro_y
    mov x12, x3          // radio
    mov w13, w4          // color
    mov x20, x0          // framebuffer base

    // y loop: desde -r hasta +r
    sub x14, xzr, x12    // x14 = -radio

circulo_y_loop:
    cmp x14, x12
    b.gt circulo_hecho

    // x loop: desde -r hasta +r
    sub x15, xzr, x12    // x15 = -radio

circulo_x_loop:
    cmp x15, x12
    b.gt siguiente_y

    // x² + y² <= r²
    mul x16, x14, x14    // y²
    mul x17, x15, x15    // x²
    add x18, x16, x17
    mul x19, x12, x12    // r²

    cmp x18, x19
    b.gt skip_pixel      // fuera del círculo

    // Coordenadas absolutas
    add x5, x10, x15     // x
    add x6, x11, x14     // y

    // Verificar límites
    cmp x5, #0
    blt skip_pixel
    cmp x6, #0
    blt skip_pixel
    cmp x5, #639
    b.gt skip_pixel
    cmp x6, #479
    b.gt skip_pixel

    // Dirección del píxel
    mov x8, #640
    mul x7, x6, x8
    add x7, x7, x5
    lsl x7, x7, #2
    add x7, x20, x7
    str w13, [x7]        // escribir color

skip_pixel:
    add x15, x15, #1
    b circulo_x_loop

siguiente_y:
    add x14, x14, #1
    b circulo_y_loop

circulo_hecho:
    ret



