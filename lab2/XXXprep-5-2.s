.data
SwitchesBase:   .word SWITCHES_0_BASE
LEDMatrixBase: .word LED_MATRIX_0_BASE
LEDMatrixWidth: .byte LED_MATRIX_0_WIDTH
LEDMatrixHeight: .byte LED_MATRIX_0_HEIGHT
Step: .byte 0,1,0,-1


.text 
la x5, SwitchesBase
lwu x5, 0(x5)

 
la x7, LEDMatrixBase
lwu x7, 0(x7)
mv x11 x7


la x8, LEDMatrixWidth
lbu x8, 0(x8)

la x9, LEDMatrixHeight
lbu x9, 0(x9) 

mul x31 x9 x8 # W * H
slli x30 x31 2
addi x30 x11 

li x10 0x00ffff00 #yellow
li x12 0x00000000 #blk

la x15 Step

mul x13 x9 x8 #n leds
li x14 0 #i 

li x17 1
li x18 2
li x19 3

do.what:
    jal ra get.step
    
    beqz x6 do.what
    beq x6 x17 move.left
    beq x6 x18 do.what
    beq x6 x19 move.right

move.left:
    beqz x14 goto.end
    sw x10 -4(x11) #yellow

    sw x12 0(x11) #blk
    addi x11 x11 -4 
    addi x14 x14 -1
    j do.what 
    
move.right:
    beq x14 x13 goto.start
    sw x10 0(x11)

    sw x12 -4(x11) 
    addi x11 x11 4 
    addi x14 x14 1
    j do.what 

get.step:
    mv x16 x15 #load vector
    lwu x6, 0(x5)
    andi x6 x6 0b0011   # x6=1 desloca, =0 stop
    
    ret 

goto.start:
    sw x12 -4(x11) 

    mv x11 x7
    
    li x14 0 
    j do.what

goto.end:
    sw x12 0(x11) 
    
    mv x11 x7
    li x14 0 
    j do.what

    
    

