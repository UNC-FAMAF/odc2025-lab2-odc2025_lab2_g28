    .equ SCREEN_WIDTH,          640
    .equ SCREEN_HEIGHT,         480
    .equ BITS_PER_PIXEL,    32

    .equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
    .equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

    .globl montaña1_sombra2
    .extern dibujar_circulo
    .extern dibujar_rectangulo

montaña1_sombra2:

    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x21, [sp, #0]        // Guarda x21 en la pila

    mov x21, x0              // Guardar base framebuffer al inicio

//IZQ
	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 87              // x inicial (columna)
	mov x3, 346              // y inicial (fila)
	mov x4, 20               // Ancho
	mov x5, 10               // Alto
	bl dibujar_rectangulo
    
    movz x5, 0xFF, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0xFFFF, lsl 0
    mov x1, 118              // x inicial
    mov x2, 338              // y inicial
    mov x3, 4              // ancho del paralelogramo
    mov x4, 10               // alto
    mov x6, -4               // desplazamiento
    bl dibujar_paralelogramo 

    movz x5, 0xFF, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0xFFFF, lsl 0
    mov x1, 118              // x inicial
    mov x2, 339              // y inicial
    mov x3, 4              // ancho del paralelogramo
    mov x4, 10               // alto
    mov x6, -4               // desplazamiento
    bl dibujar_paralelogramo 

    movz x5, 0xFF, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0xFFFF, lsl 0
    mov x1, 118              // x inicial
    mov x2, 340              // y inicial
    mov x3, 4              // ancho del paralelogramo
    mov x4, 10               // alto
    mov x6, -4               // desplazamiento
    bl dibujar_paralelogramo 
    
    movz x5, 0x11, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0x1F34, lsl 0
    mov x1, 122              // x inicial
    mov x2, 340              // y inicial
    mov x3, 4              // ancho del paralelogramo
    mov x4, 10               // alto
    mov x6, -4               // desplazamiento
    bl dibujar_paralelogramo     
    
    movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 356              // y inicial (fila)
	mov x4, 13               // Ancho
	mov x5, 3               // Alto
	bl dibujar_rectangulo


	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 359              // y inicial (fila)
	mov x4, 14               // Ancho
	mov x5, 2               // Alto
	bl dibujar_rectangulo

    
	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 361              // y inicial (fila)
	mov x4, 15               // Ancho
	mov x5, 2               // Alto
	bl dibujar_rectangulo

    movz x5, 0x11, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0x1F34, lsl 0
    mov x1, 95              // x inicial
    mov x2, 363              // y inicial
    mov x3, 16              // ancho del paralelogramo
    mov x4, 4               // alto
    mov x6, 1               // desplazamiento
    bl dibujar_paralelogramo     



	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 367              // y inicial (fila)
	mov x4, 20               // Ancho
	mov x5, 2               // Alto
	bl dibujar_rectangulo

    
	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 369              // y inicial (fila)
	mov x4, 21               // Ancho
	mov x5, 2               // Alto
	bl dibujar_rectangulo

    movz x5, 0x11, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0x1F34, lsl 0
    mov x1, 95              // x inicial
    mov x2, 371              // y inicial
    mov x3, 22              // ancho del paralelogramo
    mov x4, 2               // alto
    mov x6, 1               // desplazamiento
    bl dibujar_paralelogramo     


    movz x5, 0x11, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0x1F34, lsl 0
    mov x1, 95              // x inicial
    mov x2, 373              // y inicial
    mov x3, 25              // ancho del paralelogramo
    mov x4, 2               // alto
    mov x6, 1               // desplazamiento
    bl dibujar_paralelogramo     

//
	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 375              // y inicial (fila)
	mov x4, 27               // Ancho
	mov x5, 1               // Alto
	bl dibujar_rectangulo

    movz x5, 0x11, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0x1F34, lsl 0
    mov x1, 95              // x inicial
    mov x2, 376              // y inicial
    mov x3, 30              // ancho del paralelogramo
    mov x4, 2               // alto
    mov x6, 1               // desplazamiento
    bl dibujar_paralelogramo  


	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 376              // y inicial (fila)
	mov x4, 34               // Ancho
	mov x5, 1               // Alto
	bl dibujar_rectangulo


	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 377              // y inicial (fila)
	mov x4, 36               // Ancho
	mov x5, 1               // Alto
	bl dibujar_rectangulo


	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 378              // y inicial (fila)
	mov x4, 39               // Ancho
	mov x5, 1               // Alto
	bl dibujar_rectangulo


	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 379              // y inicial (fila)
	mov x4, 75               // Ancho
	mov x5, 2               // Alto
	bl dibujar_rectangulo


	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 144              // x inicial (columna)
	mov x3, 378              // y inicial (fila)
	mov x4, 24               // Ancho
	mov x5, 1               // Alto
	bl dibujar_rectangulo



	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 381              // y inicial (fila)
	mov x4, 74               // Ancho
	mov x5, 2               // Alto
	bl dibujar_rectangulo


	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 383              // y inicial (fila)
	mov x4, 73               // Ancho
	mov x5, 3               // Alto
	bl dibujar_rectangulo


	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 386              // y inicial (fila)
	mov x4, 71               // Ancho
	mov x5, 2               // Alto
	bl dibujar_rectangulo


	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 388              // y inicial (fila)
	mov x4, 73               // Ancho
	mov x5, 3               // Alto
	bl dibujar_rectangulo

	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 391              // y inicial (fila)
	mov x4, 75               // Ancho
	mov x5, 2               // Alto
	bl dibujar_rectangulo


    movz x5, 0x11, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0x1F34, lsl 0
    mov x1, 95              // x inicial
    mov x2, 393              // y inicial
    mov x3, 76             // ancho del paralelogramo
    mov x4, 10               // alto
    mov x6, 3               // desplazamiento
    bl dibujar_paralelogramo  

	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 403              // y inicial (fila)
	mov x4, 105               // Ancho
	mov x5, 2               // Alto
	bl dibujar_rectangulo


	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 405              // y inicial (fila)
	mov x4, 106               // Ancho
	mov x5, 3               // Alto
	bl dibujar_rectangulo


	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 407              // y inicial (fila)
	mov x4, 106               // Ancho
	mov x5, 4               // Alto
	bl dibujar_rectangulo

	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 408              // y inicial (fila)
	mov x4, 108               // Ancho
	mov x5, 3               // Alto
	bl dibujar_rectangulo

    //reLLENO

	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 95              // x inicial (columna)
	mov x3, 398              // y inicial (fila)
	mov x4, 50               // Ancho
	mov x5, 5               // Alto
	bl dibujar_rectangulo



//DER---------------------------------------------------------------------------------


    movz x5, 0x11, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0x1F34, lsl 0
    mov x1, 533              // x inicial
    mov x2, 406              // y inicial
    mov x3, 90            // ancho del paralelogramo
    mov x4, 5               // alto
    mov x6, -2               // desplazamiento
    bl dibujar_paralelogramo  

    movz x5, 0x11, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0x1F34, lsl 0
    mov x1, 548              // x inicial
    mov x2, 403              // y inicial
    mov x3, 69            // ancho del paralelogramo
    mov x4, 4               // alto
    mov x6, -2               // desplazamiento
    bl dibujar_paralelogramo  


	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 560              // x inicial (columna)
	mov x3, 402              // y inicial (fila)
	mov x4, 15               // Ancho
	mov x5, 1               // Alto
	bl dibujar_rectangulo


    mov x1, 603               // centro x
    mov x2, 424              // centro y
    mov x3, 26               // radio
    movz x4, 0x11, lsl 16    // Color Verde claro 0x69BD2F 
	movk x4, 0x1F34, lsl 0   
    bl dibujar_circulo



	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 568              // x inicial (columna)
	mov x3, 388              // y inicial (fila)
	mov x4, 4               // Ancho
	mov x5, 3               // Alto
	bl dibujar_rectangulo

	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 563              // x inicial (columna)
	mov x3, 389              // y inicial (fila)
	mov x4, 6               // Ancho
	mov x5, 3               // Alto
	bl dibujar_rectangulo

	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 554              // x inicial (columna)
	mov x3, 393              // y inicial (fila)
	mov x4, 20               // Ancho
	mov x5, 5               // Alto
	bl dibujar_rectangulo

	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 551              // x inicial (columna)
	mov x3, 396              // y inicial (fila)
	mov x4, 3               // Ancho
	mov x5, 3               // Alto
	bl dibujar_rectangulo

	movz x12, 0x11, lsl 16   // Color Linea  
	movk x12, 0x1F34, lsl 0
	mov x2, 573              // x inicial (columna)
	mov x3, 396              // y inicial (fila)
	mov x4, 6               // Ancho
	mov x5, 4               // Alto
	bl dibujar_rectangulo
  
    movz x5, 0x11, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0x1F34, lsl 0
    mov x1, 561              // x inicial
    mov x2, 390              // y inicial
    mov x3, 8            // ancho del paralelogramo
    mov x4, 5               // alto
    mov x6, -2               // desplazamiento
    bl dibujar_paralelogramo  





//CENTRO 
    mov x1, 335              // x inicial
    mov x2, 392              // y inicial
    mov x3, 7            // ancho del paralelogramo
    mov x4, 8               // alto
    mov x6, -4               // desplazamiento
    bl dibujar_paralelogramo  

    mov x1, 335              // x inicial
    mov x2, 392              // y inicial
    mov x3, 6            // ancho del paralelogramo
    mov x4, 20               // alto
    mov x6, -1               // desplazamiento
    bl dibujar_paralelogramo  

    mov x1, 325              // x inicial
    mov x2, 395              // y inicial
    mov x3, 13           // ancho del paralelogramo
    mov x4, 13               // alto
    mov x6, -1               // desplazamiento
    bl dibujar_paralelogramo  

	mov x2, 300 // x inicial
	mov x3, 395 // y inicial
	mov x4, 20  // Ancho de la base
	mov x6, 0   // Grosor borde
	mov x5, 0   // triangulo hacia abajo
	movz x13, 0x11, lsl 16
	movk x13, 0x1F34, lsl 0
	bl dibujar_triangulo_dir

	mov x2, 315 // x inicial
	mov x3, 395 // y inicial
	mov x4, 8  // Ancho de la base
	mov x6, 0   // Grosor borde
	mov x5, 0   // triangulo hacia abajo
	bl dibujar_triangulo_dir




    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta




    ret
