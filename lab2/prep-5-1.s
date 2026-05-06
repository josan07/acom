.data
SwitchesBase:   .word SWITCHES_0_BASE
LEDMatrixBase: .word LED_MATRIX_0_BASE
LEDMatrixWidth: .byte LED_MATRIX_0_WIDTH
LEDMatrixHeight: .byte LED_MATRIX_0_HEIGHT


.text
la x5, SwitchesBase
lwu x5, 0(x5)

andi x6 x5 0b0001   # x6=1 desloca, =0 stop

la x7, LEDMatrixBase
lwu x7, 0(x7)
mv x11 x7


la x8, LEDMatrixWidth
lbu x8, 0(x8)

la x9, LEDMatrixHeight
lbu x9, 0(x9)

li x10 0x00ffff00 #yellow
li x12 0x00000000 #blk

mul x13 x9 x8 #n leds
li x14 0 #i

loop:
    
beq x14 x13 restart
sw x10 0(x11)
addi x11 x11 4 
addi x14 x14 1
sw x12 -4(x11)
j loop 

restart:
mv x11 x7
li x14 0 
j loop


    
    

