.data
A: .word 4 -1

.text

la x5 A # x5 vector A
lw x7 0(x5) # A[i-1]
lw x8 4(x5) # A[i]

bge x8 x7 end

sw x8 0(x5)
sw x7 4(x5)

end: j end
