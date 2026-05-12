.equ FOREGROUND_COLOR, 0xffff00
.equ BACKGROUND_COLOR, 0x0

.data
location: .word 1 15 # (x,y) 
mbase: .word LED_MATRIX_0_BASE
mwidth: .byte LED_MATRIX_0_WIDTH


.text

li a0 FOREGROUND_COLOR #cor
la t0 location
lwu a2 0(t0) #x
lwu a1 4(t0) #y

jal ChangeLEDStatus

end: j end

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
    
    
    
    
    
    
