    .equ SCREEN_WIDTH,          640
    .equ SCREEN_HEIGHT,         480
    .equ BITS_PER_PIXEL,    32

    .equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
    .equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

    .globl dibujar_montaña 
    .extern dibujar_circulo
    .extern dibujar_rectangulo

dibujar_montaña:
    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x21, [sp, #0]        // Guarda x21 en la pila

    mov x21, x0              // Guardar base framebuffer al inicio

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl montaña_gris

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl montaña1_clara

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl montaña1_sombra1

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl montaña1_sombra2

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl montaña2_clara

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl montaña2_sombra1

mov x0, x0     // Restaurar base framebuffer para siguiente llamada

bl montaña2_sombra2


    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta


ret

//-----------------------------------------------------------------------------------------
//MONTAÑA GRIS DEL FONDO

montaña_gris:

    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x21, [sp, #0]        // Guarda x21 en la pila

    mov x21, x0              // Guardar base framebuffer al inicio

// DETALLES MONTAÑAS

    movz x12, 0xFF70, lsl 16   // *** COLOR (parte alta) ***
    movk x12, 0x8898, lsl 0  // *** COLOR (parte baja) ***
    mov x2, 310             // *** POSICIÓN X inicial rectángulo (columna) ***
    mov x3, 382              // *** POSICIÓN Y inicial rectángulo (fila) ***
    mov x4, 20               // ancho
    mov x5, 5               // alto
    bl dibujar_rectangulo

    movz x12, 0xFF70, lsl 16   // *** COLOR (parte alta) ***
    movk x12, 0x8898, lsl 0  // *** COLOR (parte baja) ***
    mov x2, 190             // *** POSICIÓN X inicial rectángulo (columna) ***
    mov x3, 375              // *** POSICIÓN Y inicial rectángulo (fila) ***
    mov x4, 20               // ancho
    mov x5, 5               // alto
    bl dibujar_rectangulo

    movz x12, 0xFF70, lsl 16   // *** COLOR (parte alta) ***
    movk x12, 0x8898, lsl 0  // *** COLOR (parte baja) ***
    mov x2, 370             // *** POSICIÓN X inicial rectángulo (columna) ***
    mov x3, 381              // *** POSICIÓN Y inicial rectángulo (fila) ***
    mov x4, 20               // ancho
    mov x5, 5               // alto
    bl dibujar_rectangulo

// PRIMER MONTAÑA
    
    mov x1, 205              // *** POSICIÓN X centro del círculo ***
    mov x2, 415              // *** POSICIÓN Y centro del círculo ***
    mov x3, 40               // radio
    movz x4, 0xFF70, lsl 16    // *** COLOR (parte alta) ***
    movk x4, 0x8898, lsl 0   // *** COLOR (parte baja) ***
    mov x0, x21              // framebuffer base
    bl dibujar_circulo

    // SEGUNDA MONTAÑA

    mov x1, 250              // *** POSICIÓN X centro del círculo ***
    mov x2, 420              // *** POSICIÓN Y centro del círculo ***
    mov x3, 40               // radio
    movz x4, 0xFF70, lsl 16    // *** COLOR (parte alta) ***
    movk x4, 0x8898, lsl 0   // *** COLOR (parte baja) ***
    mov x0, x21              // framebuffer base
    bl dibujar_circulo

    // TERCERER MONTAÑA

    mov x1, 290              // *** POSICIÓN X centro del círculo ***
    mov x2, 410              // *** POSICIÓN Y centro del círculo ***
    mov x3, 40               // radio
    movz x4, 0xFF70, lsl 16    // *** COLOR (parte alta) 0x69BD2F ***
    movk x4, 0x8898, lsl 0   // *** COLOR (parte baja) ***
    mov x0, x21              // framebuffer base
    bl dibujar_circulo


    // CUARTA MONTAÑA

    mov x1, 335              // *** POSICIÓN X centro del círculo ***
    mov x2, 415              // *** POSICIÓN Y centro del círculo ***
    mov x3, 33               // radio
    movz x4, 0xFF70, lsl 16    // *** COLOR (parte alta) ***
    movk x4, 0x8898, lsl 0   // *** COLOR (parte baja) ***
    mov x0, x21              // framebuffer base
    bl dibujar_circulo

    //  QUINTA MONTAÑA

    mov x1, 368              // *** POSICIÓN X centro del círculo ***
    mov x2, 415              // *** POSICIÓN Y centro del círculo ***
    mov x3, 37               // radio
    movz x4, 0xFF70, lsl 16    // *** COLOR (parte alta) ***
    movk x4, 0x8898, lsl 0   // *** COLOR (parte baja) ***
    mov x0, x21              // framebuffer base
    bl dibujar_circulo

    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta

    ret


//-----------------------------------------------------------------------------------------
//MONTAÑA GRANDE ZONA CLARA

montaña1_clara:

    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x21, [sp, #0]        // Guarda x21 en la pila

    mov x21, x0              // Guardar base framebuffer al inicio

//PARTE ILUMINADA (verde claro)
    
    mov x1, 125              // centro x
    mov x2, 401              // centro y
    mov x3, 62               // radio
    movz x4, 0x69, lsl 16    // Color Verde claro 0x69BD2F 
	movk x4, 0xBD2F, lsl 0   
    mov x0, x21              // framebuffer base
    bl dibujar_circulo

    movz x5, 0x69, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0xBD2F, lsl 0
    mov x1, 50               // x inicial
    mov x2, 390              // y inicial
    mov x3, 200              // ancho del paralelogramo
    mov x4, 22               // alto
    mov x6, 10               // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 404              // x inicial
    mov x2, 379              // y inicial
    mov x3, 20               // ancho del paralelogramo
    mov x4, 23               // alto
    mov x6, -5               // desplazamiento
    bl dibujar_paralelogramo
 
    mov x1, 400              // x inicial
    mov x2, 379              // y inicial
    mov x3, 20               // ancho del paralelogramo
    mov x4, 15               // alto
    mov x6, 5                // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 640              // x inicial
    mov x2, 353              // y inicial
    mov x3, 160              // ancho del paralelogramo
    mov x4, 60               // alto
    mov x6, -5               // desplazamiento
    bl dibujar_paralelogramo


    // RELLENO DE FORMA

    //"triangulo"
    mov x1, 402              // x inicial
    mov x2, 382              // y inicial
    mov x3, 33               // ancho del paralelogramo
    mov x4, 23               // alto
    mov x6, -5               // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 420              // x inicial
    mov x2, 385              // y inicial
    mov x3, 30               // ancho del paralelogramo
    mov x4, 23               // alto
    mov x6, -5               // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 433              // x inicial
    mov x2, 388              // y inicial
    mov x3, 32               // ancho del paralelogramo
    mov x4, 18               // alto
    mov x6, -5               // desplazamiento
    bl dibujar_paralelogramo

    //"ladera de colina"
	movz x12, 0x69, lsl 16   // Color Verde claro 0x69BD2F  
	movk x12, 0xBD2F, lsl 0
	mov x2, 185              // x inicial (columna)
	mov x3, 400              // y inicial (fila)
	mov x4, 75               // Ancho
	mov x5, 12               // Alto
	bl dibujar_rectangulo

    movz x5, 0x69, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0xBD2F, lsl 0
    mov x1, 128              // x inicial
    mov x2, 370              // y inicial
    mov x3, 55               // ancho del paralelogramo
    mov x4, 20               // alto
    mov x6, 3                // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 620              // x inicial
    mov x2, 380              // y inicial
    mov x3, 240              // ancho del paralelogramo
    mov x4, 50               // alto
    mov x6, -6               // desplazamiento
    bl dibujar_paralelogramo
    

    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta


    ret

//----------------------------------------------------------------------------------------
//MONTAÑA GRANDE SOMBRA MEDIA

montaña1_sombra1:

    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x21, [sp, #0]        // Guarda x21 en la pila

    mov x21, x0              // Guardar base framebuffer al inicio


    movz x12, 0x18, lsl 16     // Color Cyan oscuro 0x18556A
	movk x12, 0x556A, lsl 0
	mov x2, 184                // x inicial (columna)
	mov x3, 404                // y inicial (fila)
	mov x4, 140                // Ancho
	mov x5, 7                  // Alto
	bl dibujar_rectangulo

    movz x12, 0x18, lsl 16     // Color Cyan oscuro 0x18556A  
	movk x12, 0x556A, lsl 0
	mov x2, 228                // x inicial (columna)
	mov x3, 403                // y inicial (fila)
	mov x4, 37                 // Ancho
	mov x5, 1                  // Alto
	bl dibujar_rectangulo

    movz x12, 0x18, lsl 16     // Color Cyan oscuro 0x18556A  
	movk x12, 0x556A, lsl 0
	mov x2, 275                // x inicial (columna)
	mov x3, 403                // y inicial (fila)
	mov x4, 23                 // Ancho
	mov x5, 1                  // Alto
	bl dibujar_rectangulo

    movz x12, 0x18, lsl 16     // Color Cyan oscuro 0x18556A  
	movk x12, 0x556A, lsl 0
	mov x2, 242                // x inicial (columna)
	mov x3, 402                // y inicial (fila)
	mov x4, 6                  // Ancho
	mov x5, 1                  // Alto
	bl dibujar_rectangulo

    movz x12, 0x18, lsl 16     // Color Cyan oscuro 0x18556A  
	movk x12, 0x556A, lsl 0
	mov x2, 600                // x inicial (columna)
	mov x3, 369                // y inicial (fila)
	mov x4, 40                 // Ancho
	mov x5, 42                 // Alto
	bl dibujar_rectangulo

    movz x5, 0x69, lsl 16      // Color Verde claro 0x69BD34
    movk x5, 0xBD34, lsl 0
    mov x1, 640                // x inicial
    mov x2, 363                // y inicial
    mov x3, 20                 // ancho del paralelogramo
    mov x4, 12                 // alto
    mov x6, -4                 // desplazamiento
    bl dibujar_paralelogramo

    movz x12, 0x18, lsl 16     // Color Cyan oscuro 0x18556A  
	movk x12, 0x556A, lsl 0
	mov x2, 594                // x inicial (columna)
	mov x3, 362                // y inicial (fila)
	mov x4, 9                  // Ancho
	mov x5, 50                 // Alto
	bl dibujar_rectangulo

    mov x1, 609                // centro x
    mov x2, 367                // centro y
    mov x3, 9                  // radio
    movz x4, 0x69, lsl 16      // Color Verde claro 0x69BD34  
	movk x4, 0xBD34, lsl 0
    mov x0, x21                // framebuffer base
    bl dibujar_circulo

    movz x12, 0x18, lsl 16     // Color Cyan oscuro 0x18556A  
	movk x12, 0x556A, lsl 0
	mov x2, 588                // x inicial (columna)
	mov x3, 363                // y inicial (fila)
	mov x4, 6                  // Ancho
	mov x5, 8                  // Alto
	bl dibujar_rectangulo

    movz x12, 0x18, lsl 16     // Color Cyan oscuro 0x18556A  
	movk x12, 0x556A, lsl 0
	mov x2, 583                // x inicial (columna)
	mov x3, 364                // y inicial (fila)
	mov x4, 6                  // Ancho
	mov x5, 8                  // Alto
	bl dibujar_rectangulo

    movz x5, 0x18, lsl 16      // Color Cyan oscuro 0x18556A
    movk x5, 0x556A, lsl 0
    mov x1, 582                // x inicial
    mov x2, 363                // y inicial
    mov x3, 15                 // ancho del paralelogramo
    mov x4, 8                  // alto
    mov x6, -4                 // desplazamiento
    bl dibujar_paralelogramo

    movz x5, 0x18, lsl 16      // Color Cyan oscuro 0x18556A
    movk x5, 0x556A, lsl 0
    mov x1, 581                // x inicial
    mov x2, 367                // y inicial
    mov x3, 15                 // ancho del paralelogramo
    mov x4, 8                  // alto
    mov x6, -4                 // desplazamiento
    bl dibujar_paralelogramo

    movz x12, 0x18, lsl 16     // Color Cyan oscuro 0x18556A  
	movk x12, 0x556A, lsl 0
	mov x2, 553                // x inicial (columna)
	mov x3, 371                // y inicial (fila)
	mov x4, 12                 // Ancho
	mov x5, 4                  // Alto
	bl dibujar_rectangulo

    movz x5, 0x18, lsl 16      // Color Cyan oscuro 0x18556A
    movk x5, 0x556A, lsl 0
    mov x1, 593                // x inicial
    mov x2, 376                // y inicial
    mov x3, 60                 // ancho del paralelogramo
    mov x4, 36                 // alto
    mov x6, -2                 // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 530                // centro x
    mov x2, 405                // centro y
    mov x3, 20                 // radio
    movz x4, 0x18, lsl 16      // Color Cyan oscuro 0x18556A  
	movk x4, 0x556A, lsl 0
    mov x0, x21                // framebuffer base
    bl dibujar_circulo

    movz x5, 0x18, lsl 16      // Color Cyan oscuro 0x18556A
    movk x5, 0x556A, lsl 0
    mov x1, 532                // x inicial
    mov x2, 390                // y inicial
    mov x3, 65                 // ancho del paralelogramo
    mov x4, 32                 // alto
    mov x6, -4                 // desplazamiento
    bl dibujar_paralelogramo

    movz x12, 0x18, lsl 16     // Color Cyan oscuro 0x18556A  
	movk x12, 0x556A, lsl 0
	mov x2, 541                // x inicial (columna)
	mov x3, 390                // y inicial (fila)
	mov x4, 42                 // Ancho
	mov x5, 22                 // Alto
	bl dibujar_rectangulo

    mov x1, 342                // centro x
    mov x2, 448                // centro y
    mov x3, 50                 // radio
    movz x4, 0x18, lsl 16      // Color Cyan oscuro 0x18556A  
	movk x4, 0x556A, lsl 0
    mov x0, x21                // framebuffer base
    bl dibujar_circulo

    movz x5, 0x18, lsl 16      // Color Cyan oscuro 0x18556A
    movk x5, 0x556A, lsl 0
    mov x1, 404                // x inicial
    mov x2, 379                // y inicial
    mov x3, 20                 // ancho del paralelogramo
    mov x4, 23                 // alto
    mov x6, -5                 // desplazamiento
    bl dibujar_paralelogramo

    movz x5, 0x18, lsl 16      // Color Cyan oscuro 0x18556A
    movk x5, 0x556A, lsl 0
    mov x1, 402                // x inicial
    mov x2, 380                // y inicial
    mov x3, 33                 // ancho del paralelogramo
    mov x4, 28                 // alto
    mov x6, -5                 // desplazamiento
    bl dibujar_paralelogramo

    movz x5, 0x18, lsl 16      // Color Cyan oscuro 0x18556A
    movk x5, 0x556A, lsl 0
    mov x1, 402                // x inicial
    mov x2, 380                // y inicial
    mov x3, 33                 // ancho del paralelogramo
    mov x4, 28                 // alto
    mov x6, -4                 // desplazamiento
    bl dibujar_paralelogramo

    movz x12, 0x18, lsl 16     // Color Cyan oscuro 0x18556A  
	movk x12, 0x556A, lsl 0
	mov x2, 112                // x inicial (columna)
	mov x3, 375                // y inicial (fila)
	mov x4, 85                 // Ancho
	mov x5, 40                 // Alto
	bl dibujar_rectangulo

    movz x12, 0x18, lsl 16     // Color Cyan oscuro 0x18556A  
	movk x12, 0x556A, lsl 0
	mov x2, 105                // x inicial (columna)
	mov x3, 342                // y inicial (fila)
	mov x4, 10                 // Ancho
	mov x5, 40                 // Alto
	bl dibujar_rectangulo

    movz x5, 0x18, lsl 16      // Color Cyan oscuro 0x18556A
    movk x5, 0x556A, lsl 0
    mov x1, 80                 // x inicial
    mov x2, 352                // y inicial
    mov x3, 36                 // ancho del paralelogramo
    mov x4, 30                 // alto
    mov x6, 1                  // desplazamiento
    bl dibujar_paralelogramo

    movz x5, 0x18, lsl 16      // Color Cyan oscuro 0x18556A
    movk x5, 0x556A, lsl 0
    mov x1, 90                 // x inicial
    mov x2, 360                // y inicial
    mov x3, 36                 // ancho del paralelogramo
    mov x4, 20                 // alto
    mov x6, 3                  // desplazamiento
    bl dibujar_paralelogramo

    movz x5, 0x18, lsl 16      // Color Cyan oscuro 0x18556A
    movk x5, 0x556A, lsl 0
    mov x1, 110                // x inicial
    mov x2, 367                // y inicial
    mov x3, 36                 // ancho del paralelogramo
    mov x4, 10                 // alto
    mov x6, 5                  // desplazamiento
    bl dibujar_paralelogramo

	mov x2, 196                // x inicial
	mov x3, 420                // y inicial
	mov x4, 45                 // Ancho de la base
	mov x6, 0                  // Grosor borde
	mov x5, 2                  // Dirección
	movz x13, 0x18, lsl 16     // Color Cyan oscuro 0x18556A
 	movk x13, 0x556A, lsl 0
	bl dibujar_triangulo_dir

    movz x5, 0x18, lsl 16      // Color Cyan oscuro 0x18556A
    movk x5, 0x556A, lsl 0
    mov x1, 180                // x inicial
    mov x2, 395                // y inicial
    mov x3, 36                 // ancho del paralelogramo
    mov x4, 10                 // alto
    mov x6, 5                  // desplazamiento
    bl dibujar_paralelogramo

//-----------------------------------------------------------------------------------------
//SOMBRA 1.1 (VERDE MARINO MEDIO)

	//montaña
	mov x2, 408                // x inicial
	mov x3, 378                // y inicial
	mov x4, 10                 // Ancho de la base
	mov x6, 0                  // Grosor borde
	mov x5, 1                  // Dirección
	movz x13, 0xE5, lsl 16     // Color Gris 0xE5E5E5
 	movk x13, 0xE5E5, lsl 0
	bl dibujar_triangulo_dir

	mov x2, 398                // x inicial
	mov x3, 378                // y inicial
	mov x4, 10                 // Ancho de la base
	mov x6, 0                  // Grosor borde
	mov x5, 0                  // Dirección
	movz x13, 0xE5, lsl 16     // Color Gris 0xE5E5E5
 	movk x13, 0xE5E5, lsl 0
	bl dibujar_triangulo_dir

	movz x5, 0xE5, lsl 16      // Color Gris 0xE5E5E5
    movk x5, 0xE5E5, lsl 0
    mov x1, 419                // x inicial
    mov x2, 378                // y inicial
    mov x3, 4                  // ancho del paralelogramo
    mov x4, 5                  // alto
    mov x6, -2                 // desplazamiento
    bl dibujar_paralelogramo

	//sombra
	movz x5, 0x36, lsl 16      // Color  Verde marino medio 0x36936E
    movk x5, 0x936E, lsl 0
    mov x1, 422                // x inicial
    mov x2, 380                // y inicial
    mov x3, 20                 // ancho del paralelogramo
    mov x4, 32                 // alto
    mov x6, 1                  // desplazamiento
    bl dibujar_paralelogramo

	movz x5, 0xE5, lsl 16      // Color Gris 0xE5E5E5
    movk x5, 0xE5E5, lsl 0
    mov x1, 422                // x inicial
    mov x2, 378                // y inicial
    mov x3, 20                 // ancho del paralelogramo
    mov x4, 5                  // alto
    mov x6, 4                  // desplazamiento
    bl dibujar_paralelogramo

	mov x1, 442                // centro x
    mov x2, 418                // centro y
    mov x3, 15                 // radio
    movz x4, 0x69, lsl 16      // Color Verde claro 0x69BD34  
	movk x4, 0xBD34, lsl 0
    bl dibujar_circulo

	mov x1, 425                // centro x
    mov x2, 400                // centro y
    mov x3, 15                 // radio
    movz x4, 0x69, lsl 16      // Color Verde claro 0x69BD34  
	movk x4, 0xBD34, lsl 0
    bl dibujar_circulo
 
    ldr x21, [sp, #0]          // Restaura x21
    ldp x29, x30, [sp, #8]     // Restaura FP y LR
    add sp, sp, #24            // Ajusta SP de vuelta

    ret


//---------------------------------------------------------------------------------------
//MONTAÑA GRANDE SOMBRA MÁS OSCURA

montaña1_sombra2:

    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x21, [sp, #0]        // Guarda x21 en la pila

    mov x21, x0              // Guardar base framebuffer al inicio

//IZQUIERDA
	movz x12, 0x11, lsl 16   // Color Azul oscuro 0x111F34  
	movk x12, 0x1F34, lsl 0
	mov x2, 87               // x inicial (columna)
	mov x3, 346              // y inicial (fila)
	mov x4, 20               // Ancho
	mov x5, 10               // Alto
	bl dibujar_rectangulo
    
    movz x5, 0xE5, lsl 16    // Color Gris 0xE5E5E5
    movk x5, 0xE5E5, lsl 0
    mov x1, 118              // x inicial
    mov x2, 338              // y inicial
    mov x3, 4                // ancho del paralelogramo
    mov x4, 10               // alto
    mov x6, -4               // desplazamiento
    bl dibujar_paralelogramo 

    mov x1, 118              // x inicial
    mov x2, 339              // y inicial
    mov x3, 4                // ancho del paralelogramo
    mov x4, 10               // alto
    mov x6, -4               // desplazamiento
    bl dibujar_paralelogramo 

    mov x1, 118              // x inicial
    mov x2, 340              // y inicial
    mov x3, 4                // ancho del paralelogramo
    mov x4, 10               // alto
    mov x6, -4               // desplazamiento
    bl dibujar_paralelogramo 
    
    movz x5, 0x11, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0x1F34, lsl 0
    mov x1, 122              // x inicial
    mov x2, 340              // y inicial
    mov x3, 4                // ancho del paralelogramo
    mov x4, 10               // alto
    mov x6, -4               // desplazamiento
    bl dibujar_paralelogramo     
    
    movz x12, 0x11, lsl 16   // Color Azul oscuro 0x111F34
	movk x12, 0x1F34, lsl 0
	mov x2, 95               // x inicial (columna)
	mov x3, 356              // y inicial (fila)
	mov x4, 13               // Ancho
	mov x5, 3                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 359              // y inicial (fila)
	mov x4, 14               // Ancho
	mov x5, 2                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 361              // y inicial (fila)
	mov x4, 15               // Ancho
	mov x5, 2                // Alto
	bl dibujar_rectangulo

    movz x5, 0x11, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0x1F34, lsl 0
    mov x1, 95               // x inicial
    mov x2, 363              // y inicial
    mov x3, 16               // ancho del paralelogramo
    mov x4, 4                // alto
    mov x6, 1                // desplazamiento
    bl dibujar_paralelogramo     

	movz x12, 0x11, lsl 16   // Color Azul oscuro 0x111F34
	movk x12, 0x1F34, lsl 0
	mov x2, 95               // x inicial (columna)
	mov x3, 367              // y inicial (fila)
	mov x4, 20               // Ancho
	mov x5, 2                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 369              // y inicial (fila)
	mov x4, 21               // Ancho
	mov x5, 2                // Alto
	bl dibujar_rectangulo

    movz x5, 0x11, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0x1F34, lsl 0
    mov x1, 95               // x inicial
    mov x2, 371              // y inicial
    mov x3, 22               // ancho del paralelogramo
    mov x4, 2                // alto
    mov x6, 1                // desplazamiento
    bl dibujar_paralelogramo     

    mov x1, 95               // x inicial
    mov x2, 373              // y inicial
    mov x3, 25               // ancho del paralelogramo
    mov x4, 2                // alto
    mov x6, 1                // desplazamiento
    bl dibujar_paralelogramo     

	movz x12, 0x11, lsl 16   // Color Azul oscuro 0x111F34
	movk x12, 0x1F34, lsl 0
	mov x2, 95               // x inicial (columna)
	mov x3, 375              // y inicial (fila)
	mov x4, 27               // Ancho
	mov x5, 1                // Alto
	bl dibujar_rectangulo

    movz x5, 0x11, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0x1F34, lsl 0
    mov x1, 95               // x inicial
    mov x2, 376              // y inicial
    mov x3, 30               // ancho del paralelogramo
    mov x4, 2                // alto
    mov x6, 1                // desplazamiento
    bl dibujar_paralelogramo  

	movz x12, 0x11, lsl 16   // Color Azul oscuro 0x111F34
	movk x12, 0x1F34, lsl 0
	mov x2, 95               // x inicial (columna)
	mov x3, 376              // y inicial (fila)
	mov x4, 34               // Ancho
	mov x5, 1                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 377              // y inicial (fila)
	mov x4, 36               // Ancho
	mov x5, 1                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 378              // y inicial (fila)
	mov x4, 39               // Ancho
	mov x5, 1                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 379              // y inicial (fila)
	mov x4, 75               // Ancho
	mov x5, 2                // Alto
	bl dibujar_rectangulo

	mov x2, 144              // x inicial (columna)
	mov x3, 378              // y inicial (fila)
	mov x4, 24               // Ancho
	mov x5, 1                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 381              // y inicial (fila)
	mov x4, 74               // Ancho
	mov x5, 2                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 383              // y inicial (fila)
	mov x4, 73               // Ancho
	mov x5, 3                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 386              // y inicial (fila)
	mov x4, 71               // Ancho
	mov x5, 2                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 388              // y inicial (fila)
	mov x4, 73               // Ancho
	mov x5, 3                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 391              // y inicial (fila)
	mov x4, 75               // Ancho
	mov x5, 2                // Alto
	bl dibujar_rectangulo

    movz x5, 0x11, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0x1F34, lsl 0
    mov x1, 95               // x inicial
    mov x2, 393              // y inicial
    mov x3, 76               // ancho del paralelogramo
    mov x4, 10               // alto
    mov x6, 3                // desplazamiento
    bl dibujar_paralelogramo  

	movz x12, 0x11, lsl 16   // Color Azul oscuro 0x111F34
	movk x12, 0x1F34, lsl 0
	mov x2, 95               // x inicial (columna)
	mov x3, 403              // y inicial (fila)
	mov x4, 105              // Ancho
	mov x5, 2                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 405              // y inicial (fila)
	mov x4, 106              // Ancho
	mov x5, 3                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 407              // y inicial (fila)
	mov x4, 106              // Ancho
	mov x5, 4                // Alto
	bl dibujar_rectangulo

	mov x2, 95               // x inicial (columna)
	mov x3, 408              // y inicial (fila)
	mov x4, 108              // Ancho
	mov x5, 3                // Alto
	bl dibujar_rectangulo

    //RELLENO

	mov x2, 95               // x inicial (columna)
	mov x3, 398              // y inicial (fila)
	mov x4, 50               // Ancho
	mov x5, 5                // Alto
	bl dibujar_rectangulo


//DERECHA
    movz x5, 0x11, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0x1F34, lsl 0
    mov x1, 533              // x inicial
    mov x2, 406              // y inicial
    mov x3, 90               // ancho del paralelogramo
    mov x4, 5                // alto
    mov x6, -2               // desplazamiento
    bl dibujar_paralelogramo  

    mov x1, 548              // x inicial
    mov x2, 403              // y inicial
    mov x3, 69               // ancho del paralelogramo
    mov x4, 4                // alto
    mov x6, -2               // desplazamiento
    bl dibujar_paralelogramo  

	movz x12, 0x11, lsl 16   // Color Azul oscuro 0x111F34
	movk x12, 0x1F34, lsl 0
	mov x2, 560              // x inicial (columna)
	mov x3, 402              // y inicial (fila)
	mov x4, 15               // Ancho
	mov x5, 1                // Alto
	bl dibujar_rectangulo

    mov x1, 603              // centro x
    mov x2, 424              // centro y
    mov x3, 26               // radio
    movz x4, 0x11, lsl 16    // Color Azul oscuro 0x111F34 
	movk x4, 0x1F34, lsl 0   
    bl dibujar_circulo

	movz x12, 0x11, lsl 16   // Color Azul oscuro 0x111F34
	movk x12, 0x1F34, lsl 0
	mov x2, 568              // x inicial (columna)
	mov x3, 388              // y inicial (fila)
	mov x4, 4                // Ancho
	mov x5, 3                // Alto
	bl dibujar_rectangulo

	mov x2, 563              // x inicial (columna)
	mov x3, 389              // y inicial (fila)
	mov x4, 6                // Ancho
	mov x5, 3                // Alto
	bl dibujar_rectangulo

	mov x2, 554              // x inicial (columna)
	mov x3, 393              // y inicial (fila)
	mov x4, 20               // Ancho
	mov x5, 5                // Alto
	bl dibujar_rectangulo

	mov x2, 551              // x inicial (columna)
	mov x3, 396              // y inicial (fila)
	mov x4, 3                // Ancho
	mov x5, 3                // Alto
	bl dibujar_rectangulo

	mov x2, 573              // x inicial (columna)
	mov x3, 396              // y inicial (fila)
	mov x4, 6                // Ancho
	mov x5, 4                // Alto
	bl dibujar_rectangulo
  
    movz x5, 0x11, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0x1F34, lsl 0
    mov x1, 561              // x inicial
    mov x2, 390              // y inicial
    mov x3, 8                // ancho del paralelogramo
    mov x4, 5                // alto
    mov x6, -2               // desplazamiento
    bl dibujar_paralelogramo  

//CENTRO 
    mov x1, 335              // x inicial
    mov x2, 392              // y inicial
    mov x3, 7                // ancho del paralelogramo
    mov x4, 8                // alto
    mov x6, -4               // desplazamiento
    bl dibujar_paralelogramo  

    mov x1, 335              // x inicial
    mov x2, 392              // y inicial
    mov x3, 6                // ancho del paralelogramo
    mov x4, 20               // alto
    mov x6, -1               // desplazamiento
    bl dibujar_paralelogramo  

    mov x1, 325              // x inicial
    mov x2, 395              // y inicial
    mov x3, 13               // ancho del paralelogramo
    mov x4, 13               // alto
    mov x6, -1               // desplazamiento
    bl dibujar_paralelogramo  

	mov x2, 300              // x inicial
	mov x3, 395              // y inicial
	mov x4, 20               // Ancho de la base
	mov x6, 0                // Grosor borde
	mov x5, 0                // Dirección
	movz x13, 0x11, lsl 16   // Color Azul oscuro 0x111F34
 	movk x13, 0x1F34, lsl 0
	bl dibujar_triangulo_dir

	mov x2, 315              // x inicial
	mov x3, 395              // y inicial
	mov x4, 8                // Ancho de la base
	mov x6, 0                // Grosor borde
	mov x5, 0                // Dirección
	bl dibujar_triangulo_dir


    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta


    ret



//------------------------------------------------------------------------------------
//MONTAÑA PEQUEÑA ZONA CLARA
montaña2_clara:


    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x19, [sp, #0]        // Guarda x19 en la pila

    mov x19, x0              // Reestablezco x0


//PARTE CLARA
    mov x1, 62               // centro x
    mov x2, 398              // centro y
    mov x3, 55               // radio
    movz x4, 0x69, lsl 16    // Color Verde claro 0x69BD2F 
	movk x4, 0xBD2F, lsl 0   
    bl dibujar_circulo

    movz x12, 0x69, lsl 16   // Color Verde claro 0x69BD2F  
	movk x12, 0xBD2F, lsl 0
	mov x2, 0                // x inicial (columna)
	mov x3, 343              // y inicial (fila)
	mov x4, 52               // Ancho
	mov x5, 68               // Alto
	bl dibujar_rectangulo

	mov x2, 0                // x inicial (columna)
	mov x3, 342              // y inicial (fila)
	mov x4, 39               // Ancho
	mov x5, 1                // Alto
	bl dibujar_rectangulo

    movz x5, 0x69, lsl 16    // Color Verde claro 0x69BD2F
    movk x5, 0xBD2F, lsl 0
    mov x1, 02               // x inicial
    mov x2, 380              // y inicial
    mov x3, 112              // ancho del paralelogramo
    mov x4, 31               // alto
    mov x6, 1                // desplazamiento
    bl dibujar_paralelogramo

    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta

    ret


//----------------------------------------------------------------------------------------
//MONTAÑA PEQUEÑA SOMBRA MEDIA

montaña2_sombra1:

    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x21, [sp, #0]        // Guarda x21 en la pila

    mov x21, x0          // Guardar base framebuffer al inicio


    movz x12, 0x18, lsl 16   // Color Verde claro 0x69BD2F  
	movk x12, 0x556A, lsl 0
	mov x2, 0                // x inicial (columna)
	mov x3, 342              // y inicial (fila)
	mov x4, 28               // Ancho
	mov x5, 70               // Alto
	bl dibujar_rectangulo

    movz x5, 0x18, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0x556A, lsl 0
    mov x1, 0                // x inicial
    mov x2, 365              // y inicial
    mov x3, 38                // ancho del paralelogramo
    mov x4, 14                // alto
    mov x6, 4                // desplazamiento
    bl dibujar_paralelogramo
  
    movz x5, 0x18, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0x556A, lsl 0
    mov x1, 0                // x inicial
    mov x2, 372              // y inicial
    mov x3, 44                // ancho del paralelogramo
    mov x4, 14                // alto
    mov x6, 3                // desplazamiento
    bl dibujar_paralelogramo
  
    mov x1, 39         // centro x
    mov x2, 355         // centro y
    mov x3, 13          // radio
    movz x4, 0x69, lsl 16   // Color Azul oscuro 0x111F34  
	movk x4, 0xBD34, lsl 0
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    mov x1, 74         // centro x
    mov x2, 383         // centro y
    mov x3, 11          // radio
    movz x4, 0x18, lsl 16   // Color Azul oscuro 0x111F34  
	movk x4, 0x556A, lsl 0
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    movz x5, 0x18, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0x556A, lsl 0
    mov x1, 05                // x inicial
    mov x2, 391              // y inicial
    mov x3, 114                // ancho del paralelogramo
    mov x4, 20                // alto
    mov x6, 3                // desplazamiento
    bl dibujar_paralelogramo

    movz x5, 0x18, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0x556A, lsl 0
    mov x1, 02                // x inicial
    mov x2, 385              // y inicial
    mov x3, 117                // ancho del paralelogramo
    mov x4, 31                // alto
    mov x6, 1                // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 96         // centro x
    mov x2, 380         // centro y
    mov x3, 12          // radio
    movz x4, 0x69, lsl 16   // Color Azul oscuro 0x111F34  
	movk x4, 0xBD34, lsl 0
    mov x0, x21          // framebuffer base
    bl dibujar_circulo

    movz x5, 0x69, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0xBD34, lsl 0
    mov x1, 107                // x inicial
    mov x2, 385              // y inicial
    mov x3, 6                // ancho del paralelogramo
    mov x4, 5                // alto
    mov x6, -2                // desplazamiento
    bl dibujar_paralelogramo




    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta



    ret



//-----------------------------------------------------------------------------------------
//MONTAÑA PEQUEÑA SOMBRA MÁS OSCURA

montaña2_sombra2:
    sub sp, sp, #24          // Ajusta SP para 3 registros
    stp x29, x30, [sp, #8]   // Guarda FP y LR en la pila
    str x19, [sp, #0]        // Guarda x19 en la pila

    mov x19, x0             // Reestablezco x0

    mov x1, 54               // centro x
    mov x2, 407              // centro y
    mov x3, 22               // radio
    movz x4, 0x11, lsl 16    // Color Azul oscuro 0x111F34 
	movk x4, 0x1F34, lsl 0   
    bl dibujar_circulo

	movz x12, 0x11, lsl 16   // Color Azul oscuro 0x111F34
	movk x12, 0x1F34, lsl 0
	mov x2, 0                // x inicial (columna)
	mov x3, 341              // y inicial (fila)
	mov x4, 3                // Ancho
	mov x5, 1                // Alto
	bl dibujar_rectangulo

	mov x2, 0                // x inicial (columna)
	mov x3, 342              // y inicial (fila)
	mov x4, 4                // Ancho
	mov x5, 4                // Alto
	bl dibujar_rectangulo

	mov x2, 0                // x inicial (columna)
	mov x3, 346              // y inicial (fila)
	mov x4, 5                // Ancho
	mov x5, 3                // Alto
	bl dibujar_rectangulo

    mov x2, 0                // x inicial (columna)
	mov x3, 349              // y inicial (fila)
	mov x4, 6                // Ancho
	mov x5, 4                // Alto
	bl dibujar_rectangulo

    mov x2, 0                // x inicial (columna)
	mov x3, 353              // y inicial (fila)
	mov x4, 7                // Ancho
	mov x5, 6                // Alto
	bl dibujar_rectangulo

    mov x2, 0                // x inicial (columna)
	mov x3, 359              // y inicial (fila)
	mov x4, 8                // Ancho
	mov x5, 5                // Alto
	bl dibujar_rectangulo


    movz x5, 0x11, lsl 16    // Color Azul oscuro 0x111F34
    movk x5, 0x1F34, lsl 0
    mov x1, 0                // x inicial
    mov x2, 364              // y inicial
    mov x3, 8                // ancho del paralelogramo
    mov x4, 8                // alto
    mov x6, 1                // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 0                // x inicial
    mov x2, 372              // y inicial
    mov x3, 15               // ancho del paralelogramo
    mov x4, 10               // alto
    mov x6, 2                // desplazamiento
    bl dibujar_paralelogramo

    mov x1, 0                // x inicial
    mov x2, 380              // y inicial
    mov x3, 32               // ancho del paralelogramo
    mov x4, 15               // alto
    mov x6, 3                // desplazamiento
    bl dibujar_paralelogramo

//RELLENO

	movz x12, 0x11, lsl 16   // Color Azul oscuro 0x111F34
	movk x12, 0x1F34, lsl 0
	mov x2, 0                // x inicial (columna)
	mov x3, 365              // y inicial (fila)
	mov x4, 10               // Ancho
	mov x5, 30               // Alto
	bl dibujar_rectangulo

	mov x2, 10               // x inicial (columna)
	mov x3, 375              // y inicial (fila)
	mov x4, 10               // Ancho
	mov x5, 10               // Alto
	bl dibujar_rectangulo

	mov x2, 0                // x inicial (columna)
	mov x3, 385              // y inicial (fila)
	mov x4, 40               // Ancho
	mov x5, 30               // Alto
	bl dibujar_rectangulo

    ldr x21, [sp, #0]        // Restaura x21
    ldp x29, x30, [sp, #8]   // Restaura FP y LR
    add sp, sp, #24          // Ajusta SP de vuelta

    ret
