@CMSC 411 Arm Project
@Ryan Siegel and Aaron Lewis
@Sin(x), Cos(x), Sinh(x), Cosh(x), and e^x in armv5
@All numbers are multiplied by 2^16 (25536)

.data
    alpha: .word 2949120, 1740963, 919876, 466945, 234378, 117303, 58666, 29334, 14667, 7333, 3666, 1833

.equ SWI_Exit,  0x11

@angle to do operations on
startAngle: 
	.int 2981888        @45.5 from email table

ag_const:
	.int 39796          @.float 0.6072529350
	
@all variables that will be used
start:
    LDR r0, ag_const    @r0 = X
    MOV r1, #0          @r1 = Y
    LDR r2, startAngle  @r2 is the current angle
    MOV r3, #0          @r3 = newX
    MOV r4, r1          @r4 = Y copy
    MOV r5, r0          @r5 = X copy
    LDR r6, =alpha      @r6 = address of alpha
    MOV r7, #0          @r7 = alpha
    MOV r9, #0          @loop iterator

loop:
    MOV r4, r1          @update Y copy
    MOV r5, r0          @update X copy
    CMP r2, #0          @if current angle > 0
    BGT subFrom


addTo:                  @if L22 false
    ASR r4, r9          @shift right Y copy by iterations
    ADD r3, r4, r0      @Y copy + X

    ASR r5, r9          @shift right X copy by iterations
    SUB r1, r5          @X copy - Y
    MOV r0, r3          @update X
	

    LDR r7, [r6]    @load #12 with alpha[i]
	SUB r2, r7          @get next angle to compare with
    B loopEnd           @jump to loop end    


subFrom:                @if L22 true
    ASR r4, r9          @shift right Y copy by iterations
    SUB r3, r4, r0      @Y copy - X

    ASR r5, r9          @shift right X copy by iterations
    ADD r1, r5          @X copy + Y
    MOV r0, r3          @update X


	LDR r7, [r6]    @load #12 with alpha[i]
	SUB r2, r7          @get next angle to compare with
    B loopEnd           @jump to loop end


loopEnd:
    ADD r9, #1          @i++
    CMP r9, #12         @check if we have completed all iterations
    ADD r6, #4          @make alpha address point to next alpha
    BLT loop

end:
    SWI  SWI_Exit