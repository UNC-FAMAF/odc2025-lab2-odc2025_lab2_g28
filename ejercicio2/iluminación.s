    .equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 		480
	.equ BITS_PER_PIXEL,  	32
.globl ventanas_y_puerta
.globl animar_ventanas
.globl sombra
.globl farola
.extern dibujar_circulo  
.extern dibujar_rectangulo
.extern delay_us

.section .data
.align 4
DELAY_MICROSECONDS: .word 25000000

// --------------------- LUCES DENTRO DEL EDIFICIO ---------------
ventanas_y_puerta: 

  	sub sp, sp, #64
    stp x29, x30, [sp, #48] // Guarda FP y LR
    stp x19, x20, [sp, #0]
    stp x21, x22, [sp, #16]

    mov x19, x0 			// x19: framebuffer base

// ----------------- PUERTA DEL EDIFICIO ------------------
    mov x0, x21                         // framebuffer base
    movz w5, 0x2741                     // Color morado 
    movk w5, 0xFF37, lsl 16
    mov x1, 70                         // x inicial 
    mov x2, 310                         // y inicial 
    mov x3, 100                          // Ancho 
    mov x4, 20                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x2741                     // Color morado 
    movk w5, 0xFF37, lsl 16
    mov x1, 70                         // x inicial 
    mov x2, 335                         // y inicial 
    mov x3, 49                          // Ancho 
    mov x4, 85                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x2741                     // Color morado 
    movk w5, 0xFF37, lsl 16
    mov x1, 123                         // x inicial 
    mov x2, 335                         // y inicial 
    mov x3, 47                          // Ancho 
    mov x4, 85                          // Alto 
    bl dibujar_rectangulo
// ------------------- VENTANAS --------------------------------------------------------
    //Ventana arriba izquierda    
    mov x0, x19                         // framebuffer base
    mov x1, 65                          // centro x
    mov x2, 50                          // centro y
    mov x3, 19                          // radio
    movz w4, 0x2741                     // Color amarillo
    movk w4, 0x1037, lsl 16             
    bl dibujar_circulo

    mov x0, x19              // framebuffer
	movz w5, 0x2741
	movk w5, 0x1037, lsl 16              // color negro
    mov x1, 47              // x
    mov x2, 57             // y
    mov x3, 37               // ancho
    mov x4, 67              // alto
    bl dibujar_rectangulo

    //Ventana arriba derecha
    mov x0, x19                         // framebuffer base
    mov x1, 180                          // centro x
    mov x2, 50                          // centro y
    mov x3, 19                          // radio
    movz w4, 0x2741                     // Color amarillo
    movk w4, 0x1037, lsl 16             
    bl dibujar_circulo

    mov x0, x19              // framebuffer
	movz w5, 0x2741
	movk w5, 0x1037, lsl 16              // color negro
    mov x1, 162              // x
    mov x2, 57             // y
    mov x3, 37               // ancho
    mov x4, 67              // alto
    bl dibujar_rectangulo

    //Ventana abajo derecha
    mov x0, x19                         // framebuffer base
    mov x1, 180                          // centro x
    mov x2, 210                          // centro y
    mov x3, 19                          // radio
    movz w4, 0x6745                     // Color amarillo
    movk w4, 0x10A3, lsl 16             
    bl dibujar_circulo

    mov x0, x19              // framebuffer
	movz w5, 0x6745
	movk w5, 0x10A3, lsl 16              // color amarillo
    mov x1, 162              // x
    mov x2, 217             // y
    mov x3, 37               // ancho
    mov x4, 67              // alto
    bl dibujar_rectangulo

    //Ventana abajo izquierda
    mov x0, x19                         // framebuffer base
    mov x1, 65                          // centro x
    mov x2, 210                          // centro y
    mov x3, 19                          // radio
    movz w4, 0x2741                     // Color amarillo
    movk w4, 0x1037, lsl 16             
    bl dibujar_circulo

    mov x0, x19              // framebuffer
	movz w5, 0x2741
	movk w5, 0x1037, lsl 16              // color negro
    mov x1, 47              // x
    mov x2, 217             // y
    mov x3, 37               // ancho
    mov x4, 67              // alto
    bl dibujar_rectangulo


    ldr x25, [sp, #40]
    ldp x23, x24, [sp, #32]
    ldp x21, x22, [sp, #16]
    ldp x19, x20, [sp, #0]
    ldp x29, x30, [sp, #48]         // Restaura FP y LR
    add sp, sp, #64                 // Ajusta SP de vuelta
    ret

animar_ventanas:

  	sub sp, sp, #64
    stp x29, x30, [sp, #48] // Guarda FP y LR
    stp x19, x20, [sp, #0]
    stp x21, x22, [sp, #16]


    mov x19, x0 			// x19: framebuffer base
    mov x28, 0
loop_anim:

    // ----------- Luz encendida  PRIMER VENTANA -----------

    mov x0, x19                         // framebuffer base
    mov x1, 65                          // centro x
    mov x2, 50                          // centro y
    mov x3, 19                          // radio
    movz w4, 0x6745                     // Color amarillo
    movk w4, 0x10A3, lsl 16             
    bl dibujar_circulo

    mov x0, x19              // framebuffer
	movz w5, 0x6745
	movk w5, 0x10A3, lsl 16              // color amarillo
    mov x1, 47              // x
    mov x2, 57             // y
    mov x3, 37               // ancho
    mov x4, 67              // alto
    bl dibujar_rectangulo

// ----------------- PUERTA DEL EDIFICIO ------------------
    mov x0, x21                         // framebuffer base
    movz w5, 0x6745                     // Color morado 
    movk w5, 0x00A3, lsl 16
    mov x1, 70                         // x inicial 
    mov x2, 310                         // y inicial 
    mov x3, 100                          // Ancho 
    mov x4, 20                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x6745                     // Color morado 
    movk w5, 0xFFA3, lsl 16
    mov x1, 70                         // x inicial 
    mov x2, 335                         // y inicial 
    mov x3, 49                          // Ancho 
    mov x4, 85                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x6745                     // Color morado 
    movk w5, 0xFFA3, lsl 16
    mov x1, 123                         // x inicial 
    mov x2, 335                         // y inicial 
    mov x3, 47                          // Ancho 
    mov x4, 85                          // Alto 
    bl dibujar_rectangulo

// Cargar el valor de retardo desde la variable global
    adrp x2, DELAY_MICROSECONDS 
    ldr w2, [x2, #:lo12:DELAY_MICROSECONDS] 
    bl delay_us 

    // ----------- Luz apagada -----------

    mov x0, x19                         // framebuffer base
    mov x1, 65                          // centro x
    mov x2, 50                          // centro y
    mov x3, 19                          // radio
    movz w4, 0x2741                     // Color amarillo
    movk w4, 0x1037, lsl 16             
    bl dibujar_circulo

    mov x0, x19              // framebuffer
	movz w5, 0x2741
	movk w5, 0x1037, lsl 16              // color negro
    mov x1, 47              // x
    mov x2, 57             // y
    mov x3, 37               // ancho
    mov x4, 67              // alto
    bl dibujar_rectangulo

// ----------------- PUERTA DEL EDIFICIO ------------------
    mov x0, x21                         // framebuffer base
    movz w5, 0x2741                     // Color morado 
    movk w5, 0xFF37, lsl 16
    mov x1, 70                         // x inicial 
    mov x2, 310                         // y inicial 
    mov x3, 100                          // Ancho 
    mov x4, 20                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x2741                     // Color morado 
    movk w5, 0xFF37, lsl 16
    mov x1, 70                         // x inicial 
    mov x2, 335                         // y inicial 
    mov x3, 49                          // Ancho 
    mov x4, 85                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x2741                     // Color morado 
    movk w5, 0xFF37, lsl 16
    mov x1, 123                         // x inicial 
    mov x2, 335                         // y inicial 
    mov x3, 47                          // Ancho 
    mov x4, 85                          // Alto 
    bl dibujar_rectangulo

// Cargar el valor de retardo nuevamente
    adrp x2, DELAY_MICROSECONDS
    ldr w2, [x2, #:lo12:DELAY_MICROSECONDS]
    bl delay_us              // Llama a la función de delay basada en temporizador

    	    
	add x28, x28, 1                    // Conteo
    cmp x28, 2
    blt loop_anim

// (esto nunca se ejecuta, pero lo dejo por convención)
restore_and_exit:

    ldr x25, [sp, #40]
    ldp x23, x24, [sp, #32]
    ldp x21, x22, [sp, #16]
    ldp x19, x20, [sp, #0]
    ldp x29, x30, [sp, #48]         // Restaura FP y LR
    add sp, sp, #64                 // Ajusta SP de vuelta
    ret

//--------------------- SOMBRA EDIFICO Y MURO -------------------------

sombra:

    sub sp, sp, #24                     // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]              // Guarda FP y LR en la pila
    str x21, [sp, #0]                   // Guarda x21 en la pila

    mov x21, x0                         // Guardar base framebuffer al inicio

    mov x0, x21
    movk x13, 0x1341
    movk x13, 0xFF13, lsl 16
	mov x2, 0              // x inicial
	mov x3, 419              // y inicial
	mov x4, 263                // Ancho de la base
	mov x6, 0                // Grosor borde
	mov x5, 1                // Dirección
	bl dibujar_triangulo_dir

    mov x0, x21
	mov x2, 0              // x inicial
	mov x3, 419              // y inicial
	mov x4, 263                // Ancho de la base
	mov x6, 0                // Grosor borde
	mov x5, 1                // Dirección
	bl dibujar_triangulo_dir

    ldr x21, [sp, #0]                   // Restaura x21
    ldp x29, x30, [sp, #8]              // Restaura FP y LR
    add sp, sp, #24                     // Ajusta SP de vueltaS

    ret

// ------------------------- POSTE DE LUZ --------------------------

farola:

    sub sp, sp, #24                     // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]              // Guarda FP y LR en la pila
    str x21, [sp, #0]                   // Guarda x21 en la pila

    mov x21, x0                         // Guardar base framebuffer al inicio

    mov x0, x21                         // framebuffer base
    movz w5, 0x0C1F                     // Color azul oscuro 
    movk w5, 0xFF17, lsl 16
    mov x1, 500                         // x inicial 
    mov x2, 400                         // y inicial 
    mov x3, 20                          // Ancho 
    mov x4, 50                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x0C1F                     // Color azul oscuro 
    movk w5, 0xFF17, lsl 16
    mov x1, 500                         // x inicial 
    mov x2, 300                         // y inicial 
    mov x3, 15                          // Ancho 
    mov x4, 120                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x0C1F                     // Color azul oscuro 
    movk w5, 0xFF17, lsl 16
    mov x1, 500                         // x inicial 
    mov x2, 220                         // y inicial 
    mov x3, 10                          // Ancho 
    mov x4, 80                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x0C1F                     // Color azul oscuro 
    movk w5, 0xFF17, lsl 16
    mov x1, 500                         // x inicial 
    mov x2, 190                         // y inicial 
    mov x3, 7                          // Ancho 
    mov x4, 30                          // Alto 
    bl dibujar_rectangulo

// ----------------------- PARTE CLARA DEL POSTE ------------------

    mov x0, x21                         // framebuffer base
    movz w5, 0x2756                     // Color MORADO CLARITO 
    movk w5, 0xFF3F, lsl 16
    mov x1, 515                         // x inicial 
    mov x2, 400                         // y inicial 
    mov x3, 5                          // Ancho 
    mov x4, 50                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x2756                     // Color MORADO CLARITO 
    movk w5, 0xFF3F, lsl 16
    mov x1, 510                         // x inicial 
    mov x2, 300                         // y inicial 
    mov x3, 5                          // Ancho 
    mov x4, 100                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x2756                     // Color MORADO CLARITO 
    movk w5, 0xFF3F, lsl 16
    mov x1, 505                         // x inicial 
    mov x2, 220                         // y inicial 
    mov x3, 5                          // Ancho 
    mov x4, 80                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x2756                     // Color MORADO CLARITO 
    movk w5, 0xFF3F, lsl 16
    mov x1, 503                         // x inicial 
    mov x2, 190                         // y inicial 
    mov x3, 4                          // Ancho 
    mov x4, 30                          // Alto 
    bl dibujar_rectangulo

// ----------------------- PARTE SUPERIOR DEL POSTE ----------------------

    mov x0, x21                         // framebuffer base
    movz w5, 0x0C1F                     // Color azul oscuro 
    movk w5, 0xFF17, lsl 16
    mov x1, 495                         // x inicial 
    mov x2, 189                         // y inicial 
    mov x3, 15                          // Ancho 
    mov x4, 3                          // Alto 
    bl dibujar_rectangulo

    mov x0, x21                         // framebuffer base
    movz w5, 0x0C1F                     // Color azul oscuro 
    movk w5, 0xFF17, lsl 16
    mov x1, 497                         // x inicial 
    mov x2, 186                         // y inicial 
    mov x3, 11                         // Ancho 
    mov x4, 3                          // Alto 
    bl dibujar_rectangulo

// ------------------ TRIANGULO QUE AGARRA LA LUZ DEL POSTE ----------------

    mov x0, x21
    movk x13, 0x2756
    movk x13, 0xFF3F, lsl 16
	mov x2, 470              // x inicial
	mov x3, 192              // y inicial
	mov x4, 30                // Ancho de la base
	mov x6, 0                // Grosor borde
	mov x5, 0                // Dirección
	bl dibujar_triangulo_dir

    movk x13, 0x0C1F
    movk x13, 0xFF17, lsl 16
	mov x2, 470              // x inicial
	mov x3, 195              // y inicial
	mov x4, 30                // Ancho de la base
	mov x6, 0                // Grosor borde
	mov x5, 0                // Dirección
	bl dibujar_triangulo_dir

    movk x13, 0x367F            // COLOR ROSA CLARO
    movk x13, 0xFFB3, lsl 16
	mov x2, 480              // x inicial
	mov x3, 200              // y inicial
	mov x4, 20                // Ancho de la base
	mov x6, 0                // Grosor borde
	mov x5, 0                // Dirección
	bl dibujar_triangulo_dir

    movz w5, 0x2756                     // Color GRIS 
    movk w5, 0xFF3F, lsl 16
    mov x1, 455                         // x inicial 
    mov x2, 193                         // y inicial 
    mov x3, 20                         // Ancho 
    mov x4, 3                          // Alto 
    bl dibujar_rectangulo

    movz w5, 0x0C1F                     // Color OSCURO 
    movk w5, 0xFF17, lsl 16
    mov x1, 455                         // x inicial 
    mov x2, 196                         // y inicial 
    mov x3, 20                         // Ancho 
    mov x4, 5                          // Alto 
    bl dibujar_rectangulo

// ---------------------- PORTA LÁMPARA DEL POSTE --------------

    movz w5, 0x0C1F                     // Color OSCURO 
    movk w5, 0xFF17, lsl 16
    mov x1, 460                         // x inicial 
    mov x2, 196                         // y inicial 
    mov x3, 4                         // Ancho 
    mov x4, 20                          // Alto 
    bl dibujar_rectangulo

    mov x1, 462                         // centro x
    mov x2, 220                         // centro y
    mov x3, 10                          // radio
    movz w4, 0x0C1F         
    movk w4, 0x8017, lsl 16             // Color OSCURO
    bl dibujar_circulo

    movk x13, 0x0C1F                // COLOR OSCURO
    movk x13, 0xFF17, lsl 16
	mov x2, 445                     // x inicial
	mov x3, 223                     // y inicial
	mov x4, 10                      // Ancho de la base
	mov x6, 0                       // Grosor borde
	mov x5, 3                       // Dirección
	bl dibujar_triangulo_dir

    movk x13, 0x0C1F                // COLOR OSCURO
    movk x13, 0xFF17, lsl 16
	mov x2, 470                     // x inicial
	mov x3, 223                     // y inicial
	mov x4, 10                      // Ancho de la base
	mov x6, 0                       // Grosor borde
	mov x5, 2                       // Dirección
	bl dibujar_triangulo_dir

    ldr x21, [sp, #0]                   // Restaura x21
    ldp x29, x30, [sp, #8]              // Restaura FP y LR
    add sp, sp, #24                     // Ajusta SP de vueltaS

    ret
