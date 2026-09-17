; Fibonacci sequence
; Outputs 1, 2, 3, 5, 8, ... , 233
; Stops when the next addition sets Carry.

        MVI A,00H
        MOV B,A
        MVI A,01H
        MOV C,A

LOOP:   MOV A,B
        ADD C
        JC END
        MOV B,C
        MOV C,A
        OUT
        JMP LOOP

END:    HLT
