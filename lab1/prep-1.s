.data

a: .word 420
b: .dword 0x3e8
c: .half -500
d: .byte 140
AVG: .zero 8

.text

la x5, a
lwu x6, 0(x5)

la x5, b
ld x7, 0(x5)

add x6, x6, x7

la x5, c
lh x7, 0(x5)

add x6, x6, x7

la x5, d
lbu x7, 0(x5)

add x6, x6, x7


srai x7, x6, 2

la x5, AVG
sd x7, 0(x5)

Fim:
    j Fim

ecall
