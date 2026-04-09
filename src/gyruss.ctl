@ $4000 start
@ $4000 org
s $4000 Unused
S $4000,12288,$3000
w $7000 RAM
D $7000 Word at 7000
@ $7000 label=word_at_7000
W $7000,2,2
b $7002 Sprite data (32 sprites) #TABLE(default, default) { =h Byte offset | =h Purpose } { $00 | Sprite type, or $FF if not allocated } { $01 | Transformation } { $02 | Unknown } { $03 | Unknown } { $04 | Unknown } { $05 | Unknown } { $06 | Unknown } { $07 | Unknown } { $08 | Y } { $09 | X } { $0A | Pattern } { $0B | Color } TABLE#
@ $7002 label=sprite_data
B $7002,384,12
b $7182 Number of allocated sprites
@ $7182 label=allocated_sprites
B $7182,1,1
b $7183 Sprite allocation table
@ $7183 label=sprite_alloc_table
B $7183,32,8
b $71A3 Data block at 71A3
@ $71A3 label=buffer
B $71A3,72,8
b $71EB Byte at 71EB
B $71EB,1,1
b $71EC Stars move countdown
@ $71EC label=stars_countdown
B $71EC,1,1
b $71ED Data block at 71ED
B $71ED,106,8*13,2
w $7257 Word at 7257
@ $7257 label=word_at_7257
W $7257,2,2
b $7259 Data block at 7259
B $7259,1,1
b $725A Interrupt flag
@ $725A label=interrupt_flag
B $725A,1,1
b $725B Data block at 725B
B $725B,15,8,7
w $726A Word at 726A
@ $726A label=word_at_726A
W $726A,2,2
b $726C Byte at 726C
@ $726C label=byte_at_726C
B $726C,1,1
b $726D Data block at 726D
B $726D,104,8
b $72D5 Byte at 72D5
B $72D5,1,1
b $72D6 Byte at 72D6
B $72D6,1,1
b $72D7 Byte at 72D6
B $72D7,1,1
w $72D8 Word at 72D8
W $72D8,2,2
w $72DA Word at 72DA
W $72DA,2,2
w $72DC Word at 72DC
W $72DC,2,2
w $72DE Word at 72DE
W $72DE,2,2
b $72E0 Data block at 72E0
B $72E0,58,8*7,2
b $731A Star frame
@ $731A label=star_frame
B $731A,1,1
b $731B Random number
@ $731B label=random_number
B $731B,2,2
b $731D Data block at 731D
B $731D,217,8*27,1
w $73F6 Stars VDP address
@ $73F6 label=stars_vdp_address
W $73F6,2,2
b $73F8 Data block at 73F8
B $73F8,8,8
s $7400 Unused
S $7400,3072,$0C00
b $8000 ROM header
B $8000,2,2
w $8002 Pointer to sprite name table
W $8002,2,2
w $8004 Pointer to sprite order table
W $8004,2,2
w $8006 Pointer to temporary storage in RAM
W $8006,2,2
w $8008 Pointer to controller memory map
W $8008,2,2
w $800A Pointer to start address
W $800A,2,2
c $800C RST $08
C $800C,3 add_a_to_hl
c $800F RST $10
C $800F,3 vdp_write_byte (DE = address, A = value)
c $8012 RST $18
C $8012,3 WRITE_REGISTER (B = reg, C = value)
c $8015 RST $20
C $8015,3 Random number generator
c $8018 RST $28
C $8018,3 allocate_sprite
c $801B RST $30
C $801B,3 Load sprite pattern
c $801E RST $38
C $801E,3 WRITE_VRAM (HL = source, DE = dest, BC = count)
c $8021 NMI
C $8021,3 Interrupt routine
c $8024 Entry point
@ $8024 label=main
C $8027,2 Controller enable
C $8029,3 Clear RAM
C $8035,3 Set word
C $803B,3 Init some RAM locations (sound?)
C $803E,3 Start screen
C $8041,3 Set word
@ $8047 label=main_wait_fire
C $8047,1 Wait for interrupt
C $804B,3 Controller 0, segment 0
C $804E,3 DECODER
C $8051,2 Test fire
C $8053,2 Jump if fire pressed
C $8055,3 Controller 1, segment 0
C $8058,3 DECODER
C $805B,2 Test fire
C $805D,2 Loop until fire pressed
N $8064 This entry point is used by the routine at #R$81ED. Fire pressed
C $806A,3 Clear screen
C $8071,3 FILL_VRAM
C $807C,3 FILL_VRAM
C $80B1,1 WRITE_VRAM
C $80B7,1 vdp_write_byte
C $80BB,1 vdp_write_byte
C $80CC,1 vdp_write_byte
C $80D0,1 vdp_write_byte
C $80DF,1 WRITE_VRAM
C $80E2,3 Init random number
N $80E8 This entry point is used by the routines at #R$81AE and #R$83D0.
@ $80E8 label=main_loop
C $80E8,3 Flag set by interrupt routine
C $80EB,2 Test flag
C $80ED,2 Wait until set
C $80EF,2 Clear flag
C $80F1,3 READ_REGISTER
C $80FD,3 READ_REGISTER
C $8106,3 READ_REGISTER
C $810F,3 READ_REGISTER
c $8139 Routine at 8139
D $8139 Used by the routine at #R$8024.
C $8146,3 READ_REGISTER
@ $814F label=label_at_814F
c $8170 Routine at 8170
D $8170 Used by the routine at #R$8139.
C $8182,1 vdp_write_byte
C $818F,1 WRITE_VRAM
c $81AE Routine at 81AE
D $81AE Used by the routine at #R$8170.
N $81B9 This entry point is used by the routine at #R$8170.
C $81C2,3 READ_VRAM
C $81CE,1 WRITE_VRAM
c $81ED Routine at 81ED
D $81ED Used by the routine at #R$8170.
C $81F4,3 Controller 0, segment 1
C $81F7,3 DECODER
C $8205,3 Controller 0, segment 0
C $8208,3 DECODER
c $8212 Routine at 8212
D $8212 Used by the routines at #R$8024, #R$81AE and #R$83D0.
c $823E Routine at 823E
D $823E Used by the routine at #R$8212.
N $8240 This entry point is used by the routine at #R$8212.
N $8245 This entry point is used by the routine at #R$8212.
c $825F Routine at 825F
D $825F Used by the routine at #R$823E.
C $8265,1 vdp_write_byte
N $8267 This entry point is used by the routine at #R$823E.
C $826A,1 vdp_write_byte
C $827C,1 add_a_to_hl
c $82BA Routine at 82BA
D $82BA Used by the routine at #R$825F.
c $82BF Routine at 82BF
D $82BF Used by the routine at #R$825F.
N $82C3 This entry point is used by the routines at #R$825F and #R$82BA.
C $82D1,1 WRITE_VRAM
c $830E Routine at 830E
D $830E Used by the routines at #R$8170 and #R$82BF.
C $831D,1 WRITE_VRAM
C $8328,1 vdp_write_byte
c $832A Routine at 832A
D $832A Used by the routine at #R$8024.
C $8334,3 READ_REGISTER
N $833C This entry point is used by the routines at #R$8450 and #R$846B.
c $8368 Routine at 8368
D $8368 Used by the routine at #R$832A.
N $836D This entry point is used by the routine at #R$832A.
C $83BA,4 Set color
c $83D0 Routine at 83D0
D $83D0 Used by the routine at #R$8368.
C $840E,3 FILL_VRAM
C $8418,3 FILL_VRAM
c $8429 Routine at 8429
D $8429 Used by the routine at #R$832A.
C $843A,1 WRITE_VRAM
C $8444,1 WRITE_VRAM
c $8450 Routine at 8450
D $8450 Used by the routine at #R$8429.
C $8455,1 vdp_write_byte
C $8459,1 vdp_write_byte
C $845E,1 vdp_write_byte
C $8462,1 vdp_write_byte
c $846B Routine at 846B
D $846B Used by the routine at #R$8429.
C $8479,1 WRITE_VRAM
C $8483,1 WRITE_VRAM
N $8486 This entry point is used by the routine at #R$8450.
c $84B1 Routine at 84B1
D $84B1 Used by the routines at #R$8024, #R$8139, #R$832A, #R$8368, #R$846B, #R$A33B and #R$A3E1.
c $84CB Routine at 84CB
D $84CB Used by the routine at #R$90D6.
R $84CB Upload patterns
C $84CD,1 DE = start index
C $84D0,2 BC = count
C $84D3,2 IY = count
C $84D5,1 HL now points to graphics data
C $84D6,2 Table code (3 = pattern generator table)
C $84D8,3 PUT_VRAM
c $84DB Routine at 84DB
D $84DB Used by the routines at #R$8878, #R$8A53, #R$8A76, #R$8C68, #R$8D50, #R$8E9D, #R$900E and #R$AAF1.
c $84ED Routine at 84ED
D $84ED Used by the routines at #R$8170 and #R$832A.
C $84F4,3 FILL_VRAM
c $8501 Routine at 8501
D $8501 Used by the routine at #R$8021.
@ $8501 label=interrupt_routine
C $8518,3 Display off, interrupt off
C $851B,1 WRITE_REGISTER
C $851C,3 Black border
C $851F,1 WRITE_REGISTER
C $8520,2 Loop
c $8522 Routine at 8522
D $8522 Used by the routine at #R$8501.
C $8522,3 Sound player?
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
C $866E,4 Set color
c $8673 Routine at 8673
D $8673 Used by the routine at #R$865A.
c $867D Routine at 867D
D $867D Used by the routine at #R$865A.
C $86A5,4 Set color
C $86BB,4 Set color
C $86CF,3 Set y
C $86D7,3 Set x
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
C $87DD,3 Get pattern
C $87ED,3 Get pattern
c $87F5 Routine at 87F5
D $87F5 Used by the routine at #R$87D5.
c $8801 Routine at 8801
D $8801 Used by the routine at #R$87F5.
c $8811 Routine at 8811
D $8811 Used by the routine at #R$8801.
c $8815 Routine at 8815
D $8815 Used by the routine at #R$8801.
C $8815,3 Get color
c $8825 Routine at 8825
D $8825 Used by the routine at #R$8790.
N $8835 This entry point is used by the routine at #R$8A2D.
N $883B This entry point is used by the routine at #R$8848.
c $8848 Routine at 8848
D $8848 Used by the routine at #R$8825.
C $884E,1 Random number
c $885F Routine at 885F
D $885F Used by the routine at #R$8790.
c $8878 Routine at 8878
D $8878 Used by the routine at #R$885F.
C $8887,1 Random number
C $8897,1 Random number
N $889C This entry point is used by the routine at #R$88BE.
c $88A7 Routine at 88A7
D $88A7 Used by the routine at #R$8878.
c $88BE Routine at 88BE
D $88BE Used by the routine at #R$8878.
C $88BE,1 Random number
C $88C4,1 add_a_to_hl
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
C $8AB9,4 Set color
c $8AC0 Routine at 8AC0
D $8AC0 Used by the routines at #R$8790, #R$87F5, #R$8878 and #R$88D4.
c $8AE6 Routine at 8AE6
D $8AE6 Used by the routine at #R$8139.
c $8B12 Routine at 8B12
D $8B12 Used by the routines at #R$8F0F, #R$8F55, #R$99D3, #R$9A75 and #R$A808.
C $8B22,1 vdp_write_byte
C $8B9E,1 WRITE_VRAM
C $8BC9,1 vdp_write_byte
c $8BD9 Routine at 8BD9
D $8BD9 Used by the routine at #R$8024.
c $8C07 Routine at 8C07
D $8C07 Used by the routine at #R$8BD9.
C $8C15,1 Random number
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
C $8CA0,1 add_a_to_hl
C $8CAF,3 Set color
c $8D21 Routine at 8D21
D $8D21 Used by the routine at #R$8170.
c $8D50 Routine at 8D50
D $8D50 Used by the routine at #R$8024.
C $8D6B,1 Random number
C $8D8A,4 Set color
C $8D8E,1 Random number
C $8DA2,4 Set color
C $8DBC,4 Set color
c $8DD7 Routine at 8DD7
D $8DD7 Used by the routine at #R$8D50.
C $8DE6,1 Random number
C $8DFC,4 Set color
N $8E04 This entry point is used by the routine at #R$8D50.
C $8E04,1 Random number
c $8E0D Routine at 8E0D
c $8E0F Routine at 8E0F
b $8E11 Data block at 8E11
B $8E11,27,8*3,3
c $8E2C Routine at 8E2C
N $8E2D This entry point is used by the routines at #R$8024, #R$8139 and #R$A3E1.
c $8E89 Routine at 8E89
D $8E89 Used by the routine at #R$8E2C.
N $8E8D This entry point is used by the routines at #R$82BF and #R$8FED.
C $8E8D,1 Random number
c $8E9D Routine at 8E9D
D $8E9D Used by the routine at #R$8E2C.
c $8F0F Routine at 8F0F
D $8F0F Used by the routine at #R$8E9D.
C $8F44,3 FILL_VRAM
c $8F55 Routine at 8F55
D $8F55 Used by the routine at #R$8E2C.
N $8FAE This entry point is used by the routine at #R$8FED.
c $8FED Routine at 8FED
D $8FED Used by the routine at #R$8F55.
c $900E Routine at 900E
D $900E Used by the routines at #R$8E9D and #R$8F55.
C $9028,4 Set color
C $903C,1 Random number
b $9046 Data block at 9046
B $9046,16,8
b $9056 Graphics #UDGTABLE(no-border, no-border) { #UDGARRAY8,,4($9056-$90C7-16)(graphics-9056.png) } { #UDGARRAY8,,4($905E-$90D5-16)(graphics-905E.png) } TABLE#
B $9056,128,8
c $90D6 Start screen
D $90D6 Used by the routine at #R$8024.
@ $90D6 label=start_screen
C $90D6,3 MODE_1 (pattern generator table at  $0000, name table at $1800, color table at $2000)
C $90D9,3 Set sprite generator table at $0800 (was $3800)
C $90DE,3 INIT_TABLE
C $90E1,3 Set sprite attribute table at $1C00 (was $1B00)
C $90E6,3 INIT_TABLE
C $90E9,2 Clear all VDP RAM
C $90F1,3 FILL_VRAM
C $90F4,3 LOAD_ASCII
C $90F7,3 Stars
C $90FA,3 Upload 18 star patterns starting with 1
C $90FD,3 Save pattern 33 from VDP to RAM
C $9106,3 READ_VRAM
C $9109,3 Write it back to VDP patern 63
C $9112,1 WRITE_VRAM
C $9113,3 Write ship pattern to pattern 33
C $911C,1 WRITE_VRAM
C $911D,3 Upload patterns to VDP buffer
C $9120,3 Gyruss logo names
C $9123,3 Name table address
C $9126,2 2 rows
@ $9128 label=logo_row
C $9128,2 6 letters
@ $912A label=logo_letter
C $912A,1 Get name
C $912B,1 vdp_write_byte
C $912C,1 Next destination
C $912D,1 Next source
C $912E,1 Get name
C $912F,1 vdp_write_byte
C $9130,1 Next destination
C $9131,1 Next destination (skip space)
C $9132,1 Next source
C $9133,2 Loop for 6 letters
C $9135,3 Name table address of next row
C $9138,1 Row counter
C $9139,2 Loop for 2 rows
C $913B,3 Init sprites
C $913E,2 Planet number
C $9140,3 Draw planet 6 (Earth)
C $9143,3 Upload sprite data
C $9146,3 Clear row 7
C $9149,3 Copyright message
C $914C,3 Name table address
C $914F,3 23 bytes
C $9152,1 WRITE_VRAM
C $9153,3 Color table address
C $9156,3 Colors
C $9159,3 Update 19 color sets
C $915C,1 WRITE_VRAM
C $915D,3 Gyruss logo
C $9160,3 Upload 20 patterns starting with 128
C $9163,3 Display on, interrupt on
C $9166,1 WRITE_REGISTER
@ $9167 label=start_screen_loop
C $9167,1 Wait for interrupt
C $9168,3 Draw stars
C $916E,1 Return is no carry
C $9172,2 Loop until no carry
c $9175 Display planet
D $9175 Used by the routines at #R$8368, #R$83D0 and #R$90D6.
R $9175 I:A Index of planet (1 based)
@ $9175 label=display_planet
C $9175,1 a *= 2
C $9176,2 If zero then undraw planet
C $9178,3 Planet table minus 2: #R$9398-2
C $917B,1 add_a_to_hl
C $917C,1 Get LSB of planet data
C $917E,1 Get MSB of planet data
C $917F,1 Address now in HL
C $9180,3 Draw to name table
C $918C,3 Planet colors
C $918F,3 Address in color table
C $9192,3 16 color sets
C $9195,1 WRITE_VRAM
C $9196,3 Address in sprite pattern table
C $9199,3 Sprite patterns
C $919C,3 19 patterns
C $919F,1 WRITE_VRAM
c $91A1 Routine at 91A1
D $91A1 Used by the routine at #R$9175.
C $91A1,3 Clear row 7
C $91A4,3 Clear 16 bytes in RAM
C $91B1,3 Use cleared bytes as planet data
N $91B4 This entry point is used by the routine at #R$9175.
@ $91B4 label=display_planet_name_table
C $91B4,3 Address in name table
C $91B7,2 4 rows
C $91B9,2 4 columns
C $91BB,1 Get name to write
C $91BC,1 vdp_write_byte
C $91BD,1 Next destination
C $91BE,1 Next source
C $91BF,2 Loop for 4 columns
C $91C1,1 Save source
C $91C2,3 32 - 4
C $91C5,1 One row down
C $91C6,1 To DE
C $91C7,1 Restore source
C $91C8,1 Row counter
C $91C9,2 Loop for 4 rows
c $91CC Display planet name and sprites
D $91CC Used by the routine at #R$9175.
R $91CC I:HL address of planet name prefixed by length
@ $91CC label=display_planet_name_and_sprites
C $91CC,1 Save address
C $91CD,3 clear_row_7
C $91D0,2 32
C $91D2,1 32 - length
C $91D3,2 (32 - length) / 2
C $91D5,3 Name table address of row
C $91D9,1 add_a_to_hl
C $91DA,1 DE = display address
C $91DB,1 Get length
C $91DE,1 Advance source to text
C $91DF,1 WRITE_VRAM
C $91E0,1 Restore address
C $91E1,1 Get length
C $91E2,1 Length + 1
C $91E3,1 add_a_to_hl. Now HL points after text.
C $91E4,1 Get number of sprites
C $91E5,1 Next source byte
C $91E6,1 Get color
C $91E7,1 Next source byte
C $91E8,1 Get pattern?
C $91E9,2 Add 32
C $91EB,1 Store in E
C $91EC,1 Next source byte
C $91ED,1 Allocate sprite
C $91EE,4 Mark as allocated (set type)
C $91F2,1 Get y
C $91F3,1 Store in D
C $91F4,2 Only use 7 bits of y
C $91F6,3 Set y
C $91F9,1 Next source byte
C $91FA,1 Get x
C $91FB,3 Set x
C $91FE,1 Next source byte
C $91FF,3 Set pattern
C $9202,3 Set color
C $9205,2 If bit 7 of y is set
C $9207,2 Then skip
C $9209,1 Else increment pattern
C $920A,2 Loop to next sprite
c $920D Clear name table row 7
D $920D Used by the routines at #R$8368, #R$90D6, #R$91A1 and #R$91CC.
@ $920D label=clear_row_7
C $9210,2 Space
C $9212,3 Address in name table (row 7)
C $9215,3 32 bytes
C $9218,3 FILL_VRAM
c $921F Decode and upload patterns to VDP buffer at $1400
D $921F Used by the routine at #R$90D6.
@ $921F decode_and_upload_patterns
C $921F,3 Number of bytes in block at $9475
C $9222,3 Save it
C $9225,1 A = 0
C $9226,3 Save it
C $9229,3 Source address - 1
C $922C,3 Destination address in VDP RAM
N $922F This entry point is used by the routine at #R$924E.
C $922F,3 MSB of counter
C $9232,1 Test MSB
C $9233,1 Return when MSB is negative
C $9234,2 Read 1 bit
C $9236,3 Read it into A
C $9239,1 If zero, write multiple bytes
C $923A,2 Otherwise jump to write a single byte
C $923C,2 Read 5 bits
C $923E,3 Read them into A
C $9241,2 Add 2 as the base
C $9243,1 Save number of repeats
C $9244,3 Get byte to write in A
C $9247,1 Restore number of repeats
C $9248,1 vdp_write_byte in A to DE
C $9249,1 Next VDP address
C $924A,2 Loop B times
C $924C,2 Loop
c $924E Write single byte
D $924E Used by the routine at #R$921F.
C $924E,3 Get byte to write
C $9251,1 vdp_write_byte in A to DE
C $9252,1 Next VDP address
C $9253,2 Loop
c $9255 Read B bits into A
D $9255 Used by the routines at #R$921F and #R$924E.
@ $9255 read_b_bits_into_a
C $9255,2 Read 8 bits
N $9257 This entry point is used by the routine at #R$921F.
C $9257,1 Result
C $9258,1 Push number of bits to read
C $9259,1 Push result
C $925A,3 Number of bits left in current byte
C $925D,1 Decrement
C $925E,3 Skip ahead if there are still bits left
C $9261,1 Increment source address
C $9262,1 get source byte
C $9263,3 Save source byte
C $9266,4 Byte counter
C $926A,1 Decrement
C $926B,4 And save
C $926F,2 8 bits - 1 left
C $9271,3 Save bits left
C $9274,3 Get source byte
C $9277,1 Rotate left through carry
C $9278,3 Save again
C $927B,2 Rotate carry into bite 0
C $927D,1 Pop result
C $927E,2 Rotate bit 0 into carry
C $9280,1 Rotate carry into result
C $9281,1 Pop number of bits to read
C $9282,2 Repeat for n bits
c $9285 Copy 135 patterns from VDP RAM buffer into pattern table from 128
D $9285 Used by the routine at #R$9175.
R $9285 I:HL Pattern generator table destination address ($0400)
C $9288,2 Counter
C $928D,3 Read 9 patterns from $1400 (?)
C $9290,3 Into buffer
C $9293,3 READ_VRAM
C $9296,1 DE = $0400
C $9298,3 Write 9 patterns from buffer
C $929B,3 To $0400 (pattern 128)
C $929E,1 WRITE_VRAM
C $929F,1 HL = $0400
C $92A3,1 Advance 9 patterns, HL = $0448
C $92A4,1 DE = $1400
C $92A7,1 DE = $1448
C $92A9,2 Loop 15 times = 135 patterns
b $92AC Data block at 92AC
@ $92AC label=copyright_msg
B $92AC,1,1
t $92AD Message at 92AD
T $92AD,22,22
b $92C3 Colors
@ $92C3 label=colors
B $92C3,19,8*2,3
b $92D6 Ship pattern
@ $92D6 label=ship_pattern
B $92D6,8,8
b $92DE Gyruss logo
@ $92DE label=gyruss_logo
B $92DE,2,2
b $92E0 Logo patterns #UDGTABLE(no-border, no-border) { #UDGARRAY10,,4($92E0-$9377-16)(graphics-92E0.png) } { #UDGARRAY10,,4($92E8-$937F-16)(graphics-92E8.png) } TABLE#
B $92E0,160,8
b $9380 Gyruss logo names
B $9380,24,8
w $9398 Planet table
@ $9398 label=planet_table
W $9398,12,2
b $93A4 Neptune
@ $93A4 label=neptune
B $93A4,17,4*4,1
t $93B5 Message at 93B5
T $93B5,7,7
b $93BC Data block at 93BC
B $93BC,11,8,3
b $93C7 Uranus
@ $93C7 label=uranus
B $93C7,17,4*4,1
t $93D8 Message at 93D8
T $93D8,6,6
b $93DE Data block at 93DE
B $93DE,19,8*2,3
b $93F1 Saturn
@ $93F1 label=saturn
B $93F1,17,4*4,1
t $9402 Message at 9402
T $9402,6,6
b $9408 Data block at 9408
B $9408,15,8,7
b $9417 Jupiter
@ $9417 label=jupiter
B $9417,17,4*4,1
t $9428 Message at 9428
T $9428,7,7
b $942F Data block at 942F
B $942F,9,8,1
b $9438 Mars
@ $9438 label=mars
B $9438,17,4*4,1
t $9449 Message at 9449
T $9449,4,4
b $944D Data block at 944D
B $944D,7,7
b $9454 Earth
@ $9454 label=earth
B $9454,17,4*4,1
t $9465 Message at 9465
T $9465,5,5
b $946A Data block at 946A
B $946A,10,8,2
b $9474 Data block at 9474
B $9474,1,1
b $9475 Planet graphics - encoded
D $9475 0 bit means a run: read next 5 bits and add 2. This is the number of repeats. 1 bit means a single byte. Read next 8 bits for the byte to repeat/not repeat.
B $9475,633,8*79,1
b $96EE Planet colors
@ $96EE label=planet_colors
B $96EE,16,8
b $96FE Planet sprite patterns #UDGTABLE { #UDGARRAY19,,4($96FE-$9795-8)(graphics-96FE.png) } TABLE#
@ $96FE label=planet_sprite_patterns
B $96FE,152,8
c $9796 Routine at 9796
D $9796 Used by the routine at #R$8024.
N $97F3 This entry point is used by the routines at #R$98B5, #R$9978 and #R$9A49.
c $9845 Routine at 9845
D $9845 Used by the routine at #R$9796.
C $9858,4 Set color
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
C $9991,1 add_a_to_hl
N $9999 This entry point is used by the routines at #R$9934, #R$99A0, #R$99D3 and #R$9A08.
c $99A0 Routine at 99A0
D $99A0 Used by the routine at #R$98B5.
c $99B1 Routine at 99B1
D $99B1 Used by the routine at #R$98B5.
c $99D3 Routine at 99D3
D $99D3 Used by the routine at #R$99B1.
C $99E1,1 add_a_to_hl
N $99EA This entry point is used by the routine at #R$99B1.
c $9A08 Routine at 9A08
D $9A08 Used by the routine at #R$9924.
c $9A1C Routine at 9A1C
D $9A1C Used by the routines at #R$9934, #R$99A0, #R$99B1 and #R$9A08.
C $9A20,3 Set color
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
N $9AB3 This entry point is used by the routine at #R$800C.
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
c $9AC3 VDP write byte (RST $10)
D $9AC3 Used by the routine at #R$800F.
R $9AC3 I:DE Write address I:A byte to write
@ $9AC3 label=vdp_write_byte
C $9AC5,2 Set LSB of VDP address
C $9AC8,2 Setup write address
C $9ACA,2 Set MSB of VDP address
C $9ACD,2 Write byte
c $9AD0 VDP read byte
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
R $9ADE Sound init?
C $9ADE,3 TURN_OFF_SOUND
C $9B04,4 Set y
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
C $9B99,3 Sound player?
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
C $9C7E,3 Get y
N $9C87 This entry point is used by the routine at #R$9C4B.
N $9C8A This entry point is used by the routines at #R$9BFD, #R$9C1C and #R$9C4B.
c $9C92 Routine at 9C92
D $9C92 Used by the routines at #R$9BF8 and #R$9C46.
C $9C93,3 Get x
C $9C99,3 Dec x
c $9CA0 Routine at 9CA0
D $9CA0 Used by the routine at #R$9C92.
C $9CA0,3 Set x
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
@ $A2BB label=sound_player
c $A2F3 Routine at A2F3
D $A2F3 Used by the routine at #R$A2BB.
N $A303 This entry point is used by the routine at #R$A31D.
c $A314 Routine at A314
D $A314 Used by the routine at #R$A2BB.
c $A31D Routine at A31D
D $A31D Used by the routine at #R$A314.
c $A33B Routine at A33B
D $A33B Used by the routine at #R$82BF.
C $A364,4 Set color
C $A392,4 Set color
C $A3A4,4 Set color
C $A3CE,3 FILL_VRAM
c $A3E1 Routine at A3E1
D $A3E1 Used by the routine at #R$8139.
C $A40B,4 Set y
C $A436,4 Set color
c $A471 Routine at A471
D $A471 Used by the routines at #R$A33B and #R$A3E1.
N $A47D This entry point is used by the routine at #R$A4A0.
C $A48E,3 Set y
C $A491,3 Set x
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
C $A6CF,1 vdp_write_byte
c $A6D2 Routine at A6D2
D $A6D2 Used by the routines at #R$82BF and #R$A6EC.
C $A6D9,3 FILL_VRAM
C $A6E7,1 vdp_write_byte
c $A6EC Routine at A6EC
D $A6EC Used by the routines at #R$846B and #R$9978.
c $A73C Routine at A73C
D $A73C Used by the routines at #R$8024, #R$832A, #R$8368, #R$846B and #R$A33B.
C $A742,3 Controller
C $A745,2 Segment 0
C $A747,3 DECODER
C $A78B,2 Segment 0
C $A78D,3 DECODER
C $A793,2 Segment 1
C $A795,3 DECODER
C $A7D0,4 Set color
c $A7D5 Routine at A7D5
D $A7D5 Used by the routine at #R$A73C.
C $A7E8,4 Set color
C $A7FC,4 Set color
c $A805 Routine at A805
D $A805 Used by the routine at #R$A73C.
c $A808 Routine at A808
D $A808 Used by the routines at #R$8368, #R$A33B, #R$A3E1 and #R$A73C.
C $A833,1 add_a_to_hl
b $A865 Data block at A865
B $A865,24,8
b $A87D Ship sprites #UDGTABLE(no-border, no-border) { #UDGARRAY32,,4($A87D-$AA75-16)(graphics-A87D.png) } { #UDGARRAY32,,4($A885-$AA7D-16)(graphics-A885.png) } TABLE#
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
C $AB2B,3 Set color
c $AB38 Routine at AB38
D $AB38 Used by the routines at #R$87F5, #R$98B5, #R$AB17 and #R$AB72.
c $AB53 Routine at AB53
D $AB53 Used by the routines at #R$9934 and #R$9A49.
C $AB5F,3 Get pattern
c $AB6C Routine at AB6C
D $AB6C Used by the routine at #R$AB53.
N $AB6F This entry point is used by the routine at #R$AB53.
c $AB72 Routine at AB72
D $AB72 Used by the routines at #R$8024, #R$8139, #R$832A, #R$846B, #R$A33B and #R$A3E1.
C $ABBE,3 FILL_VRAM
c $ABFF Routine at ABFF
D $ABFF Used by the routine at #R$AB72.
C $AC17,1 vdp_write_byte
c $AC32 Routine at AC32
D $AC32 Used by the routine at #R$ABFF.
C $AC3A,1 vdp_write_byte
b $AC47 Data block at AC47
D $AC47 Used by the routine at #R$AB72.
B $AC47,152,8
c $ACDF Init sprite data
D $ACDF Used by the routines at #R$82BF, #R$90D6 and #R$A33B.
@ $ACDF label=init_sprite_data
C $ACDF,4 Address of sprite data
C $ACE3,3 Size of each sprite
C $ACE6,2 Number of sprites
C $ACE9,3 Number of allocated sprites
C $ACEC,3 Set pattern
C $ACEF,4 Set as unallocated
C $ACF4,2 Advance to next sprite
C $ACF6,2 Loop for 32 sprites
c $ACF9 Upload sprite data to VDP
D $ACF9 Used by the routines at #R$8368, #R$84B1, #R$90D6, #R$A33B and #R$A3E1.
@ $ACF9 label=upload_sprite_data
C $ACF9,4 VDP address of sprite allocation table?
C $ACFD,3 Number of allocated sprites
C $AD00,1 Get
C $AD01,1 Store in B
C $AD03,1 Next allocation
C $AD04,1 Get sprite index
C $AD05,1 * 2
C $AD06,1 * 4
C $AD08,1 * 8
C $AD09,1 * 12 (may overflow?)
C $AD0B,3 First y address in sprite data table
C $AD0E,1 add_a_to_hl
C $AD0F,3 Write 4 bytes for each sprite
C $AD13,3 WRITE_VRAM
C $AD17,3 Add 4 to destination
C $AD1E,2 Loop for each sprite
C $AD20,2 End marker byte
C $AD22,1 vdp_write_byte
C $AD23,3 Get number of allocation sprites
C $AD26,2 Is it < 5
C $AD28,1 Then return
N $AD29 Rotate sprite allocation table
C $AD2B,1 Number of sprites above 4
C $AD2F,3 From 2nd entry of allocation table
C $AD32,3 To buffer
C $AD35,3 Copy 2 bytes
C $AD3A,3 From 4th to 2nd entry of allocation table
C $AD3D,1 Copy number of sprites above 4 bytes
C $AD40,3 From buffer to end of allocation table
C $AD43,3 Copy 2 bytes
c $AD49 Allocate sprite (RST $28)
D $AD49 Used by the routine at #R$8018.
R $AD49 O:IX holds sprite address
@ $AD49 label=allocate_sprite
C $AD4C,3 Address of sprite data
C $AD4F,3 Size of each sprite
C $AD52,3 Number of sprites and sprite index
C $AD58,2 If > $7E (usually $FF), sprite is available
C $AD5A,1 Sprite index++
C $AD5B,1 Advance to next sprite
C $AD5C,2 Loop for up to 32 sprites
C $AD5E,4 Not found, set to address in ROM (?)
C $AD62,2 And return
c $AD64 Routine at AD64
D $AD64 Used by the routine at #R$AD49.
@ $AD64 label=available_sprite_found
C $AD64,1 Save sprite address
C $AD69,3 Allocated sprites
C $AD6C,1 Record one more
C $AD6D,1 Read number back
C $AD6E,1 Add number to HL
C $AD74,1 Record sprite index in table
C $AD75,2 IX now holds sprite address
C $AD77,4 Init sprite
C $AD83,4 Set y
N $AD87 This entry point is used by the routine at #R$AD49.
c $AD8B Load sprite pattern (RST $30)
D $AD8B Used by the routine at #R$801B.
R $AD8B I:IX points to sprite data
C $AD90,3 Get sprite type
C $AD95,3 Table of 29 bytes (offsets into table at $B8FA)
C $AD99,1 Get graphics pointer offset for sprite type
C $AD9A,3 Table of pointers to graphics
C $AD9D,1 HL now pointer to graphics pointer
C $AD9E,3 Get which transformation we want (flipped, shifted, etc.)
C $ADA1,3 Address
C $ADA4,2 Adjust address according to type
C $ADEE,1 What is B?
C $ADF1,1 Multiply by 8
C $ADF4,1 And add DE
C $ADF5,1 Move HL into DE, which becomes source address
C $ADF9,3 Read 8 bytes
C $ADFC,3 READ_VRAM
C $ADFF,3 Get pattern
C $AE02,1 Multiply by 8
C $AE06,2 DE = $800 + pattern * 8
C $AE08,3 Source
C $AE0B,3 Write 8 bytes
C $AE0E,3 WRITE_VRAM
C $AE21,3 Set y
C $AE24,3 Set x
C $AE3E,1 add_a_to_hl
C $AE43,3 Set y
C $AE4B,3 Set x
N $AE4E This entry point is used by the routines at #R$AE54 and #R$AE75.
c $AE54 Routine at AE54
D $AE54 Used by the routine at #R$ADD1.
c $AE75 Routine at AE75
D $AE75 Used by the routine at #R$AE54.
C $AE8A,4 Set x
C $AE8E,4 Set y
c $AE94 Fill VDP RAM from $2100 to $3868 with character patterns that may be flipped and shifted. One new pattern is generated with each call. Are these used?
D $AE94 Used by the routine at #R$90D6.
C $AE94,3 Get counter
C $AE97,2 If maxed out
C $AE99,1 Then return
C $AE9A,3 Get word (only used locally)
C $AE9D,1 Is it zero?
C $AE9F,2 No - skip ahead
C $AEA1,3 Yes - set it to $2100
C $AEA7,3 Set another word to $72E0 (pointer to a RAM block)
C $AEAD,3 Get counter
C $AEB0,3 And next counter
C $AEB4,2 If any is non-zero skip ahead
C $AEB6,3 HL = $72E0
C $AEB9,4 DE = $2100 initially
C $AEBD,1 Write $00
C $AEBF,1 Write $21
C $AEC1,3 Save updated pointer, e.g. $72E0
C $AEC4,3 Get counter
C $AEC7,3 Table of 29 bytes (offsets into table at $B8FA)
C $AECA,1 add_a_to_hl
C $AECB,1 Load DE with value from table
C $AECE,3 Table of pointers to graphics
C $AED1,1 Add offset
C $AED2,3 Save address of pointer
C $AED5,3 Get counter
C $AED8,1 Increment
C $AED9,1 Double
C $AEDA,1 add_a_to_hl
C $AEDB,1 Get LSB of pointer
C $AEDD,1 Get MSB of pointer
C $AEDE,1 Now HL pointer to graphics
C $AEDF,3 Get counter
C $AEE2,2 0, 1, 2, 3
C $AEE4,1 0, 2, 4, 6
C $AEE5,1 0, 4, 8, 12
C $AEE6,1 0, 8, 16, 32
C $AEE7,1 add_a_to_hl
C $AEE8,3 Buffer
C $AEEB,4 Store as source address
C $AEEF,3 Copy 8 bytes
C $AEF2,2 of graphics data info buffer
C $AEF4,3 Get address of graphics pointer
C $AEF7,1 To MSB
C $AEF8,1 Get MSB
C $AEF9,1 Is it 0, i.e. not a real address?
C $AEFA,2 Then skip ahead
C $AEFC,4 Address of counter
C $AF00,4 Is bit 2 set?
C $AF04,2 If not, skip ahead
C $AF06,3 flip_horz
C $AF09,4 Is bit 3 set?
C $AF0D,2 If not, skip ahead
C $AF0F,3 flip_vert
C $AF12,3 shift_left
C $AF15,3 Source for writing to DP RAM
C $AF18,4 Destination
C $AF1C,3 8 bytes
C $AF1F,3 WRITE_VRAM
C $AF22,3 Get destination address
C $AF28,1 Add 8
C $AF29,3 Write back
@ $AF2C label=inc_counters_1
C $AF2C,4 Get address of graphics pointer
C $AF30,3 Get counter
C $AF33,1 Increment it
C $AF34,3 When it reaches LSB of graphics pointer
C $AF37,2 Then increment other counters
C $AF39,3 Otherwise store new value
C $AF3C,1 Set carry flag
@ $AF3E label=inc_counters_2
C $AF3F,3 Set counter at $72D7 to zero
C $AF42,3 Get MSB of graphics pointer
C $AF45,1 If zero
C $AF46,2 Then increment other counters
C $AF48,3 Get counter
C $AF4B,1 Increment it
C $AF4C,2 When it reaches 10
C $AF4E,2 Then increment other counters
C $AF50,3 Otherwise store new value
C $AF53,1 Set carry flag
@ $AF55 label=inc_counters_3
C $AF56,3 Set counter at $72D6 to zero
C $AF59,3 Increment counter at $72D5
C $AF5D,3 Get counter
C $AF63,1 When it reaches $1D (29)
C $AF67,3 Then set it to $FF (done)
c $AF6B Take 8 bytes pointed to by $72DE and place them after, bit reversed. Returns address of reversed bytes in $72DE.
D $AF6B Used by the routine at #R$AE94.
@ $AF6B label=flip_horz
c $AFAE Take 8 bytes pointed to by $72DE and place them after in reverse order. Returns address of reversed bytes in $72DE.
D $AFAE Used by the routine at #R$AE94.
@ $AFAE label=flip_vert
c $AFC2 Take 8 bytes pointed to by $72DE and place them after, left shifted one bit. Returns address of shifted bytes in $72DE.
D $AFC2 Used by the routine at #R$AE94.
@ $AFC2 label=shift_left
b $AFDD Data block at AFDD
B $AFDD,34,8*4,2
c $AFFF Display stars
D $AFFF Used by the routines at #R$8024, #R$8139, #R$8170, #R$832A, #R$8368, #R$846B, #R$90D6, #R$A33B and #R$A3E1.
@ $AFFF label=display_stars
C $AFFF,3 Counter from 7 to 0
C $B002,1 Count down
C $B003,1 Return
C $B004,2 Reset counter to 7
C $B006,3 Get some flag
C $B009,2 Test bit 0
C $B00D,2 If bit 0 is set then reset counter to 3
C $B00F,2 Set mask to undraw
C $B014,3 Get star frame
C $B017,2 Add 2
C $B019,2 < 12 ?
C $B01B,2 Yes, skip ahead
C $B01E,3 Set star frame to zero
C $B021,2 Set mask to draw
c $B023 Display star frame
D $B023 Used by the routine at #R$AFFF.
R $B023 I:C mask $00 or $FF
@ $B023 label=display_star_frame
C $B023,3 0, 2, 4, 6, 8, 10
C $B026,3 Table of pointers
C $B029,1 add_a_to_hl
C $B02A,1 Get LSB
C $B02C,1 Get MSB
C $B02D,3 Get VDP address (always 0)
C $B030,1 Now HL holds address of star frame table to use
C $B031,1 Get byte from table
C $B033,1 Zero terminates
C $B034,3 If bit 7 is set it's a change of VDP address
C $B037,3 vdp_read_byte from DE
C $B03A,2 >= 18
C $B03C,2 Then skip writing
C $B03E,1 Get byte from table
C $B03F,1 Apply mask
C $B040,1 vdp_write_byte A to DE
C $B041,1 Next VDP address
C $B042,1 Next table address
C $B043,3 Loop
C $B046,2 Reset bit 7
C $B048,1 Add VDP address LSB
C $B049,1 Write back to E
C $B04A,2 Loop if no carry
C $B04C,1 Increment MSB if carry
C $B04D,2 Loop
w $B04F Star frame lookup
@ $B04F label=star_frame_lookup
W $B04F,12,2
b $B05B Star frame 0
@ $B05B label=star_frame_0
B $B05B,39,8*4,7
b $B082 Star frame 1
@ $B082 label=star_frame_1
B $B082,38,8*4,6
b $B0A8 Star frame 2
@ $B0A8 label=star_frame_2
B $B0A8,37,8*4,5
b $B0CD Star frame 3
@ $B0CD label=star_frame_3
B $B0CD,31,8*3,7
b $B0EC Star frame 4
@ $B0EC label=star_frame_4
B $B0EC,34,8*4,2
b $B10E Star frame 5
@ $B10E label=star_frame_5
B $B10E,38,8*4,6
b $B134 Stars
@ $B134 label=stars
B $B134,2,2
b $B136 Star patterns #UDGTABLE { #UDGARRAY18,,4($B136-$B1C5-8)(graphics-B136.png) } TABLE#
B $B136,144,8
c $B1C6 Routine at B1C6
D $B1C6 Used by the routines at #R$8F0F, #R$8F55, #R$A471, #R$AB72 and #R$ADD1.
C $B1D3,1 Multiply by 32
b $B21D Data block at B21D
B $B21D,1728,8
b $B8DD Graphics pointer offsets
D $B8DD Offsets into data block at B8FA
B $B8DD,29,8*3,5
b $B8FA Data block at B8FA
B $B8FA,2,2
w $B8FC Graphics pointers
W $B8FC,2,2 Offset $00
W $B8FE,8,2
W $B906,2,2 Offset $0A
W $B908,8,2
W $B910,2,2 Offset $14
W $B912,8,2
W $B91A,2,2 Offset $1E
W $B91C,2,2
W $B91E,2,2 Offset $22
W $B920,8,2
W $B928,2,2 Offset $2C
W $B92A,8,2
W $B932,2,2 Offset $36
W $B934,2,2
W $B936,2,2 Offset $3A
W $B938,174,2
b $B9E6 Graphics #UDGTABLE { #UDGARRAY37,,4($B9E6-$BFAD-8)(graphics-B9E6.png) } TABLE#
B $B9E6,1480,8
c $BFAE Random number generator (RST $20)
D $BFAE Used by the routine at #R$8015.
@ $BFAE label=rnd
b $BFCF Data block at BFCF
B $BFCF,49,8*6,1
s $C000 Unused
S $C000,16384,$4000
