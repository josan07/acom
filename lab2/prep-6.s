.equ FOREGROUND_COLOR, 0xffff00
.equ BACKGROUND_COLOR, 0x0

.data
location: .word 0 0 # (x,y) 
mbase: .word LED_MATRIX_0_BASE
mwidth: .byte LED_MATRIX_0_WIDTH
mheight: .byte LED_MATRIX_0_HEIGHT

 
.text

li a0 FOREGROUND_COLOR #cor
la t0 location
li a4 LED_MATRIX_0_WIDTH
addi a4 a4 -1
li a5 LED_MATRIX_0_HEIGHT
addi a5 a5 -1

li a3 BACKGROUND_COLOR

loop:
    lwu a2 0(t0) #x 
    lwu a1 4(t0) #y
    
    jal ChangeLEDStatus
        
    li t5 D_PAD_0_UP
    lbu t5 0(t5)
    li t1 D_PAD_0_DOWN
    lbu t1 0(t1)
    li t2 D_PAD_0_LEFT
    lbu t2 0(t2)
    li t3 D_PAD_0_RIGHT
    lbu t3 0(t3)
    
    bnez t5 up
    bnez t1 down
    bnez t2 left
    bnez t3 right
    j loop
 
up:    
    jal ChangeLEDStatus_2
    beq a1 zero tp_up #extremo superior da matriz
    addi a1 a1 -1
    j up_end
tp_up:
    mv a1 a5
up_end:
    sw a1 4(t0)
    jal ChangeLEDStatus
    j loop
    
down:
    jal ChangeLEDStatus_2
    beq a1 a5 tp_down
    addi a1 a1 1
    j down_end
tp_down:
    mv a1 zero
down_end:
    sw a1 4(t0)
    jal ChangeLEDStatus
    j loop
    
left:
    jal ChangeLEDStatus_2
    beq a2 zero tp_left
    addi a2 a2 -1
    j left_end
tp_left:
    mv a2 a4
left_end:
    sw a2 0(t0)
    jal ChangeLEDStatus
    j loop
    
right: 
    jal ChangeLEDStatus_2
    beq a2 a4 tp_right
    addi a2 a2 1
    j right_end
tp_right:
    mv a2 zero
right_end:
    sw a2 0(t0)
    jal ChangeLEDStatus
    j loop


ChangeLEDStatus:
    
    la t3 mwidth
    lbu t3 0(t3)
    
    mul t3 t3 a1 #width * y
    add t3 t3 a2 #+x
    slli t3 t3 2 #*4
    
    la t2 mbase
    lwu t2 0(t2)
    add t2 t2 t3
    
    sw a0 0(t2)
    
    
    ret
ChangeLEDStatus_2:
    
    la t3 mwidth
    lbu t3 0(t3)
    
    mul t3 t3 a1 #width * y
    add t3 t3 a2 #+x
    slli t3 t3 2 #*4
    
    la t2 mbase
    lwu t2 0(t2)
    add t2 t2 t3
    
    sw a3 0(t2)
    
    
    ret
    
    
    
    
    
        
