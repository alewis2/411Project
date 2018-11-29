@variables
.equ SWI_Exit,  0x11

start:
    MOV r0, #26 @dividend
    MOV r1, #5  @divisor
    MOV r8, #0  @remainder
    MOV r9, #0  @quotient
    
    CMP r1, #0  @if 0 stop
    BEQ end

divide:
    CMP r0, r1  @dividend < divisor end loop (not floats today)
    BLT divEnd
    SUB r0, r1  @dividend - divisor 
    ADD r9, #1  @quotient++
    B divide    @restart the loop

divEnd:
    MOV r8, r0  @remainder to r8

end:
    SWI  SWI_Exit