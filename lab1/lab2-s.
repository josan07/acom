.data
LEDMatrixBase: .word LED_MATRIX_0_BASE
LEDMatrixWidth: .byte LED_MATRIX_0_WIDTH
color1: .word 0xffff00
color2: .word 0x00ff00
 
.text

    ## REGION 1 – Loop preamble
    la x6 , LEDMatrixBase
    lwu x7 , 0(x6)
    li x10 , 4
    
    lw x28 , color1
    lw x29 , color2
    
    ## REGION 2 - Set the register x17 to the number of iterations of the loop
    la x8 , LEDMatrixWidth
    lbu x9 , 0(x8)
    add x5, x0, x0

loop:

    ## REGION 3 - Iteration code
    ##            (add your code here)
    mv x13 , x0
    mv x16 , x0
    mul x12 , x11 , x9 #Width * R
    add x14 , x12 , x13 #widthR + C
    mul x15 , x14 , x10 #4(widthR + C)
    add x16 , x7 , x15 #x16 e adress
    sw x28 , 0(x16)
    sw x28 , 4(x16)
    addi x13 , x9 , -2 ## R=Width - 2
    mul x12 , x11 , x9 #Width * R
    add x14 , x12 , x13 #widthR + C
    mul x15 , x14 , x10 #4(widthR + C)
    add x21 , x7 , x15 #x16 e adress
    sw x28 , 0(x16)
    sw x28 , 4(x16)
    sw x29 , 0(x21)
    sw x29 , 4(x21)
    addi x11 , x11 , 1  
    ## loop control - DO NOT CHANGE BELLOW THIS LINE
    addi x5, x5,  1

    blt  x5, x9, loop     # branch to ‘loop’ if x5 < x8
