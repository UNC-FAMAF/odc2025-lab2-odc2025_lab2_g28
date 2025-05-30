    .equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 		480
	.equ BITS_PER_PIXEL,  	32

.globl animar_ventanas
.extern dibujar_circulo  
.extern dibujar_rectangulo
.extern delay_us

.section .data
.align 4
DELAY_MICROSECONDS: .word 50000000

animar_ventanas:

  	sub sp, sp, #64
    stp x29, x30, [sp, #48] // Guarda FP y LR
    stp x19, x20, [sp, #0]
    stp x21, x22, [sp, #16]
    stp x23, x24, [sp, #32] // Guarda x23 y x24
    str x25, [sp, #40]      // Guarda x25


    mov x19, x0 			// x19: framebuffer base

	mov x22, 47             // x22 = x del rectángulo
    mov x23, 57             // x23 = y del rectángulo
    mov x24, 38              // x24 = ancho del rectángulo
    mov x25, 67              // x25 = alto del rectángulo


loop_anim:

    // ----------- Luz encendida -----------
    mov x0, x19              // framebuffer
	movz w5, 0x6745
	movk w5, 0xFFA3, lsl 16              // color amarillo
    mov x1, x22              // x
    mov x2, x23             // y
    mov x3, x24               // ancho
    mov x4, x25              // alto
    bl dibujar_rectangulo

// Cargar el valor de retardo desde la variable global
    adrp x0, DELAY_MICROSECONDS 
    ldr w0, [x0, #:lo12:DELAY_MICROSECONDS] 
    bl delay_us 

    // ----------- Luz apagada -----------

    mov x0, x19              // framebuffer
	movz w5, 0x2741
	movk w5, 0xFF37, lsl 16              // color negro
    mov x1, x22              // x
    mov x2, x23             // y
    mov x3, x24               // ancho
    mov x4, x25              // alto
    bl dibujar_rectangulo

// Cargar el valor de retardo nuevamente
    adrp x0, DELAY_MICROSECONDS
    ldr w0, [x0, #:lo12:DELAY_MICROSECONDS]
    bl delay_us              // Llama a la función de delay basada en temporizador

    b loop_anim

simple_delay:
    movz x0, 0xF080     
    movk x0, 0x2FAF, lsl 16 
1:
    subs x0, x0, #1
    bne 1b
    ret


// (esto nunca se ejecuta, pero lo dejo por convención)
restore_and_exit:
    ldr x25, [sp, #40]
    ldp x23, x24, [sp, #32]
    ldp x21, x22, [sp, #16]
    ldp x19, x20, [sp, #0]
    ldp x29, x30, [sp, #48] // Restaura FP y LR
    add sp, sp, #64          // Ajusta SP de vuelta
    ret
