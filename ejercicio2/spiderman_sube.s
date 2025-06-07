	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl spiderman_sube

spiderman_sube:
    sub sp, sp, #24                     // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]              // Guarda FP y LR en la pila
    str x21, [sp, #0]                   // Guarda x21 en la pila

    mov x20, x0                         // base framebuffer

    mov x25, 30                         // desplazamiento X
    mov x26, 350                        // desplazamiento Y (se incrementa)
//   add x27, x26, 58                   // ultimos pixeles de la imagen     
    
    mov x8, 366
loop_anim:

    mov x0, x20                         // framebuffer
    bl spiderman_img                    // dibuja spiderman en (x25, x26) con soga de x27

    mov x0, x20
    bl borrar_fondo2
    bl borrar_fondo1

    // Delay 
    movz x2, 0x02, lsl 16
    movk x2, 0xA120, lsl 0
    bl delay_us

    // Actualizar valores
    sub x26, x26, 1                    // bajar 1 píxel
  //  sub x27, x17, 1
    sub x8, x8, 1

    cmp x26, 0
    bge loop_anim                      // repetir si no llegó al final

    ldr x21, [sp, #0]                   // Restaura x21
    ldp x29, x30, [sp, #8]              // Restaura FP y LR
    add sp, sp, #24                     // Ajusta SP de vuelta

    ret

borrar_fondo2:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.
   
 //   cmp x8, 294
   // bge llamar_borrar_gris2
    
    cmp x8, 305
    bge llamar_borrar_rosa2 

    cmp x8, 105
    bge llamar_borrar_violeta2
    
    cmp x8, 0
    bge llamar_borrar_celeste2

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

borrar_fondo1:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.
    
    cmp x8, 350
    bge llamar_borrar_gris
    
    cmp x8, 259
    bge llamar_borrar_rosa 

    cmp x8, 60
    bge llamar_borrar_violeta
    
    cmp x8, 0
    bge llamar_borrar_celeste

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

   

llamar_borrar_celeste:

    bl borrar_celeste_sube
    ldp x29, x30, [sp], #16
    ret

llamar_borrar_violeta:
    bl borrar_violeta_sube
    ldp x29, x30, [sp], #16
    ret

llamar_borrar_rosa:
    bl borrar_rosa_sube
    ldp x29, x30, [sp], #16
    ret


llamar_borrar_gris:
    bl borrar_gris_sube
    ldp x29, x30, [sp], #16
    ret
	

llamar_borrar_celeste2:
    bl borrar_celeste_sube2
    ldp x29, x30, [sp], #16
    ret

llamar_borrar_violeta2:
    bl borrar_violeta_sube2
    ldp x29, x30, [sp], #16
    ret

llamar_borrar_rosa2:
    bl borrar_rosa_sube2
    ldp x29, x30, [sp], #16
    ret

llamar_borrar_gris2:
    bl borrar_gris_sube2
    ldp x29, x30, [sp], #16
    ret

