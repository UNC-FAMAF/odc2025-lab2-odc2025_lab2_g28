.equ SCREEN_WIDTH, 640

.globl dibujar_pixel

dibujar_pixel: 
    // x0 = framebuffer base
    // x1 = x coord
    // x2 = y coord
    // x4 = color ARGB

    mov x10, x1             // x10 = x coord
    mov x11, x2             // x11 = y coord

    mov x12, #SCREEN_WIDTH  // x12 = SCREEN_WIDTH (mejor como literal o constante si es posible)
    mul x11, x11, x12       // x11 = y * width
    add x11, x11, x10       // x11 = (y * width) + x
    lsl x11, x11, #2        // x11 = offset en bytes ( * 4 bytes/pixel)

    add x13, x0, x11        // x13 = dirección final = framebuffer_base (x0) + offset (x11)
    stur w4, [x13]          // escribir color en la dirección final

    ret
