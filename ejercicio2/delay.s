.global delay_us

// Suponiendo: 1 iteración = ~10 ciclos (ajustable)
delay_us:
    mov x1, #10           // factor de calibración
    mul x0, x0, x1        // x0 = x0 * 10 (amplifica la espera)
delay_loop:
    subs x0, x0, #1
    bne delay_loop
    ret
