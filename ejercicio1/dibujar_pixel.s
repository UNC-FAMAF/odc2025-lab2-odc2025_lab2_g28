.equ SCREEN_WIDTH, 640

.globl dibujar_pixel

dibujar_pixel: 
    // x0 = framebuffer base
    // x1 = x coord
    // x2 = y coord
    // x4 = color ARGB

    mov x10, x1             // Backup x en x10
    mov x11, x2             // Backup y en x11

    mov x12, SCREEN_WIDTH   // x12 = SCREEN_WIDTH
    mul x11, x11, x12       // y * width
    add x11, x11, x10       // x + y * width
    lsl x11, x11, #2        // *4 bytes por pixel

    add x0, x0, x11         // dirección final = base + offset
    stur w4, [x0]            // escribir color

    ret
    




