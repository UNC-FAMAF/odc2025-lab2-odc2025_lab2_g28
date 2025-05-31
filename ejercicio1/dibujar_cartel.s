	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ SCREEN_MAX_X,          (SCREEN_WIDTH - 1)  // 639
	.equ SCREEN_MAX_Y,          (SCREEN_HEIGHT - 1) // 479

    .globl dibujar_cartel
    .extern dibujar_rectangulo
    .extern dibujar_paralelogramo

dibujar_cartel:

    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

//----------- SOGA AVION --------------
    mov x2, #330    // x_inicial
    mov x3, #98     // y_inicial
    mov x4, #35     //ancho 
    mov x5, #3      //alto
    movz w12, #0x5E1E, lsl 0
    movk w12, #0x68, lsl 16

    bl dibujar_rectangulo

    mov x1, #377        //x_inicial
    mov x2, #85         //y_inicial
    mov x3, #5          //ancho
    mov x4, #17         //alto
    mov x6, #-1         //desplazamiento
    movz w5, #0x5E1E, lsl 0     //color 
    movk w5, #0x68, lsl 16

    bl dibujar_paralelogramo

    mov x1, #360        //x_inicial
    mov x2, #98         //y_inicial
    mov x3, #5          //ancho
    mov x4, #17         //alto
    mov x6, #1         //desplazamiento
    movz w5, #0x5E1E, lsl 0     //color 
    movk w5, #0x68, lsl 16

    bl dibujar_paralelogramo

//----------- CARTEL --------------
    mov x2, #372    // x_inicial
    mov x3, #78     // y_inicial
    mov x4, #250     //ancho 
    mov x5, #50      //alto
    movz w12, #0xCAB4, lsl 0
    movk w12, #0xE1, lsl 16
    
    bl dibujar_rectangulo

    mov x2, #599        //x inicial
    mov x3, #103        //y inicial
    mov x4, #32         // ancho de la base
    mov x5, #3          //triangulo hacia la derecha
    mov x6, #5          // grosor borde
    movz w13, 0x5B, lsl 16     // Color borde (parte oscura) 
	movk w13, 0x6EE1, lsl 0 

    bl dibujar_triangulo_dir

    mov x0, x0
    mov x2, #599        //x inicial
    mov x3, #102        //y inicial
    mov x4, #32         // ancho de la base
    mov x5, #0          //triangulo hacia la derecha
    mov x6, #5          // grosor borde
    movz w13, 0x5B, lsl 16     // Color borde (parte oscura) 
	movk w13, 0x6EE1, lsl 0 

    bl dibujar_triangulo_dir

//----------- ODC 2025 --------------
//----------- O --------------
    mov x2, #384    // x_inicial
    mov x3, #93     // y_inicial

    bl rectangulo_vertical

    mov x2, #399    // x_inicial
    mov x3, #93     // y_inicial

    bl rectangulo_vertical

    mov x2, #387    // x_inicial
    mov x3, #87     // y_inicial
    mov x4, #15     //ancho 
    mov x5, #7      //alto
    movz w12, #0x6F77, lsl 0
    movk w12, #0x72, lsl 16

    bl dibujar_rectangulo

    mov x2, #387            // x_inicial
    mov x3, #113            // y_inicial
    mov x4, #15             //ancho 
    mov x5, #7              //alto
    movz w12, #0x6F77, lsl 0
    movk w12, #0x72, lsl 16

    bl dibujar_rectangulo

//----------- D --------------
    mov x2, #417    // x_inicial
    mov x3, #93     // y_inicial

    bl rectangulo_vertical

    mov x2, #413    // x_inicial
    mov x3, #87     // y_inicial

    bl rectangulo_horizontal

    mov x2, #413    // x_inicial
    mov x3, #113     // y_inicial

    bl rectangulo_horizontal

    mov x2, #431    // x_inicial
    mov x3, #93     // y_inicial

    bl rectangulo_vertical

//----------- C --------------
    mov x2, #447    // x_inicial
    mov x3, #93     // y_inicial

    bl rectangulo_vertical

    mov x2, #447    // x_inicial
    mov x3, #87     // y_inicial

    bl rectangulo_horizontal

    mov x2, #447    // x_inicial
    mov x3, #113     // y_inicial

    bl rectangulo_horizontal

    mov x2, #464    // x_inicial
    mov x3, #93     // y_inicial

    bl cuadrado

    mov x2, #464    // x_inicial
    mov x3, #106     // y_inicial

    bl cuadrado

//----------- 2 --------------
    mov x2, #491    // x_inicial
    mov x3, #87     // y_inicial

    bl rectangulo_horizontal

    mov x2, #491    //x_inicial
    mov x3, #100    //y_inicial

    bl rectangulo_horizontal

    mov x2, #491    //x_inicial
    mov x3, #113    //y_inicial

    bl rectangulo_horizontal

    mov x2, #505
    mov x3, #93

    bl cuadrado

    mov x2, #491
    mov x3, #106

    bl cuadrado

//----------- 0 --------------
    mov x2, #521
    mov x3, #87

    bl rectangulo_horizontal

    mov x2, #521
    mov x3, #113
    
    bl rectangulo_horizontal

    mov x2, #521
    mov x3, #93

    bl rectangulo_vertical

    mov x2, #535
    mov x3, #93

    bl rectangulo_vertical

//----------- 2 --------------
    mov x2, #547    // x_inicial
    mov x3, #87     // y_inicial

    bl rectangulo_horizontal


    mov x2, #547    //x_inicial
    mov x3, #100    //y_inicial

    bl rectangulo_horizontal

    mov x2, #547    //x_inicial
    mov x3, #113    //y_inicial

    bl rectangulo_horizontal

    mov x2, #561
    mov x3, #93

    bl cuadrado

    mov x2, #547
    mov x3, #106

    bl cuadrado

//----------- 5 --------------
    mov x2, #575    // x_inicial
    mov x3, #87     // y_inicial
    bl rectangulo_horizontal

    mov x2, #575    //x_inicial
    mov x3, #100    //y_inicial

    bl rectangulo_horizontal

    mov x2, #575    //x_inicial
    mov x3, #113    //y_inicial

    bl rectangulo_horizontal

    mov x2, #575
    mov x3, #93

    bl cuadrado

    mov x2, #589
    mov x3, #106

    bl cuadrado


    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret 

//----------- FUNCIONES --------------

rectangulo_vertical:

    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    mov x7, #0

    add x2, x7, x2    // x_inicial
    add x3, x7, x3     // y_inicial
    mov x4, #7     //ancho 
    mov x5, #21      //alto
    movz w12, #0x6F77, lsl 0
    movk w12, #0x72, lsl 16

    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

rectangulo_horizontal:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    mov x7, #0

    add x2, x7, x2    // x_inicial
    add x3, x7, x3     // y_inicial
    mov x4, #21     //ancho 
    mov x5, #7      //alto
    movz w12, #0x6F77, lsl 0
    movk w12, #0x72, lsl 16

    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret

cuadrado:
    stp x29, x30, [sp, #-16]! // Guarda FP y LR y ajusta SP.

    mov x7, #0

    add x2, x7, x2    // x_inicial
    add x3, x7, x3     // y_inicial
    mov x4, #7     //ancho 
    mov x5, #7      //alto
    movz w12, #0x6F77, lsl 0
    movk w12, #0x72, lsl 16

    bl dibujar_rectangulo

    ldp x29, x30, [sp], #16 // Restaura FP y LR y ajusta SP de vuelta.

    ret
