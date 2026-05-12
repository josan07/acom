.equ FOREGROUND_COLOR, 0xffff00
.equ BACKGROUND_COLOR, 0x0

.data
location: .word 1 4 # (x,y) 
mbase: .word LED_MATRIX_0_BASE
mwidth: .byte LED_MATRIX_0_WIDTH


.text

li a0 0x00FF00 #cor

jal ChangeLEDStatus

end: j end

ChangeLEDStatus:

    
    la t0 location
    lwu t2 0(t0) #x
    lwu t1 4(t0) #1
    
    la t3 mwidth
    lbu t3 0(t3)
    
    mul t3 t3 t1 #width * y
    add t3 t3 t2 #+x
    slli t3 t3 2 #*4
    
    la t2 mbase
    lwu t2 0(t2)
    add t2 t2 t3
    
    sw a0 0(t2)
    
    
    ret
    
    
    
    
    
    
