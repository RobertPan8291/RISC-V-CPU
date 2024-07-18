MOV R0, #5
MOV R1, #3
MOV R5, #14
LDR R6, [R5]
MOV R2, R0, LSL #1 //R2 should be 10 
STR R2, [R6]
CMP R1, R0 //Should set the N flag to 1 but not modify anything
STR R1, [R6]
AND R3, R0, R1 //R3 should be 1 
STR R3, [R6]
MOV R4, #0 
MVN R4, R4 //R4 should be all 1
STR R4, [R6]
HALT
