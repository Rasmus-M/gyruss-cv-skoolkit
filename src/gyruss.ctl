@ $4000 start
@ $4000 org
s $4000 Unused
S $4000,12288,$3000
w $7000 Center of projection
@ $7000 label=center_of_projection
W $7000,2,2
b $7002 Sprite data (32 sprites)
D $7002 #TABLE(default, default) { =h Byte offset | =h Purpose } { $00 | Sprite type, or $FF if not allocated } { $01 | Polar y (depth, 0 is closest (normal ship position), 116 is furthest away) } { $02 | Polar x (angle, 0 at bottom center, moving clockwise to 16 at the left side, 32 at the top, and 48 at the right side) } { $03 | Close to polar y ($01) } { $04 | Close to polar x ($02) } { $05 | Close to polar x ($02) } { $06 | Unknown } { $07 | Unknown } { $08 | Screen y } { $09 | Screen x } { $0A | Pattern } { $0B | Color } TABLE#
D $7002 #TABLE(default, default) { =h Sprite type | =h Description } { $00 | Ship 1 } { $01 | Ship 2 } { $02 | Shot } { $0D | Explosion dot } TABLE#
@ $7002 label=sprite_data
B $7002,384,12
b $7182 Number of allocated sprites
@ $7182 label=allocated_sprites
B $7182,1,1
b $7183 Sprite allocation table
D $7183 Contains #R$7182 indexes into #R$7002
@ $7183 label=sprite_alloc_table
B $7183,32,8
b $71A3 Temporary storage (72 bytes)
@ $71A3 label=buffer
B $71A3,31,8*3,7
b $71C2 Data block at 71C2
B $71C2,41,8*5,1
b $71EB Status flags
D $71EB #TABLE(default, default) { =h Bit | =h Purpose } { $00 | Set during warp } { $01 | Set when the mines appear } { $02 | You died } { $03 | Set during chance stage } { $04 | Set during stage init } { $05 | Set for two-player game when one is game over } { $06 | Set during main loop } { $07 | Two-player game } TABLE#
@ $71EB label=status_flags
B $71EB,1,1
b $71EC Stars move countdown
@ $71EC label=stars_countdown
B $71EC,1,1
b $71ED Byte at 71ED
B $71ED,1,1
b $71EE Byte at 71EE
B $71EE,1,1
b $71EF Byte at 71EF
B $71EF,1,1
b $71F0 Byte at 71F0
B $71F0,1,1
b $71F1 Current player (0 or 1)
@ $71F1 label=current_player
B $71F1,1,1
b $71F2 Frame counter
@ $71F2 label=frame_counter
B $71F2,1,1
b $71F3 Score player 1
@ $71F3 label=score_player_1
B $71F3,3,3
b $71F6 Score for getting extra life player 1
@ $71F6 label=score_extra_life_1
B $71F6,2,2
b $71F8 Byte at 71F8 (initially set to 6)
B $71F8,1,1
b $71F9 Score player 2
@ $71F9 label=score_player_2
B $71F9,3,3
b $71FC Score for getting extra life player 2
@ $71FC label=score_extra_life_2
B $71FC,2,2
b $71FE Byte at 71FE (initially set to 6)
B $71FE,1,1
b $71FF Lives
@ $71FF label=lives
B $71FF,1,1
b $7200 Stage (0-23, but starts with 1 during play)
@ $7200 label=stage
B $7200,1,1
b $7201 Wave
@ $7201 label=wave
B $7201,1,1
b $7202 Enemies destroyed not chance stage
@ $7202 label=enemies_hit
B $7202,1,1
b $7203 Index (0-7) into #R$8541 (blocks of 8 bytes)
@ $7203 label=stage_data_index
B $7203,1,1
b $7204 Number of times died within stage
@ $7204 label=stage_death_count
B $7204,1,1
b $7205 Completed stages
D $7205 When stage reaches 24, this number is added here, and stage is reset to 0
@ $7205 label=completed_stages
B $7205,1,1
b $7206 Number of active enemies
@ $7206 label=active_enemies
B $7206,1,1
b $7207 Data block at 7207
@ $7207 label=buffer_at_7207
B $7207,36,8*4,4
b $722B Byte at 722B
B $722B,1,1
b $722C Byte at 722C
B $722C,1,1
b $722D Byte at 722D
B $722D,1,1
b $722E Data block at 722E
B $722E,36,8*4,4
b $7252 Active enemy shots, set to $FF during explosion
@ $7252 label=active_enemy_shots
B $7252,1,1
b $7253 Number of active shots
@ $7253 label=active_shots
B $7253,1,1
b $7254 Byte at 7254
B $7254,1,1
b $7255 Enemies destroyed in chance stage
@ $7255 label=bonus_enemies_hit
B $7255,1,1
b $7256 Other flags
D $7256 #TABLE(default, default) { =h Bit | =h Purpose } { $00 | Fire pressed last time } { $01 | Double shot } { $02 | Unknown } { $03 | Unknown } { $04 | Unknown } { $05 | Unknown } { $06 | Unknown } { $07 | Unknown } TABLE#
@ $7256 label=other_flags
B $7256,1,1
w $7257 Countdown to screen off
@ $7257 label=screensaver_countdown
W $7257,2,2
b $7259 Counter used when approaching planet
@ $7259 label=counter_stage_completed
B $7259,1,1
b $725A Interrupt flag
@ $725A label=interrupt_flag
B $725A,1,1
b $725B Byte at 725B
B $725B,1,1
b $725C Byte at 725C
B $725C,1,1
w $725D Word at 725D
W $725D,2,2
b $725F Byte at 725F
B $725F,1,1
b $7260 Byte at 7260
B $7260,1,1
b $7261 Byte at 7261
B $7261,1,1
b $7262 Byte at 7262
B $7262,1,1
b $7263 Byte at 7263
B $7263,1,1
b $7264 Byte at 7264
B $7264,1,1
b $7265 Byte at 7265
B $7265,1,1
b $7266 Byte at 7266
B $7266,1,1
b $7267 Byte at 7267
B $7267,1,1
b $7268 Byte at 7268
B $7268,1,1
b $7269 Byte at 7269
B $7269,1,1
w $726A Word at 726A
@ $726A label=word_at_726A
W $726A,2,2
b $726C Byte at 726C
@ $726C label=byte_at_726C
B $726C,1,1
b $726D Byte at 726D
B $726D,1,1
b $726E Byte at 726E
B $726E,1,1
b $726F Byte at 726F
B $726F,1,1
w $7270 Word at 7270 (sound)
W $7270,2,2
w $7272 Word at 7272 (sound)
W $7272,2,2
w $7274 Word at 7274 (sound)
W $7274,2,2
w $7276 Word at 7276 (sound)
W $7276,2,2
b $7278 Data block at 7278 (sound)
B $7278,2,2
b $727A Byte at 727A (sound)
B $727A,1,1
b $727B Byte at 727B (sound)
B $727B,1,1
b $727C Byte at 727C (sound)
B $727C,1,1
b $727D Sound channel 1
B $727D,10,10
b $7287 Sound channel 2
B $7287,10,10
b $7291 Sound channel 3
B $7291,10,10
b $729B Sound channel 4
B $729B,10,10
b $72A5 Data block at 72A5
B $72A5,25,8*3,1
w $72BE Word at 72BE
W $72BE,2,2
w $72C0 Word at 72C0
W $72C0,2,2
b $72C2 Byte at 72C2
B $72C2,1,1
w $72C3 Word at 72C3
W $72C3,2,2
w $72C5 Temporary center of projection
D $72C5 Will be copied to #R$7000
@ $72C5 label=tmp_center_of_projection
W $72C5,2,2
b $72C7 Temp sprite data
B $72C7,1,1
b $72C8 Temp points to add
@ $72C8 label=points_to_add
B $72C8,3,3
b $72CB Byte at 72CB
B $72CB,1,1
b $72CC Data block at 72CC
B $72CC,1,1
b $72CD Data block at 72CD
B $72CD,1,1
b $72CE Data block at 72CE
B $72CE,1,1
b $72CF Data block at 72CF
B $72CF,1,1
w $72D0 Data block at 72D0
W $72D0,2,2
b $72D2 Data block at 72D2
B $72D2,1,1
b $72D3 Data block at 72D3
B $72D3,1,1
b $72D4 Data block at 72D4
B $72D4,1,1
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
w $72E0 Sprite patterns addresses in VDP
D $72E0 One entry for each of the 29 sprite types.
@ $72E0 label=sprite_pattern_vdp_addrs_table
W $72E0,58,2
b $731A Star frame
@ $731A label=star_frame
B $731A,1,1
b $731B Random number
@ $731B label=random_number
B $731B,2,2
b $731D Stack
B $731D,158,8*19,6
s $73BB Unused
S $73BB,59,$3B
w $73F6 Stars VDP address
@ $73F6 label=stars_vdp_address
W $73F6,2,2
s $73F8 Unused
S $73F8,8,$08
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
C $800C,3 Add A to HL
c $800F RST $10
C $800F,3 Write VDP byte (DE = address, A = value)
c $8012 RST $18
C $8012,3 WRITE_REGISTER (B = reg, C = value)
c $8015 RST $20
C $8015,3 Random number generator
c $8018 RST $28
C $8018,3 Allocate_sprite
c $801B RST $30
C $801B,3 Load sprite pattern
c $801E RST $38
C $801E,3 WRITE_VRAM (HL = source, DE = dest, BC = count)
c $8021 NMI
C $8021,3 Interrupt routine
c $8024 Entry point
@ $8024 label=entry
C $8024,3 Init stack pointer
C $8027,2 Controller enable
C $8029,3 Clear RAM
C $802C,3 #R$7000+1
C $802F,3 ...
C $8032,1 ...
C $8033,2 ...
C $8035,3 Set center of projection
C $8038,3 ...
C $803B,3 Init sound
C $803E,3 Start screen
C $8041,3 180 * 60 frames
C $8044,3 Set screensaver countdown
@ $8047 label=entry_wait_fire
C $8047,1 Wait for interrupt
C $8048,3 Display stars
C $804B,3 Controller 0, segment 0
C $804E,3 DECODER
C $8051,2 Test fire
C $8053,2 Jump if fire pressed
C $8055,3 Controller 1, segment 0
C $8058,3 DECODER
C $805B,2 Test fire
C $805D,2 Loop until fire pressed
C $805F,3 Set two-player flag
C $8062,2 ...
N $8064 This entry point is used by the routine at #R$81ED. Fire pressed
@ $8064 label=new_game
C $8067,3 Clear screensaver countdown
C $806A,3 Name table address
C $806D,3 Name table size
C $8070,1 Zero
C $8071,3 FILL_VRAM (clear screen)
C $8074,3 Last 4 bytes of color table
C $8077,3 4 bytes
C $807A,2 Set to white/black
C $807C,3 FILL_VRAM
C $807F,3 Clear RAM  from $71F1
C $8082,3 To $7256
C $8085,1 ...
C $8086,1 ...
C $8087,3 ...
C $808A,2 ...
C $808C,3 Clear all but two-player flag
C $808F,2 ...
C $8091,3 ...
C $8094,2 5 Lives
C $8096,3 Set lives
C $8099,1 Increment to 6
C $809A,3 Set #R$71F6+2 to 6 (extra life at 60000)
C $809D,3 Set #R$71FC+2 to 6 (extra life at 60000)
C $80A0,2 Stage
C $80A2,3 Set to 1
C $80A8,3 Display stage message
C $80AB,3 ...
C $80AE,3 ...
C $80B1,1 WRITE_VRAM
C $80B2,3 Display '1' at the top left corner
C $80B5,2 ...
C $80B7,1 Write VDP byte
C $80B8,1 Display '-' next to '1'
C $80B9,2 ...
C $80BB,1 Write VDP byte
C $80BC,1 Parameter to display score
C $80BD,3 Display score player 1
C $80C0,3 Flags
C $80C3,2 Test bit for two players
C $80C5,2 If bit is reset then skip ahead
C $80C7,3 Display '-' at the top right corner
C $80CA,2 ...
C $80CC,1 Write VDP byte
C $80CD,1 Display '2' next to '-'
C $80CE,2 ...
C $80D0,1 Write VDP byte
C $80D3,3 Display score player 2
C $80D6,3 Save player data in VDP RAM, starting with lives?
C $80D9,3 VDP address
C $80DC,3 45 bytes
C $80DF,1 WRITE_VRAM
C $80E0,2 Random number seed
C $80E2,3 Init random number
C $80E5,3 Initialize stage
c $80E8 Main loop
D $80E8 Used by the routines at #R$81AE and #R$83D0.
@ $80E8 label=main_loop
C $80E8,3 Flag set by interrupt routine
C $80EB,2 Test flag
C $80ED,2 Wait until set
C $80EF,2 Clear flag
C $80F1,3 READ_REGISTER (read VDP status)
C $80F4,3 Display stars
C $80F7,3 Control ship
C $80FA,3 Process sprites
C $80FD,3 READ_REGISTER
C $8106,3 READ_REGISTER
C $810F,3 READ_REGISTER
C $8115,3 Upload sprites
C $8118,3 Display center enemies
C $811B,3 Current player
C $811E,3 Display score
C $8121,3 Status flags
C $8124,2 Test bit 2
C $8126,3 Exit main loop if set
C $8129,2 Test bit 1
C $812B,2 Loop if not set
C $812D,3 Get active enemies
C $8130,3 Add enemy shots
C $8133,1 ...
C $8134,3 Stage completed when sum is zero
C $8137,2 Loop
c $8139 Died
D $8139 Used by the routine at #R$80E8.
@ $8139 label=died
C $8139,3 Set variables
C $813C,2 Play explosion sound
C $813E,3 ...
C $8141,3 Reset main loop flag
C $8144,2 ...
C $8146,3 READ_REGISTER
C $8149,3 Update sprite types $0F - $11
C $814C,3 Explosion
@ $814F label=label_at_814F
C $815F,3 Display stars
C $8162,3 Process sprites
C $8168,3 Display center enemies
C $816B,3 Upload sprites
c $8170 Lose life
D $8170 Used by the routine at #R$8139.
@ $8170 label=lose_life
C $8177,3 Lives
C $817A,1 Lose life
C $817B,2 Jump if lives left
N $817D Game over
C $8182,1 Write VDP byte
C $8183,3 Display player
C $8186,3 Display GAME OVER
C $8189,3 ...
C $818C,3 ...
C $818F,1 WRITE_VRAM
C $8190,2 Stars for 256 frames
C $8192,1 ...
C $8193,1 ...
C $8194,3 Display stars
C $8197,1 ...
C $8198,2 ...
C $819A,3 Clear rows 9 and 14
C $819D,3 Test for two players
C $81A0,2 ...
C $81A2,3 If not, wait for restart
C $81A5,2 Is one player already game over=
C $81A7,3 If so, wait for restart
C $81AA,2 Else flag that one player game over
C $81AC,2 And switch player
c $81AE Switch player
D $81AE Used by the routine at #R$8170.
@ $81AE label=switch_player
C $81AE,3 Test for two players
C $81B1,2 ...
C $81B3,2 Skip ahead if one player
C $81B5,2 Test for ?
C $81B7,2 Skip ahead if not set
N $81B9 This entry point is used by the routine at #R$8170.
C $81B9,3 Restore player data from VDP RAM into buffer
C $81BC,3 ...
C $81BF,3 ...
C $81C2,3 READ_VRAM
C $81C5,3 Save player data to VDP RAM
C $81C8,3 ...
C $81CB,3 ...
C $81CE,1 WRITE_VRAM
C $81CF,3 Copy data from buffer to right place
C $81D2,3 ...
C $81D5,3 ...
C $81D8,2 ...
C $81DA,3 Current player
C $81DD,2 Switch player
C $81DF,3 Save again
C $81E2,3 Initialize stage
C $81EA,3 To main loop
c $81ED Wait for restart
D $81ED Used by the routine at #R$8170.
@ $81ED label=wait_for_restart
C $81ED,3 300 seconds
C $81F0,3 Set screensaver countdown
C $81F4,3 Controller 0, segment 1
C $81F7,3 DECODER
C $81FD,3 Start a new game
C $8202,3 Reset
C $8205,3 Controller 0, segment 0
C $8208,3 DECODER
C $820B,2 Test fire
C $820D,3 Start a new game
C $8210,2 Loop
c $8212 Init stage
D $8212 Initialize stage and display X WARPS TO Y message. Used by the routines at #R$8024, #R$81AE and #R$83D0.
@ $8212 label=init_stage
C $8212,3 Clear $28 bytes from $722E
C $8215,3 ...
C $8218,3 ...
C $821B,2 ...
C $821D,2 ...
C $8224,3 Clear died flag
C $8227,2 ...
N $8229 Calculate stage data index
C $8229,3 Get completed stages
C $822C,1 Test if zero
C $822D,2 If not, skip ahead to set max value
C $822F,3 Stage
C $8234,2 Jump if stage >= 4, to set value = stage / 4 + 1
C $8236,1 B = stage 1-3
C $8237,1 A = 0
C $8238,1 B = 0-2
C $8239,2 If zero then skip ahead to save value
C $823B,1 Stage = 2 or 3, set A = 1
C $823C,2 Skip ahead to save value
C $823E,2 24
C $8240,2 Divide stage by 4
C $8242,2 ...
C $8244,1 + 1
C $8245,3 Save value (0 - 7)
N $8248 Display stage number
C $8248,3 Current stage
C $824B,3 Completed stages
C $824E,1 Add to stage
C $824F,3 VDP address (stage number tens)
C $8254,2 Jump if < 10
C $8256,2 Divide by ten into B
C $8258,2 ...
C $825A,2 ...
C $825C,1 ...
C $825D,2 ...
C $825F,2 Restore ones
C $8261,1 Save in C
C $8262,1 Tens
C $8263,2 Add ASCII 0
C $8265,1 Write VDP byte
C $8266,1 Ones
C $8267,1 Increment VDP address to stage number ones
C $8268,2 Add ASCII 0
C $826A,1 Write VDP byte
N $826B Display X WARPS TO Y message
C $826B,3 Check whether you just died
C $826E,1 So we want to display READY instead
C $826F,2 And if so jump ahead
C $8271,3 Get stage
C $8274,1 Save in B
C $8275,2 Divide by 2
C $8277,2 Clamp to 0, 2, 4, 6, 8, 10, 12
C $8279,3 Base planet table
C $827C,1 Add A to HL
C $827D,1 Get LSB of planet data
C $827E,1 To MSB
C $827F,1 Get MSB of planet data
C $8280,3 Planet name offset is 16
C $8283,1 Add planet data address
C $8284,1 Save it
C $8285,3 Buffer address for the string #R$71A3+1
C $8288,1 Restore stage
C $8289,2 Clamp to 0, 1, 2, 3 (0 not an option?)
C $828B,2 If 3 we have reached it's a chance stage
C $828D,2 Then jump ahead
C $828F,2 Flip the bits, so we know how many warps TO the planet
C $8291,2 Add ASCII 0
C $8293,1 Store number in the buffer
C $8294,1 Next buffer address
C $8295,3 WARPS message
C $8298,3 Copy 5 bytes '_WARP'
C $829B,2 If the number is less than 2,
C $829D,2 then skip ahead
C $829F,1 Otherwise copy one more byte '_WARPS'
C $82A0,2 Make the copy
C $82A2,3 Copy _TO_ message
C $82A5,3 4 bytes
C $82A8,2 Make the copy
C $82AA,1 Restore the planet name address
C $82AB,1 Get length of name
C $82AC,1 Next byte
C $82AD,2 Copy planet name
C $82AF,1 Now HL=destination and DE=source
C $82B0,3 Buffer address for the string #R$71A3+1
C $82B3,2 Now HL contain the length of the string
C $82B5,1 Now DE=length and HL=$71A4
C $82B6,1 HL=#R$71A3
C $82B7,1 Set length
C $82B8,2 Jump ahead
C $82BA,3 Ready message
C $82BD,2 Skip ahead
C $82BF,1 Drop the pushed planet name address
C $82C0,3 Chance stage message
C $82C3,2 At this point HL contains a pointer to the length prefixed message to print
C $82C5,1 32 - string length
C $82C6,2 / 2 = offset to center line
C $82C8,3 VDP address of line start
C $82CB,1 Add address to offset
C $82CC,1 Copy back to destination
C $82CD,1 Length
C $82CE,2 MSB of length
C $82D0,1 Increment source to text
C $82D1,1 WRITE_VRAM Display the X WARPS TO Y message
N $82D2 Display ship and stars with music for a short while
C $82D2,3 Display player if 2 player
C $82D5,2 For calculating ...
C $82D7,3 Get stage
C $82DA,3 Add completed stages
C $82DD,1 ...
C $82DE,2 If 1 then skip ahead with B = 0
C $82E0,2 ...
C $82E2,2 Stage mod 4
C $82E4,2 Set B = 5
C $82E6,2 And skip ahead if stage mod 4 < 1
C $82E8,2 ...
C $82EA,2 Set B = 3
C $82EC,2 And skip ahead if stage mod 4 = 1
C $82EE,2 Set B = 4
C $82F0,2 And skip ahead if stage mod 4 = 2
C $82F2,2 ...
C $82F4,2 Set B = 6
C $82F6,1 Set A = B
C $82F7,3 Play selected tune
C $82FA,3 Display lives
C $82FD,3 Init sprite data
C $8300,3 Initial game loop
C $8303,3 Init some variables
C $8306,3 Update status flags
C $8309,2 ...
C $830B,2 Set main loop flag
c $830E Display player message
D $830E Used by the routines at #R$8170 and #R$82BF.
@ $830E label=display_player
C $830E,3 Status
C $8311,2 Check bit for 2 players
C $8313,1 Return if not set
C $8314,3 PLAYER 1 message
C $8317,3 VDP address
C $831A,3 8 characters
C $831D,1 WRITE_VRAM
C $831E,3 Current player
C $8321,1 Is it player 1?
C $8322,1 The return
C $8323,2 ASCII 2
C $8325,3 VDP address
C $8328,1 Write VDP byte
c $832A Stage completed
D $832A Used by the routine at #R$80E8.
@ $832A label=stage_completed
C $832A,2 Set counter for later
C $832C,3 ...
C $8332,2 Clear main loop flag
C $8334,3 READ_REGISTER
C $8337,2 If bit 3 is set
C $8339,3 Then it was a chance stage
N $833C This entry point is used by the routines at #R$8450 and #R$846B.
C $833C,2 90
C $833F,1 Wait interrupt
C $8340,3 Display stars
C $8343,3 Control ship
C $8346,3 Process sprites
C $8349,3 Display center enemies
C $834C,3 Upload sprites
C $8350,2 Loop for 90 frames
C $8352,3 Set variables
C $8355,3 Clear rows 9 and 14
C $8358,3 Stage
C $835B,2 Stage mod 4
C $835D,2 If not planet reached (2)
C $835F,2 Then skip ahead
C $8361,2 Play tune 1
C $8363,3 ...
C $8368,2 If not 2 then play sound
C $836A,3 ...
C $8374,3 Stage
C $8377,1 B = stage
C $8378,2 Stage mod 4
C $837A,2 If not planet reached (2)
C $837C,2 Then skip displaying planet
C $837E,1 Stage
C $837F,2 Divide by 4
C $8381,2 ...
C $8383,1 + 1
C $8384,3 Display planet A
C $8387,3 Upload sprite data
N $838A Warp
C $838A,1 Wait interrupt
C $838B,3 Display stars
C $838E,3 Control ship
C $8391,3 Process sprites
C $8394,3 Decrement counter that start at 8
C $8397,1 ...
C $8398,2 If not zero yet then skip loop body
C $839A,2 Reset counter
C $839C,4 Pointer sprite 0
C $83A0,3 Increment polar y
C $83A3,3 Increment polar y for sprite 1
C $83A6,3 Get polar y
C $83A9,2 Is polar y 18?
C $83AB,2 No, skip ahead
C $83AE,3 Clear row 7 (planet name)
C $83B2,2 Is polar y 43?
C $83B4,2 Yes, break out of loop
C $83B6,2 Is polar y 21?
C $83B8,2 No, skip ahead
C $83BA,4 Set color of sprite 0
C $83BE,4 Set color of sprite 1
C $83C2,1 Load sprite pattern sprite 0
C $83C3,4 Sprite 1
C $83C7,1 Load sprite pattern sprite 1
C $83C8,3 Display ship background patterns
C $83CB,3 Upload sprites
C $83CE,2 Loop
c $83D0 Next stage
D $83D0 Used by the routine at #R$832A.
@ $83D0 label=next_stage
C $83D0,3 Flags
C $83D8,3 Clear wave
C $83DB,3 Clear enemies destroyed
C $83DE,3 Stage
C $83E1,1 Next stage
C $83E2,2 Did we reach 24?
C $83E4,2 No, skip ahead
C $83E6,3 Get the total stages completed
C $83E9,1 And add 24
C $83EA,1 Save again
C $83EB,1 And set stage to zero
C $83EC,3 Save stage
C $83EF,3 Flags
C $83F2,2 Reset bit 3
C $83F4,3 Stage
C $83F7,2 Mod 4
C $83F9,2 Is it a chance stage?
C $83FB,2 No, skip ahead
C $83FD,2 Yes, set flag
C $83FF,1 Reset death count
C $8400,3 ...
C $8403,3 Undraw planet
C $8406,3 Set 4 colors to white/black
C $8409,3 ...
C $840C,2 ...
C $840E,3 FILL_VRAM
C $8411,3 Address in pattern table
C $8414,3 256 bytes = 32 patterns
C $8417,1 Clear
C $8418,3 FILL_VRAM
C $841B,3 Save flags
C $841E,1 ...
C $841F,3 Init stage
C $8422,1 Restore flags
C $8423,3 ...
C $8426,3 Jump to main loop
c $8429 Display bonus
D $8429 Used by the routine at #R$832A.
@ $8429 label=display_bonus
C $8429,3 Number of ships destroyed in chance stage
C $842C,2 Is it 40?
C $842E,2 Then it's perfect
C $8430,1 Save ships
C $8431,3 Display BONUS
C $8434,3 ...
C $8437,3 ...
C $843A,1 WRITE_VRAM
C $843B,3 Display 100 X ..  ..00
C $843E,3 ...
C $8441,3 ...
C $8444,1 WRITE_VRAM
C $8445,1 Restore ships
C $8446,1 Save again
C $8447,2 48
C $8449,2 Ships - 10
C $844B,2 Jump if ships < 10, A is now -10 to -1
C $844D,1 +1 for every 10 ships
C $844E,2 Loop
c $8450 Display hits
D $8450 Used by the routine at #R$8429.
@ $8450 label=display_hits
C $8450,2 Add ASCII for zero + 10
C $8452,3 Ones in number of ships
C $8455,1 Write VDP byte
C $8456,3 Hundreds in bonus
C $8459,1 Write VDP byte
C $845A,1 Tens
C $845B,3 Tens in number of ships
C $845E,1 Write VDP byte
C $845F,3 Thousands in bonus
C $8462,1 Write VDP byte
C $8463,1 Restore ships destroyed
C $8464,1 If it zero?
C $8465,1 ...
C $8466,3 Then jump back to complete stage
C $8469,2 Else add B x 100 bonus points
c $846B Perfect bonus
D $846B Used by the routine at #R$8429.
@ $846B label=perfect_bonus
C $846B,2 Play a tune
C $846D,3 ...
C $8470,3 Display CONGRATULATIONS
C $8473,3 ...
C $8476,3 ...
C $8479,1 WRITE_VRAM
C $847A,3 Display PERFECT 10000 PTS
C $847D,3 ...
C $8480,3 ...
C $8483,1 WRITE_VRAM
C $8484,2 100 times
N $8486 This entry point is used by the routine at #R$8450.
C $8486,3 100 points
C $848B,3 Add 100 points to score
C $848E,3 Current player
C $8491,3 Display score
C $8494,2 7 frames
C $8496,1 Wait for interrupt
C $8498,3 Display stars
C $849B,3 Control ship
C $849E,3 Process sprites
C $84A1,3 Display center enemies
C $84A4,3 Upload sprites
C $84A8,2 Loop 7 times
C $84AC,2 Loop number of ships times
C $84AE,3 Jump back to complete stage
c $84B1 Update frames and upload sprites
D $84B1 Used by the routines at #R$8024, #R$8139, #R$832A, #R$832A, #R$846B, #R$A33B and #R$A3E1.
@ $84B1 label=update_frame_upload_sprites
C $84B1,3 Update frame counter
C $84B4,1 ...
C $84B5,1 Get new value
C $84B6,2 Every second frame ...
C $84B8,2 go directly to upload sprite data
C $84BA,3 Else get type of sprite 1
C $84BD,2 Is it 1 (ship 2)?
C $84BF,2 If not upload sprite data
C $84C1,3 Get color of sprite 1
C $84C4,1 ...
C $84C5,2 Flip bit 4
C $84C7,1 And set color back
C $84C8,3 Upload sprite data
c $84CB Upload patterns
D $84CB Used by the routine at #R$90D6.
R $84CB I: HL Pointer to start index and count
@ $84CB label=upload_patterns
C $84CD,1 DE = start index
C $84D0,2 BC = count
C $84D3,2 IY = count
C $84D5,1 HL now points to graphics data
C $84D6,2 Table code (3 = pattern generator table)
C $84D8,3 PUT_VRAM
c $84DB Get stage data address
D $84DB Used by the routines at #R$8878, #R$8A53, #R$8A76, #R$8C68, #R$8D50, #R$8E9D, #R$900E and #R$AAF1.
R $84DB O:IY Stage data address
@ $84DB label=stage_data_addr
C $84DC,3 Get value (0 - 6)
C $84DF,1 Multiply by 8
C $84E0,1 ...
C $84E1,1 ...
C $84E2,1 Add #R$8541
C $84E3,2 ...
C $84E5,4 ...
C $84E9,2 ...
c $84ED Clear rows 9 and 14
D $84ED Used by the routines at #R$8170 and #R$832A.
@ $84ED label=clear_rows_9_and_14
C $84ED,3 Name table row 9
C $84F0,3 32 bytes
C $84F3,1 Clear
C $84F4,3 FILL_VRAM
C $84F7,3 Name table row 14
C $84FA,3 32 bytes
C $84FD,1 Clear
C $84FE,3 FILL_VRAM
c $8501 Interrupt routine
D $8501 Calls sound player and handles screen saver Used by the routine at #R$8021.
@ $8501 label=interrupt_routine
C $8509,3 Counter
C $850C,1 Check if zero
C $850D,1 ...
C $850E,2 If counter is 0 then skip ahead
C $8510,1 Otherwise decrement
C $8511,3 and save.
C $8514,1 Check again if zero
C $8515,1 ...
C $8516,2 If not then skip ahead, otherwise blank screen
C $8518,3 Display off, interrupt off
C $851B,1 WRITE_REGISTER
C $851C,3 Black border
C $851F,1 WRITE_REGISTER
C $8520,2 Loop
C $8522,3 Sound player
C $852A,3 READ_REGISTER
t $853C STAGE message
@ $853C label=stage_msg
T $853C,5,5
b $8541 Stage data (8 bytes per stage)
D $8541 #TABLE(default, default) { =h Byte offset | =h Purpose } { $00 | Unknown } { $01 | Unknown } { $02 | Unknown } { $03 | Unknown } { $04 | Unknown } { $05 | Unknown } { $06 | Unknown } { $07 | Unknown } TABLE#
@ $8541 label=stage_data
B $8541,64,8
t $8581 PLAYER message
@ $8581 label=player_msg
T $8581,8,6:n1:1
t $8589 READY message
@ $8589 label=ready_msg
T $8589,6,n1:5
t $858F CHANCE STAGE message
@ $858F label=chance_stage_msg
T $858F,13,n1:6:n1:5
t $859C WARPS message
@ $859C label=warps_msg
T $859C,6,n1:5
t $85A2 TO message
@ $85A2 label=to_msg
T $85A2,4,n1:2:n1
t $85A6 BONUS message
@ $85A6 label=bonus_msg
T $85A6,5,5
t $85AB Bonus points message
@ $85AB label=bonus_numbers_msg
T $85AB,14,3:n1:1:n1:2:n2:4
t $85B9 CONGRATULATIONS message
@ $85B9 label=congratulations_msg
T $85B9,16,16
t $85C9 PERFECT message
@ $85C9 label=perfect_msg
T $85C9,20,8:n3:5:n1:3
t $85DD GAME OVER message
@ $85DD label=game_over_msg
T $85DD,9,4:n1:4
c $85E6 Process sprites
D $85E6 Used by the routines at #R$8024, #R$8139, #R$832A, #R$832A, #R$846B and #R$A3E1.
@ $85E6 label=process_sprites
C $85E6,3 Decrement counter
C $85E9,1 ...
C $85EA,3 Decrement counter
C $85ED,1 ...
C $85EE,3 Decrement counter stopping at 0
C $85F1,1 ...
C $85F2,3 ...
C $85F5,3 ...
C $85F8,3 Flags
C $85FB,2 Reset init flag
C $85FD,3 Table address #R$7183+2 (skip ship sprites)
N $8600 This entry point is used by the routine at #R$8A41.
C $8600,1 Save table address
C $8601,3 Sprite allocation table
C $8604,1 Clear carry
C $8605,2 HL = offset into table
C $8607,3 Allocated sprites
C $860A,1 Compare to offset
C $860B,1 Restore table address
C $860C,3 Jump when we have reached the last allocation
C $860F,1 Push allocation table address
C $8610,1 Get sprite data table index
C $8611,2 ...
C $8613,1 Multiply by 4
C $8614,1 ...
C $8615,1 Store in DE
C $8616,1 ...
C $8617,1 Multiplied by 8
C $8618,1 Multiplied by 12
C $8619,1 DE = sprite data table offset
C $861A,4 Base sprite data table address
C $861E,2 IX = sprite data table address
C $8620,3 Push return address of routine at #R$8A41
C $8623,1 ...
C $8624,3 Get sprite type
C $8627,3 Copy it to byte 5?
C $862A,2 Is it to be deallocated?
C $862C,3 If not, jump ahead
N $862F This entry point is used by the routines at #R$8654, #R$8673, #R$867D and #R$8815.
@ $862F label=deallocate_sprite
C $862F,4 Set as not allocated
C $8633,1 Pop return address
C $8634,1 Restore allocation table address of sprite to be deallocated
C $8635,1 Push it again
C $8636,3 Sprite allocation table
C $8639,1 Clear carry
C $863A,2 HL = offset into table
C $863C,3 Decrement number of allocated sprites
C $863F,1 ...
C $8640,3 ...
C $8643,1 Allocated sprites - offset = number of allocations after this one
C $8644,2 If it was the last one, there's nothing to do
C $8646,1 BC = number of allocations to move
C $8647,2 ...
C $8649,1 DE = allocation table address
C $864A,1 ...
C $864B,1 HL = allocation table address
C $864C,1 ...
C $864D,1 HL = allocation table address + 1
C $864E,2 Copy allocations after to close hole
C $8650,1 Restore allocation table address
C $8651,3 Proceed with next sprite
c $8654 Routine at 8654
D $8654 Used by the routines at #R$870C, #R$873E and #R$8848.
c $865A Handle sprite
D $865A Used by the routine at #R$85E6.
@ $865A label=handle_sprite
C $865A,2 Is sprite type $02?
C $865C,3 If not proceed to next handler
N $865F Sprite type $02 (shot)
C $8662,3 Get polar y
C $8665,1 Move shot
C $8666,1 ...
C $8667,3 And save again
C $866A,2 Is polar y now 7?
C $866C,2 If not, jump ahead
C $866E,4 Set color
C $8672,1 Return to #R$8A41
c $8673 Routine at 8673
D $8673 Used by the routine at #R$865A.
c $867D Routine at 867D
D $867D Used by the routine at #R$865A.
C $867D,2 Is sprite type < 4 (ship1, ship2, shot)
C $867F,2 Then jump
C $8681,2 Is it >= $0D
C $8683,2 Then jump
N $8685 Sprite types $04 - $0C (TODO)
C $869A,3 Set type
C $86A5,4 Set color
C $86AD,1 Load sprite pattern
C $86B0,1 Allocate sprite
C $86B3,4 Set type
C $86BB,4 Set color
C $86BF,4 Set polar y
C $86C3,4 Set polar x
C $86CB,1 Load sprite pattern
C $86CF,3 Set y
C $86D2,3 Get x
C $86D5,2 Add 8
C $86D7,3 Set x
c $86DE Routine at 86DE
D $86DE Used by the routine at #R$867D.
C $86DE,2 Is sprite type $014
C $86E0,2 If not, jump ahead
N $86E2 Sprite type $14 (TODO)
C $86E5,3 Decrement polar y
C $86E8,1 Return to #R$8A41
c $86E9 Routine at 86E9
D $86E9 Used by the routine at #R$86DE.
C $86E9,2 Is sprite type < $012
C $86EB,2 If so, move ahead
C $86ED,2 Is sprite type >= $014
C $86EF,2 If so, move ahead
N $86F1 Sprite types $12 - $13 (TODO)
C $86F1,3 Frame counter
c $870C Routine at 870C
D $870C Used by the routine at #R$86E9.
C $870C,2 Is sprite type $03?
C $870E,2 If not, jump ahead
N $8710 Sprite type $03 (TODO)
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
C $8884,3 Get stage data address in IY
C $8887,1 Random number
C $8897,1 Random number
N $889C This entry point is used by the routine at #R$88BE.
c $88A7 Routine at 88A7
D $88A7 Used by the routine at #R$8878.
c $88BE Routine at 88BE
D $88BE Used by the routine at #R$8878.
C $88BE,1 Random number
C $88C4,1 Add A to HL
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
c $8A41 Return from sprite handler
D $8A41 Sprite handler branching out from #R$8600
@ $8A41 label=return_from_sprite_handler
C $8A41,3 Get sprite type
C $8A44,3 Is it $05 (TODO)
C $8A47,2 Skip ahead if so
C $8A4D,1 Load sprite pattern
N $8A4E This entry point is used by the routine at #R$867D.
C $8A4E,1 Restore sprite allocation table address
C $8A4F,1 Increment address
C $8A50,3 Jump back into loop at #R$8600
c $8A53 Routine at 8A53
D $8A53 Used by the routine at #R$85E6.
C $8A53,3 Get stage data address in IY
c $8A76 Routine at 8A76
D $8A76 Used by the routines at #R$8790, #R$885F and #R$88FE.
C $8A87,3 Get stage data address in IY
C $8AA4,1 Allocate sprite
C $8AB9,4 Set color
c $8AC0 Routine at 8AC0
D $8AC0 Used by the routines at #R$8790, #R$87F5, #R$8878 and #R$88D4.
c $8AE6 Update sprite types $0F - $11
D $8AE6 Used by the routine at #R$8139.
C $8AE6,4 Sprite data
C $8AEA,3 Size of each sprite
C $8AED,2 32 sprites
C $8AEF,3 Get type
C $8AF2,2 If < 14 then move on
C $8AF4,2 ...
C $8AF6,2 If >= 18 then move on
C $8AF8,2 ...
C $8AFA,4 For types $0F - $11, test bit 6 of ?
C $8AFE,2 If not set, move on
C $8B00,4 Set type to $10
C $8B04,4 Set ? to $0C
C $8B08,4 Set ? to $FF
C $8B0C,1 Load sprite pattern
C $8B0D,2 Next sprite
C $8B0F,2 Loop for 32 sprites
c $8B12 Draw background patterns for sprite
D $8B12 Used by the routines at #R$8F0F, #R$8F55, #R$99D3, #R$9A75 and #R$A808.
R $8B12 I:IY Data structure
@ $8B12 label=display_background_patterns
C $8B12,3 Get name table address of 3 x 3 area to clear
C $8B15,3 ...
C $8B18,1 If zero
C $8B19,1 ...
C $8B1A,2 Then skip ahead
N $8B1C Clear name table area
C $8B1C,2 3 rows
C $8B1E,1 DE now VDP address
C $8B1F,2 3 columns
C $8B21,1 Zero to clear
C $8B22,1 Write VDP byte
C $8B23,1 Next VDP address
C $8B24,2 Inner loop
C $8B26,3 One row down and 3 columns back
C $8B29,1 ...
C $8B2A,1 Row counter
C $8B2B,2 Outer loop
C $8B2D,4 Reset name table address
C $8B31,4 ...
C $8B35,3 Background patterns LSB
C $8B38,3 Background patterns MSB
C $8B3B,1 If both zero
C $8B3C,1 ...
C $8B3D,1 Then return
N $8B3E Shift/scroll patterns to the right pixel offset
C $8B3E,2 Save structure pointer
C $8B40,1 Save background patterns address
C $8B41,3 Clear 72 bytes starting from #R$71A3
C $8B44,3 ...
C $8B47,3 ...
C $8B4A,2 ...
C $8B4C,2 ...
C $8B4E,3 Get screen y
C $8B51,2 Pixel offset y
C $8B53,4 Cleared buffer
C $8B57,1 DE = pixel offset y
C $8B58,2 ...
C $8B5A,2 Buffer address
C $8B5C,3 Get screen x
C $8B5F,2 Pixel offset x
C $8B61,1 B = pixel offset (counter for outer loop)
C $8B62,2 C = 16 (counter for inner loop)
C $8B64,2 Restore background patterns address
C $8B66,1 Save counters
C $8B67,2 C = 0
C $8B69,3 D = byte from left column of pattern
C $8B6C,3 E = byte from right column of pattern
C $8B6F,1 If pixel offset = 0
C $8B70,1 ...
C $8B71,2 Then skip shifting
C $8B73,1 Clear carry?
C $8B74,2 Shift first byte
C $8B76,2 Shift second byte
C $8B78,2 Shift third byte
C $8B7A,2 Repeat 'pixel offset' times (inner loop)
C $8B7C,3 Save shifted bytes in buffer
C $8B7F,3 3 patterns offset
C $8B82,3 ...
C $8B85,2 Next destination address
C $8B87,2 Next source address
C $8B89,1 Restore counters
C $8B8A,1 Repeat 16 times
C $8B8B,2 Outer loop
N $8B8D Update pattern table
C $8B8F,3 VDP pattern index
C $8B94,1 * 8
C $8B95,1 ...
C $8B96,1 ...
C $8B97,1 DE now VDP address in pattern table
C $8B98,3 Source address
C $8B9B,3 72 bytes (9 patterns)
C $8B9E,1 WRITE_VRAM
N $8B9F Update name table (3 x 3)
C $8B9F,3 Get screen y
C $8BA2,2 Round to characters
C $8BA4,1 HL = A
C $8BA5,2 ...
C $8BA7,1 * 4 = row offset in name table
C $8BA8,1 ...
C $8BA9,3 Get screen x
C $8BAC,2 / 8 = column offset in name table
C $8BAE,2 ...
C $8BB0,2 ...
C $8BB2,1 -1 (start one column before)
C $8BB3,1 DE = A
C $8BB4,2 ...
C $8BB6,1 Add to address
C $8BB7,3 Name table base address
C $8BBA,1 Add to address in HL
C $8BBB,3 Store address
C $8BBE,3 ...
C $8BC1,2 3 rows
C $8BC3,3 Get name
C $8BC6,1 DE is now VDP address
C $8BC7,2 3 columns
C $8BC9,1 Write VDP byte
C $8BCA,2 Name += 3 (columns 3 apart)
C $8BCC,1 Next VDP address
C $8BCD,2 Inner loop for 3 bytes
C $8BCF,2 Name -= 8 (rows 1 apart)
C $8BD1,3 One row down and 3 columns back
C $8BD4,1 ...
C $8BD5,1 Row counter
C $8BD6,2 Outer loop for 3 bytes
c $8BD9 Routine at 8BD9
D $8BD9 Used by the routine at #R$8024.
c $8C07 Routine at 8C07
D $8C07 Used by the routine at #R$8BD9.
C $8C15,1 Random number
c $8C1E Routine at 8C1E
D $8C1E Used by the routines at #R$8BD9 and #R$8C07.
c $8C30 Routine at 8C30
D $8C30 Used by the routine at #R$8BD9.
C $8C35,3 Stage
N $8C3E This entry point is used by the routine at #R$8C07.
c $8C52 Routine at 8C52
D $8C52 Used by the routine at #R$8C30.
N $8C57 This entry point is used by the routine at #R$8C30.
c $8C68 Routine at 8C68
D $8C68 Used by the routine at #R$8BD9.
N $8C6D This entry point is used by the routine at #R$8C52.
C $8C7C,3 Get stage data address in IY
C $8C94,3 Stage
C $8CA0,1 Add A to HL
C $8CA2,1 Allocate sprite
C $8CAF,3 Set color
C $8CF5,1 Load sprite pattern
C $8D17,3 Get stage data address in IY
c $8D21 Routine at 8D21
D $8D21 Used by the routine at #R$8170.
c $8D50 Routine at 8D50
D $8D50 Used by the routine at #R$8024.
C $8D68,3 Get stage data address in IY
C $8D6B,1 Random number
C $8D81,1 Allocate sprite
C $8D8A,4 Set color
C $8D8E,1 Random number
C $8D98,1 Load sprite pattern
C $8D99,1 Allocate sprite
C $8DA2,4 Set color
C $8DB2,1 Load sprite pattern
C $8DB3,1 Allocate sprite
C $8DBC,4 Set color
C $8DCC,1 Load sprite pattern
c $8DD7 Routine at 8DD7
D $8DD7 Used by the routine at #R$8D50.
C $8DDD,1 Allocate sprite
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
C $8E5C,3 Stage
C $8E81,2 Set died flag
c $8E89 Routine at 8E89
D $8E89 Used by the routine at #R$8E2C.
@ $8E89 label=init_stage_variables
N $8E8D This entry point is used by the routines at #R$82BF and #R$8FED.
C $8E8D,1 Random number
C $8E8E,2 0 - 15
C $8E90,2 5  - 20
C $8E92,3 Store
C $8E95,1 A = 0
C $8E96,3 Set to 0
C $8E99,3 Set to 0
c $8E9D Routine at 8E9D
D $8E9D Used by the routine at #R$8E2C.
C $8F00,3 Get stage data address in IY
c $8F0F Routine at 8F0F
D $8F0F Used by the routine at #R$8E9D.
C $8F44,3 FILL_VRAM
C $8F52,3 Display background patterns
c $8F55 Routine at 8F55
D $8F55 Used by the routine at #R$8E2C.
N $8FAE This entry point is used by the routine at #R$8FED.
C $8FAE,3 Polar y
C $8FB1,3 Polar x
C $8FC3,3 Display background patterns
c $8FED Routine at 8FED
D $8FED Used by the routine at #R$8F55.
C $9004,3 Clear died flag
C $9007,2 ...
c $900E Routine at 900E
D $900E Used by the routines at #R$8E9D and #R$8F55.
C $9023,1 Allocate sprite
C $9028,4 Set color
C $9038,1 Load sprite pattern
C $9039,3 Get stage data address in IY
C $903C,1 Random number
b $9046 Data block at 9046
B $9046,16,8
b $9056 Graphics
D $9056 #UDGTABLE(no-border, no-border) { #UDGARRAY8,,4($9056-$90C7-16)(graphics-9056.png) } { #UDGARRAY8,,4($905E-$90D5-16)(graphics-905E.png) } TABLE#
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
C $912B,1 Write VDP byte
C $912C,1 Next destination
C $912D,1 Next source
C $912E,1 Get name
C $912F,1 Write VDP byte
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
C $9168,3 Display stars
C $916E,1 Return is no carry
C $9172,2 Loop until no carry
c $9175 Display planet
D $9175 Used by the routines at #R$832A, #R$83D0 and #R$90D6.
R $9175 I:A Index of planet (1 based, 0 = undraw)
@ $9175 label=display_planet
C $9175,1 a *= 2
C $9176,2 If zero then undraw planet
C $9178,3 Planet table minus 2: #R$9398-2
C $917B,1 Add A to HL
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
C $91BC,1 Write VDP byte
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
R $91CC I:HL Address of planet name prefixed by length
@ $91CC label=display_planet_name_and_sprites
C $91CC,1 Save address
C $91CD,3 clear_row_7 where the planet name is displayed
C $91D0,2 32
C $91D2,1 32 - length
C $91D3,2 (32 - length) / 2
C $91D5,3 Name table address of row
C $91D9,1 Add A to HL
C $91DA,1 DE = display address
C $91DB,1 Get length
C $91DE,1 Advance source to text
C $91DF,1 WRITE_VRAM
C $91E0,1 Restore address
C $91E1,1 Get length
C $91E2,1 Length + 1
C $91E3,1 Add A to HL. Now HL points after text.
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
D $920D Where the planet name is displayed Used by the routines at #R$832A, #R$90D6, #R$91A1 and #R$91CC.
@ $920D label=clear_row_7
C $9210,2 Space
C $9212,3 Address in name table (row 7)
C $9215,3 32 bytes
C $9218,3 FILL_VRAM
c $921F Decode and upload patterns
D $921F Decode and upload patterns to VDP buffer at $1400 Used by the routine at #R$90D6.
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
C $9248,1 Write VDP byte in A to DE
C $9249,1 Next VDP address
C $924A,2 Loop B times
C $924C,2 Loop
c $924E Write single byte
D $924E Used by the routine at #R$921F.
C $924E,3 Get byte to write
C $9251,1 Write VDP byte in A to DE
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
c $9285 Copy 135 patterns
D $9285 Copy 135 patterns from VDP RAM buffer into pattern table from 128 Used by the routine at #R$9175.
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
b $92E0 Logo patterns
D $92E0 #UDGTABLE(no-border, no-border) { #UDGARRAY10,,4($92E0-$9377-16)(graphics-92E0.png) } { #UDGARRAY10,,4($92E8-$937F-16)(graphics-92E8.png) } TABLE#
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
b $96FE Planet sprite patterns
D $96FE #UDGTABLE { #UDGARRAY19,,4($96FE-$9795-8)(graphics-96FE.png) } TABLE#
@ $96FE label=planet_sprite_patterns
B $96FE,152,8
c $9796 Routine at 9796
D $9796 Used by the routine at #R$8024.
C $9796,3 Return if only the ship sprites are allocated
C $9799,2 ...
C $979B,1 ...
N $97F3 This entry point is used by the routines at #R$98B5, #R$9978 and #R$9A49.
C $983B,1 Load sprite pattern
C $9843,1 Load sprite pattern
c $9845 Routine at 9845
D $9845 Used by the routine at #R$9796.
C $9845,1 Allocate sprite
C $9858,4 Set color
c $9861 Routine at 9861
D $9861 Used by the routine at #R$9796.
C $986B,3 Size of each sprite
N $986E This entry point is used by the routine at #R$98B5.
c $98B5 Routine at 98B5
D $98B5 Used by the routine at #R$9861.
N $98BB This entry point is used by the routine at #R$9861.
c $9924 Routine at 9924
D $9924 Used by the routines at #R$9861 and #R$98B5.
c $9934 Routine at 9934
D $9934 Used by the routine at #R$9924.
N $9936 This entry point is used by the routine at #R$9924.
C $9951,3 Record hit
C $9954,1 ...
c $9978 Add score when enemy destroyed
D $9978 Used by the routine at #R$9934.
R $9978 I:IX ?
R $9978 I:DE Points to add
@ $9978 label=add_score_from_enemy
C $9978,3 Flags
C $997B,2 If bit 5 or 6 set?
C $997D,2 Then just add score
C $997F,3 Flags
C $9982,3 Enemies destroyed
C $9985,1 +1
C $9986,2 Check for chance stage
C $9988,2 Skip ahead if chance stage
C $998A,3 Save if not chance stage
C $998D,1 x2
C $998E,3 Score table
C $9991,1 Add A to HL
C $9992,1 Get points (hundreds)
C $9994,1 Get ?
C $9998,1 100 more
N $9999 This entry point is used by the routines at #R$9934, #R$99A0, #R$99D3 and #R$9A08.
C $9999,1 HL = points
C $999A,3 Add score
c $99A0 Routine at 99A0
D $99A0 Used by the routine at #R$98B5.
c $99B1 Routine at 99B1
D $99B1 Used by the routine at #R$98B5.
c $99D3 Routine at 99D3
D $99D3 Used by the routine at #R$99B1.
C $99E1,1 Add A to HL
N $99EA This entry point is used by the routine at #R$99B1.
C $99F5,3 Display background patterns
C $99FE,3 Clear died flag
C $9A01,2 ...
c $9A08 Routine at 9A08
D $9A08 Used by the routine at #R$9924.
c $9A1C Routine at 9A1C
D $9A1C Used by the routines at #R$9934, #R$99A0, #R$99B1 and #R$9A08.
C $9A20,3 Set color
c $9A38 Routine at 9A38
D $9A38 Used by the routine at #R$9796.
c $9A49 Routine at 9A49
D $9A49 Used by the routine at #R$9A38.
C $9A68,1 Load sprite pattern
N $9A69 This entry point is used by the routine at #R$9A75.
N $9A6D This entry point is used by the routine at #R$9A38.
C $9A6D,3 Set died flag
C $9A70,2 ...
c $9A75 Routine at 9A75
D $9A75 Used by the routine at #R$9796.
C $9A7D,3 Display background patterns
c $9A86 Routine at 9A86
D $9A86 Used by the routines at #R$870C, #R$9796, #R$9861 and #R$98B5.
b $9AA7 Data block at 9AA7
B $9AA7,12,2
c $9AB3 Add A to HL (RST $08)
D $9AB3 Used by the routine at #R$800C.
@ $9AB3 label=add_a_to_hl
c $9ABB Unused routine at 9ABB
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
R $9AD0 I:DE Read address
R $9AD0 O:A Byte read
@ $9AD0 label=vdp_read_byte
C $9AD0,1 Set LSB of VDP address
C $9AD4,2 Set MSB of VDP address
C $9AD6,2 Delay
C $9ADB,2 Read byte
c $9ADE Routine at 9ADE
D $9ADE Used by the routine at #R$8024.
@ $9ADE label=init_sound
C $9ADE,3 TURN_OFF_SOUND
C $9AE7,3 $727D
C $9AEB,3 $7287
C $9AEF,3 $7291
C $9AF3,3 $729B
C $9AFC,4 Set as not allocated
C $9B04,4 Set y
c $9B0D Play tune?
D $9B0D Used by the routines at #R$9BD9, #R$9C1C and #R$9E91.
R $9B0D I:A Index of tune (0 - 6)
@ $9B0D label=play_tune
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
@ $9B87 label=set_variables_after_stage
c $9B99 Sound player?
D $9B99 Used by the routine at #R$8522.
@ $9B99 label=sound_player
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
R $9CA8 I:C Index of sound (1-8)
@ $9CA8 label=play_sound
N $9CB5 This entry point is used by the routines at #R$9B54 and #R$9E01.
C $9CC5,3 Table address
b $9CE7 Sound data
@ $9CE7 label=table_at_9CE7
B $9CE7,86,8*10,6
c $9D3D Routine at 9D3D
D $9D3D Used by the routines at #R$9E75.
c $9D67 Routine at 9D67
D $9D67 Used by the routine at #R$9B99.
N $9D6D This entry point is used by the routine at #R$9D89.
c $9D89 Routine at 9D89
D $9D89 Used by the routine at #R$9D67.
w $9D91 Data block at 9D91
W $9D91,22,2
c $9DA7 Routine at 9DA7
c $9DB9 Routine at 9DB9
c $9DC4 Routine at 9DC4
c $9DE8 Routine at 9DE8
N $9DF2 This entry point is used by the routine at #R$9DC4.
N $9DFC This entry point is used by the routines at #R$9DA7 and #R$9DC4.
c $9E01 Routine at 9E01
c $9E5C Routine at 9E5C
c $9E75 Routine at 9E75
c $9E91 Play tune, preserve registers
D $9E91 Used by the routines at #R$82BF, #R$832A and #R$846B. I:A Index of tune
@ $9E91 label=call_play_tune
C $9E98,3 Play tune
c $9EA3 Routine at 9EA3
D $9EA3 Used by the routines at #R$8139, #R$832A, #R$8C52, #R$8E9D, #R$9934, #R$99A0, #R$99B1, #R$99D3, #R$A33B and #R$A6EC.
R $9EA3 I:A Index of sound
@ $9EA3 label=call_play_sound
C $9EAB,3 Play sound
b $9EB6 Sound data
B $9EB6,52,8*6,4
b $9EEA Sound data
B $9EEA,977,8*122,1
c $A2BB Routine at A2BB
D $A2BB Used by the routine at #R$9B99.
C $A2BB,2 Mute channel 1
C $A2C8,2 Mute channel 2
C $A2D5,2 Mute channel 3
C $A2E2,2 Mute channel 4
c $A2F3 Routine at A2F3
D $A2F3 Used by the routine at #R$A2BB.
N $A303 This entry point is used by the routine at #R$A31D.
c $A314 Send sound data to PSG
D $A314 Used by the routine at #R$A2BB.
R $A314 I:A
R $A314 I:C
R $A314 I:D
R $A314 I:IX
@ $A314 label=output_sound
c $A31D Routine at A31D
D $A31D Used by the routine at #R$A314.
c $A33B Routine at A33B
D $A33B Used by the routine at #R$82BF.
@ $A33B label=initial_game_loop
C $A33B,3 New center of projection at bottom center for implosion
C $A33E,3 Set #R$72C5, which will be copied to #R$7000
C $A341,3 Status flags
C $A344,2 Set bit 4
N $A346 Allocate 6 dot sprites for the implosion that becomes the ship
C $A346,4 Sprite init data
C $A34A,2 Allocate 6 sprites
C $A34C,1 Allocate sprite
C $A34D,4 Sprite type is $0D (a dot)
C $A351,4 Polar y
C $A355,4 Polar x
C $A359,1 Load sprite pattern
C $A35A,4 Polar y
C $A35E,3 Get init data
C $A361,3 Polar x
C $A364,4 Set color (pink)
C $A368,2 Next init data
C $A36A,2 Loop for 6 sprites
N $A36C Display implosion
C $A36C,2 20
C $A36E,1 Save counter
C $A36F,3 Move dots
C $A372,3 Control ship
C $A375,3 Upload sprite data
C $A378,1 Wait interrupt
C $A379,3 Display stars
C $A37C,3 Display center enemies
C $A37F,1 Restore counter
C $A380,2 Loop 20 times
N $A382 Allocate ship etc.
C $A385,1 Allocate sprite
C $A386,4 Sprite type $01 (ship 1)
C $A38A,4 Polar y
C $A38E,4 Polar x
C $A392,4 Set color (red)
C $A396,1 Load sprite pattern
C $A397,1 Allocate sprite
C $A398,4 Sprite type $01 (ship 2)
C $A39C,4 Polar y
C $A3A0,4 Polar x
C $A3A4,4 Set color (blue)
C $A3A8,1 Load sprite pattern
C $A3A9,3 Display ship background patterns
C $A3AC,3 Upload sprite data
N $A3B4 Game loop 60 times
C $A3B4,2 60
C $A3B6,1 Wait interrupt
C $A3B7,1 Save counter
C $A3B8,3 Display stars
C $A3BB,3 Control ship
C $A3BE,3 Display center enemies
C $A3C1,3 Upload sprites
C $A3C4,1 Restore counter
C $A3C5,2 Loop 60 times
C $A3C7,3 Clear warps line
C $A3CA,3 ...
C $A3CD,1 ...
C $A3CE,3 FILL_VRAM
C $A3D1,3 Status
C $A3D4,2 Check bit for 2 players
C $A3D6,1 Return if not
C $A3D7,3 Clear player message
C $A3DA,3 ...
C $A3DD,1 ...
C $A3DE,3 FILL_VRAM and return
c $A3E1 Routine at A3E1
D $A3E1 Used by the routine at #R$8139.
@ $A3E1 label=explode
C $A3E6,3 Display ship background patterns
C $A3E9,2 Not allocated
C $A3EB,3 1st sprite
C $A3EE,3 2nd sprite
C $A3F1,3 Active shots
C $A3F4,1 If zero
C $A3F5,2 Then skip ahead
N $A3F7 Deallocate all shots
C $A3F7,4 Sprite data table
C $A3FB,3 Size of each sprite
C $A3FE,2 32 sprites
C $A400,2 Is it type $02 (shot)?
C $A402,3 ...
C $A405,2 No, then skip
C $A407,4 Set as not allocated
C $A40B,4 Set y
C $A40F,2 Next sprite
C $A411,2 Loop 32 times
N $A413 Set center of projection for explosion
C $A413,3 Y and X of 1st sprite
C $A416,3 Add 4 to each
C $A419,1 ...
C $A41A,3 Save it in #R$72C5, which will be copied to #R$7000
C $A41D,3 Byte 2 of 1st sprite
C $A420,3 Save it temporary
N $A423 Allocate 6 sprites for explosion
C $A427,2 Allocate 6 sprites
C $A429,1 Allocate sprite
C $A42A,4 Sprite type is $0D (a dot)
C $A42E,4 Polar y
C $A432,4 Polar x
C $A436,4 Set color (pink)
C $A43A,1 Load sprite pattern
C $A43B,3 Restore byte 2 of 1st sprite
C $A43E,3 Add data from table
C $A441,2 Mod $40
C $A443,3 Set polar x on new sprite
C $A446,4 Set polar y
C $A44A,2 Next init data
C $A44C,2 Loop for 6 sprites
N $A44E Game loop for 3 seconds
C $A44E,2 20
C $A450,1 Outer loop
C $A451,3 Move dots
C $A454,3 Upload sprite data
C $A457,2 9
C $A459,1 Inner loop
C $A45B,3 Display stars
C $A45E,3 Process sprites
C $A461,3 Display center enemies
C $A467,3 Upload sprites
C $A46B,2 Loop 9 times
C $A46E,2 Loop 20 times
c $A471 Routine at A471
D $A471 Change polar y of sprite types $0D, according to bit 2 of #R$71EB. Used by the routines at #R$A33B and #R$A3E1.
@ $A471 label=move_dots
C $A471,3 Copy #R$72C5 to #R$7000
C $A474,3 ...
C $A477,2 32 sprites
C $A479,4 Sprite data
N $A47D This entry point is used by the routine at #R$A4A0.
C $A47D,3 Get type
C $A480,2 Is it $0D (a dot)?
C $A482,2 If not then move to next sprite
C $A484,1 Save counter
C $A485,3 Polar y
C $A488,3 Polar x
C $A48B,3 Polar to screen
C $A48E,3 Set y
C $A491,3 Set x
C $A494,3 Status
C $A497,2 Test bit
C $A499,2 If 1, decrement polar y
C $A49B,3 Else increment polar y
C $A49E,2 Skip next
C $A4A0,3 Decrement polar y
C $A4A3,1 Restore counter
C $A4A4,3 Size of each sprite
C $A4A7,2 Next sprite
C $A4A9,2 Loop 32 times
C $A4AB,3 Set #R$7000 back to original value
C $A4AE,3 ...
b $A4B2 Init data for implosion
@ $A4B2 implosion_polar_x
B $A4B2,6,6
b $A4B8 Sprite init data (polar x)
B $A4B8,6,6
b $A4BE Data block at A4BE
B $A4BE,475,8*59,3
c $A699 Display score
D $A699 Used by the routines at #R$8024, #R$80E8 and #R$846B.
R $A699 I:A Player 0 or 1
@ $A699 label=display_score
C $A699,4 Score player 1
C $A69D,2 Offset into name table player 1
C $A69F,1 If it player 1
C $A6A0,2 The skip ahead
C $A6A2,4 Score player 2
C $A6A6,2 Offset into name table player 2
C $A6A8,2 MSB of name table in VDP
C $A6AA,3 B = 3 (digits), C = 0 (zero character offset)
C $A6AD,3 Get 3rd score byte (most significant)
C $A6B0,1 Shift BCD digit into place
C $A6B1,1 ...
C $A6B2,1 ...
C $A6B3,1 ...
C $A6B4,3 Display most significant digit
C $A6B7,1 If B > 1
C $A6B8,2 Then don't choose new zero character offset
C $A6BA,2 Else choose ASCII 0 as zero character offset
C $A6BC,1 Increment again
C $A6BD,3 Get 3rd score byte (most significant)
C $A6C0,3 Display least significant digit
C $A6C3,2 Proceed to less significant score bytes
C $A6C5,2 Loop 3 times
c $A6C8 Display digit
D $A6C8 Used by the routine at #R$A699.
R $A6C8 I:A Digit 0 - 9
@ $A6C8 label=display_digit
C $A6C8,2 Isolate BCD digit
C $A6CA,2 If zero, skip displaying leading zeros by not setting C
C $A6CC,2 Use ASCII 0 as zero character offset by default
C $A6CE,1 Add zero character offset
C $A6CF,1 Write VDP byte
C $A6D0,1 Next VDP address
c $A6D2 Display lives
D $A6D2 Used by the routines at #R$82BF and #R$A6EC.
@ $A6D2 label=display-lives
C $A6D2,3 VDP address of 'lives'
C $A6D5,3 Count
C $A6D8,1 Value
C $A6D9,3 FILL_VRAM
C $A6DC,3 Get lives
C $A6DF,1 Display one less live
C $A6E0,1 Return if none to display
C $A6E1,1 Count
C $A6E2,3 VDP address
C $A6E5,2 Ship character
C $A6E7,1 Write VDP byte
C $A6E8,1 Next VDP address
C $A6E9,2 Loop
c $A6EC Add points to score
D $A6EC Used by the routines at #R$846B and #R$9978.
R $A6EC I: HL Points to add (BCD)
@ $A6EC label=add_score
C $A6EE,3 Save points to add (this buffer has one more byte)
C $A6F1,3 Current player
C $A6F4,3 Score player 1
C $A6F7,1 Is it player 1?
C $A6F8,2 The skip ahead
C $A6FA,3 Score player 2
C $A6FD,1 Save pointer to score
C $A6FE,3 Pointer to points to add
C $A701,2 3 bytes in score
C $A703,1 Get score byte
C $A704,1 Add points
C $A705,1 Adjust for BCD
C $A706,1 Store score byte
C $A707,1 Next score byte
C $A708,1 Next points byte
C $A709,2 Loop 3 times
C $A70B,1 Restore pointer to score
C $A70C,1 Advance to last byte of extra life score $71F5 or $71FB
C $A70D,1 ...
C $A70E,3 Point HL to byte at #R$71F8 or #R$71FE (initially set to 6)
C $A711,1 ...
C $A712,1 Save pointer
C $A713,2 3 bytes to check
C $A715,1 Get score byte
C $A716,1 Compare with extra life byte
C $A717,2 Exit loop if not equal
C $A719,1 Previous score byte
C $A71A,1 Previous extra life byte
C $A71B,2 Loop 3 times
C $A71D,1 All equal, set A = 0
C $A71E,1 Restore pointer to #R$71F8 or #R$71FE
C $A71F,2 Return if extra life byte was bigger
C $A721,1 Next extra life at 80000 more points
C $A722,2 ...
C $A724,1 ...
C $A725,1 ...
C $A726,3 Get lives
C $A729,2 Return if already 9
C $A72B,2 ...
C $A72D,1 Extra life
C $A72E,3 Save it
C $A731,3 Display lives
C $A734,2 Play a sound
C $A736,3 ...
c $A73C Control ship
D $A73C Control ship movement and fire using controllers Used by the routines at #R$8024, #R$832A, #R$832A, #R$846B and #R$A33B.
@ $A73C label=control_ship
C $A73C,3 Get frame
C $A73F,2 Test bit 0
C $A741,1 Return every 2nd frame
C $A742,3 Controller: #R$71F1
C $A745,2 Segment 0
C $A747,3 DECODER (H = fire, L = joystick (bit 0: up, bit 1: right, bit 2: down, bit 3: left))
C $A74A,2 Reset fire
C $A74C,3 Movement table
C $A74F,1 Add joystick result (0 - 12, some values not possible)
C $A750,4 Sprite 0 data (ship)
C $A754,2 Direction = 1 (clockwise)
C $A756,1 Get table value, which is the value of polar x to move towards
C $A757,2 Is it an impossible joystick value, e.g. up + down?
C $A759,2 Then skip ahead
C $A75B,3 Table value - polar x
C $A75E,2 If zero the skip ahead (alredy there)
C $A760,2 If positive skip ahead
C $A762,2 Direction = -1 (anti-clockwise)
C $A764,2 abs(value - polar x)
C $A766,2 Is the difference < 33?
C $A768,1 Direction
C $A769,2 The skip ahead
C $A76B,2 Otherwise reverse direction
C $A76D,3 Polar x + direction
C $A770,2 Mod 64
C $A772,3 Update polar x
C $A775,3 Also update sprite 1
C $A778,1 Load sprite pattern sprite 0
C $A779,4 Sprite 1
C $A77D,1 Load sprite pattern sprite 1
C $A77E,3 Display ship background patterns
N $A781 Handle fire
C $A787,3 Controller: #R$71F1
C $A78A,1 Save current player
C $A78B,2 Segment 0
C $A78D,3 DECODER (H = fire, L = joystick)
C $A790,1 Fire
C $A791,1 Restore current player
C $A792,1 Save fire segment 0
C $A793,2 Segment 1
C $A795,3 DECODER
C $A798,1 Restore fire segment 0
C $A799,1 Combine with fire segment 1
C $A79A,3 Flags
C $A79D,2 Test fire pressed
C $A79F,2 If not, clear bit for fire pressed, and return
C $A7A1,2 Check if fire was pressed last time
C $A7A3,1 Then return (must release after each shot)
C $A7A4,3 Get number of active shots
C $A7A7,2 Test for double shot
C $A7A9,2 Skip ahead if single shot
C $A7AB,2 Divide by 2 (allow twice as many shots)
C $A7AD,2 Return if >= 2
C $A7AF,1 ...
C $A7B0,2 No effect
C $A7B2,1 Some instructions removed here?
C $A7B3,1 ...
C $A7B4,1 ...
C $A7B5,3 Increment number of active shots
C $A7B8,1 ...
C $A7B9,3 ...
C $A7BC,2 Set bit for fire pressed
C $A7BE,2 Test for double shot
C $A7C0,2 Jump for double shot
C $A7C2,1 Allocate sprite
C $A7C3,3 Ship's polar coordinates
C $A7C6,3 Shot y = ship y
C $A7C9,3 Shot x = ship x
C $A7CC,4 Shot type
C $A7D0,4 Set color
C $A7D4,1 Return
c $A7D5 Routine at A7D5
D $A7D5 Used by the routine at #R$A73C.
C $A7D5,1 Allocate sprite
C $A7D6,3 Ship's polar coordinates
C $A7D9,1 Save them
C $A7DA,3 Set polar y same as ship's
C $A7DD,1 Ship's polar x
C $A7DE,1 One step clockwise
C $A7DF,2 Mod 64
C $A7E1,3 Set polar x
C $A7E4,4 Shot type
C $A7E8,4 Set color (yellow)
C $A7EC,1 Allocate sprite
C $A7ED,1 Restore ship's polar coordinates
C $A7EE,3 Set polar y same as ship's
C $A7F1,1 Ship's polar x
C $A7F2,1 One step anti-clockwise
C $A7F3,2 Mod 64
C $A7F5,3 Set polar x
C $A7F8,4 Shot type
C $A7FC,4 Set color (yellow)
C $A800,3 Increment number of active shots
C $A803,1 ...
C $A804,1 Return
c $A805 Routine at A805
D $A805 Used by the routine at #R$A73C.
C $A805,2 Clear bit for fire pressed
C $A807,1 Return
c $A808 Routine at A808
D $A808 Used by the routines at #R$832A, #R$A33B, #R$A3E1 and #R$A73C.
@ $A808 label=display_ship_background_patterns
C $A80F,4 Buffer for generated structure
C $A817,4 Pattern address LSB
C $A81B,4 Pattern address MSB
C $A81F,3 Ship's polar y
C $A824,2 Jump if >= 21
C $A826,3 Ship's polar x
C $A829,2 Polar x + 2
C $A82B,1 Rotate right 3 times
C $A82C,1 00XXXXXX -> XXX00XXX
C $A82E,2 XXX00XXX -> 00000XX0 (quadrant)
C $A830,3 Adjustment table
C $A833,1 Add A to HL
C $A834,3 Ship's screen x
C $A837,1 Add table value
C $A838,3 Store x
C $A83B,1 Next table address
C $A83C,3 Ship's screen y
C $A83F,1 Add table value
C $A840,3 Store y
C $A843,3 Ship's polar x
C $A846,2 Polar x + 2
C $A848,2 Keep 4 most significant bits, i.e. 16 offsets 4 bytes apart
C $A84A,1 HL = A
C $A84B,2 ...
C $A84D,1 x2
C $A84E,1 x4
C $A84F,1 x8, now 32 bytes apart
C $A850,3 Table of ship background patterns (32 bytes per frame)
C $A853,1 Add to offset
C $A854,3 Save LSB
C $A857,3 Save MSB
C $A85A,3 Display background patterns
b $A865 Data block at A865
@ $A865 label=movement_table
B $A865,1,1 0000
B $A866,1,1 0001 Up
B $A867,1,1 0010 Right
B $A868,1,1 0011 Up + right
B $A869,1,1 0100 Down
B $A86A,1,1 0101
B $A86B,1,1 0110 Down + right
B $A86C,1,1 0111
B $A86D,1,1 1000 Left
B $A86E,1,1 1001 Left + up
B $A86F,1,1 1010
B $A870,1,1 1011
B $A871,1,1 1100 Left + down
B $A872,1,1 1101
B $A873,1,1 1110
B $A874,1,1 1111
b $A875 Data block at A875
@ $A875 label=adjust_ship_x_y_table
B $A875,8,8
b $A87D Ship background patterns
D $A87D 16 frames of 4 patterns, organised as 16x16 sprite patterns #UDGTABLE(no-border, no-border) { #UDGARRAY32,,4($A87D-$AA75-16)(graphics-A87D.png) } { #UDGARRAY32,,4($A885-$AA7D-16)(graphics-A885.png) } TABLE#
@ $A87D label=ship_patterns
B $A87D,512,8
c $AA7D Routine at AA7D
D $AA7D Used by the routine at #R$8024.
@ $AA7D label=init_game_variables
C $AA7D,3 Set 36 bytes at #R$7207 to $FF
C $AA80,3 ...
C $AA83,3 ...
C $AA86,2 ...
C $AA88,2 ...
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
C $AAFA,3 Get stage data address in IY
C $AB09,3 End of #R$7207
C $AB0C,2 36 bytes
C $AB0E,2 Value to compare with
C $AB10,1 Test byte
C $AB11,2 If > $80 then skip ahead
C $AB13,1 Previous byte
C $AB14,2 Loop 36 times
c $AB17 Routine at AB17
D $AB17 Used by the routine at #R$AAF1.
C $AB1F,1 Allocate sprite
C $AB2B,3 Set color
C $AB32,1 Load sprite pattern
c $AB38 Routine at AB38
D $AB38 Used by the routines at #R$87F5, #R$98B5, #R$AB17 and #R$AB72.
c $AB53 Routine at AB53
D $AB53 Used by the routines at #R$9934 and #R$9A49.
C $AB5F,3 Get pattern
c $AB6C Routine at AB6C
D $AB6C Used by the routine at #R$AB53.
N $AB6F This entry point is used by the routine at #R$AB53.
c $AB72 Display tiny enemies at the center of the screen
D $AB72 Used by the routines at #R$8024, #R$8139, #R$832A, #R$846B, #R$A33B and #R$A3E1.
@ $AB72 label=display_center_enemies
C $ABBE,3 FILL_VRAM
c $ABFF Routine at ABFF
D $ABFF Used by the routine at #R$AB72.
C $AC17,1 Write VDP byte
c $AC32 Routine at AC32
D $AC32 Used by the routine at #R$ABFF.
C $AC3A,1 Write VDP byte
c $AC47 Routine at AC47
D $AC47 Used by the routine at #R$AB72.
b $AC87 Data block at AC87
B $AC87,88,8
c $ACDF Init sprite data
D $ACDF Used by the routines at #R$82BF, #R$90D6 and #R$A33B.
@ $ACDF label=init_sprite_data
C $ACDF,4 Address of sprite data
C $ACE3,3 Size of each sprite
C $ACE6,2 Number of sprites
C $ACE9,3 Number of allocated sprites
C $ACEC,3 Set pattern
N $ACEF This entry point is used by the routine at #R$AC47.
C $ACEF,4 Set as unallocated
C $ACF4,2 Advance to next sprite
C $ACF6,2 Loop for 32 sprites
c $ACF9 Upload sprite data to VDP
D $ACF9 Used by the routines at #R$832A, #R$84B1, #R$90D6, #R$A33B and #R$A3E1.
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
C $AD0E,1 Add A to HL
C $AD0F,3 Write 4 bytes for each sprite
C $AD13,3 WRITE_VRAM
C $AD17,3 Add 4 to destination
C $AD1E,2 Loop for each sprite
C $AD20,2 End marker byte
C $AD22,1 Write VDP byte
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
C $AD58,2 If >= $7F ($FF from init), sprite is available
C $AD5A,1 Sprite index++
C $AD5B,1 Advance to next sprite
C $AD5C,2 Loop for up to 32 sprites
C $AD5E,4 Not found, set to address in ROM (?)
C $AD62,2 And return
c $AD64 Routine at AD64
D $AD64 Used by the routine at #R$AD49.
@ $AD64 label=available_sprite_found
C $AD64,1 Save sprite address
C $AD65,2 Is bit 7 set, i.e. $FF?
C $AD67,2 If not, skip recoding in allocation table
C $AD69,3 Allocated sprites
C $AD6C,1 Record one more
C $AD6D,1 Read number back
C $AD6E,1 Add number to HL
C $AD6F,1 ...
C $AD70,3 ...
C $AD73,1 ...
C $AD74,1 Record sprite index in table
C $AD75,2 IX now holds sprite address
C $AD77,4 Init sprite
C $AD83,4 Set y
N $AD87 This entry point is used by the routine at #R$AD49.
c $AD8B Load sprite pattern (RST $30)
D $AD8B Used by the routine at #R$801B.
R $AD8B I:IX Pointer to sprite data
@ $AD8B label=load_sprite_pattern
C $AD90,3 DE = Sprite type
C $AD93,2 ...
C $AD95,3 Table of offsets for each sprite type into table at #R$B8FC
C $AD98,1 Add sprite type
C $AD99,1 Get graphics pointer offset for sprite type
C $AD9A,3 Table of pointers to graphics
C $AD9D,1 HL now points to graphics pointer
C $AD9E,3 Get polar that determines which scale we want
C $ADA1,3 Start with zero
C $ADA4,2 If bit 7 of polar y is set, skip ahead with E=0
C $ADA6,2 ...
C $ADA8,2 Skip ahead if polar y < 21
C $ADAA,2 ...
C $ADAC,1 Else set E = 1
C $ADAD,2 Skip ahead if polar y < 26
C $ADAF,2 ...
C $ADB1,1 Else set E = 2
C $ADB2,2 Skip ahead if polar y < 34
C $ADB4,2 ...
C $ADB6,1 Else set E = 3
C $ADB7,1 A = E
C $ADB8,1 Compare with graphics pointer LSB
C $ADB9,2 Jump if LSB of pointer >= 0..3 (not real address) TODO: Circumstantial, hard to convert?
C $ADBB,1 Get LSB of pointer
C $ADBC,1 Minus 1
C $ADBD,1 Advance to MSB
C $ADBE,1 B = MSB
C $ADBF,1 C = LSB - 1
C $ADC0,3 Get polar x
C $ADC3,2 Plus 2
C $ADC5,2 Mod 64
C $ADCA,1 If B = 0 (MSB of graphics pointer)
C $ADCB,1 ...
C $ADCC,2 Then skip ahead
C $ADCE,1 Else set A = 0
C $ADCF,2 And skip ahead
C $ADD1,2 Divide polar x by 2
C $ADD3,2 B times
C $ADD5,1 * 4
C $ADD6,1 ...
C $ADD7,1 + LSB -1
C $ADD8,1 Copy result into B, which is the index of pattern to fetch within sprite type
C $ADD9,3 Same as existing?
C $ADDC,2 If so, skip ahead
C $ADDE,3 Save result
C $ADE1,3 HL = Sprite type
C $ADE4,2 ...
C $ADE6,1 * 2
C $ADE7,3 Table address
C $ADEA,1 #R$72E0 + sprite type * 2
C $ADEB,1 Get LSB of VDP address
C $ADEC,1 TO MSB
C $ADED,1 Get MSB of VDP address
C $ADEE,1 Hl = Index of pattern to fetch within sprite type
C $ADEF,2 ...
C $ADF1,1 Multiply by 8
C $ADF2,1 ...
C $ADF3,1 ...
C $ADF4,1 And add DE
C $ADF5,1 Move HL into DE, which becomes source address
C $ADF6,3 Buffer
C $ADF9,3 Read 8 bytes
C $ADFC,3 READ_VRAM
C $ADFF,3 Get pattern
C $AE02,1 Multiply by 8
C $AE03,1 ...
C $AE04,1 ...
C $AE05,1 ...
C $AE06,2 DE = $800 + pattern * 8
C $AE08,3 Source
C $AE0B,3 Write 8 bytes
C $AE0E,3 WRITE_VRAM
C $AE11,3 Get sprite type
C $AE14,2 If 1, i.e. ship 2
C $AE16,2 Then skip ahead
C $AE18,3 Polar y
C $AE1B,3 Polar x
C $AE1E,3 Polar to screen
C $AE21,3 Set y
C $AE24,3 Set x
C $AE27,2 If carry, sprite is outside visible screen, skip ahead
C $AE29,2 Return
C $AE2B,3 If sprite type is ship 2, set HL to table address
C $AE2E,3 Pattern index
C $AE31,2 Mod 4
C $AE3B,3 #R$AFDD+2 = ship 2 address
C $AE3E,1 Add A to HL
C $AE3F,3 Ship screen y
C $AE42,1 Add table value
C $AE43,3 Set y
C $AE46,1 Next table address
C $AE47,3 Ship screen x
C $AE4A,1 Add table value
C $AE4B,3 Set x
N $AE4E This entry point is used by the routines at #R$AE54 and #R$AE75.
c $AE54 Routine at AE54
D $AE54 Used by the routine at #R$ADD1.
C $AE54,3 Get sprite type
C $AE57,2 Jump if < 12
C $AE59,2 ...
C $AE5B,2 Jump if < 14
C $AE5D,2 ...
C $AE5F,2 Jump if < 18
C $AE61,2 ...
C $AE63,2 Jump if >= 24
C $AE65,2 ...
C $AE67,2 Jump if < 18
C $AE69,2 ...
C $AE6B,2 Jump if >= 20
C $AE6D,2 ...
C $AE73,2 Set off-screen values and return
c $AE75 Routine at AE75
D $AE75 Used by the routine at #R$AE54.
N $AE86 This entry point is used by the routine at #R$AE54.
C $AE86,4 Set as not allocated
C $AE8A,4 Set x
C $AE8E,4 Set y
c $AE94 Upload sprite patterns
D $AE94 Fill VDP RAM from $2100 to $3868 with sprite patterns that may be flipped and shifted. One new pattern is generated with each call. Builds a table of VDP addresses in #R$72E0. Used by the routine at #R$90D6.
@ $AE94 label=upload_sprite_patterns
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
C $AECA,1 Add A to HL
C $AECB,1 Load DE with value from table
C $AECE,3 Table of pointers to graphics
C $AED1,1 Add offset
C $AED2,3 Save address of pointer
C $AED5,3 Get counter
C $AED8,1 Increment
C $AED9,1 Double
C $AEDA,1 Add A to HL
C $AEDB,1 Get LSB of pointer
C $AEDD,1 Get MSB of pointer
C $AEDE,1 Now HL pointer to graphics
C $AEDF,3 Get counter
C $AEE2,2 0, 1, 2, 3
C $AEE4,1 0, 2, 4, 6
C $AEE5,1 0, 4, 8, 12
C $AEE6,1 0, 8, 16, 32
C $AEE7,1 Add A to HL
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
C $AF15,3 Source for writing to VDP RAM
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
C $AF64,1 ...
C $AF65,2 Then set it to $FF (done)
C $AF67,3 ...
c $AF6B Flip horizontal
D $AF6B Take 8 bytes pointed to by $72DE and place them after, bit reversed. Returns address of reversed bytes in $72DE. Used by the routine at #R$AE94.
@ $AF6B label=flip_horz
c $AFAE Flip vertical
D $AFAE Take 8 bytes pointed to by $72DE and place them after in reverse order. Returns address of reversed bytes in $72DE. Used by the routine at #R$AE94.
@ $AFAE label=flip_vert
c $AFC2 Shift left
D $AFC2 Take 8 bytes pointed to by $72DE and place them after, left shifted one bit. Returns address of shifted bytes in $72DE. Used by the routine at #R$AE94.
@ $AFC2 label=shift_left
b $AFDD Table at AFDD
@ $AFDD label=table_at_AFDD
B $AFDD,34,8*4,2
c $AFFF Display stars
D $AFFF Used by the routines at #R$8024, #R$8139, #R$8170, #R$832A, #R$832A, #R$846B, #R$90D6, #R$A33B and #R$A3E1.
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
R $B023 I:C Mask $00 or $FF
@ $B023 label=display_star_frame
C $B023,3 0, 2, 4, 6, 8, 10
C $B026,3 Table of pointers
C $B029,1 Add A to HL
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
C $B040,1 Write VDP byte A to DE
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
b $B136 Star patterns
D $B136 #UDGTABLE { #UDGARRAY18,,4($B136-$B1C5-8)(graphics-B136.png) } TABLE#
B $B136,144,8
c $B1C6 Convert polar to screen coordinates
D $B1C6 Used by the routines at #R$8F0F, #R$8F55, #R$A471, #R$AB72 and #R$ADD1.
R $B1C6 I:IX Pointer to sprite data
R $B1C6 I:D Polar y
R $B1C6 I:E Polar x
R $B1C6 O:D Screen y
R $B1C6 O:E Screen x
R $B1C6 O:Carry flag set if out of screen
@ $B1C6 label=polar_to_screen
C $B1CA,2 11
C $B1CC,1 Polar y + 11
C $B1CD,3 If this is 128 or more (polar y > 116), then set position outside screen and return
C $B1D0,1 Calculate table address, starting with y + 11 (11 first table rows are never used?)
C $B1D3,1 (y + 11) * 32
C $B1D4,1 ...
C $B1D5,1 ...
C $B1D6,1 ...
C $B1D7,1 ...
C $B1D8,1 x
C $B1D9,2 Is bit 4 set (top left or lower right quadrants)?
C $B1DB,2 Jump if not
C $B1DD,1 Else invert (0 -> 15, 1 -> 14, etc.)
C $B1DE,2 Use the first 4 inverted bits
C $B1E0,1 x2 (2 bytes per x)
C $B1E1,1 Add to address
C $B1E2,1 ...
C $B1E3,2 ...
C $B1E5,1 ...
C $B1E6,3 Lookup table base address
C $B1E9,1 Add to address
C $B1EA,1 Get table value
C $B1EB,2 If $FF
C $B1ED,2 Then set position outside screen and return
C $B1EF,4 Center of projection
C $B1F3,1 x
C $B1F4,1 Shift right
C $B1F5,1 Bit 4 is now set if bit 5 (left/right) and bit 4 (top left/lower right) were different, i.e. top of screen
C $B1F6,2 Test bit 4 (top of screen)
C $B1F8,1 Get table value
C $B1F9,2 Skip negating if not top of screen
C $B1FB,2 -table value
C $B1FD,3 +center y ($60)
C $B200,2 -4 (adjust for sprite size)
C $B202,1 Store as sprite y
C $B203,1 Next table address
C $B204,1 Get table value
C $B205,2 Test bit 5 of x (left/right)
C $B207,2 Skip negating if right
C $B209,2 -table value
C $B20B,3 +center x ($80 or $B5 or ?)
C $B20E,2 -4 (adjust for sprite size)
C $B210,1 Store as sprite x
C $B211,1 Clear carry flag
C $B212,1 Return
C $B213,1 ...
C $B214,2 ...
C $B216,1 ...
C $B217,3 Set return position outside screen
C $B21A,1 Set carry flag
C $B21B,2 To return
b $B21D Polar to screen coordinates lookup table
D $B21D 16 (y, x) pairs (32 bytes) for each depth value (polar y) (y, x) are offsets from center of screen
@ $B21D label=polar_to_screen_table
B $B21D,1728,32
b $B8DD Graphics pointer offsets
D $B8DD Offsets into data block at B8FA
@ $B8DD label=graphics_pointer_offsets_table
B $B8DD,29,8*3,5
b $B8FA Data block at B8FA
B $B8FA,2,2
w $B8FC Graphics pointers
@ $B8FC label=graphics_pointers_table
W $B8FC,2,2 $00 type $00: Offset $00
W $B8FE,2,2 $01
W $B900,2,2 $02
W $B902,2,2 $03
W $B904,2,2 $04
W $B906,2,2 $05 type $01: Offset $0A
W $B908,2,2 $06
W $B90A,2,2 $07
W $B90C,2,2 $08
W $B90E,2,2 $09
W $B910,2,2 $0A type $02: Offset $14
W $B912,2,2 $0B
W $B914,2,2 $0C
W $B916,2,2 $0D
W $B918,2,2 $0E
W $B91A,2,2 $0F type $03: Offset $1E
W $B91C,2,2 $10
W $B91E,2,2 $11 type $04: Offset $22
W $B920,2,2 $12
W $B922,2,2 $13
W $B924,2,2 $14
W $B926,2,2 $15
W $B928,2,2 $16 type $05: Offset $2C
W $B92A,2,2 $17
W $B92C,2,2 $18
W $B92E,2,2 $19
W $B930,2,2 $1A
W $B932,2,2 $1B type $06: Offset $36
W $B934,2,2 $1C
W $B936,2,2 $1D type $07: Offset $3A
W $B938,2,2 $1E
W $B93A,2,2 $1F type $08: Offset $3E
W $B93C,2,2 $20
W $B93E,2,2 $21 type $09: Offset $42
W $B940,2,2 $22
W $B942,2,2 $23 type $0A: Offset $46
W $B944,2,2 $24
W $B946,2,2 $25 type $0B: Offset $4A
W $B948,2,2 $26
W $B94A,2,2 $27 type $0C: Offset $4E
W $B94C,2,2 $28
W $B94E,2,2 $29 type $0D: Offset $52
W $B950,2,2 $2A
W $B952,2,2 $2B type $0E: Offset $56
W $B954,2,2 $2C
W $B956,2,2 $2D
W $B958,2,2 $2E
W $B95A,2,2 $2F
W $B95C,2,2 $30 type $0F: Offset $60
W $B95E,2,2 $31
W $B960,2,2 $32
W $B962,2,2 $33
W $B964,2,2 $34
W $B966,2,2 $35 type $10: Offset $6A
W $B968,2,2 $36
W $B96A,2,2 $37
W $B96C,2,2 $38
W $B96E,2,2 $39
W $B970,2,2 $3A type $11: Offset $74
W $B972,2,2 $3B
W $B974,2,2 $3C
W $B976,2,2 $3D
W $B978,2,2 $3E
W $B97A,2,2 $3F type $12: Offset $7E
W $B97C,2,2 $40
W $B97E,2,2 $41
W $B980,2,2 $42
W $B982,2,2 $43
W $B984,2,2 $44 type $13: Offset $88
W $B986,2,2 $45
W $B988,2,2 $46
W $B98A,2,2 $47
W $B98C,2,2 $48
W $B98E,2,2 $49 type $14: Offset $92
W $B990,2,2 $4A
W $B992,2,2 $4B
W $B994,2,2 $4C
W $B996,2,2 $4D
W $B998,2,2 $4E type $15: Offset $9C
W $B99A,2,2 $4F
W $B99C,2,2 $50
W $B99E,2,2 $51
W $B9A0,2,2 $52
W $B9A2,2,2 $53 type $16: Offset $A6
W $B9A4,2,2 $54
W $B9A6,2,2 $55
W $B9A8,2,2 $56
W $B9AA,2,2 $57
W $B9AC,2,2 $58 type $17: Offset $B0
W $B9AE,2,2 $59
W $B9B0,2,2 $5A
W $B9B2,2,2 $5B
W $B9B4,2,2 $5C
W $B9B6,2,2 $5D type $18: Offset $BA
W $B9B8,2,2 $5E
W $B9BA,2,2 $5F
W $B9BC,2,2 $60
W $B9BE,2,2 $61
W $B9C0,2,2 $62 type $19: Offset $C4
W $B9C2,2,2 $63
W $B9C4,2,2 $64
W $B9C6,2,2 $65
W $B9C8,2,2 $66
W $B9CA,2,2 $67 type $1A: Offset $CE
W $B9CC,2,2 $68
W $B9CE,2,2 $69
W $B9D0,2,2 $6A
W $B9D2,2,2 $6B
W $B9D4,2,2 $6C type $1B: Offset $D8
W $B9D6,2,2 $6D
W $B9D8,2,2 $6E
W $B9DA,2,2 $6F
W $B9DC,2,2 $70
W $B9DE,2,2 $71 type $1C: Offset $E2
W $B9E0,2,2 $72
W $B9E2,2,2 $73
W $B9E4,2,2 $74
b $B9E6 Graphics
D $B9E6 #UDGTABLE { #UDGARRAY37,,4($B9E6-$BFAD-8)(graphics-B9E6.png) } TABLE#
@ $B9E6 label=graphics_patterns
B $B9E6,1480,8
c $BFAE Random number generator (RST $20)
D $BFAE Used by the routine at #R$8015.
@ $BFAE label=rnd
s $BFCF Unused
B $BFCF,49,8*6,1
s $C000 Unused
S $C000,16384,$4000
