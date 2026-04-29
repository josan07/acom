.data

Niterations:  .byte  7    # Number of loop iterations
cyan:         .word  0x00ffff
Base:        .word LED_MATRIX_0_BASE
height:        .word LED_MATRIX_0_HEIGHT


.text

    ## REGION 1 – Loop preamble
    ##            (add your code here – only if needed)
     
    la x12, cyan
    lwu x12, 0(x12)
    
    la x10, height
    lwu x10, 0(x10 )
    
    
    li x6, 35
    
    la x8, Base
    lwu x8, 0(x8)

    la x11, Niterations
    sb x10, 0(x11)

    ## REGION 2 - Set the register x17 to the number of iterations of the loop
    ##            (as defined by variable Niterations)
    la x17, Niterations
    lbu x17, 0(x17)
    
    
    ## Loop initialization - DO NOT CHANGE THE LINE BELLOW
    add x5, x0, x0

loop:

    mul  x18, x6, x5            #x7 posR
    add x18, x18, x5            #x9 posC
    slli x18, x18, 2             
    add x18, x18, x8
    
    sw x12,  0(x18)

    ## loop control - DO NOT CHANGE BELLOW THIS LINE
    addi x5, x5,  1
    

    blt  x5, x17, loop     # branch to ‘loop’ if x5 < x17
