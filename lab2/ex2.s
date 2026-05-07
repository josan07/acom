.data
str: .string "aaaaaaa"
letter: .byte 97 #Letra a
res: .zero 4

.text
la x5 str

la x14 res

li x15 0

la x8 letter
lwu x8 0(x8)

loop:
    lbu x7 0(x5)
    beqz x7 end
    addi x5 x5 1
    beq x7 x8 soma.um
    
    j loop
    
soma.um:
    addi x15 x15 1
    
    j loop
end:
    sw x15 0(x14)

