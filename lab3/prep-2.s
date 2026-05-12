.data
mbase: .word LED_MATRIX_0_BASE
mwidth: .byte LED_MATRIX_0_WIDTH
mheight: .byte LED_MATRIX_0_HEIGHT
color1: .word 0x00ff00
color2: .word 0xff0000
  

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
    
