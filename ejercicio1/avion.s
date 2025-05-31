	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
	.equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

    .global avion
    .extern dibujar_triangulo_dir
    .extern dibujar_paralelogramo_con_borde
    .extern ventanas_avion
    
avion:

    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

//----------- CUERPO DEL AVION --------------
    mov x0, x0
    mov x2, #220         // x inicial
    mov x3, #100         // y inicial
    mov x4, #100          // ancho
    mov x5, #30          // alto
    mov x16, #-1          // desplazamiento horizontal por fila (paralelogramo inclinado)
    mov x17, #5          // grosor del borde

    movz w13, #0xFFFF // color (blanco)
    movk w13, #0xFFFF, lsl 16

    movz w12, #0x5B6D // color borde
    movk w12, #0x62, lsl 16

    bl dibujar_paralelogramo_con_borde 
     
    mov x0, x0
    bl ventanas_avion

//----------- LINEA DE COLOR --------------
    mov x0, x0
    mov x1, #205         // x inicial
    mov x2, #120         // y inicial
    mov x3, #90          // ancho
    mov x4, #5           // alto
    mov x6, #-1          // inclinacion
    movz w5, #0x0077     // color relleno
    movk w5, #0xFF, lsl 16

    bl dibujar_paralelogramo
    
//----------- ALA DEL AVION --------------
    mov x0, x0
    mov x2, #235        //x inicial
    mov x3, #117        //y inicial
    mov x4, #35         // ancho de la base
    mov x5, #0          //triangulo hacia la izquierda
    mov x6, #5          // grosor borde
    movz w13, 0x62, lsl 16     // Color borde (parte oscura) 
	movk w13, 0x5B6D, lsl 0

    bl dibujar_triangulo_dir

    mov x0, x0
    mov x2, #245        //x inicial
    mov x3, #122        //y inicial
    mov x4, #21         // ancho de la base
    mov x5, #0          //triangulo hacia la izquierda
    mov x6, #5          // grosor borde
    movz w13, #0xFFFF   // color relleno (blanco)
    movk w13, #0xFF, lsl 16
    
    bl dibujar_triangulo_dir

//----------- COLA DEL AVION --------------
    mov x0, x0
    mov x2, #330           // x inicial
    mov x3, #78            // y inicial
    mov x4, #25            // ancho
    mov x5, #26            // alto
    mov x16, #-1           // desplazamiento horizontal por fila (paralelogramo inclinado)
    mov x17, #5            // grosor del borde
    movz w13, #0xFFFF      //color relleno
    movk w13, #0xFFFF, lsl 16

    movz w12, #0x5B6D // color borde
    movk w12, #0x62, lsl 16

    bl dibujar_paralelogramo_con_borde

    mov x0, x0
    mov x2, #305           //x inicial
    mov x3, #98            //y inicial
    mov x4, #25            // ancho de la base
    mov x5, #0
    movz w13, #0x5B6D       // color borde
    movk w13, #0x62, lsl 16
    bl dibujar_triangulo_dir

    mov x0, x0
    mov x2, #312           //x inicial
    mov x3, #102            //y inicial
    mov x4, #15            // ancho de la base
    movz w13, #0x0077      //color relleno
    movk w13, #0xFF, lsl 16   
    mov x5, #0             //triangulo hacia arriba
    bl dibujar_triangulo_dir

    ldp x29, x30, [sp], #16   // Restaurar FP y LR
    ret


dibujar_paralelogramo_con_borde:
    mov w20, w12   // respaldo del color del borde

    stp x29, x30, [sp, #-16]!   // Guardamos x29 y x30 y ajusta SP 

    mov x6, #0                  // fila = 0
    mov x15, x0                 // framebuffer base

fila_loop:
    //Vemos si terminó de recorrer las filas para terminar o no
    cmp x6, x5      
    bge fin

    // x13 = desplazamiento para esta fila
    mul x13, x6, x16            // desplazamiento = fila * inclinación

    mov x7, #0                  // columna = 0

col_loop:
    // determinamos si termino la columna y si avanzamos a la sigiente fila
    cmp x7, x4      
    bge siguiente_fila

    // elegimos que color usar (borde o relleno)
    
    // evaluamos si es borde (fila o columna en borde)
    cmp x6, x17 // fila superior
    blt usar_color_borde

    sub x10, x5, x17 //fila inferior
    cmp x6, x10
    bge usar_color_borde

    cmp x7, x17 //columna superior
    blt usar_color_borde

    sub x11, x4, x17 //columna inferior
    cmp x7, x11
    bge usar_color_borde

    // No es borde, usar color de relleno
    mov w14, w13
    b pintar_pixel

usar_color_borde:
    mov w14, w20

pintar_pixel:
    // Calculo de coordenadas para pintar el pixel
    add x8, x3, x6          // y = y_inicial + fila
    add x9, x2, x7          // x = x_inicial + columna
    add x9, x9, x13         // aplicar desplazamiento

    // offset = (y * SCREEN_WIDTH + x) * 4
    mov x10, #SCREEN_WIDTH
    mul x11, x8, x10
    add x11, x11, x9
    lsl x11, x11, #2       

    //framebuffer + offset para saber donde pintar (direccion del pixel)
    add x12, x15, x11
    str w14, [x12]

    add x7, x7, #1
    b col_loop

siguiente_fila:
    add x6, x6, #1
    b fila_loop

fin:
    ldp x29, x30, [sp], #16   // Restaurar FP y LR
    ret

