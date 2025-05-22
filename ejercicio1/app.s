	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGHT, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main
	.extern dibujar_circulo
	.extern dibujar_pixel

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0       // Backup del framebuffer en x20 
	mov x21, x0
	//---------------- CODE HERE ------------------------------------

	movz x10, 0x5B6E, lsl 16 // Color celeste para el cielo
	movk x10, 0xE1, lsl 0 


	mov x2, SCREEN_HEIGHT         // Y Size
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w10,[x20]  // Colorear el pixel N
	add x20,x20,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto


	mov x0, x21 // framebuffer base
	mov x1, 326
	mov x2, 285
	movz x4, 0xFFFF, lsl 16
	movk x4, 0xFFFF, lsl 0
	bl dibujar_pixel

    mov x0, x21          // framebuffer base
    mov x1, 320          // centro x
    mov x2, 240          // centro y
    mov x3, 100          // radio

    movz w4, 0xFFFF
    movk w4, 0xFFFF, lsl 16   // color blanco 0xFFFFFFFF (32 bits)

    bl dibujar_circulo

	//--------------- CAMINO ---------------
    mov x0, x20                // Reestablezco x0

	//------------------ Linea entre montañas y camino ---------------
	mov x20, x0                // Guarda la dirección base del framebuffer en x20
	movz x12, 0x31, lsl 16     // Color Linea  
	movk x12, 0x3B38, lsl 0
	mov x2, 0                  // x inicial (columna)
	mov x3, 411                // y inicial (fila)
	mov x4, 640                // Ancho
	mov x5, 1                  // Alto
	bl dibujar_rectangulo      // Llamada funcion
	mov x0, x20                // Reestablezco x0
	
	//------------------ Camino (parte clara) ---------------
	mov x20, x0                // Guarda la dirección base del framebuffer en x20
	movz x12, 0x83, lsl 16     // Color Camino (parte clara)  
	movk x12, 0x7E87, lsl 0
	mov x2, 0                  // x inicial (columna)
	mov x3, 412                // y inicial (fila)
	mov x4, 640                // Ancho
	mov x5, 39                 // Alto
	bl dibujar_rectangulo      // Llamada funcion
	mov x0, x20                // Reestablezco x0

	//------------------ Camino (parte oscura) ---------------
	mov x0, x20                // Guarda la dirección base del framebuffer en x20
	movz x12, 0x62, lsl 16     // Color Camino (parte oscura)
	movk x12, 0x5B6D, lsl 0
	mov x2, 0                  // x inicial (columna)
	mov x3, 451                // y inicial (fila)
	mov x4, 640                // Ancho
	mov x5, 29                 // Alto
	bl dibujar_rectangulo      // Llamada funcion
	mov x0, x20                // Reestablezco x0


	mov x0, x20           // Reestablezco x0

	//------------------ Linea entre montañas y camino ---------------
	mov x20, x0                // Guarda la dirección base del framebuffer en x20
	movz x12, 0x31, lsl 16     // Color linea
	movk x12, 0x3B38, lsl 0
	mov x2, 0                  // Columna
	mov x3, 411                // Fila
	mov x4, 640                // Ancho
	mov x5, 1                  // Alto
	bl dibujar_rectangulo      // Llamada a funcion dibujar_rectangulos
	mov x0, x20                // Reestablezco x0
	
	//------------------ Camino (parte clara) ---------------
	mov x20, x0                // Guarda la dirección base del framebuffer en x20
	movz x12, 0x83, lsl 16     // Color camino (parte clara)
	movk x12, 0x7E87, lsl 0
	mov x2, 0                  // Columna
	mov x3, 412                // Fila
	mov x4, 640                // Ancho
	mov x5, 39                 // Alto
	bl dibujar_rectangulo      // Llamada a funcion dibujar_rectangulos
	mov x0, x20                // Reestablezco x0

	//------------------ Camino (parte oscura) ---------------
	mov x0, x20
	movz x12, 0x62, lsl 16     // Color camino (parte oscura) 
	movk x12, 0x5B6D, lsl 0
	mov x2, 0                  // Columna
	mov x3, 451                // Fila
	mov x4, 640                // Ancho
	mov x5, 29                 // Alto
	bl dibujar_rectangulo      // Llamada a funcion dibujar_rectangulos
	mov x0, x20                // Reestablezco x0
	

	//---------------------------------------------------------------
	// Infinite Loop

InfLoop:
	b InfLoop
