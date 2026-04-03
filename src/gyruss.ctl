@ $4000 start
@ $4000 org
s $4000 Unused
S $4000,16384,$4000
b $8000 ROM header
b $8002 Pointer to sprite name table
b $8004 Pointer to sprite order table
b $8006 Pointer to temporary storage in RAM
b $8008 Pointer to controller memory map
b $800A Pointer to start address
c $800C Routine at 800C
C $800C,3 RST $08: add_a_to_hl
c $800F Routine at 800F
C $800F,3 RST $10: vdp_write_byte
c $8012 Routine at 8012
C $8012,3 RST $18: WRITE_REGISTER
c $8015 Routine at 8015
C $8015,3 RST $20
c $8018 Routine at 8018
C $8018,3 RST $28
c $801B Routine at 801B
C $801B,3 RST $30
c $801E Routine at 801E
C $801E,3 RST $38: WRITE_VRAM
c $8021 Routine at 8021
C $8021,3 Interrupt handler
c $8024 Entry point
C $8027,2 Controller enable
C $8029,3 Clear RAM
C $803E,3 Start screen
N $8064 This entry point is used by the routine at #R$81ED.
N $80E8 This entry point is used by the routines at #R$81AE and #R$83D0.
c $8139 Routine at 8139
D $8139 Used by the routine at #R$8024.
c $8170 Routine at 8170
D $8170 Used by the routine at #R$8139.
c $81AE Routine at 81AE
D $81AE Used by the routine at #R$8170.
N $81B9 This entry point is used by the routine at #R$8170.
c $81ED Routine at 81ED
D $81ED Used by the routine at #R$8170.
c $8212 Routine at 8212
D $8212 Used by the routines at #R$8024, #R$81AE and #R$83D0.
c $823E Routine at 823E
D $823E Used by the routine at #R$8212.
N $8240 This entry point is used by the routine at #R$8212.
N $8245 This entry point is used by the routine at #R$8212.
c $825F Routine at 825F
D $825F Used by the routine at #R$823E.
N $8267 This entry point is used by the routine at #R$823E.
c $82BA Routine at 82BA
D $82BA Used by the routine at #R$825F.
c $82BF Routine at 82BF
D $82BF Used by the routine at #R$825F.
N $82C3 This entry point is used by the routines at #R$825F and #R$82BA.
c $830E Routine at 830E
D $830E Used by the routines at #R$8170 and #R$82BF.
c $832A Routine at 832A
D $832A Used by the routine at #R$8024.
N $833C This entry point is used by the routines at #R$8450 and #R$846B.
c $8368 Routine at 8368
D $8368 Used by the routine at #R$832A.
N $836D This entry point is used by the routine at #R$832A.
c $83D0 Routine at 83D0
D $83D0 Used by the routine at #R$8368.
c $8429 Routine at 8429
D $8429 Used by the routine at #R$832A.
c $8450 Routine at 8450
D $8450 Used by the routine at #R$8429.
c $846B Routine at 846B
D $846B Used by the routine at #R$8429.
N $8486 This entry point is used by the routine at #R$8450.
c $84B1 Routine at 84B1
D $84B1 Used by the routines at #R$8024, #R$8139, #R$832A, #R$8368, #R$846B, #R$A33B and #R$A3E1.
c $84CB Routine at 84CB
D $84CB Used by the routine at #R$90D4.
c $84DB Routine at 84DB
D $84DB Used by the routines at #R$8878, #R$8A53, #R$8A76, #R$8C68, #R$8D50, #R$8E9D, #R$900E and #R$AAF1.
c $84ED Routine at 84ED
D $84ED Used by the routines at #R$8170 and #R$832A.
c $8501 Routine at 8501
D $8501 Used by the routine at #R$8021.
c $8522 Routine at 8522
D $8522 Used by the routine at #R$8501.
t $853C Message at 853C
T $853C,5,5
b $8541 Data block at 8541
B $8541,64,8
t $8581 Message at 8581
T $8581,6,6
b $8587 Data block at 8587
B $8587,3,3
t $858A Message at 858A
T $858A,5,5
b $858F Data block at 858F
B $858F,1,1
t $8590 Message at 8590
T $8590,6,6
b $8596 Data block at 8596
B $8596,1,1
t $8597 Message at 8597
T $8597,5,5
b $859C Data block at 859C
B $859C,1,1
t $859D Message at 859D
T $859D,5,5
b $85A2 Data block at 85A2
B $85A2,4,4
t $85A6 Message at 85A6
T $85A6,8,8
b $85AE Data block at 85AE
B $85AE,7,7
t $85B5 Message at 85B5
T $85B5,28,28
b $85D1 Data block at 85D1
B $85D1,3,3
t $85D4 Message at 85D4
T $85D4,5,5
b $85D9 Data block at 85D9
B $85D9,1,1
t $85DA Message at 85DA
T $85DA,7,7
b $85E1 Data block at 85E1
B $85E1,1,1
t $85E2 Message at 85E2
T $85E2,4,4
c $85E6 Routine at 85E6
D $85E6 Used by the routines at #R$8024, #R$8139, #R$832A, #R$8368, #R$846B and #R$A3E1.
N $8600 This entry point is used by the routine at #R$8A41.
N $862F This entry point is used by the routines at #R$8654, #R$8673, #R$867D and #R$8815.
c $8654 Routine at 8654
D $8654 Used by the routines at #R$870C, #R$873E and #R$8848.
c $865A Routine at 865A
D $865A Used by the routine at #R$85E6.
c $8673 Routine at 8673
D $8673 Used by the routine at #R$865A.
c $867D Routine at 867D
D $867D Used by the routine at #R$865A.
c $86DE Routine at 86DE
D $86DE Used by the routine at #R$867D.
c $86E9 Routine at 86E9
D $86E9 Used by the routine at #R$86DE.
c $870C Routine at 870C
D $870C Used by the routine at #R$86E9.
c $873E Routine at 873E
D $873E Used by the routine at #R$870C.
c $8790 Routine at 8790
D $8790 Used by the routine at #R$873E.
c $87D5 Routine at 87D5
D $87D5 Used by the routine at #R$8790.
c $87F5 Routine at 87F5
D $87F5 Used by the routine at #R$87D5.
c $8801 Routine at 8801
D $8801 Used by the routine at #R$87F5.
c $8811 Routine at 8811
D $8811 Used by the routine at #R$8801.
c $8815 Routine at 8815
D $8815 Used by the routine at #R$8801.
c $8825 Routine at 8825
D $8825 Used by the routine at #R$8790.
N $8835 This entry point is used by the routine at #R$8A2D.
N $883B This entry point is used by the routine at #R$8848.
c $8848 Routine at 8848
D $8848 Used by the routine at #R$8825.
c $885F Routine at 885F
D $885F Used by the routine at #R$8790.
c $8878 Routine at 8878
D $8878 Used by the routine at #R$885F.
N $889C This entry point is used by the routine at #R$88BE.
c $88A7 Routine at 88A7
D $88A7 Used by the routine at #R$8878.
c $88BE Routine at 88BE
D $88BE Used by the routine at #R$8878.
N $88CF This entry point is used by the routine at #R$8878.
c $88D4 Routine at 88D4
D $88D4 Used by the routines at #R$8878 and #R$88BE.
c $88F3 Routine at 88F3
D $88F3 Used by the routine at #R$88D4.
c $88FE Routine at 88FE
D $88FE Used by the routine at #R$8790.
N $890F This entry point is used by the routine at #R$892B.
N $8916 This entry point is used by the routine at #R$8986.
c $892B Routine at 892B
D $892B Used by the routine at #R$88FE.
c $8936 Routine at 8936
D $8936 Used by the routine at #R$88FE.
c $8986 Routine at 8986
D $8986 Used by the routine at #R$88FE.
c $8994 Routine at 8994
D $8994 Used by the routine at #R$88FE.
c $8999 Routine at 8999
D $8999 Used by the routine at #R$88FE.
c $899E Routine at 899E
D $899E Used by the routine at #R$8790.
c $8A2D Routine at 8A2D
D $8A2D Used by the routine at #R$899E.
c $8A3C Routine at 8A3C
D $8A3C Used by the routine at #R$899E.
c $8A41 Routine at 8A41
N $8A4E This entry point is used by the routine at #R$867D.
c $8A53 Routine at 8A53
D $8A53 Used by the routine at #R$85E6.
c $8A76 Routine at 8A76
D $8A76 Used by the routines at #R$8790, #R$885F and #R$88FE.
c $8AC0 Routine at 8AC0
D $8AC0 Used by the routines at #R$8790, #R$87F5, #R$8878 and #R$88D4.
c $8AE6 Routine at 8AE6
D $8AE6 Used by the routine at #R$8139.
c $8B12 Routine at 8B12
D $8B12 Used by the routines at #R$8F0F, #R$8F55, #R$99D3, #R$9A75 and #R$A808.
c $8BD9 Routine at 8BD9
D $8BD9 Used by the routine at #R$8024.
c $8C07 Routine at 8C07
D $8C07 Used by the routine at #R$8BD9.
c $8C1E Routine at 8C1E
D $8C1E Used by the routines at #R$8BD9 and #R$8C07.
c $8C30 Routine at 8C30
D $8C30 Used by the routine at #R$8BD9.
N $8C3E This entry point is used by the routine at #R$8C07.
c $8C52 Routine at 8C52
D $8C52 Used by the routine at #R$8C30.
N $8C57 This entry point is used by the routine at #R$8C30.
c $8C68 Routine at 8C68
D $8C68 Used by the routine at #R$8BD9.
N $8C6D This entry point is used by the routine at #R$8C52.
c $8D21 Routine at 8D21
D $8D21 Used by the routine at #R$8170.
c $8D50 Routine at 8D50
D $8D50 Used by the routine at #R$8024.
c $8DD7 Routine at 8DD7
D $8DD7 Used by the routine at #R$8D50.
N $8E04 This entry point is used by the routine at #R$8D50.
c $8E0D Routine at 8E0D
c $8E0F Routine at 8E0F
b $8E11 Data block at 8E11
B $8E11,27,8*3,3
c $8E2C Routine at 8E2C
N $8E2D This entry point is used by the routines at #R$8024, #R$8139 and #R$A3E1.
c $8E89 Routine at 8E89
D $8E89 Used by the routine at #R$8E2C.
N $8E8D This entry point is used by the routines at #R$82BF and #R$8FED.
c $8E9D Routine at 8E9D
D $8E9D Used by the routine at #R$8E2C.
c $8F0F Routine at 8F0F
D $8F0F Used by the routine at #R$8E9D.
c $8F55 Routine at 8F55
D $8F55 Used by the routine at #R$8E2C.
N $8FAE This entry point is used by the routine at #R$8FED.
c $8FED Routine at 8FED
D $8FED Used by the routine at #R$8F55.
c $900E Routine at 900E
D $900E Used by the routines at #R$8E9D and #R$8F55.
b $9046 Data block at 9046
B $9046,16,8
b $9056 Graphics
B $9056,126,8*15,6
c $90D4 Routine at 90D4
N $90D6 This entry point is used by the routine at #R$8024.
c $9175 Routine at 9175
D $9175 Used by the routines at #R$8368, #R$83D0 and #R$90D4.
c $91A1 Routine at 91A1
D $91A1 Used by the routine at #R$9175.
N $91B4 This entry point is used by the routine at #R$9175.
c $91CC Routine at 91CC
D $91CC Used by the routine at #R$9175.
c $920D Routine at 920D
D $920D Used by the routines at #R$8368, #R$90D4, #R$91A1 and #R$91CC.
c $921F Routine at 921F
D $921F Used by the routine at #R$90D4.
N $922F This entry point is used by the routine at #R$924E.
c $924E Routine at 924E
D $924E Used by the routine at #R$921F.
c $9255 Routine at 9255
D $9255 Used by the routines at #R$921F and #R$924E.
N $9257 This entry point is used by the routine at #R$921F.
c $9285 Routine at 9285
D $9285 Used by the routine at #R$9175.
b $92AC Data block at 92AC
B $92AC,1,1
t $92AD Message at 92AD
T $92AD,22,22
b $92C3 Colors?
B $92C3,19,8*2,3
b $92D6 Data block at 92D6
B $92D6,10,8,2
b $92E0 Gyruss logo
B $92E0,160,8
b $9380 Data block at 9380
B $9380,53,8*6,5
t $93B5 Message at 93B5
T $93B5,7,7
b $93BC Data block at 93BC
B $93BC,28,8*3,4
t $93D8 Message at 93D8
T $93D8,6,6
b $93DE Data block at 93DE
B $93DE,36,8*4,4
t $9402 Message at 9402
T $9402,6,6
b $9408 Data block at 9408
B $9408,32,8
t $9428 Message at 9428
T $9428,7,7
b $942F Data block at 942F
B $942F,26,8*3,2
t $9449 Message at 9449
T $9449,4,4
b $944D Data block at 944D
B $944D,24,8
t $9465 Message at 9465
T $9465,5,5
b $946A Data block at 946A
B $946A,812,8*101,4
c $9796 Routine at 9796
D $9796 Used by the routine at #R$8024.
N $97F3 This entry point is used by the routines at #R$98B5, #R$9978 and #R$9A49.
c $9845 Routine at 9845
D $9845 Used by the routine at #R$9796.
c $9861 Routine at 9861
D $9861 Used by the routine at #R$9796.
N $986E This entry point is used by the routine at #R$98B5.
c $98B5 Routine at 98B5
D $98B5 Used by the routine at #R$9861.
N $98BB This entry point is used by the routine at #R$9861.
c $9924 Routine at 9924
D $9924 Used by the routines at #R$9861 and #R$98B5.
c $9934 Routine at 9934
D $9934 Used by the routine at #R$9924.
N $9936 This entry point is used by the routine at #R$9924.
c $9978 Routine at 9978
D $9978 Used by the routine at #R$9934.
N $9999 This entry point is used by the routines at #R$9934, #R$99A0, #R$99D3 and #R$9A08.
c $99A0 Routine at 99A0
D $99A0 Used by the routine at #R$98B5.
c $99B1 Routine at 99B1
D $99B1 Used by the routine at #R$98B5.
c $99D3 Routine at 99D3
D $99D3 Used by the routine at #R$99B1.
N $99EA This entry point is used by the routine at #R$99B1.
c $9A08 Routine at 9A08
D $9A08 Used by the routine at #R$9924.
c $9A1C Routine at 9A1C
D $9A1C Used by the routines at #R$9934, #R$99A0, #R$99B1 and #R$9A08.
c $9A38 Routine at 9A38
D $9A38 Used by the routine at #R$9796.
c $9A49 Routine at 9A49
D $9A49 Used by the routine at #R$9A38.
N $9A69 This entry point is used by the routine at #R$9A75.
N $9A6D This entry point is used by the routine at #R$9A38.
c $9A75 Routine at 9A75
D $9A75 Used by the routine at #R$9796.
c $9A86 Routine at 9A86
D $9A86 Used by the routines at #R$870C, #R$9796, #R$9861 and #R$98B5.
c $9AA7 Routine at 9AA7
> $9ABB ; Routine at 9AB3
> $9ABB ;
> $9ABB ; Used by the routine at #R$800C.
> $9ABB ;
> $9ABB ; HL = HL + A
> $9ABB @label=add_a_to_hl
> $9ABB *$9AB3 PUSH AF       ;
> $9ABB  $9AB4 ADD A,L       ;
> $9ABB  $9AB5 LD L,A        ;
> $9ABB  $9AB6 JR NC,$9AB9   ;
> $9ABB *$9AB8 INC H         ;
> $9ABB *$9AB9 POP AF        ;
> $9ABB  $9ABA RET           ;
c $9ABB Routine at 9ABB
c $9AC3 Routine at 9AC3
D $9AC3 Used by the routine at #R$800F.
R $9AC3 RST $10
N $9AC3 I:DE Write address I:A byte to write
@ $9AC3 label=vdp_write_byte
C $9AC5,2 Set LSB of VDP address
C $9AC8,2 Setup write address
C $9ACA,2 Set MSB of VDP address
C $9ACD,2 Write byte
c $9AD0 Routine at 9AD0
D $9AD0 Used by the routine at #R$AFE5.
R $9AD0 I:DE read address
R $9AD0 O:A byte read
@ $9AD0 label=vdp_read_byte
C $9AD0,1 Set LSB of VDP address
C $9AD4,2 Set MSB of VDP address
C $9AD6,2 Delay
C $9ADB,2 Read byte
c $9ADE Routine at 9ADE
D $9ADE Used by the routine at #R$8024.
c $9B0D Routine at 9B0D
D $9B0D Used by the routines at #R$9BD9, #R$9C1C and #R$9E91.
c $9B54 Routine at 9B54
D $9B54 Used by the routine at #R$9B0D.
N $9B56 This entry point is used by the routine at #R$9B0D.
c $9B59 Routine at 9B59
D $9B59 Used by the routine at #R$9B99.
c $9B70 Routine at 9B70
D $9B70 Used by the routine at #R$9B59.
N $9B82 This entry point is used by the routine at #R$9B59.
c $9B87 Routine at 9B87
D $9B87 Used by the routines at #R$8139, #R$832A and #R$9C1C.
c $9B99 Routine at 9B99
D $9B99 Used by the routine at #R$8522.
N $9BAE This entry point is used by the routine at #R$9BD9.
N $9BCA This entry point is used by the routines at #R$9BD9 and #R$9BF8.
c $9BD9 Routine at 9BD9
D $9BD9 Used by the routine at #R$9B99.
c $9BF8 Routine at 9BF8
D $9BF8 Used by the routine at #R$9BD9.
c $9BFD Routine at 9BFD
D $9BFD Used by the routine at #R$9B99.
N $9C06 This entry point is used by the routine at #R$9B99.
c $9C1C Routine at 9C1C
D $9C1C Used by the routines at #R$9B99 and #R$9C7E.
N $9C27 This entry point is used by the routines at #R$9C39 and #R$9C46.
c $9C39 Routine at 9C39
D $9C39 Used by the routine at #R$9C1C.
c $9C46 Routine at 9C46
D $9C46 Used by the routine at #R$9C39.
c $9C4B Routine at 9C4B
D $9C4B Used by the routine at #R$9C39.
c $9C7E Routine at 9C7E
D $9C7E Used by the routine at #R$9C4B.
N $9C87 This entry point is used by the routine at #R$9C4B.
N $9C8A This entry point is used by the routines at #R$9BFD, #R$9C1C and #R$9C4B.
c $9C92 Routine at 9C92
D $9C92 Used by the routines at #R$9BF8 and #R$9C46.
c $9CA0 Routine at 9CA0
D $9CA0 Used by the routine at #R$9C92.
N $9CA3 This entry point is used by the routine at #R$9C92.
c $9CA8 Routine at 9CA8
D $9CA8 Used by the routine at #R$9EA3.
N $9CB5 This entry point is used by the routines at #R$9B54 and #R$9E01.
b $9CE7 Data block at 9CE7
B $9CE7,86,8*10,6
c $9D3D Routine at 9D3D
D $9D3D Used by the routines at #R$9DE8 and #R$9E75.
c $9D67 Routine at 9D67
D $9D67 Used by the routine at #R$9B99.
N $9D6D This entry point is used by the routine at #R$9D89.
c $9D89 Routine at 9D89
D $9D89 Used by the routine at #R$9D67.
c $9D91 Routine at 9D91
c $9DB9 Routine at 9DB9
c $9DC4 Routine at 9DC4
c $9DD7 Routine at 9DD7
c $9DE8 Routine at 9DE8
N $9DF2 This entry point is used by the routine at #R$9DC4.
N $9DFC This entry point is used by the routines at #R$9D91, #R$9DB9, #R$9DD7, #R$9E01, #R$9E5C and #R$9E75.
c $9E01 Routine at 9E01
c $9E4A Routine at 9E4A
D $9E4A Used by the routine at #R$9E01.
c $9E5C Routine at 9E5C
c $9E75 Routine at 9E75
c $9E91 Routine at 9E91
D $9E91 Used by the routines at #R$82BF, #R$832A and #R$846B.
c $9EA3 Routine at 9EA3
D $9EA3 Used by the routines at #R$8139, #R$8368, #R$8C52, #R$8E9D, #R$9934, #R$99A0, #R$99B1, #R$99D3, #R$A33B and #R$A6EC.
b $9EB6 Data block at 9EB6
B $9EB6,1029,8*128,5
c $A2BB Routine at A2BB
D $A2BB Used by the routine at #R$9B99.
c $A2F3 Routine at A2F3
D $A2F3 Used by the routine at #R$A2BB.
N $A303 This entry point is used by the routine at #R$A31D.
c $A314 Routine at A314
D $A314 Used by the routine at #R$A2BB.
c $A31D Routine at A31D
D $A31D Used by the routine at #R$A314.
c $A33B Routine at A33B
D $A33B Used by the routine at #R$82BF.
c $A3E1 Routine at A3E1
D $A3E1 Used by the routine at #R$8139.
c $A471 Routine at A471
D $A471 Used by the routines at #R$A33B and #R$A3E1.
N $A47D This entry point is used by the routine at #R$A4A0.
c $A4A0 Routine at A4A0
D $A4A0 Used by the routine at #R$A471.
N $A4A3 This entry point is used by the routine at #R$A471.
N $A4A4 This entry point is used by the routine at #R$A471.
b $A4B2 Data block at A4B2
B $A4B2,487,8*60,7
c $A699 Routine at A699
D $A699 Used by the routines at #R$8024 and #R$846B.
c $A6C8 Routine at A6C8
D $A6C8 Used by the routine at #R$A699.
c $A6D2 Routine at A6D2
D $A6D2 Used by the routines at #R$82BF and #R$A6EC.
c $A6EC Routine at A6EC
D $A6EC Used by the routines at #R$846B and #R$9978.
c $A73C Routine at A73C
D $A73C Used by the routines at #R$8024, #R$832A, #R$8368, #R$846B and #R$A33B.
c $A7D5 Routine at A7D5
D $A7D5 Used by the routine at #R$A73C.
c $A805 Routine at A805
D $A805 Used by the routine at #R$A73C.
c $A808 Routine at A808
D $A808 Used by the routines at #R$8368, #R$A33B, #R$A3E1 and #R$A73C.
b $A865 Data block at A865
B $A865,24,8
b $A87D Ship sprites
B $A87D,513,8*64,1
c $AA7E Routine at AA7E
c $AAA6 Routine at AAA6
D $AAA6 Used by the routines at #R$87D5 and #R$8D21.
c $AAC3 Routine at AAC3
D $AAC3 Used by the routine at #R$AAA6.
c $AAC6 Routine at AAC6
D $AAC6 Used by the routine at #R$AAA6.
c $AAD1 Routine at AAD1
D $AAD1 Used by the routines at #R$AAC3 and #R$AAC6.
c $AADE Routine at AADE
D $AADE Used by the routine at #R$AAA6.
N $AADF This entry point is used by the routine at #R$AAD1.
c $AAE3 Routine at AAE3
D $AAE3 Used by the routines at #R$99A0, #R$AB17 and #R$AB6C.
c $AAF1 Routine at AAF1
D $AAF1 Used by the routine at #R$8024.
c $AB17 Routine at AB17
D $AB17 Used by the routine at #R$AAF1.
c $AB38 Routine at AB38
D $AB38 Used by the routines at #R$87F5, #R$98B5, #R$AB17 and #R$AB72.
c $AB53 Routine at AB53
D $AB53 Used by the routines at #R$9934 and #R$9A49.
c $AB6C Routine at AB6C
D $AB6C Used by the routine at #R$AB53.
N $AB6F This entry point is used by the routine at #R$AB53.
c $AB72 Routine at AB72
D $AB72 Used by the routines at #R$8024, #R$8139, #R$832A, #R$846B, #R$A33B and #R$A3E1.
c $ABFF Routine at ABFF
D $ABFF Used by the routine at #R$AB72.
c $AC32 Routine at AC32
D $AC32 Used by the routine at #R$ABFF.
b $AC47 Data block at AC47
D $AC47 Used by the routine at #R$AB72.
B $AC47,152,8
c $ACDF Routine at ACDF
D $ACDF Used by the routines at #R$82BF, #R$90D4 and #R$A33B.
c $ACF9 Routine at ACF9
D $ACF9 Used by the routines at #R$8368, #R$84B1, #R$90D4, #R$A33B and #R$A3E1.
c $AD49 Routine at AD49
D $AD49 Used by the routine at #R$8018.
c $AD64 Routine at AD64
D $AD64 Used by the routine at #R$AD49.
N $AD87 This entry point is used by the routine at #R$AD49.
c $AD8B Routine at AD8B
D $AD8B Used by the routine at #R$801B.
c $ADD1 Routine at ADD1
D $ADD1 Used by the routine at #R$AD8B.
N $ADD7 This entry point is used by the routine at #R$AD8B.
c $AE2B Routine at AE2B
D $AE2B Used by the routine at #R$ADD1.
N $AE4E This entry point is used by the routines at #R$ADD1, #R$AE54 and #R$AE75.
c $AE54 Routine at AE54
D $AE54 Used by the routine at #R$ADD1.
c $AE75 Routine at AE75
D $AE75 Used by the routine at #R$AE54.
N $AE86 This entry point is used by the routine at #R$AE54.
c $AE94 Routine at AE94
D $AE94 Used by the routine at #R$90D4.
c $AF3E Routine at AF3E
D $AF3E Used by the routine at #R$AE94.
c $AF55 Routine at AF55
D $AF55 Used by the routine at #R$AF3E.
c $AF6B Routine at AF6B
D $AF6B Used by the routine at #R$AE94.
c $AFAE Routine at AFAE
D $AFAE Used by the routine at #R$AE94.
c $AFC2 Routine at AFC2
D $AFC2 Used by the routine at #R$AE94.
b $AFDD Data block at AFDD
B $AFDD,8,8
c $AFE5 Routine at AFE5
N $B042 This entry point is used by the routine at #R$B046.
c $B046 Routine at B046
D $B046 Used by the routine at #R$AFE5.
b $B04F Data block at B04F
B $B04F,229,8*28,5
b $B134 Stars
B $B134,144,8
b $B1C4 Data block at B1C4
B $B1C4,2082,8*260,2
b $B9E6 Graphics
B $B9E6,1480,8
c $BFAE Routine at BFAE
D $BFAE Used by the routine at #R$8015.
b $BFCF Data block at BFCF
B $BFCF,49,8*6,1
s $C000 Unused
S $C000,16384,$4000
