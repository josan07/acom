.data
sbase:   .word SWITCHES_0_BASE
mbase: .word LED_MATRIX_0_BASE
mwidth: .byte LED_MATRIX_0_WIDTH
mheight: .byte LED_MATRIX_0_HEIGHT
Step: .byte 0,1,0,-1
  

.text 

#load bases e tamanhos
la x5 sbase
lwu x5, 0(x5)

la x20 mbase
lwu x20 0(x20)
mv x6 x20 #atual led
mv x17 x6 #anterior led


la x7 mwidth
lbu x7 0(x7)

la x8 mheight
lbu x8 0(x8)

mul x19 x7 x8 # w*l
slli x19 x19 2
addi x19 x19 -4
add x18 x20 x19 #endereço ultimo quadrado

li x9 0x00FF00 #cor
li x16 0x0 #preto

sw x9 0(x20)

la x10 Step

li x14 1
li x15 -1


switch:
mv x12 x10 #copiar end memoria step
lwu x11 0(x5)
andi x11 x11 0b11
add x12 x12 x11 #actualizar registo
lb x13 0(x12) #obter valor de step (0,1,0,-1)

beqz x13 switch
beq x13 x14 right
beq x13 x15 left
 

right:
    beq x6 x18 reinit_r
    addi x6 x6 4 
    sw x9 0(x6) #actual cor
    sw x16 0(x17) #anterior preto
    addi x17 x17 4
    j switch
left:
    beq x6 x20 reinit_l
    addi x6 x6 -4
    sw x9 0(x6) #actual cor
    sw x16 0(x17) #anterior preto
    addi x17 x17 -4 
    j switch
reinit_r:
    mv x6 x20 # atual passa pra 1.º led
    sw x16 0(x18) # ultimo led passa a preto
    sw x9 0(x6) # atual fica cor
    mv x17 x6 # anterior atualizado 
    j switch
reinit_l:
    mv x6 x18
    sw x16 0(x20)
    sw x9 0(x6)
    mv x17 x6 
    j switch
      
      
