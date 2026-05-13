.equ FOREGROUND_COLOR, 0xffff00
.equ BACKGROUND_COLOR, 0xff0000

.data
location: .word 1 1 # (x,y) 
mbase: .word LED_MATRIX_0_BASE
mwidth: .byte LED_MATRIX_0_WIDTH
mheight: .byte LED_MATRIX_0_HEIGHT
color1: .word 0x00ff00
color2: .word 0xff0000

 
.text


.text 
la s0 mbase
lwu s0 0(s0)
mv s4 s0 
    
la s1 mwidth
lbu s1 0(s1)

la s2 mheight
lbu s2 0(s2)

la a0 color1
lwu a0 0(a0)
la a1 color2
lwu a1 0(a1)

jal CreateGamingBoard
j next

CreateGamingBoard:

addi sp sp -12  # 8*3 (registos s1,s2,s4)
sw s1 0(sp)
sw s2 4(sp)
sw s4 8(sp)


li t0 -1 #contador linhas
addi t1 s2 -1 #n.º ultima linha
addi t4 s1 -1 # no ultima colna

outer_for:
    addi t0 t0 1

    beqz t0 line
    beq t0 t1 line 
    beq t0 s2 end 

    j borders


line:
    li t2 -1 # j contador colunas
loop_in_line:
    addi t2 t2 1
    beq t2 s1 outer_for
    
    sw a0 0(s4)
    addi s4 s4 4
    j loop_in_line
 
borders:
    li t3 -1
borders_loop:
    addi t3 t3 1
    beq t3 s1 outer_for
    
    beqz t3 border_led
    beq t3 t4 border_led
    j inner_led

border_led:
    sw a0 0(s4)
    addi s4 s4 4
    j borders_loop
inner_led:
    sw a1 0(s4)
    addi s4 s4 4
    j borders_loop


end: 
    lw s1 0(sp)
    lw s2 4(sp)
    lw s4 8(sp)
    addi sp sp 12
    ret

next:
li a0 FOREGROUND_COLOR #cor
la t0 location
li a4 LED_MATRIX_0_WIDTH
addi a4 a4 -2
li a5 LED_MATRIX_0_HEIGHT
addi a5 a5 -2

li a3 BACKGROUND_COLOR

loop:
    lwu a2 0(t0) #x 
    lwu a1 4(t0) #y
    
    li t4 1
    
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
    
    beq a1 t4 tp_up #extremo superior da matriz
    addi a1 a1 -1
    j up_end
tp_up:
    mv a1 a5
up_end:
    sw a1 4(t0)
    jal ChangeLEDStatus
wait_up_release:               # <--- ADD THIS
    li t5 D_PAD_0_UP
    lbu t5 0(t5)
    bnez t5 wait_up_release    # Stay stuck here until button == 0
    j loop
    
down:
    jal ChangeLEDStatus_2
    beq a1 a5 tp_down
    addi a1 a1 1
    j down_end
tp_down:
    mv a1 t4
down_end:
    sw a1 4(t0)
    jal ChangeLEDStatus
wait_down_release:             # <--- ADD THIS
    li t1 D_PAD_0_DOWN
    lbu t1 0(t1)
    bnez t1 wait_down_release  # Stay stuck here until button == 0
    j loop    
left:
    jal ChangeLEDStatus_2
    beq a2 t4 tp_left 
    addi a2 a2 -1
    j left_end
tp_left:
    mv a2 a4
left_end:
    sw a2 0(t0)
    jal ChangeLEDStatus
wait_left_release:             # <--- ADD THIS
    li t2 D_PAD_0_LEFT
    lbu t2 0(t2)
    bnez t2 wait_left_release  # Stay stuck here until button == 0
    j loop
    
right: 
    jal ChangeLEDStatus_2
    beq a2 a4 tp_right
    addi a2 a2 1
    j right_end
tp_right:
    mv a2 t4
right_end:
    sw a2 0(t0)
    jal ChangeLEDStatus
wait_right_release:            
    li t3 D_PAD_0_RIGHT
    lbu t3 0(t3)
    bnez t3 wait_right_release 
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
    
    
    
    
    
        
