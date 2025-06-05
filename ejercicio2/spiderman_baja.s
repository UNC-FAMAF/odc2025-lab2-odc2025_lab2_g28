	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl spiderman_baja

spiderman_baja:
    sub sp, sp, #24                     // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]              // Guarda FP y LR en la pila
    str x21, [sp, #0]                   // Guarda x21 en la pila

    mov x20, x0                         // base framebuffer

    mov x25, 30                         // desplazamiento X
    mov x26, -5                          // desplazamiento Y (se incrementa)

loop_anim:

    mov x0, x20                         // framebuffer
    bl spiderman_img                    // dibuja spiderman en (x25, x26) con soga de x27

    // Delay 
    movz x2, 0x02, lsl 16
    movk x2, 0xA120, lsl 0
    bl delay_us
    

    // Actualizar valores
    add x26, x26, 1                    // bajar 1 píxel

    cmp x26, 350
    blt loop_anim                      // repetir si no llegó al final


    ldr x21, [sp, #0]                   // Restaura x21
    ldp x29, x30, [sp, #8]              // Restaura FP y LR
    add sp, sp, #24                     // Ajusta SP de vuelta

    ret
