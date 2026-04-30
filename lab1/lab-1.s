.data
a: .word 20
b: .half -14
c: .byte 4
res: .zero 64

.text

la x5, res
ld x5,0(x5)

addi x5, x5, 20
slli, x5, x5, 2
addi, x5, x5, -14
srli, x5, x5, 1

sd x5, 0(x5)
