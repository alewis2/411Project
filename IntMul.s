@variables
.equ SWI_Exit,  0x11
    
_start:
    MOV  r1, #0 @set result
    MOV  r2, #5 @set factor1
    MOV  r3, #6 @set factor2

    MOV  r9, #0 @mulLoop iteration

mulLoop: @for(int j = r9, j < r2, j++)
    ADD  r1, r2 @add factor1 to result
    ADD  r9, #1 @j++
    CMP  r9, r3 @check if we have completed factor2 additions
    BLT  mulLoop


end:
    SWI  SWI_Exit