	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 	480
	.equ BITS_PER_PIXEL,  	32

    .globl hello_kitty

    
hello_kitty:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    //Limpiar kitty de detŕas
    movz x5, 0x2F, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x273E, lsl 0
	add x1, x25, 337                    // x inicial (columna)
	add x2, x26, 398              	    // y inicial (fila)
	mov x3, 50                	        // Ancho
	mov x4, 20                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función
    
    movz x5, 0xA6, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x286C, lsl 0
	add x1, x25, 337                    // x inicial (columna)
	add x2, x26, 378              	    // y inicial (fila)
	mov x3, 50                	        // Ancho
	mov x4, 20                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función
    
    movz x5, 0x2F, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x273E, lsl 0
	add x1, x25, 344                    // x inicial (columna)
	add x2, x26, 430              	    // y inicial (fila)
	mov x3, 10                	        // Ancho
	mov x4, 20                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función   

    movz x5, 0x13, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1341, lsl 0
	add x1, x25, 320                    // x inicial (columna)
	add x2, x26, 390                	// y inicial (fila)
	mov x3, 40                	        // Ancho
	mov x4, 30                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función
    
    movz x5, 0x1D, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1D4F, lsl 0
	add x1, x25, 337                    // x inicial (columna)
	add x2, x26, 378                	// y inicial (fila)
	mov x3, 25                	        // Ancho
	mov x4, 16                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función

    movz x5, 0x1D, lsl 16     		    // Color Azul 0x131341
	movk x5, 0x1D4F, lsl 0
	add x1, x25, 337                    // x inicial (columna)
	add x2, x26, 396                	// y inicial (fila)
	mov x3, 25                	        // Ancho
	mov x4, 16                 	        // Alto
	bl dibujar_rectangulo      	        // Llamada función


//                     CUERPO 

    add x1, x25, #337           // x_inicial
    add x2, x26, #402           // y_inicial 
    mov x3, #26                 //ancho 
    mov x4, #22                 //alto
    movz w5, #0xB2B2, lsl 0
    movk w5, #0xC6, lsl 16
    bl dibujar_rectangulo

    add x1, x25, #335           //x_inicial
    add x2, x26, #410           //y_inicial 
    movz w5, #0xB2B2, lsl 0
    movk w5, #0xC6, lsl 16
    bl rectangulo_vertical

    add x1, x25, #335           //x_inicial
    add x2, x26, #416           //y_inicial 
    movz w5, #0xB2B2, lsl 0
    movk w5, #0xC6, lsl 16
    bl cuadrado1

    add x1, x25, #363           //x_inicial
    add x2, x26, #412           //y_inicial 
    movz w5, #0xB2B2, lsl 0
    movk w5, #0xC6, lsl 16
    bl cuadrado1

    add x1, x25, #363           //x_inicial
    add x2, x26, #416           //y_inicial
    movz w5, #0xB2B2, lsl 0
    movk w5, #0xC6, lsl 16
    bl cuadrado1

    add x1, x25, #335           //x_inicial
    add x2, x26, #434           //y_inicial 
    movz w5, #0xB2B2, lsl 0
    movk w5, #0xC6, lsl 16
    bl cuadrado2

    add x1, x25, #361           //x_inicial
    add x2, x26, #434           //y_inicial
    movz w5, #0xB2B2, lsl 0
    movk w5, #0xC6, lsl 16
    bl cuadrado2
// PIERNA
    add x1, x25, #341           //x_inicial
    add x2, x26, #442           //y_inicial 
    movz w5, #0xB2B2, lsl 0
    movk w5, #0xC6, lsl 16
    bl cuadrado2

    add x1, x25, #345           //x_inicial
    add x2, x26, #442           //y_inicial
    movz w5, #0xB2B2, lsl 0
    movk w5, #0xC6, lsl 16
    bl cuadrado2

    add x1, x25, #351           //x_inicial
    add x2, x26, #442           //y_inicial
    movz w5, #0xB2B2, lsl 0
    movk w5, #0xC6, lsl 16
    bl cuadrado2

    add x1, x25, #355           //x_inicial
    add x2, x26, #442           //y_inicial
    movz w5, #0xB2B2, lsl 0
    movk w5, #0xC6, lsl 16
    bl cuadrado2
// NARIZ
    add x1, x25, #349           //x_inicial
    add x2, x26, #420           //y_inicial 
    movz w5, #0x8C00, lsl 0
    movk w5, #0xBB, lsl 16
    bl cuadrado1

//                     ROPA 
// PARTE OSCURA 
    add x1, x25, #341           // x_inicial
    add x2, x26, #426           // y_inicial 326
    mov x3, #18                 //ancho 
    mov x4, #14                 //alto
    movz w5, #0x0077, lsl 0
    movk w5, #0x7E, lsl 16
    bl dibujar_rectangulo

    add x1, x25, #355           //x_inicial
    add x2, x26, #406           //y_inicial 
    movz w5, #0x0077, lsl 0     //color
    movk w5, #0x7E, lsl 16
    bl cuadrado2

//PARTE CLARA 

    add x1, x25, #347           // x_inicial
    add x2, x26, #426           // y_inicial
    mov x3, #6                  //ancho 
    mov x4, #2                  //alto
    movz w5, #0x45B2, lsl 0     //color
    movk w5, #0xAF, lsl 16
    bl dibujar_rectangulo

    add x1, x25, #359           //x_inicial
    add x2, x26, #426           //y_inicial
    movz w5, #0x45B2, lsl 0     //color
    movk w5, #0xAF, lsl 16
    bl rectangulo_vertical
    
    add x1, x25, #361           //x_inicial
    add x2, x26, #428           //y_inicial 
    movz w5, #0x45B2, lsl 0     //color
    movk w5, #0xAF, lsl 16
    bl rectangulo_vertical

    add x1, x25, #339           //x_inicial
    add x2, x26, #426           //y_inicial
    movz w5, #0x45B2, lsl 0     //color
    movk w5, #0xAF, lsl 16
    bl rectangulo_vertical
    
    add x1, x25, #337           //x_inicial
    add x2, x26, #428           //y_inicial
    movz w5, #0x45B2, lsl 0     //color
    movk w5, #0xAF, lsl 16
    bl rectangulo_vertical

    add x1, x25, #363           //x_inicial
    add x2, x26, #430           //y_inicial 
    movz w5, #0x45B2, lsl 0     //color
    movk w5, #0xAF, lsl 16
    bl cuadrado1

    add x1, x25, #335           //x_inicial
    add x2, x26, #430           //y_inicial
    movz w5, #0x45B2, lsl 0     //color
    movk w5, #0xAF, lsl 16
    bl cuadrado1

    add x1, x25, #351           //x_inicial
    add x2, x26, #402           //y_inicial
    movz w5, #0x45B2, lsl 0     //color
    movk w5, #0xAF, lsl 16
    bl cuadrado2

    add x1, x25, #359           //x_inicial
    add x2, x26, #408           //y_inicial 
    movz w5, #0x45B2, lsl 0     //color
    movk w5, #0xAF, lsl 16
    bl cuadrado2

    add x1, x25, #349           //x_inicial
    add x2, x26, #404           //y_inicial 
    movz w5, #0x45B2, lsl 0     //color
    movk w5, #0xAF, lsl 16
    bl rectangulo_vertical
    
    add x1, x25, #351           //x_inicial
    add x2, x26, #406           //y_inicial
    movz w5, #0x45B2, lsl 0     //color
    movk w5, #0xAF, lsl 16
    bl rectangulo_vertical
//-------------- BOTONES -----------------
    add x1, x25, #343           //x_inicial
    add x2, x26, #430           //y_inicial
    movz w5, #0xB2B2, lsl 0     //color
    movk w5, #0xC6, lsl 16
    bl cuadrado1

    add x1, x25, #355           //x_inicial
    add x2, x26, #430           //y_inicial
    movz w5, #0xB2B2, lsl 0     //color 
    movk w5, #0xC6, lsl 16
    bl cuadrado1
//---------------- CONTORNO -----------------------------

    add x1, x25, #335           //x_inicial
    add x2, x26, #400           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #335           //x_inicial
    add x2, x26, #404           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #333           //x_inicial
    add x2, x26, #410           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #333           //x_inicial
    add x2, x26, #416           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #335           //x_inicial 
    add x2, x26, #418           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #337           //x_inicial
    add x2, x26, #424           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #341           //x_inicial
    add x2, x26, #426           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #361           //x_inicial
    add x2, x26, #424           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #363           //x_inicial 
    add x2, x26, #418           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #365           //x_inicial 
    add x2, x26, #416           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #365           //x_inicial
    add x2, x26, #410           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #363           //x_inicial
    add x2, x26, #404           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #363           //x_inicial
    add x2, x26, #400           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #347           //x_inicial 
    add x2, x26, #404           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #355           //x_inicial 
    add x2, x26, #402           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #353           //x_inicial 
    add x2, x26, #406           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #333           //x_inicial
    add x2, x26, #430           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #333           //x_inicial
    add x2, x26, #434           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #339           //x_inicial 
    add x2, x26, #432           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #339           //x_inicial
    add x2, x26, #436           //y_inicial 
    movz w5, #0x1324, lsl 0
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #339           //x_inicial
    add x2, x26, #442           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #359           //x_inicial 
    add x2, x26, #442           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #365           //x_inicial
    add x2, x26, #434           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #365           //x_inicial
    add x2, x26, #430           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #359           //x_inicial
    add x2, x26, #432           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #359           //x_inicial 
    add x2, x26, #436           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #349           //x_inicial 
    add x2, x26, #442           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #349           //x_inicial
    add x2, x26, #438           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #357           //x_inicial 
    add x2, x26, #426           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #341           //x_inicial
    add x2, x26, #416           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #357           //x_inicial
    add x2, x26, #416           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_vertical

    add x1, x25, #333           //x_inicial
    add x2, x26, #408           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #333           //x_inicial
    add x2, x26, #414           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #329           //x_inicial
    add x2, x26, #414           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #329           //x_inicial
    add x2, x26, #418           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16 
    bl rectangulo_horizontal

    add x1, x25, #331           //x_inicial 336
    add x2, x26, #422           //y_inicial 322
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16  
    bl rectangulo_horizontal

    add x1, x25, #335           //x_inicial
    add x2, x26, #422           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal 

    add x1, x25, #339           //x_inicial
    add x2, x26, #424           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #343           //x_inicial
    add x2, x26, #424           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #349           //x_inicial
    add x2, x26, #424           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #353           //x_inicial
    add x2, x26, #424           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #357           //x_inicial
    add x2, x26, #424           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #361           //x_inicial
    add x2, x26, #422           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #365           //x_inicial
    add x2, x26, #422           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #367           //x_inicial 
    add x2, x26, #418           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #367           //x_inicial
    add x2, x26, #414           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #363           //x_inicial
    add x2, x26, #414           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #363           //x_inicial
    add x2, x26, #408           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #359           //x_inicial
    add x2, x26, #406           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #359           //x_inicial
    add x2, x26, #400           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #351           //x_inicial
    add x2, x26, #400           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #347           //x_inicial
    add x2, x26, #402           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #341           //x_inicial
    add x2, x26, #402           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #337           //x_inicial
    add x2, x26, #400           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #355           //x_inicial
    add x2, x26, #410           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #359           //x_inicial
    add x2, x26, #412           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #335           //x_inicial
    add x2, x26, #432           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #335           //x_inicial
    add x2, x26, #438           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #339           //x_inicial
    add x2, x26, #440           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #341           //x_inicial
    add x2, x26, #446           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #345           //x_inicial 
    add x2, x26, #446           //y_inicial
    movz w5, #0x1324, lsl 0     //color 
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #351           //x_inicial
    add x2, x26, #446           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #355           //x_inicial
    add x2, x26, #446           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #357           //x_inicial
    add x2, x26, #440           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #361           //x_inicial
    add x2, x26, #438           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #361           //x_inicial
    add x2, x26, #432           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #353           //x_inicial
    add x2, x26, #440           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #343           //x_inicial
    add x2, x26, #440           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #347           //x_inicial
    add x2, x26, #428           //y_inicial 
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl rectangulo_horizontal

    add x1, x25, #345           //x_inicial
    add x2, x26, #402           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #349           //x_inicial
    add x2, x26, #400           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #357           //x_inicial
    add x2, x26, #400           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #357           //x_inicial
    add x2, x26, #404           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #349           //x_inicial
    add x2, x26, #408           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #351           //x_inicial
    add x2, x26, #410           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #363           //x_inicial
    add x2, x26, #410           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #347           //x_inicial
    add x2, x26, #424           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #345           //x_inicial
    add x2, x26, #426           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #353           //x_inicial
    add x2, x26, #426           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #335           //x_inicial
    add x2, x26, #428           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #351           //x_inicial
    add x2, x26, #428           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #363           //x_inicial
    add x2, x26, #428           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #339           //x_inicial
    add x2, x26, #430           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #359           //x_inicial
    add x2, x26, #430           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #347           //x_inicial
    add x2, x26, #440           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1

    add x1, x25, #351           //x_inicial
    add x2, x26, #440           //y_inicial
    movz w5, #0x1324, lsl 0     //color
    movk w5, #0x16, lsl 16
    bl cuadrado1


    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

rectangulo_vertical:

    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    mov x7, #0

    add x1, x7, x1      // x_inicial
    add x2, x7, x2      // y_inicial
    mov x3, #2          //ancho 
    mov x4, #4          //alto
    mov w5, w5
    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

rectangulo_horizontal:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    mov x7, #0

    add x1, x7, x1       // x_inicial
    add x2, x7, x2       // y_inicial
    mov x3, #4           //ancho 
    mov x4, #2           //alto
    mov w5, w5


    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

cuadrado1:
//--------------------- CUADRADO 1X1 ------------------------------------

    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    mov x7, #0

    add x1, x7, x1      // x_inicial
    add x2, x7, x2      // y_inicial
    mov x3, #2          //ancho 
    mov x4, #2          //alto
    mov w5, w5

    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

cuadrado2:
//--------------------- CUADRADO 2X2 ------------------------------------
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    mov x7, #0

    add x1, x7, x1         // x_inicial
    add x2, x7, x2         // y_inicial
    mov x3, #4             //ancho 
    mov x4, #4             //alto
    mov w5, w5

    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret
