@CMSC 411 Arm Project
@Ryan Siegel and Aaron Lewis
@Sin(x), Cos(x), (Sinh(x), Cosh(x), and e^x) - eventually in armv5
@
@KEEP TRACK OF REGISTERS
@r0 is start angle
@r1 is index i
@r2 is end index
@r3 is X, cos(x)
@r4 is Y, sin(x)
@r5 is NewX
@r6 is address of A
@r7 is first value in A?
@r8 is temp
@r9 is r1*4, 4 bytes per index, use for A[i]

	.data
@A:	.word 45.0, 26.565, 14.0362, 7.12502, 3.57633, 1.78991, 0.895174, 0.447614, 0.223811, 0.111906, 0.055953, 0.027977
@A: .word 2949120, 1740963.84, 919876.4032, 466945.31072, 234378.36288, 117303.54176, 58666.123264, 29334.831104, 14667.677696, 7333.871616, 3666.935808, 1833.500672
A:	.word 2949120, 1740963, 919876, 466945, 234378, 117303, 58666, 29334, 14667, 7333, 3666, 1833

.equ SWI_Exit,  0x11

@angle to do operations on
startAngle: 
	.long 938731 			@starting with X*65536 degrees (need to input like this)
	
ag_const:
	.long 39796 			@0.6072529350 shifted left by 16 bits
	
main:
	LDR r0, startAngle 		@load the starting angle into r1
	MOV r1, #0 				@index i for for loop
	MOV r2, #12 			@hardcoded index @end index for foor loop, length of lookup table
	LDR r3, ag_const		@X in C example
	MOV r4, #0		 		@Y in C example
	LDR r6, =A		 		@address of alpha

@for(int i = 0, i < 12, i++) r1 is i, r2 is 12
loop:
	CMP r0, #0 				@compare to see if the current angle is greater than 0
	BGE greater_than 		@if the angle is less than 0
	BLE less_than 	 		@

after_if:
	ADD r1, #1 				@increment i
	CMP r1, r2 				@if r1 == r2 then break
	BLT loop
	B end

@if the current angle is less than 0
less_than: 
	ASR r5, r4, r1 			@(Y >>i)
	ADD r5, r3, r5 			@NewX = X + (Y >> i)
	ASR r8, r3, r1 			@(X >> i)
	SUB r4, r4, r8 			@(Y -= (X >> i)
	MOV r3, r5 				@X = NewX
	ADD r9, r1, r1 			@gotta add i by 4 so it can be used as A[i] correctly
	ADD r9, r9, r9 			@^^
	LDR r7, [r6, r9] 		@load Alpha[i] into r7
	ADD r0, r0, r7 			@CurrAngle += Alpha[i]
	
	B after_if

 @if the current angle is greater than 0, r5 is NewX
greater_than:
	ASR r5, r4, r1 			@(Y >>i)
	SUB r5, r3, r5 			@NewX = X - (Y >> i)
	ASR r8, r3, r1 			@(X >> i)
	ADD r4, r4, r8 			@(Y += (X >> i)
	MOV r3, r5 				@X = NewX
	ADD r9, r1, r1 			@gotta add i by 4 so it can be used as A[i] correctly
	ADD r9, r9, r9 			@^^
	LDR r7, [r6, r9] 		@load Alpha[i] into r7
	SUB r0, r0, r7 			@CurrAngle -= Alpha[i]
	
	B after_if
	
	
end:
	SWI SWI_Exit
	