@ $4000 start
@ $4000 org
s $4000 Unused
S $4000,12288,$3000
w $7000 Center of projection
@ $7000 label=center_of_projection
W $7000,2,2
b $7002 Sprite data
D $7002 Contains data for 32 sprites, or actually entities, since only those entities with entries in the #R$7183 are rendered as sprites. Other entities have entries in the #R$7207 and are rendered in a bitmap at the center of the screen.
D $7002 #TABLE(default, default) { =h Byte offset | =h Purpose } { $00 | Sprite type, or $FF if not allocated } { $01 | Polar y (depth, -11 is closest, 0 is normal ship position, 116 is furthest away) } { $02 | Polar x (angle, 0 at bottom center, moving clockwise to 16 at the left side, 32 at the top, and 48 at the right side) } { $03 | Movement counter, velocity. For enemy, upper nybble from path data, lower nybble sprite position in wave } { $04 | Loaded pattern index within sprite type, $FF means not loaded } { $05 | Copy of sprite type to check for pattern reload } { $06 | Replacement sprite type when destroyed, or LSB of path address } { $07 | Flags, velocity, or MSB of path address } { $08 | Screen y } { $09 | Screen x } { $0A | Pattern } { $0B | Color } TABLE#
D $7002 #TABLE(default, default) { =h Sprite type | =h Pattern example | =h Description } { $00 | #UDG$B9E6 | Ship body } { $01 | #UDG$BA66 | Ship exhaust } { $02 | #UDG$BAE6 | Shot } { $03 | #UDG$BB06 | Double shot pickup } { $04 | #UDG$BB0E | Dots (another explosion) } { $05 | #UDG$BB2E | Destroyed enemy  } { $06 | #UDG$BB4E | Number 5 } { $07 | #UDG$BB56 | Number 10 } { $08 | #UDG$BB5E | Number 15 } { $09 | #UDG$BB66 | Number 20 } { $0A | #UDG$BB6E | Number 25 } { $0B | #UDG$BB76 | Number 30 } { $0C | #UDG$BB7E | Number 00 } { $0D | #UDG$BDE6 | Explosion dot } { $0E | #UDG$BB86 | Enemy } { $0F | #UDG$BC06 | Enemy } { $10 | #UDG$BC86 | Enemy } { $11 | #UDG$BD06 | Enemy } { $12 | #UDG$BD86 | Enemy missile 1 } { $13 | #UDG$BDA6 | Enemy missile 2 } { $14 | #UDG$BDC6 | Meteor } { $15 | #UDG$BDEE | Laser fence end 1 } { $16 | #UDG$BE4E | Laser fence end 2 } { $17 | #UDG$BEAE | Laser fence center } { $18 | #UDG$BF0E | Star shaped enemy } { $19 | #UDG$BF2E | Three spheres } { $1A | #UDG$BF4E | Enemy (chance stage) 1 } { $1B | #UDG$BF6E | Enemy (chance stage) 2 } { $1C | #UDG$BF8E | Enemy (chance stage) 3 } TABLE#
@ $7002 label=sprite_data
B $7002,384,12
b $7182 Number of allocated sprites
@ $7182 label=allocated_sprites
B $7182,1,1
b $7183 Sprite allocation table
D $7183 Contains #R$7182 indexes into #R$7002
@ $7183 label=sprite_allocation_table
B $7183,32,8
b $71A3 Temporary storage (72 bytes)
@ $71A3 label=buffer
B $71A3,72,8
b $71EB Status flags
D $71EB #TABLE(default, default) { =h Bit | =h Purpose } { $00 | Set during warp } { $01 | Set when all waves are completed } { $02 | Set when you die } { $03 | Set during chance stage } { $04 | Set during stage init } { $05 | Set for two-player game when one is game over } { $06 | Set during main loop } { $07 | Two-player game } TABLE#
@ $71EB label=status_flags
B $71EB,1,1
b $71EC Stars move countdown
@ $71EC label=stars_countdown
B $71EC,1,1
b $71ED Unused byte at 71ED
B $71ED,1,1
b $71EE Sprite countdown
D $71EE Decremented when #R$85E6 is called, and it reset to first byte of level data by #R$8A53. 4 sprite handler actions are only executed when counter is zero.
@ $71EE label=sprite_countdown
B $71EE,1,1
b $71EF Countdown to enemy shooting
D $71EF Reset to 2nd byte of stage data. See #R$8541.
@ $71EF label=countdown_at_shoot
B $71EF,1,1
b $71F0 Time to next wave
D $71F0 Reset to 6th byte of stage data. See #R$8541.
@ $71F0 label=countdown_to_wave
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
b $71F8 Score for getting extra life player 1 MSB
@ $71F8 label=score_extra_life_1_MSB
B $71F8,1,1
b $71F9 Score player 2
@ $71F9 label=score_player_2
B $71F9,3,3
b $71FC Score for getting extra life player 2
@ $71FC label=score_extra_life_2
B $71FC,2,2
b $71FE Score for getting extra life player 2 (MSB)
@ $71FE label=score_extra_life_2_MSB
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
b $7203 Stage data index
D $7203 Index (0-7) into #R$8541 (blocks of 8 bytes)
@ $7203 label=stage_data_index
B $7203,1,1
b $7204 Number of times died within stage
@ $7204 label=stage_death_count
B $7204,1,1
b $7205 Completed stages
D $7205 When stage reaches 24, this number is added here, and stage is reset to 0
@ $7205 label=completed_stages
B $7205,1,1
b $7206 Number of enemies
D $7206 Including enemies at the center of the screen
@ $7206 label=total_enemies
B $7206,1,1
b $7207 Map of center enemies
D $7207 Initialized to $FF meaning unused
@ $7207 label=center_enemy_map
B $7207,36,6
b $722B Number of center enemies
D $722B Number of map entries in #R$7207
@ $722B label=center_map_entries
B $722B,1,1
b $722C Number of active enemies
D $722C Excluding enemies at the center of the screen.
@ $722C label=active_enemies
B $722C,1,1
b $722D Number of 3-spheres/mines left
D $722D 3 - 0 during mines sub-stage.
@ $722D label=mines_left
B $722D,1,1
b $722E Ship background data
@ $722E label=ship_background_data
B $722E,9,9
b $7237 Mines background data
D $7237 3x9 bytes #TABLE(default, default) { =h Byte | =h Purpose } { $00 | Screen x } { $01 | Screen y } { $02 | Name table address of area to clear LSB } { $03 | Name table address of area to clear MSB } { $04 | Patterns address LSB } { $05 | Patterns address MSB } { $06 | Name } { $07 | Polar y } { $08 | Polar x } TABLE#
@ $7237 label=mines_background_data
B $7237,27,9
b $7252 Active enemy shots
D $7252 Set to $FF during explosion
@ $7252 label=active_enemy_shots
B $7252,1,1
b $7253 Number of active shots
@ $7253 label=active_shots
B $7253,1,1
b $7254 Mines destroyed
@ $7254 label=mines_destroyed
B $7254,1,1
b $7255 Enemies destroyed in chance stage
@ $7255 label=bonus_enemies_hit
B $7255,1,1
b $7256 Other flags
D $7256 #TABLE(default, default) { =h Bit | =h Purpose } { $00 | Fire pressed last time } { $01 | Double shot pickup } { $02 | Set when mines exist } { $03 | Ever set? Reset when laser fence destroyed } { $04 | Set when laser fence exists } { $05 | Set when stage starts. Reset when wave starts. Set when enemy hit } { $06 | Set when wave starts } { $07 | Unused } TABLE#
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
b $725B Wave speed counter
@ $725B label=wave_speed_counter
B $725B,1,1
b $725C Number of enemies left center
D $725C Number of enemies that have left center in the current wave. Set to zero when all enemies are out.
@ $725C label=outcoming_enemies
B $725C,1,1
w $725D Wave data address
D $725D Pointer into #R$A4BE or #R$A51E
@ $725D label=wave_data_address
W $725D,2,2
b $725F Laser fence/meteor countdown
@ $725F label=laser_meteor_countdown
B $725F,1,1
b $7260 Sprite countdown 2
D $7260 Decremented when #R$85E6 is called, and it reset to first byte of level data (x2) by #R$8A53. One action at #R$87C1 is only executed when counter is zero.
@ $7260 label=sprite_countdown_2
B $7260,1,1
b $7261 Laser fence end 2 polar x
B $7261,1,1
b $7262 Laser fence end 1 polar x
B $7262,1,1
b $7263 Countdown. Mines are destroyed when zero.
@ $7263 label=mines_time_left
B $7263,1,1
b $7264 Mines action
D $7264 1 = create mines 2 = display mines
@ $7264 label=mines_action
B $7264,1,1
b $7265 Mines are destroyed if bit 0 is set
@ $7265 destroy_mines_flag
B $7265,1,1
b $7266 Related to when mines reappear
B $7266,1,1
b $7267 Mines movement table offset
@ $7267 label=mines_movement_table_offset
B $7267,1,1
b $7268 Mine name/pattern index
@ $7268 label=mine_name
B $7268,1,1
b $7269 Mine countdown to shoot
@ $7269 label=mine_countdown_to_shoot
B $7269,1,1
w $726A Pattern decoder length
@ $726A label=decoder_length
W $726A,2,2
b $726C Pattern decoder bits left
@ $726C label=decoder_bits_left
B $726C,1,1
b $726D Pattern decoder source byte
@ $726D label=decoder_source_byte
B $726D,1,1
b $726E Flag for showing double shot pickup
@ $726E label=offset_double_shot_flag
B $726E,1,1
b $726F Temporary polar x
@ $726F label=temp_polar_x
B $726F,1,1
w $7270 Pointer to data for PSG noise generator
D $7270 Points to #R$727D for tune. Changed (by #R$9CE3) to #R$72A5 for sound fx
@ $7270 label=ptr_psg_noise_data
W $7270,2,2
w $7272 Pointer to data for PSG tone generator 1
D $7272 Points to #R$7287 for tune.
@ $7272 label=ptr_psg_tone_1_data
W $7272,2,2
w $7274 Pointer to data for PSG tone generator 2
D $7274 Points to #R$7291 for tune.
@ $7274 label=ptr_psg_tone_2_data
W $7274,2,2
w $7276 Pointer to data for PSG tone generator 3
D $7276 Points to #R$729B for tune.
@ $7276 label=ptr_psg_tone_3_data
W $7276,2,2
b $7278 Last noise operation
@ $7278 label=last_noise_operation
B $7278,2,2
b $727A Is a tune playing?
D $727A Set to 5 when starting a tune, but any non-zero value could be used. Set to 0 when stopping a tune
@ $727A label=is_tune_playing
B $727A,1,1
b $727B Sound player countdown (tune speed?)
D $727B Counts down from 5 to zero, and certain sound player actions are only performed when 0.
@ $727B sound_player_countdown
B $727B,1,1
b $727C Index of tune playing
@ $727C label=tune_playing
B $727C,1,1
b $727D Tune data channel 1
D $727D #TABLE(default, default) { =h Byte | =h Purpose } { $00 | $00 for tone/noise else mute } { $01 | LSB of ... } { $02 | MSB of ... } { $03 | Frequency LSB } { $04 | Bits 4-7 attenuation, bits 0-3 frequency MSB or noise value  } { $05 | Countdown until next note } { $06 | Attenuation. Initialized to $50 } { $07 | Countdown for when to increase attenuation } { $08 | Speed. Initialized to $05 } { $09 | Countdown for relative loops } TABLE#
@ $727D label=tune_data_buffer_1
B $727D,10,10
b $7287 Tune data channel 2
@ $7287 label=tune_data_buffer_2
B $7287,10,10
b $7291 Tune data channel 3
@ $7291 label=tune_data_buffer_3
B $7291,10,10
b $729B Tune data channel 4
@ $729B label=tune_data_buffer_4
B $729B,10,10
b $72A5 Sound fx data channel 1
D $72A5 Sound fx data are initialised by #R$9CBF with data from #R$9CE7 #TABLE(default, default) { =h Byte | =h Purpose } { $00 | Channel, $00 for tone/noise else mute } { $01 | Unknown, $00, $DC, $40 } { $02 | Unknown, initialized to 0 } { $03 | Frequency LSB } { $04 | Bits 4-7 attenuation, bits 0-3 frequency 2 MSbits or noise value  } { $05 | Bits 0-3 command index, bit 7 must be set or channel is skipped } { $06 | Unknown, $00, $40, $80, $C0, $F0 } { $07 | Unknown, $00, $01, $03 } TABLE#
@ $72A5 label=sound_fx_data_buffer_1
B $72A5,8,8
b $72AD Sound fx data channel 2
@ $72AD label=sound_fx_data_buffer_2
B $72AD,8,8
b $72B5 Sound fx data channel 3
@ $72B5 label=sound_data_buffer_3
B $72B5,8,8
b $72BD Sound fx data channel 4
@ $72BD label=sound_fx_data_buffer_4
B $72BD,1,1
w $72BE Byte 1-2 of sound fx data 4
W $72BE,2,2
w $72C0 Byte 3-4 of sound fx data 4
W $72C0,2,2
b $72C2 Byte 5 of sound fx data 4
B $72C2,1,1
w $72C3 Byte 6-7 of sound fx data 4
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
b $72CB Update counters countdown
D $72CB Counter from $0F to $00. Other counters are updated when 0.
@ $72CB update_counters_countdown
B $72CB,1,1
b $72CC Center enemies redraw flag
@ $72CC label=center_enemies_redraw
B $72CC,1,1
b $72CD Counter for drawing center enemies
D $72CD Counts from $00 up to $24. Updated each frame.
@ $72CD label=center_enemy_processed
B $72CD,1,1
b $72CE First name used for center enemies 1
@ $72CE label=center_enemies_name_1
B $72CE,1,1
b $72CF First name used for center enemies 2
@ $72CF label=center_enemies_name_2
B $72CF,1,1
w $72D0 Pattern table address of center enemies
@ $72D0 label=center_enemies_pattern
W $72D0,2,2
b $72D2 Y counter direction
@ $72D2 label=y_counter_direction
B $72D2,1,1
b $72D3 Y counter
D $72D3 Goes -1, 0, 1, 0, -1, 0, 1, 0, ...
@ $72D3 label=y_counter
B $72D3,1,1
b $72D4 X counter
D $72D4 Counter $00 - $3F
@ $72D4 label=x_counter
B $72D4,1,1
b $72D5 Sprite type processed
D $72D5 Sprite type processed by #R$AE94
@ $72D5 label=sprite_type_processed
B $72D5,1,1
b $72D6 Transformation processed
D $72D6 Transformation processed by #R$AE94
@ $72D6 label=transformation_processed
B $72D6,1,1
b $72D7 Pattern index
D $72D7 Pattern index (within sprite type) processed by #R$AE94
@ $72D7 label=pattern_processed
B $72D7,1,1
w $72D8 Destination address in VDP
D $72D8 Destination address in VDP used by #R$AE94
@ $72D8 label=upload_destination
W $72D8,2,2
w $72DA Graphics pointer address
D $72DA Pointer to first entry in R#$B8FA for the current sprite type processed by #R$AE94
@ $72DA label=graphics_pointer_address
W $72DA,2,2
w $72DC Source address
D $72DC Source address used by #R$AE94
@ $72DC label=upload_source
W $72DC,2,2
w $72DE Pattern address
D $72DE Pattern address used by #R$AE94
@ $72DE label=pattern_address
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
B $731D,157,8*19,5
s $73BA OS RAM
S $73BA,56,$38
w $73F2 Sprite allocation table VDP address
@ $73F2 label=sat_vdp_address
W $73F2,2,2
w $73F4 Sprite pattern table VDP address
W $73F4,2,2
w $73F6 Name table VDP address
@ $73F6 label=name_table_vdp_address
W $73F6,2,2
s $73F8 OS RAM
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
C $80A5,3 Init variables
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
C $8100,3 Handle collisions
C $8106,3 READ_REGISTER
C $8109,3 Manage waves
C $810C,3 Create sprite from map entry
C $810F,3 READ_REGISTER
C $8112,3 Create laser fence
C $8115,3 Upload sprites
C $8118,3 Display center enemies
C $811B,3 Current player
C $811E,3 Display score
C $8121,3 Status flags
C $8124,2 Test bit 2
C $8126,3 Exit main loop if set
C $8129,2 Test bit 1
C $812B,2 Loop if not set
C $812D,3 Get total enemies
C $8130,3 Add enemy shots
C $8133,1 ...
C $8134,3 Stage completed when sum is zero
C $8137,2 Loop
c $8139 Died
D $8139 Used by the routine at #R$80E8.
@ $8139 label=died
C $8139,3 Stop tune
C $813C,2 Play explosion sound
C $813E,3 ...
C $8141,3 Reset main loop flag
C $8144,2 ...
C $8146,3 READ_REGISTER
C $8149,3 Update sprite types $0F - $11
C $814C,3 Explosion
C $814F,3 Get active enemies
C $8155,3 Get total enemies
C $815F,3 Display stars
C $8162,3 Process sprites
C $8168,3 Display center enemies
C $816B,3 Upload sprites
c $8170 Lose life
D $8170 Used by the routine at #R$8139.
@ $8170 label=lose_life
C $8170,3 Reset outcoming enemies
C $8173,3 Increase number of times died within stage
C $8176,1 ...
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
C $81E5,3 Set flag
C $81E8,2 ...
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
C $821F,2 Set sprite countdown to 1
C $8221,3 ...
C $8224,3 Clear died flag
C $8227,2 ...
N $8229 Calculate stage data index
C $8229,3 Get completed stages
C $822C,1 Test if zero
C $822D,2 If not, skip ahead to set max value
C $822F,3 Stage
C $8232,2 Compare stage to 4
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
C $830E,3 Status flags
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
C $832F,3 Clear main loop flag
C $8332,2 ...
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
C $8352,3 Stop tune
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
D $8541 #TABLE(default, default) { =h Byte offset | =h Purpose } { $00 | Speed } { $01 | Max enemy shots } { $02 | Enemy shooting speed } { $03 | Unknown } { $04 | Unknown } { $05 | Unknown } { $06 | Time between waves } { $07 | Unknown } TABLE#
@ $8541 label=stage_data_table
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
C $85E6,3 Decrement counter 1
C $85E9,1 ...
C $85EA,3 Decrement counter 2
C $85ED,1 ...
C $85EE,3 Decrement counter stopping at 0
C $85F1,1 ...
C $85F2,3 ...
C $85F5,3 ...
C $85F8,3 Flags
C $85FB,2 Reset laser fence flag
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
C $8627,3 Copy it to byte 5
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
c $8654 Deallocate enemy
D $8654 Used by the routines at #R$870C, #R$873E and #R$8848.
@ $8654 label=deallocate_enemy
C $8654,3 Decrease total enemies
C $8657,1 ...
C $8658,2 Deallocate sprite
c $865A Handle sprite type $02
D $865A Used by the routine at #R$85E6.
R $865A I:A Sprite type
R $865A I:IX Sprite data
@ $865A label=handle_sprite_type_02
C $865A,2 Is sprite type $02?
C $865C,3 If not proceed to next handler
N $865F Sprite type $02 (shot)
C $865F,3 Mark for pattern reload
C $8662,3 Get polar y
C $8665,1 Move shot
C $8666,1 ...
C $8667,3 And save again
C $866A,2 Is polar y now 7?
C $866C,2 If not, jump ahead
C $866E,4 Set color
C $8672,1 Return to #R$8A41
C $8673,2 Is polar y 43?
C $8675,1 Return if less than
C $8676,3 Decrease active shots
C $8679,1 ...
C $867A,3 Deallocate sprite
c $867D Handle sprite type $04 - $0C
D $867D Used by the routine at #R$865A.
R $867D I:A Sprite type
R $867D I:IX Sprite data
@ $867D label=handle_sprite_types_04_0C
C $867D,2 Is sprite type < $04
C $867F,2 Then jump
C $8681,2 Is it >= $0D
C $8683,2 Then jump
N $8685 Sprite types $04 - $0C (enemy remains, numbers)
C $8685,3 Decrement counter
C $8688,1 Return if not zero
C $8689,3 Increment sprite type
C $868C,4 Reset counter
C $8690,2 Is sprite type destroyed enemy?
C $8692,1 Then return
C $8693,3 Else get replacement type (probably number)
C $8696,1 If zero
C $8697,3 Then deallocate sprite
C $869A,3 Set new type
C $869D,4 Counter
C $86A1,4 No replacement type
C $86A5,4 Set color
C $86A9,4 Set loaded patten index to none
C $86AD,1 Load sprite pattern
C $86AE,2 Save sprite data address
C $86B0,1 Allocate new sprite for last digits of points
C $86B1,2 IY = old sprite
C $86B3,4 Set type if new sprite (number 00)
C $86B7,4 Counter
C $86BB,4 Set color
C $86BF,4 Set polar y
C $86C3,4 Set polar x
C $86C7,4 No replacement type
C $86CB,1 Load sprite pattern
C $86CC,3 Get screen y of old sprite
C $86CF,3 Set screen y of new sprite
C $86D2,3 Get screen x of old sprite
C $86D5,2 Add 8
C $86D7,3 Set screen x of new sprite
C $86DA,1 Pop return address
C $86DB,3 Jump back into sprite handler loop
c $86DE Handle sprite type  $14
D $86DE Used by the routine at #R$867D.
R $86DE I:A Sprite type
R $86DE I:IX Sprite data
@ $86DE label=handle_sprite_type_14
C $86DE,2 Is sprite type $014
C $86E0,2 If not, jump ahead
N $86E2 Sprite type $14 (meteor)
C $86E2,3 Mark for pattern reload
C $86E5,3 Decrement polar y
C $86E8,1 Return to #R$8A41
c $86E9 Handle sprite types $12 - $13
D $86E9 Used by the routine at #R$86DE.
R $86E9 I:A Sprite type
R $86E9 I:IX Sprite data
@ $86E9 label=handle_sprite_types_12_13
C $86E9,2 Is sprite type < $012
C $86EB,2 If so, jump ahead
C $86ED,2 Is sprite type >= $014
C $86EF,2 If so, jump ahead
N $86F1 Sprite types $12 - $13 (enemy missile)
C $86F1,3 Frame counter
C $86F4,1 Store in B
C $86F5,2 Every 2nd frame
C $86F7,1 Return to #R$8A41
C $86F8,1 Frame counter
C $86F9,2 Mod 16
C $86FB,2 If not zero then skip animation
C $86FD,3 Get sprite type
C $8700,2 Flip bit 0 to change between $12 and $13
C $8702,3 Save new type
C $8705,3 Mark for pattern reload
C $8708,3 Decrement polar y
C $870B,1 Return to #R$8A41
c $870C Handle sprite type $03
D $870C Used by the routine at #R$86E9.
R $870C I:A Sprite type
R $870C I:IX Sprite data
@ $870C label=handle_sprite_type_03
C $870C,2 Is sprite type $03?
C $870E,2 If not, jump ahead
N $8710 Sprite type $03 (double shot pickup)
C $8710,3 Check if you have died
C $8713,2 ...
C $8715,3 If so, deallocate and return
C $8718,3 Mark for pattern reload
C $871B,3 X velocity, set to $02 or $FE when created
C $871E,3 Add to polar x
C $8721,2 Mod 64
C $8723,3 Save again
C $8726,3 Counter, set to $10 when created
C $8729,1 Return if > 0
C $872A,3 Get ship polar x
C $872D,3 Get polar x
C $8730,3 Polar x distance
C $8733,2 Is it >= 4
C $8735,1 Then return
C $8736,3 Set double shot flag
C $8739,2 ...
C $873B,3 Deallocate and return
c $873E Handle sprite types $15 - $17
D $873E Used by the routine at #R$870C.
R $873E I:A Sprite type
R $873E I:IX Sprite data
@ $873E label=handle_sprite_types_15_17
C $873E,2 Is sprite type < $15
C $8740,2 If so, jump ahead
C $8742,2 Is sprite type >= $18
C $8744,2 If so, jump ahead
N $8746 sprite types $15 - $17 (laser fence)
C $8746,2 Mask = 7
C $8748,3 Check if you have died
C $874B,2 ...
C $874D,2 If not, skip next
C $874F,2 Else set Mask = 3
C $8751,3 Frame counter
C $8754,1 AND mask
C $8755,2 If not zero, skip next 2
C $8757,3 Decrement polar y
C $875A,3 Mark for pattern reload
C $875D,3 Flags
C $8760,2 Set laser fence flag
C $8762,3 Get sprite type
C $8765,2 If not laser fence center
C $8767,1 Then return to #R$8A41
C $8768,3 If bit 3 is reset
C $876B,2 ...
C $876D,3 Then deallocate
C $8770,3 Mark for pattern reload
C $8773,3 Get polar x
C $8776,3 Add velocity
C $8779,2 Mod 64
C $877B,3 Save new polar x
C $877E,3 Did center reach end 2?
C $8781,1 ...
C $8782,2 Then skip ahead
C $8784,1 Did center reach end 1?
C $8785,1 ...
C $8786,1 If not, return to #R$8A41
C $8787,3 Switch direction
C $878A,2 ...
C $878C,3 ...
C $878F,1 Return to #R$8A41
c $8790 Handle sprite types $0E - $11
D $8790 Used by the routine at #R$873E.
R $8790 I:A Sprite type
R $8790 I:IX Sprite data
@ $8790 label=handle_sprite_types_0E_11
C $8790,2 Is sprite type < $0E
C $8792,3 If so, jump ahead
C $8795,2 Is sprite type >= $12
C $8797,3 If so, jump ahead
N $879A Sprite type $0E - $11 (enemies)
C $879A,4 Check bit 7 of flags
C $879E,3 Update sprite path
C $87A1,4 Check bit 7 of polar y
C $87A5,3 If set, move towards viewer
C $87A8,4 Check bit 6 of flags
C $87AC,2 Create map entry for enemy sprite
C $87AE,4 Check bit 2 of flags
C $87B2,3 Move towards viewer
C $87B5,4 Check bit 0 of flags
C $87B9,3 Create enemy shot and ...
C $87BC,3 Sprite countdown 2
C $87BF,1 Return if not zero
C $87C0,1 ...
C $87C1,3 Create enemy shot
C $87C4,3 Decrement polar y
C $87C7,3 Ship polar x
C $87CA,3 Move towards x
C $87CD,4 Set sprite type
C $87D1,3 Mark for pattern reload
C $87D4,1 Return to #R$8A41
c $87D5 Create map entry for enemy sprite
D $87D5 Search for a value (pattern OR $80) in map. If not found, allocate an entry. If found, calculate coordinates and move towards them. Used by the routine at #R$8790.
R $87D5 I: IX Sprite data of enemy
@ $87D5 label=create_map_entry_for_sprite
C $87D5,3 Return if countdown
C $87D8,1 is not zero
C $87D9,1 ...
C $87DA,3 Mark for pattern reload
C $87DD,3 Get pattern
C $87E0,2 Set bit 7
C $87E2,2 Size of map
C $87E4,3 Address of map
C $87E7,1 Check entry
C $87E8,2 Break out if found
C $87EA,1 Next map address
C $87EB,2 Loop up to 36 times
C $87ED,3 Get pattern
C $87F0,2 Set bit 7
C $87F2,3 Add pattern to map. Return to #R$8A41
C $87F5,3 Now DE contains polar y,x
C $87F8,1 Get x from map
C $87F9,3 Compare with polar x
C $87FC,2 If same, skip ahead
C $87FE,3 Else jump out to #R$8AC0
C $8801,4 Change sprite type to enemy
N $8805 Move towards y
C $8805,3 Get polar y
C $8808,1 Compare with polar y from map
C $8809,2 If same, jump ahead
C $880B,2 If less than, skip to increment polar y
C $880D,3 Decrement polar y
C $8810,1 Return to #R$8A41
C $8811,3 Increment polar y
C $8814,1 Return to #R$8A41
c $8815 Enemy movement: Return enemy to map
D $8815 Used by the routine at #R$8801.
R $8815 I:IX Sprite data of enemy
@ $8815 label=return_enemy_to_map
C $8815,3 Get color (why not pattern?)
C $8818,1 Set in map
C $8819,3 Decrease active enemies
C $881C,1 ...
C $881D,3 Set a flag
C $8820,2 ...
C $8822,3 Deallocate sprite and return
c $8825 Enemy movement: Move enemy towards viewer
D $8825 Used by the routine at #R$8790.
R $8825 I:IX Sprite data of enemy
@ $8825 label=move_towards_viewer
C $8825,4 Change sprite type
C $8829,3 Mark for pattern reload
C $882C,3 Decrement polar y
C $882F,3 Get polar y
C $8832,2 Return if not $F2 (-14)
C $8834,1 Else continue into #R$8835
c $8835 Enemy movement: Determine action when out of screen
D $8835 Used by the routine at #R$8A2D.
R $8835 I:IX Sprite data of enemy
@ $8835 label=handle_out_of_screen
C $8835,4 If a flag is reset
C $8839,2 Then skip ahead and determine what to do
N $883B This entry point is used by the routine at #R$8848.
C $883B,4 Reset polar y back to center
C $883F,4 Reset polar x
C $8843,4 Set flags
C $8847,1 Return to #R$8A41
C $8848,4 Test flag
C $884C,2 If not set, skip ahead
C $884E,1 Random number
C $884F,2 0 - 3
C $8851,2 If not 0, jump back
C $8853,3 Decrement active enemies
C $8856,1 ...
C $8857,3 Set flag
C $885A,2 ...
C $885C,3 Deallocate and return
c $885F Enemy movement: Create enemy shot and move
D $885F Used by the routine at #R$8790. Called and jumped.
R $885F I:IX Sprite data of enemy
C $885F,3 Create enemy shot
C $8862,3 Get polar y
C $8865,2 Is it < $22
C $8867,2 Then jump ahead
C $8869,3 Decrement polar y
C $886C,4 Set counter
C $8870,4 Set sprite type
C $8874,3 Mark for pattern reload
c $8878 Enemy movement: Polar Y of enemy < $22
D $8878 Used by the routine at #R$885F.
C $8878,3 Get sprite countdown
C $887B,1 Return if not zero
C $887C,1 ...
C $887D,3 Get counter
C $8880,2 If >= $40
C $8882,2 Then jump to ...
C $8884,3 Get stage data address in IY
C $8887,1 Random number
C $8888,3 AND stage data byte 3 ($3F, $1F, $0F)
C $888B,2 If not all zeros, then jump (more likely on earlier stages)
C $888D,3 Decrement polar y
C $8890,3 Get polar y
C $8893,2 If it's 8
C $8895,2 Then jump ahead
C $8897,1 Random number
C $8898,2 0 - 15
C $889A,2 If it's not 0 then jump ahead
N $889C This entry point is used by the routine at #R$88BE.
C $889C,3 Ship polar x
C $889F,3 Move towards x
C $88A3,3 Set counter
C $88A6,1 Return to #R$8A41
c $88A7 Enemy movement: Called with random probability.
D $88A7 Used by the routine at #R$8878.
C $88A7,3 Get counter
C $88AA,1 Counter - 1
C $88AB,1 Store in B
C $88AC,3 Add polar x
C $88AF,2 Mod 64
C $88B1,3 Set polar x
C $88B4,2 16
C $88B6,1 16 + counter - 1
C $88B7,3 Set sprite type
C $88BA,3 Mark for pattern reload
C $88BD,1 Return to #R$8A41
c $88BE Enemy movement: Called with random probability.
D $88BE Used by the routine at #R$8878.
C $88BE,1 Random number
C $88BF,2 0 - 7
C $88C1,3 Table base address
C $88C4,1 Add A to HL
C $88C5,1 Get table value
C $88C6,3 Set counter
C $88C9,2 Compare to $40
C $88CB,2 If < $40 then jump to move towards ship
C $88CD,2 If > $40 then jump ahead
N $88CF This entry point is used by the routine at #R$8878.
C $88CF,4 Set flags
C $88D3,1 Return to #R$8A41
c $88D4 Enemy movement: Counter is >(=) $40
D $88D4 Used by the routines at #R$8878 and #R$88BE.
R $88D4 I:A counter (IX+$03)
C $88D4,2 If $41
C $88D6,2 Then jump to next routine
C $88D8,3 Decrement polar y
C $88DB,3 Get ship polar x
C $88DE,3 Move towards x
C $88E1,4 Set sprite type
C $88E5,3 Mark for pattern reload
C $88E8,3 Get polar y
C $88EB,2 Return if not 8
C $88ED,1 ...
C $88EE,4 Set counter
C $88F2,1 Return to #R$8A41
c $88F3 Enemy movement: Counter is $41
D $88F3 Used by the routine at #R$88D4.
C $88F3,3 Increment polar y
C $88F6,4 Set type to enemy
C $88FA,3 Mark for pattern reload
C $88FD,1 Return to #R$8A41
c $88FE Enemy movement: Update sprite path
D $88FE Used by the routine at #R$8790.
@ $88FE label=update_sprite_path
C $8903,3 Create enemy shot
C $8906,3 Get path address
C $8909,3 ...
C $890C,3 Get counter
N $890F This entry point is used by the routine at #R$892B.
C $890F,2 Decrement upper nybble
C $8911,3 Store again
C $8914,2 If upper nybble >= 0, then jump to move sprite
N $8916 This entry point is used by the routine at #R$8986.
C $8916,1 Else increment path address
C $8917,3 Set path address
C $891A,3 ...
C $891D,1 Get path byte
C $891E,2 If upper nybble >= 1
C $8920,2 Then jump ahead to update counter
C $8922,1 Else decrement lower nybble
C $8923,3 If negative then set sprite flag to $18 if path byte matches and return
C $8926,2 If zero then set sprite flag to $04 and return
C $8928,3 If positive then set sprite flag to $40 and return
c $892B Enemy movement: Upper nybble >= 1
D $892B Used by the routine at #R$88FE.
C $892B,2 Isolate upper nybble
C $892D,1 Save it
C $892E,3 Get counter
C $8931,2 And apply upper nybble
C $8933,1 ...
C $8934,2 Jump back into #R$88FE
c $8936 Enemy movement: Move sprite along path and update sprite type
D $8936 Used by the routine at #R$88FE.
R $8936 I:IX Sprite data
R $8936 I:HL Path address
@ $8936 label=move_animate_sprite_along_path
C $8936,1 Get path byte
C $8937,3 Get wave data address
C $893A,4 If bit 0 of counter is reset
C $893E,2 Then skip moving to next byte
C $8940,1 Else move to next byte
C $8941,2 Is bit 7 reset
C $8943,2 Then skip ahead
C $8945,2 Isolate bits 0-3
C $8947,2 If 1 (inc polar y)
C $8949,2 Then skip ahead
C $894B,2 If 4 (dec polar y)
C $894D,2 Then skip ahead
C $894F,2 Else flip bits 1 and 3
C $8951,3 Get polar x
C $8954,3 Get polar y
C $8957,3 Get sprite type
C $895A,2 If bit for incrementing polar y is reset
C $895C,2 Then skip next
C $895E,1 Increment polar y
C $895F,2 Sprite type $0E
C $8961,2 If bit for decrementing polar y is reset
C $8963,2 Then skip next
C $8965,1 Decrement polar y
C $8966,2 Sprite type $10
C $8968,2 If bit for decrementing polar x is reset
C $896A,2 Then skip next
C $896C,1 Decrement polar x
C $896D,2 Sprite type $0F
C $896F,2 If bit for incrementing polar x is reset
C $8971,2 Then skip next
C $8973,1 Increment polar x
C $8974,2 Sprite type $11
C $8976,3 Set sprite type
C $8979,3 Set polar y
C $897C,1 Polar x
C $897D,2 Mod 64
C $897F,3 Set polar x
C $8982,3 Mark for pattern reload
C $8985,1 Return to #R$8A41
c $8986 Enemy movement: Set sprite flags to $18 if ...
D $8986 Used by the routine at #R$88FE.
R $8986 I:IX Sprite data
R $8986 I:HL Path address
@ $8986 label=set_sprite_flags_to_18_if_match
C $8986,1 Advance path address
C $8987,3 Get counter
C $898A,2 Isolate sprite position in wave
C $898C,1 Compare with path byte
C $898D,2 If different, then jump back to #R$88FE
C $898F,4 Set flags
C $8993,1 Return to #R$8A41
c $8994 Enemy movement: Set sprite flags to $04
D $8994 Used by the routine at #R$88FE.
R $8994 I:IX Sprite data
R $8994 I:HL Path address
@ $8994 label=set_sprite_flags_to_04
C $8994,4 Set flags
C $8998,1 Return to #R$8A41
c $8999 Enemy movement: Set sprite flags to $40
D $8999 Used by the routine at #R$88FE.
R $8999 I:IX Sprite data
R $8999 I:HL Path address
@ $8999 label=set_sprite_flags_to_40
C $8999,4 Set flags
C $899D,1 Return to #R$8A41
c $899E Handle sprite types $18 - $1C
D $899E Used by the routine at #R$8790.
@ $899E label=handle_sprite_types_18_1C
C $899E,2 Is sprite type < $18
C $89A0,1 Then return
C $89A1,2 Is sprite type < $1A
C $89A3,2 If so, jump ahead
N $89A5 Sprite types $1A - $1C (circular enemies)
C $89A5,1 B = sprite type
C $89A6,3 Frame counter
C $89A9,2 Mod 4
C $89AB,2 If not zero the skip ahead
C $89AD,1 A = sprite type
C $89AE,1 A = sprite type + 1
C $89AF,2 Is sprite type + 1 < $1D, i.e. sprite type < $1C, i.e. $1A or $1B
C $89B1,2 Then skip next
C $89B3,2 Else set sprite type to $1A
C $89B5,3 This means rotate between $1A, $1B, and $1C
N $89B8 Sprite types $18 - $19 (three spheres, star shape) plus $1A - 1C
C $89B8,4 Text flag bit 7
C $89BC,2 If reset, move towards viewer
C $89BE,3 Return if countdown
C $89C1,1 is not zero
C $89C2,1 ...
C $89C3,3 Get path address
C $89C6,3 ...
C $89C9,3 Get counter
C $89CC,2 Decrement upper nybble
C $89CE,3 Save counter
C $89D1,2 If upper nybble >= 0 then jump ahead
C $89D3,1 Next path address
C $89D4,1 Get path byte
C $89D5,2 Decrement upper nybble
C $89D7,2 If < 0 then set flag and return
C $89D9,2 Isolate upper nybble
C $89DB,1 Save it
C $89DC,3 Get counter
C $89DF,2 And apply upper nybble
C $89E1,1 ...
C $89E2,3 ...
C $89E5,3 Set path address
C $89E8,3 ... (continue into #R$89EB)
c $89EB Circular enemy movement: Move sprite along path
D $89EB Used by the routine at #R$899E. Identical to code at #R$8936
@ $89EB label=move_sprite_along_path
C $89EB,1 Get path byte
C $89EC,3 Get wave data address
C $89EF,4 If bit 0 of counter is reset
C $89F3,2 Then skip moving to next byte
C $89F5,1 Else move to next byte
C $89F6,2 Is bit 7 reset
C $89F8,2 Then skip ahead
C $89FA,2 Isolate bits 0-3
C $89FC,2 If 1 (inc polar y)
C $89FE,2 Then skip ahead
C $8A00,2 If 4 (dec polar y)
C $8A02,2 Then skip ahead
C $8A04,2 Else flip bits 1 and 3
C $8A06,3 Get polar x
C $8A09,3 Get polar y
N $8A0C Identical to code at #R$895A except doesn't set sprite type
C $8A0C,2 If bit for incrementing polar y is reset
C $8A0E,2 Then skip next
C $8A10,1 Increment polar y
C $8A11,2 If bit for decrementing polar y is reset
C $8A13,2 Then skip next
C $8A15,1 Decrement polar y
C $8A16,2 If bit for decrementing polar x is reset
C $8A18,2 Then skip next
C $8A1A,1 Decrement polar x
C $8A1B,2 If bit for incrementing polar x is reset
C $8A1D,2 Then skip next
C $8A1F,1 Increment polar x
C $8A20,3 Set polar y
C $8A23,1 Polar x
C $8A24,2 Mod 64
C $8A26,3 Set polar x
C $8A29,3 Mark for pattern reload
C $8A2C,1 Return to #R$8A41
c $8A2D Circular enemy movement: Move enemy towards viewer
D $8A2D Used by the routine at #R$899E.
C $8A2D,3 Get polar y
C $8A30,2 If $F2 (-14)
C $8A32,3 Then jump to handler
C $8A35,3 Decrement polar y
C $8A38,3 Mark for pattern reload
C $8A3B,1 Return to #R$8A41
c $8A3C Circular enemy movement: Set sprite flags to $04
D $8A3C Used by the routine at #R$899E.
C $8A3C,4 Set flags
C $8A40,1 Return to #R$8A41
c $8A41 Return from sprite handler
D $8A41 Sprite handler branching out from #R$8600
@ $8A41 label=return_from_sprite_handler
C $8A41,3 Get sprite type
C $8A44,3 Same as before?
C $8A47,2 Skip ahead if so
C $8A49,4 Set loaded patten index to none
C $8A4D,1 Load sprite pattern
N $8A4E This entry point is used by the routine at #R$867D.
C $8A4E,1 Restore sprite allocation table address
C $8A4F,1 Increment address
C $8A50,3 Jump back into loop at #R$8600
c $8A53 When all sprites have been processed
D $8A53 Used by the routine at #R$85E6.
@ $8A53 label=all_sprites_processed
C $8A53,3 Get stage data address in IY
C $8A56,3 Get sprite countdown
C $8A59,1 Is it zero
C $8A5A,2 No, skip ahead
C $8A5C,3 Reset to first byte of stage data (speed?)
C $8A5F,3 ...
C $8A62,3 Get sprite countdown 2
C $8A65,1 Return is not zero
C $8A66,1 ...
C $8A67,3 Get stage data index
C $8A6A,2 Compare to 2
C $8A6C,3 Get first byte of stage data (speed?)
C $8A6F,2 If stage index >= 2, then skip ahead
C $8A71,1 Else multiply by 2
C $8A72,3 Save sprite countdown 2
C $8A75,1 Return from sprite processing
c $8A76 Create enemy shot
D $8A76 Used by the routines at #R$8790, #R$885F and #R$88FE.
@ $8A76 label=create_enemy_shot
C $8A76,3 Is countdown zero?
C $8A79,1 ...
C $8A7A,1 Return if not
C $8A7B,3 Get enemy shots
C $8A7E,2 Return if >= 7
C $8A80,1 ...
C $8A81,3 Flags
C $8A84,2 Is chance stage or died?
C $8A86,1 Then return
C $8A87,3 Get stage data address in IY
C $8A8A,3 Get enemy shots
C $8A8D,3 Compare with stage data byte 1
C $8A90,1 Return if shots >= max shots
C $8A91,3 Ship polar x
C $8A94,3 Compare with sprite polar x
C $8A97,1 Return if not equal
C $8A98,3 Reset countdown
C $8A9B,3 ...
C $8A9E,3 Increment enemy shots
C $8AA1,1 ...
C $8AA2,2 Save enemy sprite address
C $8AA4,1 Allocate sprite
C $8AA5,2 Now IY = enemy sprite and IX = shot
C $8AA7,2 Save enemy sprite
C $8AA9,3 Set polar y of shot to polar x of enemy
C $8AAC,3 ...
C $8AAF,3 Set polar x of shot to polar x of enemy
C $8AB2,3 ...
C $8AB5,4 Set sprite type
C $8AB9,4 Set color
C $8ABD,2 Restore enemy sprite
c $8AC0 Move towards x
D $8AC0 Used by the routines at #R$8790, #R$87F5, #R$8878 and #R$88D4.
R $8AC0 I:IX Sprite data
R $8AC0 I:A Polar x to move towards
@ $8AC0 label=move_towards_x
C $8AC0,2 Direction = 1
C $8AC2,3 Desired x - x
C $8AC5,1 Return if same
C $8AC6,2 Jump if desired >= x
C $8AC8,2 Direction = -1
C $8ACA,2 x = -x
C $8ACC,2 Compare with top center
C $8ACE,1 A = direction
C $8ACF,2 Jump if left half
C $8AD1,2 Invert direction in right half
C $8AD3,1 B = direction
C $8AD4,3 Direction + x
C $8AD7,2 Mod 64
C $8AD9,3 Save new x
C $8ADC,2 $10
C $8ADE,1 $10 + direction, i.e. $0F or $11
C $8ADF,3 Change sprite type?
C $8AE2,3 Increment counter
c $8AE6 Reset enemy sprite types after dying
D $8AE6 Used by the routine at #R$8139.
@ $8AE6 label=reset_enemy_sprite_types
C $8AE6,4 Sprite data
C $8AEA,3 Size of each sprite
C $8AED,2 32 sprites
C $8AEF,3 Get type
C $8AF2,2 If < $0E then move on
C $8AF4,2 ...
C $8AF6,2 If >= $12 then move on
C $8AF8,2 ...
C $8AFA,4 For types $0E - $11 (enemies), test flag bit 6
C $8AFE,2 If not set, move on
C $8B00,4 Set type to $10
C $8B04,4 Set flags to $0C
C $8B08,4 Set loaded patten index to none
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
C $8B8F,3 VDP pattern index (name)
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
c $8BD9 Manage waves
D $8BD9 Used by the routine at #R$80E8.
@ $8BD9 label=manage_waves
C $8BD9,3 Check bit for all waves completed
C $8BDC,2 ...
C $8BDE,1 Return if set
C $8BDF,3 Outcoming enemies
C $8BE2,1 Is it zero?
C $8BE3,3 If not, jump ahead to add enemy
C $8BE6,3 Get active enemies
C $8BE9,1 Return if not zero
C $8BEA,1 ...
C $8BEB,3 Frame counter
C $8BEE,2 3 of 4 times,
C $8BF0,2 skip ahead
C $8BF2,3 Get counter value
C $8BF5,1 Decrement value
C $8BF6,3 If negative, skip ahead
C $8BF9,3 Save counter again
C $8BFC,3 Get wave
C $8BFF,2 Compare to 4
C $8C01,2 If < 4, jump ahead
C $8C03,2 If = 4, jump ahead
C $8C05,2 If > 4, jump ahead
c $8C07 Manage wave = 4
D $8C07 Used by the routine at #R$8BD9.
@ $8C07 label=manage_wave_eq_4
C $8C07,3 Test for chance stage
C $8C0A,2 ...
C $8C0C,2 If set, set bit for all waves completed
C $8C0E,3 Number of center enemies
C $8C11,2 If >= 6,
C $8C13,2 Then init mine sub-stage
C $8C15,1 Random number
C $8C16,2 If < 20,
C $8C18,2 Then skip ahead
C $8C1A,2 - 20
C $8C1C,2 Loop until small enough
c $8C1E Init mine sub-stage
D $8C1E Used by the routines at #R$8BD9 and #R$8C07. Init mine sub-stage when wave > 4 or wave = 4 and not chance stage.
@ $8C1E label=init_mine_sub_stage
C $8C1E,1 A = 0
C $8C1F,3 Reset outcoming enemies
C $8C22,3 Reset counter
C $8C25,3 Set all waves completed flag
C $8C28,2 ...
C $8C2A,3 Reset flag
C $8C2D,2 ...
c $8C30 Manage wave < 4
D $8C30 Used by the routine at #R$8BD9.
@ $8C30 label=manage_wave_lt_4
C $8C30,3 Get counter
C $8C33,1 Is it zero?
C $8C34,1 Then return
C $8C35,3 Get stage
C $8C38,2 Isolate planet index bits
C $8C3A,3 Add wave
C $8C3D,1 ...
N $8C3E This entry point is used by the routine at #R$8C07.
C $8C3E,1 Multiply by 4
C $8C3F,1 ...
C $8C40,1 BC = offset into table
C $8C41,2 ...
C $8C43,3 Table base address
C $8C46,3 Is it chance stage?
C $8C49,2 ...
C $8C4B,2 If not, jump ahead
C $8C4D,3 Else load other table
C $8C50,2 And jump ahead
c $8C52 Start new wave
D $8C52 Used by the routine at #R$8C30.
@ $8C52 label=start_new_wave
C $8C52,2 Play a sound
C $8C54,3 ...
N $8C57 This entry point is used by the routine at #R$8C30.
C $8C57,1 Add offset to table base
C $8C58,3 Save table address
C $8C5B,3 Next wave
C $8C5E,1 ...
C $8C5F,3 Flags
C $8C62,2 Reset flag
C $8C64,2 Set flag
c $8C68 When wave is initiating
D $8C68 Called when there's still more outcoming enemies. Used by the routine at #R$8BD9.
@ $8C68 label=handle_wave_outcoming
C $8C68,3 Decrement wave speed counter
C $8C6B,1 ...
C $8C6C,1 Return if > 0
N $8C6D This entry point is used by the routine at #R$8C52.
C $8C6D,4 Get wave data address
C $8C71,2 Save pointer
C $8C73,3 Get byte 3
C $8C76,1 Shift bit 5-7 into 0-2
C $8C77,1 ...
C $8C78,1 ...
C $8C79,2 And isolate them
C $8C7C,3 Get stage data address in IY
C $8C80,3 Add 2 times stage speed
C $8C83,3 ...
C $8C86,3 Store as new speed counter value
C $8C89,2 Restore wave data address
C $8C8B,2 Default sprite type (enemy)
C $8C8D,3 Is it chance stage?
C $8C90,2 ...
C $8C92,2 If not, skip ahead
C $8C94,3 Get stage
C $8C97,2 Isolate planet index bits
C $8C99,3 Add wave
C $8C9C,1 ...
C $8C9D,3 Table at #R$8E0D - 1
C $8CA0,1 Add A (1-24) to HL
C $8CA1,1 Get table value
C $8CA2,1 Allocate sprite
C $8CA3,3 Set sprite type
C $8CA6,3 Get wave data byte 3
C $8CA9,1 Shift bits 4-7 to 0-3
C $8CAA,1 ...
C $8CAB,1 ...
C $8CAC,1 ...
C $8CAD,2 Isolate bits 0-3
C $8CAF,3 Set color
C $8CB2,3 Get wave data byte 3
C $8CB5,2 Isolate bits 0-3
C $8CB7,1 BC = A = table offset (actually only 0 - 2)
C $8CB8,2 ...
C $8CBA,3 Table base address
C $8CBD,1 Table address
C $8CBE,1 Get table byte
C $8CBF,3 Save as polar y
C $8CC2,3 Outcoming enemies
C $8CC5,3 Get wave data byte 0
C $8CC8,2 Even number of outcoming enemies?
C $8CCA,2 Skip ahead if so
C $8CCC,3 Get wave data byte 1
C $8CCF,1 A = wave data byte
C $8CD0,2 Clear bit 7
C $8CD2,3 Save as polar x
C $8CD5,3 Get wave data byte 2
C $8CD8,2 Isolate bits 0-4
C $8CDA,1 x2
C $8CDB,1 BC = offset
C $8CDC,3 Table base address
C $8CDF,1 Table address
C $8CE0,1 Get LSB
C $8CE1,1 Next table address
C $8CE2,1 Get MSB
C $8CE3,1 L = LSB
C $8CE4,3 Store in sprite data (pointer to path data?)
C $8CE7,3 ...
C $8CEA,1 Get first byte
C $8CEB,2 Isolate bits 4-7
C $8CED,1 Store in B
C $8CEE,3 Outcoming enemies
C $8CF1,1 OR bits 4-7
C $8CF2,3 Store in sprite data
C $8CF5,1 Load sprite pattern
C $8CF6,3 Increment active enemies
C $8CF9,1 ...
C $8CFA,3 Increment total enemies
C $8CFD,1 ...
C $8CFE,3 Increment outcoming enemies
C $8D01,1 ...
C $8D02,2 B = 9 enemies
C $8D04,3 Is it chance stage?
C $8D07,2 ...
C $8D09,2 If not, skip ahead
C $8D0B,2 Else B = 10 enemies
C $8D0D,1 Increased outcoming enemies
C $8D0E,1 Compare with 9 or 10
C $8D0F,1 Return if all are not out
C $8D10,2 Set outcoming enemies to 0
C $8D12,3 Clear flag that was set
C $8D15,2 when the wave started
C $8D17,3 Get stage data address in IY
C $8D1A,3 Set countdown
C $8D1D,3 ...
c $8D21 Reset outcoming enemies
D $8D21 Used by the routine at #R$8170.
@ $8D21 label=reset_outcoming_enemies
C $8D21,3 Are all waves completed?
C $8D24,2 ...
C $8D26,1 Then return
C $8D27,3 Outcoming enemies
C $8D2A,1 If none
C $8D2B,1 Then return
C $8D2C,1 B = outcoming enemies
C $8D2D,2 B = 9 - outcoming enemies
C $8D2F,1 ...
C $8D30,1 ...
C $8D31,3 Total enemies
C $8D34,1 Add outcoming enemies
C $8D35,1 Save again
C $8D36,4 Wave data address
C $8D3A,3 Get bits 4-7 of byte 3
C $8D3D,1 ...
C $8D3E,1 ...
C $8D3F,1 ...
C $8D40,1 ...
C $8D41,2 ...
C $8D43,3 Return enemies to center
C $8D46,2 ...
C $8D48,1 Reset outcoming enemies
C $8D49,3 ...
C $8D4C,3 Reset countdown to wave
c $8D50 Create "laser fence" or meteor
D $8D50 Used by the routine at #R$80E8.
@ $8D50 label=create_laser_fence_or_meteor
C $8D50,3 Frame counter
C $8D53,2 If not every 4th frame
C $8D55,1 Then return
C $8D56,3 Is it chance stage?
C $8D59,2 ...
C $8D5B,1 Then return
C $8D5C,3 Is countdown zero?
C $8D5F,1 ...
C $8D60,3 Then start another countdown
C $8D63,1 Else decrement it
C $8D64,3 And save it
C $8D67,1 If it's still not zero then return
C $8D68,3 Get stage data address in IY
C $8D6B,1 Random number
C $8D6C,2 If any of 3 bits are set
C $8D6E,2 Then jump to create meteor
C $8D70,4 ...
C $8D74,2 ...
C $8D76,3 If laser fence flag is set
C $8D79,2 ...
C $8D7B,2 Then jump to create meteor
N $8D7D Allocate laser fence
C $8D81,1 Allocate sprite
C $8D82,4 Set type to laser fence end 1
C $8D86,4 Set polar y
C $8D8A,4 Set color
C $8D8E,1 Random number
C $8D8F,2 0-63
C $8D91,3 Set polar x
C $8D94,3 Store polar x
C $8D97,1 Save polar x
C $8D98,1 Load sprite pattern
C $8D99,1 Allocate sprite
C $8D9A,4 Set type to laser fence end 2
C $8D9E,4 Set polar y
C $8DA2,4 Set color
C $8DA6,1 Restore polar x
C $8DA7,1 Save polar x
C $8DA8,2 Polar x + 8
C $8DAA,2 Mod 64
C $8DAC,3 Set polar x
C $8DAF,3 Store polar x
C $8DB2,1 Load sprite pattern
C $8DB3,1 Allocate sprite
C $8DB4,4 Set type to laser fence center
C $8DB8,4 Set polar y
C $8DBC,4 Set color
C $8DC0,4 Set velocity
C $8DC4,1 Restore polar x
C $8DC5,2 Polar x + 4
C $8DC7,2 Mod 64
C $8DC9,3 Set polar x
C $8DCC,1 Load sprite pattern
C $8DCD,3 Total enemies
C $8DD0,2 Add 3
C $8DD2,3 Store again
C $8DD5,2 Jump to return
c $8DD7 Create meteor
D $8DD7 Used by the routine at #R$8D50.
@ $8DD7 label=create_meteor
C $8DDD,1 Allocate sprite
C $8DDE,4 Set type to meteor
C $8DE2,4 Set polar y
C $8DE6,1 Random number
C $8DE7,1 Store it in C
C $8DE8,2 Offset 0-7
C $8DEA,2 2-9
C $8DEC,2 If a bit in the random number is set
C $8DEE,2 ...
C $8DF0,2 Then make offset negative
C $8DF2,1 Stor offset
C $8DF3,3 Get ship polar x
C $8DF6,1 Add offset
C $8DF7,2 Mod 64
C $8DF9,3 Set polar x
C $8DFC,4 Set color
C $8E00,3 Increment total enemies
C $8E03,1 ...
N $8E04 This entry point is used by the routine at #R$8D50.
C $8E04,1 Random number
C $8E05,2 $00 - $3F
C $8E07,2 $10 - $4F
C $8E09,3 Store countdown
b $8E0D Enemy types in different waves (chance stage)
@ $8E0D label=enemies_by_wave_table
B $8E0D,24,8
b $8E25 Enemy movement table
D $8E25 A random value is selected for the counter.
@ $8E25 label=enemy_movement_table
B $8E25,8,8
c $8E2D Create or display mines
D $8E2D Used by the routines at #R$80E8, #R$8139 and #R$A3E1.
@ $8E2D label=create_or_display_mines
C $8E2D,3 Get flags
C $8E30,2 If all waves completed bit is not set
C $8E32,2 Then init variables
C $8E34,3 Get mines action (0-2)
C $8E37,2 If 1
C $8E39,3 Then create mines
C $8E3C,3 If 2 then display mines
C $8E3F,3 If died
C $8E42,2 ...
C $8E44,1 Then return
C $8E45,3 If mines flag is set
C $8E48,2 ...
C $8E4A,1 The return
C $8E4B,3 Frame counter
C $8E4E,2 If not every 16th frame
C $8E50,1 Then return
C $8E51,3 Get countdown
C $8E54,1 Decrement it
C $8E55,1 Return if not zero
C $8E56,3 Get center enemies
C $8E59,2 If < 3
C $8E5B,1 Then return
C $8E5C,3 Stage
C $8E5F,2 Shift out stage within planet bits
C $8E61,2 ...
C $8E63,1 B = planet
C $8E64,2 A = 5
C $8E66,1 5 - planet
C $8E67,2 If planet > 5 then skip ahead and set to 2
C $8E69,2 If 5 - planet >= 2 then skip ahead
C $8E6B,2 ...
C $8E6D,2 Set to 2
C $8E6F,3 Number of times died within stage
C $8E72,1 Return if >= calculated value (2, 3, 4, 5)
C $8E73,1 ...
C $8E74,3 If stored value is 2
C $8E77,2 ...
C $8E79,1 Then return
C $8E7A,1 Else increment calculated value
C $8E7B,3 And store
C $8E7E,3 Set mines flag
C $8E81,2 ...
C $8E83,2 Set action to create mines
C $8E85,3 ...
c $8E89 Init mine variables
D $8E89 Used by the routine at #R$8E2D.
@ $8E89 label=init_mine_variables
N $8E8D This entry point is used by the routines at #R$82BF and #R$8FED.
C $8E8D,1 Random number
C $8E8E,2 0 - 15
C $8E90,2 5  - 20
C $8E92,3 Store
C $8E95,1 A = 0
C $8E96,3 Set to 0
C $8E99,3 Set action to 0
c $8E9D Create mines
D $8E9D Used by the routine at #R$8E2D.
@ $8E9D label=create_mines
C $8E9D,4 Ship background data
C $8EA1,2 Store name
C $8EA3,3 ...
C $8EA6,3 Ship polar x
C $8EA9,2 Polar x + 8
C $8EAB,2 Mod 64
C $8EAD,1 E = new polar x
C $8EAE,2 D = polar y
C $8EB0,1 Save coordinates
C $8EB1,3 3 spheres graphics (if double shot on)
C $8EB4,2 Color
C $8EB6,3 Test double shot flag
C $8EB9,2 ...
C $8EBB,2 If set then skip ahead
C $8EBD,3 Mine graphics (if double shot off)
C $8EC2,3 Create mine
C $8EC5,1 Restore coordinates
C $8EC6,1 Save coordinates
C $8EC7,1 Polar x
C $8EC8,2 Polar x + 8
C $8ECA,2 Mod 64
C $8ECC,1 Set new polar x
C $8ECD,3 3 spheres graphics
C $8ED0,2 Color
C $8ED2,3 Create mine
C $8ED5,1 Restore coordinate
C $8ED6,1 Polar x
C $8ED7,2 Polar x - 8
C $8ED9,2 Mod 64
C $8EDB,1 Set new polar x
C $8EDC,3 3 spheres graphics
C $8EDF,2 Color
C $8EE1,3 Create mine
C $8EE4,2 Set action to display mines
C $8EE6,3 ...
C $8EE9,1 A = 3
C $8EEA,3 Set mines left
C $8EED,3 Total enemies
C $8EF0,1 Add 3
C $8EF1,1 Save again
C $8EF6,3 No mines destroyed
C $8EFA,3 Set countdown to shoot to 1
C $8EFD,3 Create shot from mine
C $8F00,3 Get stage data address in IY
C $8F09,2 Play sound
C $8F0B,3 ...
c $8F0F Create mine
D $8F0F Used by the routine at #R$8E9D.
R $8F0F I: IY Points to ship background data
R $8F0F I: DE Polar coordinates
R $8F0F I: HL Graphics patterns
R $8F0F I: C Color
@ $8F0F label=create_mine
C $8F0F,1 Save color
C $8F10,3 Advance IY to mine background data
C $8F13,2 ...
C $8F15,3 Patterns address LSB
C $8F18,3 Patterns address MSB
C $8F1B,3 Polar y
C $8F1E,3 Polar x
C $8F21,3 Polar to screen
C $8F24,1 Screen y
C $8F25,2 Screen y - 4
C $8F27,3 Save in structure
C $8F2A,1 Screen x
C $8F2B,2 Screen x - 4
C $8F2D,3 Save in structure
C $8F30,3 Get name
C $8F33,1 Divide by 8
C $8F34,1 ...
C $8F35,1 ...
C $8F36,2 Mod 32
C $8F38,1 HL = color set
C $8F39,2 ...
C $8F3B,3 Color table
C $8F3E,1 Add color set offset
C $8F3F,3 Update 2 color sets
C $8F42,1 Restore color
C $8F43,1 A = color
C $8F44,3 FILL_VRAM
C $8F47,3 Get name
C $8F4A,3 Save in structure
C $8F4D,2 Add 16 (when will this be used?)
C $8F4F,3 Set name
C $8F52,3 Display background patterns
c $8F55 Display mines
D $8F55 Used by the routine at #R$8E2D.
C $8F55,3 Create shot from mine
C $8F58,4 Mine data
C $8F5C,2 3 mines
C $8F5E,1 Save counter
C $8F5F,3 Get patterns address LSB
C $8F62,3 Get patterns address MSB
C $8F65,1 If zero
C $8F66,1 ...
C $8F67,2 Then return
C $8F69,3 Test died flag
C $8F6C,2 ...
C $8F6E,2 If we died then destroy mine
C $8F70,3 Test flag
C $8F73,2 If set
C $8F75,2 Then destroy mine
C $8F77,3 Frame counter
C $8F7A,2 If not every 8th frame
C $8F7C,2 Then skip to next mine
C $8F7E,3 Get table offset
C $8F81,1 BC = A
C $8F82,2 ...
C $8F84,3 Table base address
C $8F87,1 Add offset
C $8F88,1 Get table byte
C $8F89,3 Add to polar y
C $8F8C,3 ...
C $8F8F,1 Next table address
C $8F90,1 Get table byte
C $8F91,3 Add to polar x
C $8F94,3 ...
C $8F97,3 Get patterns address
C $8F9A,3 ...
C $8F9D,3 3 spheres graphics
C $8FA0,1 Patterns offset
C $8FA1,2 ...
C $8FA3,1 Flip bit value 32 (animate)
C $8FA4,2 ...
C $8FA6,1 ...
C $8FA7,1 New patterns address
C $8FA8,3 Save in structure
C $8FAB,3 ...
N $8FAE This entry point is used by the routine at #R$8FED.
C $8FAE,3 Polar y
C $8FB1,3 Polar x
C $8FB4,3 Polar to screen
C $8FB7,1 Screen y
C $8FB8,2 Screen y - 4
C $8FBA,3 Save in structure
C $8FBD,1 Screen x
C $8FBE,2 Screen x - 4
C $8FC0,3 Save in structure
C $8FC3,3 Display background patterns
C $8FC6,3 Next mine
C $8FC9,2 ...
C $8FCB,1 Restore counter
C $8FCC,2 Loop for 3 mines
C $8FCE,3 Frame counter
C $8FD1,2 If not the 8th frame
C $8FD3,1 Then return
C $8FD4,3 Get countdown
C $8FD7,1 Decrement it
C $8FD8,2 Return if not zero
C $8FDA,3 Set flag to destroy mines
C $8FDD,2 ...
C $8FDF,3 Offset movement table offset
C $8FE2,2 Add 2
C $8FE4,2 If < 16
C $8FE6,2 Then update
C $8FE8,1 Else reset
C $8FE9,3 Save offset
c $8FED Destroy mine
D $8FED Used by the routine at #R$8F55.
C $8FFA,3 Decrement total enemies
C $8FFD,1 ...
C $8FFE,3 Decrement mines left
C $9001,1 ...
C $9004,3 Clear mines flag
C $9007,2 ...
c $900E Create shot from mine
D $900E Used by the routines at #R$8E9D and #R$8F55.
C $900E,3 Decrement countdown
C $9011,1 ...
C $9012,1 Return if not 0
C $9013,4 Mine data
C $9017,3 Check if mine exists
C $901A,3 ...
C $901D,2 Skip ahead if not
C $901F,3 Increment enemy shots
C $9022,1 ...
C $9023,1 Allocate sprite
C $9024,4 Missile
C $9028,4 Set color
C $902C,3 Set polar y to mine polar y
C $902F,3 ...
C $9032,3 Set polar x to mine polar x
C $9035,3 ...
C $9038,1 Load sprite pattern
C $9039,3 Get stage data address in IY
C $903C,1 Random number
C $903D,2 0-63
C $903F,3 Add ?
C $9042,3 Set countdown to random value
b $9046 Mines movement table
@ $9046 label=mines_movement_table
B $9046,16,8
b $9056 3 spheres background graphics
D $9056 Organized as 16x16 sprites. #UDGTABLE(no-border, no-border) { #UDGARRAY8,,4($9056-$908D-16)(graphics-9056.png) } { #UDGARRAY8,,4($905E-$9095-16)(graphics-905E.png) } TABLE#
@ $9056 label=3_spheres_graphics
B $9056,64,8
b $9096 Mine background graphics
D $9096 Organized as 16x16 sprites. #UDGTABLE(no-border, no-border) { #UDGARRAY8,,4($9096-$90CD-16)(graphics-9096.png) } { #UDGARRAY8,,4($909E-$90D5-16)(graphics-909E.png) } TABLE#
@ $9096 label=mine_graphics
B $9096,64,8
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
c $91A1 Erase planet
D $91A1 Used by the routine at #R$9175.
@ $91A1 label=erase_planet
C $91A1,3 Clear row 7
C $91A4,3 Clear 16 bytes in RAM
C $91A7,3 ...
C $91AA,3 ...
C $91AD,2 ...
C $91AF,2 ...
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
C $9229,3 #R$9475 - 1
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
t $92AC Parker Brothers copyright message
@ $92AC label=copyright_msg
T $92AC,23,n1:22
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
t $93B5 NEPTUNE message
T $93B5,7,7
b $93BC Neptune sprite data
B $93BC,11,8,3
b $93C7 Uranus
@ $93C7 label=uranus
B $93C7,17,4*4,1
t $93D8 URANUS message
T $93D8,6,6
b $93DE Uranus sprite data
B $93DE,19,8*2,3
b $93F1 Saturn
@ $93F1 label=saturn
B $93F1,17,4*4,1
t $9402 SATURN message
T $9402,6,6
b $9408 Saturn sprite data
B $9408,15,8,7
b $9417 Jupiter
@ $9417 label=jupiter
B $9417,17,4*4,1
t $9428 JUPITER message
T $9428,7,7
b $942F Jupiter sprite data
B $942F,9,8,1
b $9438 Mars
@ $9438 label=mars
B $9438,17,4*4,1
t $9449 MARS message
T $9449,4,4
b $944D Mars sprite data
B $944D,7,7
b $9454 Earth
@ $9454 label=earth
B $9454,17,4*4,1
t $9465 EARTH message
T $9465,5,5
b $946A Earth sprite data
B $946A,10,8,2
b $9474 Byte before planet graphics
B $9474,1,1
b $9475 Planet graphics - encoded
D $9475 0 bit means a run: read next 5 bits and add 2. This is the number of repeats. 1 bit means a single byte. Read next 8 bits for the byte to repeat/not repeat.
@ $9475 label=planet_graphics
B $9475,633,8*79,1
b $96EE Planet colors
@ $96EE label=planet_colors
B $96EE,16,8
b $96FE Planet sprite patterns
D $96FE #UDGTABLE { #UDGARRAY19,,4($96FE-$9795-8)(graphics-96FE.png) } TABLE#
@ $96FE label=planet_sprite_patterns
B $96FE,152,8
c $9796 Handle collisions
D $9796 Used by the routine at #R$80E8.
@ $9796 label=handle_collisions
C $9796,3 Allocated sprites
C $9799,2 Return if only the ship sprites are allocated
C $979B,1 ...
C $979C,1 Loop counter for allocated sprites - 2
C $979D,3 Table address #R$7183+2 (skip ship sprites)
C $97A0,1 Reset a flag
C $97A1,3 ...
C $97A4,1 Loop start; Save table address
C $97A5,1 Save counter
C $97A6,1 Get sprites allocation table byte
C $97A7,2 MSB = 0
C $97A9,1 x4
C $97AA,1 ...
C $97AB,1 DE = x4
C $97AC,1 ...
C $97AD,1 x8
C $97AE,1 x12
C $97AF,1 DE = x12
C $97B0,4 Sprite data table base
C $97B4,2 Add offset so that IX = current sprite data
C $97B6,3 Get sprite type
C $97B9,2 If deallocated value
C $97BB,2 Then move to next sprite
C $97BD,4 If bit 7 of polar y is set
C $97C1,2 Then move to next sprite
C $97C3,2 Is it a shot?
C $97C5,3 Then jump to handler
C $97C8,2 Is it < $0D (numbers or destroyed enemy)?
C $97CA,2 Then move on to next sprite
C $97CC,3 Is it chance stage?
C $97CF,2 ...
C $97D1,2 Then move to next sprite
C $97D3,4 If the flag bit 7 set in sprite data
C $97D7,2 Then move to next sprite
C $97D9,4 Ship sprite data
C $97DD,3 Is polar x = ship x?
C $97E0,3 ...
C $97E3,2 If not, move to next sprite
C $97E5,3 Polar x for sprite
C $97E8,3 Polar x for ship
C $97EB,3 Polar x distance
C $97EE,2 Is distance < 2
C $97F0,3 Then jump to collision handler
N $97F3 This entry point is used by the routines at #R$9861, #R$9978 and #R$9A49.
C $97F3,1 Restore counter
C $97F4,1 Restore table address
C $97F5,1 Next table address
C $97F6,2 Loop for each allocated sprites (except ship)
C $97F8,3 Are there any mines left?
C $97FB,1 ...
C $97FC,2 Skip ahead if not
C $97FE,4 Mine data address
C $9802,3 Size of each mine structure
C $9805,2 3 mines
C $9807,4 Ship sprite data
C $980B,1 Save counter
C $980C,3 If mine is gone
C $980F,3 ...
C $9812,2 Then move to next mine
C $9814,3 Get mine polar y?
C $9817,2 If >= 6
C $9819,2 Then move to next mine
C $981B,3 Get ship polar x
C $981E,3 Get mine polar x
C $9821,3 Polar x distance
C $9824,2 If < 7
C $9826,3 Then call collision routine
C $9829,2 Next mine
C $982B,1 Restore counter
C $982C,2 Loop for 3 mines
C $982E,3 Check a flag
C $9831,2 ...
C $9833,1 Return if not
C $9834,3 Create double shot sprite
C $9837,4 Polar x velocity
C $983B,1 Load sprite pattern
C $983C,3 Create double shot sprite
C $983F,4 Polar x velocity
C $9843,1 Load sprite pattern
c $9845 Create double shot pickup sprite
D $9845 Used by the routine at #R$9796.
@ $9845 label=create_double_shot_sprite
C $9845,1 Allocate sprite
C $9846,4 Double shot circle
C $984A,4 Polar y
C $984E,3 Get ship polar x
C $9851,3 Set as sprite polar x
C $9854,4 Set counter
C $9858,4 Set color
C $985C,3 Increment total enemies
C $985F,1 ...
c $9861 Handle shot (from ship) collision
D $9861 Used by the routine at #R$9796.
R $9861 I:IX Sprite data address of shot
@ $9861 label=handle_shot_collision
C $9861,3 Flags
C $9864,1 C = flags
N $9865 Check collision with sprites
C $9865,4 Data for sprite  2
C $9869,2 30 sprites
C $986B,3 Size of each sprite
C $986E,4 If deallocated
C $9872,2 Then move to next sprite
C $9874,4 If polar y is out of range
C $9878,2 Then move to next sprite
C $987A,3 Get sprite type
C $987D,2 If deallocated
C $987F,2 Then move to next sprite
C $9881,2 If < $0D (explosion dot, should this have been $0E?)
C $9883,2 Then move to next sprite
C $9885,2 If laser fence
C $9887,2 Then move to next sprite
C $9889,2 If < $12 (enemy missile)
C $988B,2 Then do further checks
C $988D,2 if < $15 (last fence end)
C $988F,2 Then move to next sprite
N $9891 $0D <= type <= $11 or type >= $15 except $17
C $9891,3 Polar y other sprite
C $9894,3 Minus polar y shot
C $9897,2 Absolute value
C $9899,2 ...
C $989B,2 If >= 2
C $989D,2 Then move to next sprite
C $989F,3 Polar x other sprite
C $98A2,2 Is double shot activated?
C $98A4,2 If not, we need a precise match on x
C $98A6,1 Save counter
C $98A7,3 Polar x other sprite
C $98AA,3 Polar x distance
C $98AD,1 Restore counter
C $98AE,2 If distance < 3
C $98B0,3 Then we have a hit
C $98B3,2 Then move to next sprite
C $98B5,3 Compare to polar x of shot
C $98B8,3 If equal we have a hit
C $98BB,2 Next sprite address
C $98BD,2 Loop for 30 sprites
N $98BF Check for collision with center enemies
C $98BF,3 Get polar y
C $98C2,2 if < 35
C $98C4,2 Then skip this step (not in center)
C $98C6,3 Get number of enemies in map
C $98C9,1 If zero
C $98CA,2 Then skip this step
C $98CC,3 Map address
C $98CF,2 Size of map
C $98D1,2 If not allocated
C $98D3,2 Then move on to next
C $98D5,3 Now DE contains polar y,x
C $98D8,1 Polar y
C $98D9,3 Subtract polar y of shot
C $98DC,2 Take absolute value
C $98DE,2 ...
C $98E0,2 If < 2
C $98E2,2 Then move on to next
C $98E4,1 Polar x
C $98E5,3 Compare to polar x of shot
C $98E8,3 If equal we have a hit
C $98EB,1 Next map address
C $98EC,2 Loop for all map entries
N $98EE Check for collision with mines
C $98EE,4 Mine data
C $98F2,3 Size of each mine structure
C $98F5,2 3 mines
C $98F7,3 If mine is gone
C $98FA,3 ...
C $98FD,2 Then move to next mine
C $98FF,3 Get polar y of mine
C $9902,3 Subtract polar y of shot
C $9905,2 Absolute value
C $9907,2 ...
C $9909,2 >= 2
C $990B,2 Then move on to next mine
C $990D,1 Save counter
C $990E,3 Get polar x of mine
C $9911,3 Get polar x of shot
C $9914,3 Polar x distance
C $9917,1 Restore counter
C $9918,2 If distance is < 4
C $991A,3 Then we have a hit
C $991D,2 Next mine address
C $991F,2 Loop for 3 mines
C $9921,3 Jump back into collisions loop
c $9924 Shot hit sprite
D $9924 Used by the routines at #R$9861.
R $9924 I:IX Sprite data of shot
R $9924 I:IY Sprite data of other
@ $9924 label=shot_hit_sprite
C $9924,3 Get sprite type
C $9927,2 If >= $18 (uncommon enemies)
C $9929,2 Then jump to enemy handler
C $992B,2 If >= $15 and =< $17 (laser fence)
C $992D,3 Then jump to handler
C $9930,2 Else set sound to 1
C $9932,2 And jump to enemy handler
c $9934 Shot hit sprite enemy
D $9934 Used by the routine at #R$9924.
R $9934 I:A Sound to play
R $9934 I:IX Sprite data of shot
R $9934 I:IY Sprite data of enemy
@ $9934 label=shot_hit_sprite_enemy
C $9934,2 Sound = 4
N $9936 This entry point is used by the routine at #R$9924.
C $9936,3 Play sound
C $9939,2 Save shot address
C $993B,2 Save enemy address
C $993D,2 IX = enemy address
C $993F,3 Deallocate from map
C $9942,2 IX = shot address
C $9944,4 Set enemy sprite type to unallocated
C $9948,3 Get color
C $994B,3 Remove shot
C $994E,3 Points
C $9951,3 Record hit
C $9954,1 ...
C $9955,3 Decrement active enemies
C $9958,1 ...
C $9959,2 If still active enemies then add default points
C $995B,3 Are all waves complete?
C $995E,2 ...
C $9960,2 If not add points from enemy
C $9962,3 Test wave flag
C $9965,2 ...
C $9967,2 If not wave then add default points
C $9969,3 Get center enemies
C $996C,1 Is it zero?
C $996D,2 If not, add default points
C $996F,3 A lot more points
C $9972,4 Points sprite to show?
C $9976,2 Add points
c $9978 Add score when enemy destroyed
D $9978 Used by the routine at #R$9934.
R $9978 I:IX Sprite data of shot
R $9978 I:DE Points to add
@ $9978 label=add_points_from_enemy
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
C $9993,1 Next address in table
C $9994,1 Get replacement number sprite type ($06 - $0B)
C $9995,3 Save in sprite data
C $9998,1 100 more
N $9999 This entry point is used by the routines at #R$9934, #R$99A0, #R$99D3 and #R$9A08.
@ $9999 label=add_points_in_de
C $9999,1 HL = points
C $999A,3 Add score
C $999D,3 Jump back into collisions loop
c $99A0 Shot hit center enemy
D $99A0 Used by the routine at #R$9861.
R $99A0 I:IX Sprite data of shot
R $99A0 I:HL Map address of other
@ $99A0 label=shot_hit_center_enemy
C $99A0,1 Get map entry (color)
C $99A1,3 Deallocate map entry
C $99A4,3 Remove shot
C $99A7,2 Play sound
C $99A9,3 ...
C $99AC,3 Add points
C $99AF,2 ...
c $99B1 Shot hit mine
D $99B1 Used by the routine at #R$9861.
R $99B1 I:IX Sprite data of shot
R $99B1 I:IY Mine data
@ $99B1 label=shot_hit_mine
C $99B1,2 Color
C $99B3,3 Remove shot
C $99B6,3 Get mine data ?
C $99B9,2 If not $80
C $99BB,2 Then jump ahead
C $99BD,2 Play sound
C $99BF,3 ...
C $99C2,3 If double shot is enabled
C $99C5,2 ...
C $99C7,2 Then skip offering double shot
C $99C9,3 Set flag for offering double shot
C $99CC,2 ...
C $99CE,3 Points
C $99D1,2 Jump ahead
C $99D3,2 Play sound
C $99D5,3 ...
C $99D8,3 Get mines destroyed
C $99DB,1 ...
C $99DC,1 Increment mines destroyed
C $99DD,1 x2
C $99DE,3 Score table
C $99E1,1 Add A to HL
C $99E2,1 Get points (hundreds)
C $99E3,1 Next address in table
C $99E4,1 Get points sprite type ($06 - $0B)
C $99E5,3 Save in sprite data
C $99E8,2 LSB of points
N $99EA This entry point is used by the routine at #R$99B1.
C $99EA,1 Save score
C $99EB,4 Remove mine
C $99EF,4 ...
C $99F5,3 Display background patterns
C $99F8,3 Decrement mines left
C $99FB,1 ...
C $99FC,2 Skip ahead if any left
C $99FE,3 Clear mines flag
C $9A01,2 ...
C $9A05,1 Restore score
C $9A06,2 Add points to score
c $9A08 Shot hit laser fence
D $9A08 Used by the routine at #R$9924.
R $9A08 I:IX Sprite data of shot
@ $9A08 label=shot_hit_laser_fence
C $9A08,4 Set sprite type to unallocated
C $9A0C,3 Reset flag
C $9A0F,2 ...
C $9A11,2 Color
C $9A13,3 Remove shot
C $9A16,3 Points
C $9A19,3 Add points
c $9A1C Remove shot
D $9A1C Used by the routines at #R$9934, #R$99A0, #R$99B1 and #R$9A08.
R $9A1C I:D Color of 'explosion'
R $9A1C I:IX Sprite data of shot
@ $9A1C label=remove_shot
C $9A1C,4 Set sprite type to destroyed
C $9A20,3 Set color
C $9A23,4 Set animation counter
C $9A27,4 Set loaded patten index to none
C $9A2F,3 Decrement active shots
C $9A32,1 ...
C $9A33,3 Decrement total enemies (hmm, why here?)
C $9A36,1 ...
c $9A38 Collision of ship with sprite
D $9A38 Used by the routine at #R$9796.
R $9A38 I:IX Sprite data of other sprite
R $9A38 I:IY Sprite data of ship
@ $9A38 label=ship_hit_sprite
C $9A38,3 Get sprite type
C $9A3B,2 If < $12
C $9A3D,2 Then handle collision with enemy
C $9A3F,2 If >= $14
C $9A41,2 Then handle collision with enemy
C $9A43,3 Decrement enemy shots
C $9A46,1 ...
C $9A47,2 Set died flag and return
c $9A49 Collision of ship with enemy
D $9A49 Used by the routine at #R$9A38.
R $9A49 I:A enemy type
R $9A49 I:IX Sprite data of other sprite
R $9A49 I:IY Sprite data of ship
@ $9A49 label=ship_hit_enemy
C $9A49,2 If < $0E
C $9A4B,2 Then set died flag and return
C $9A4D,2 If >= $12
C $9A4F,2 Then set died flag and return
C $9A51,3 Decrement active enemies
C $9A54,1 ...
C $9A55,3 Deallocate from map
C $9A58,4 Set sprite type to destroyed
C $9A5C,4 Set animation counter
C $9A60,4 Set loaded patten index to none
C $9A68,1 Load sprite pattern
N $9A69 This entry point is used by the routine at #R$9A75.
C $9A69,3 Decrement total enemies
C $9A6C,1 ...
N $9A6D This entry point is used by the routine at #R$9A38.
C $9A6D,3 Set died flag
C $9A70,2 ...
C $9A72,3 Jump back into collisions loop
c $9A75 Collision of ship with mine
D $9A75 Used by the routine at #R$9796.
R $9A75 I: IX Sprite data of ship
R $9A75 I: IY Mine data
@ $9A75 label=ship_hit_mine
C $9A75,4 Remove mine
C $9A79,4 ...
C $9A7D,3 Display background patterns
C $9A80,3 Decrement mines left
C $9A83,1 ...
C $9A84,2 Die and return to loop
c $9A86 Polar x distance
D $9A86 Used by the routines at #R$870C, #R$9796, and #R$9861.
R $9A86 I: A Polar x1
R $9A86 I: B Polar x2
@ $9A86 label=polar_x_distance
C $9A86,3 Store polar x1
C $9A89,1 Polar x1 - polar x2
C $9A8A,2 Jump ahead of >= 0
C $9A8C,2 Else make positive
C $9A8E,2 Is it < 32?
C $9A90,1 Then return
C $9A91,3 Restore polar x1
C $9A94,2 Is it >= 32?
C $9A96,2 Then skip ahead
C $9A98,2 Else add 64
C $9A9A,1 Store in C
C $9A9B,1 Get polar x2
C $9A9C,2 Is it >= 32?
C $9A9E,2 Then skip ahead
C $9AA0,2 Else add 64
C $9AA2,1 Subtract the modified polar x1
C $9AA3,1 Return if >= 0
C $9AA4,2 Else make positive
C $9AA6,1 And return
b $9AA7 Score table
@ $9AA7 label=score_table
B $9AA7,12,2
c $9AB3 Add A to HL (RST $08)
D $9AB3 Used by the routine at #R$800C.
@ $9AB3 label=add_a_to_hl
c $9ABB Unused routine at 9ABB
c $9AC3 VDP write byte (RST $10)
D $9AC3 Used by the routine at #R$800F.
R $9AC3 I:DE Write address I:A byte to write
@ $9AC3 label=vdp_write_byte
C $9AC4,1 LSB
C $9AC5,2 Set LSB of VDP address
C $9AC7,1 MSB
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
c $9ADE Init sound
D $9ADE Used by the routine at #R$8024.
@ $9ADE label=init_sound
C $9ADE,3 TURN_OFF_SOUND
C $9AE1,3 First tune data buffer
C $9AE4,3 Size of tune data
C $9AE7,3 Set to #R$727D
C $9AEB,3 Set to #R$7287
C $9AEF,3 Set to #R$7291
C $9AF3,3 Set to #R$729B
C $9AF6,2 4 channels
C $9AF8,4 First tune data buffer
C $9AFC,4 Disable
C $9B00,4 Attenuation
C $9B04,4 Speed (lower is faster)
C $9B08,2 Next channel
C $9B0A,2 Loop for 4 channels
c $9B0D Play tune
D $9B0D Used by the routines at #R$9BD9, #R$9C1C and #R$9E91.
R $9B0D I:A Index of tune (0 - 6)
@ $9B0D label=play_tune
C $9B0D,2 If tune index is 7
C $9B0F,2 Then skip ahead
C $9B11,3 Else save tune index
C $9B14,3 #R$727D+7
C $9B17,2 Set to 2
C $9B19,1 Multiply index by 8
C $9B1A,1 ...
C $9B1B,1 ...
C $9B1C,1 DE = A
C $9B1D,2 ...
C $9B1F,3 Table base address
C $9B22,1 Add offset
C $9B23,4 First tune data buffer
C $9B27,2 4 channels
C $9B29,2 10 bytes each
C $9B2B,1 Get LSB
C $9B2C,3 Store in tune data buffer
C $9B2F,1 Next table address
C $9B30,1 Get MSB
C $9B31,3 Store in tune data buffer
C $9B34,4 Set countdown
C $9B38,1 Next table address
C $9B39,4 Countdown for relative jumps
C $9B3D,2 Next channel
C $9B3F,2 Loop for 4 channels
C $9B41,2 Tune speed?
C $9B43,3 Init countdown
C $9B46,3 Set a tune is playing
C $9B49,3 Get tune index
C $9B4C,1 Minus 1
C $9B4D,2 If tune index was 1 then skip ahead and set C = 9
C $9B4F,1 If tune index was > 1 then return
C $9B50,2 Set C = 5 (sound index)
C $9B52,2 Skip next
C $9B54,2 Set C = 9 (sound index)
C $9B56,3 Jump to central part of play_sound
c $9B59 Increase attenuation for all tune channels
D $9B59 Used by the routine at #R$9B99.
@ $9B59 label=dampen_all_tune_channels
C $9B59,4 First tune data data buffer
C $9B5D,2 4 channels
C $9B5F,3 Size of sound data
C $9B62,3 Get tune index
C $9B65,2 If < 3
C $9B67,2 Then skip ahead
C $9B69,2 Else set first byte
C $9B6B,3 of buffer to $FF (mute)
C $9B6E,2 and skip first channel
C $9B70,3 Get countdown for when to increase attenuation
C $9B73,1 and decrement
C $9B74,3 If it was 0 then move to next channel
C $9B77,3 Else save new value
C $9B7A,3 Get attenuation in bits 4-7
C $9B7D,2 Add 1
C $9B7F,3 Save again
C $9B82,2 Next channel
C $9B84,2 Loop for 4 channels
c $9B87 Stop tune
D $9B87 Used by the routines at #R$8139, #R$832A and #R$9C1C.
@ $9B87 label=stop_tune
C $9B88,3 Set tune playing flag to 0
C $9B8B,1 $FF
C $9B8C,3 Disable channel 1
C $9B8F,3 Disable channel 2
C $9B92,3 Disable channel 3
C $9B95,3 Disable channel 4
c $9B99 Sound player
D $9B99 Used by the routine at #R$8522.
@ $9B99 label=sound_player
C $9B99,3 Send data for all channels to PSG
C $9B9C,3 Execute commands for all sound fx channels
C $9B9F,3 Is tune playing?
C $9BA2,1 ...
C $9BA3,1 Return is not
C $9BA4,3 Dampen all tune channels
C $9BA7,3 Decrement overall countdown
C $9BAA,1 ...
C $9BAB,1 Return if not 0
C $9BAC,2 Reset countdown
N $9BAE This entry point is used by the routine at #R$9BD9.
C $9BAE,4 First tune data buffer
C $9BB2,2 4 channels
C $9BB4,3 Get tune index
C $9BB7,2 If < 3
C $9BB9,2 Then jump to the standard handler code
N $9BBB Special processing when tune index >= 3
C $9BBB,3 Decrement countdown for channel
C $9BBE,2 If not 0 then jump ahead and return into standard code
N $9BC0 A countdown of 0 when tune index >= 3 would take us here
C $9BC0,4 Reset countdown to 4 instead of 5
C $9BC4,3 Get tune address LSB
C $9BC7,3 Get tune address MSB
N $9BCA This entry point is used by the routines at #R$9BD9 and #R$9BF8.
C $9BCA,1 Get tune byte
C $9BCB,1 Next tune address (always points to next)
C $9BCC,1 Was the byte zero?
C $9BCD,2 If not, jump ahead
C $9BCF,1 Get next tune byte
C $9BD0,1 Next tune address
C $9BD1,1 Was the byte zero?
C $9BD2,2 If not, jump ahead
N $9BD4 Two zeros only appear at the end of #R$A299
C $9BD4,3 Jump back and repeat with #R$A299
C $9BD7,2 ...
c $9BD9 Handle frequency byte when tune index >= 3
D $9BD9 Used by the routine at #R$9B99.
C $9BD9,3 If > 0 then jump ahead to loop
C $9BDC,2 Negative - clear sign
C $9BDE,2 If bit 7 was
C $9BE0,1 Save value
C $9BE1,3 Get tune playing
C $9BE4,2 If not 5
C $9BE6,2 Then jump back into #R$9B99
C $9BE8,1 Restore value
C $9BE9,1 Decrement value
C $9BEA,2 If it was 1 then skip ahead
C $9BEC,3 Decrement countdown
C $9BEF,2 If zero then jump back into #R$9B99
C $9BF1,2 Add 6 to get tune index
C $9BF3,3 Play tune
c $9BF8 Relative jump then  tune index >= 3
D $9BF8 When tune index >= 3 Used by the routine at #R$9BD9.
C $9BF8,3 Update counter and loop tune
C $9BFB,2 Jump back into #R$9B99
c $9BFD Handle duration byte when tune index >= 3
D $9BFD When tune index >= 3 Used by the routine at #R$9B99.
C $9BFD,3 Save tune byte in frequency LSB
C $9C00,3 Set tune address LSB
C $9C03,3 Set tune address MSB
N $9C06 This entry point is used by the routine at #R$9B99.
C $9C06,1 Clear A
C $9C07,4 Shift frequency bit 7 into carry
C $9C0B,1 Shift carry into A bit 0
C $9C0C,4 Shift frequency bit 7 into carry
C $9C10,1 Shift carry into A bit 0
C $9C11,1 -1, so that a zero will mute
C $9C12,3 Save as tune/mute byte
C $9C15,2 000000FF OR 01110100 -> 011101FF
C $9C17,3 Save in attenuation/frequency
C $9C1A,2 Next tune data buffer
c $9C1C Process tune byte
D $9C1C Used by the routines at #R$9B99 and #R$9C7E.
@ $9C1C label=process_tune_byte
C $9C1C,3 Decrement countdown
C $9C1F,2 If not 0 then next tune data buffer
C $9C21,3 Get tune address LSB
C $9C24,3 Get tune address MSB
N $9C27 This entry point is used by the routines at #R$9C39 and #R$9C46.
C $9C27,1 Get tune byte (duration)
C $9C28,1 Next tune address (always points to next)
C $9C29,1 Was the byte zero?
C $9C2A,2 If not then jump ahead
C $9C2C,3 Stop tune
C $9C2F,3 Get tune index
C $9C32,1 Return if not zero
C $9C33,1 ...
C $9C34,2 Play tune #3
C $9C36,3 ...
c $9C39 Handle absolute or relative jump
D $9C39 Used by the routine at #R$9C1C.
@ $9C39 label=process_abs_rel_jump
C $9C39,3 If bit 7 is not set, then jump ahead
N $9C3C Duration byte has bit 7 set
C $9C3C,2 Clear bit 7
C $9C3E,2 If it wasn't $80 then jump ahead
N $9C40 Duration byte is $80: absolute jump
C $9C40,1 Get address from tune data
C $9C41,1 ...
C $9C42,1 ...
C $9C43,1 HL = next address
C $9C44,2 Jump to check if finished
c $9C46 Relative jump then check finished
D $9C46 Used by the routine at #R$9C39.
C $9C46,3 Handle relative jump
C $9C49,2 Jump to check if finished
c $9C4B Process normal duration and frequency
D $9C4B Used by the routine at #R$9C39.
@ $9C4B process_duration_and_frequency
C $9C4B,3 Set countdown to duration
C $9C4E,1 Get tune byte (frequency)
C $9C4F,1 Next tune address
C $9C50,3 Set tone/mute to tune byte
C $9C53,3 Set tune address LSB
C $9C56,3 Set tune address MSB
C $9C59,2 Is it mute?
C $9C5B,2 Then next tune data buffer
C $9C5D,2 Isolate bits 0-5 for table lookup
C $9C5F,1 DE = A
C $9C60,2 ...
C $9C62,3 Table base address
C $9C65,1 Add offset
C $9C66,1 Get table byte
C $9C67,3 Set as frequency LSB
C $9C6A,3 Get saved tune byte
C $9C6D,2 Isolate bits 6-7
C $9C6F,1 Shift into bits 0-1
C $9C70,1 ...
C $9C71,1 Save in E
C $9C72,3 Get tune playing
C $9C75,2 Is it 6?
C $9C77,1 Get value back in A
C $9C78,2 Jump if tune not 6
C $9C7A,2 Apply special attenuation for tune 6
C $9C7C,2 Skip reset countdown (?) and skip fetch attenuation
c $9C7E End of processing sound channel
D $9C7E Used by the routine at #R$9C4B.
C $9C7E,3 Copy byte 8 (speed) to countdown
C $9C81,3 ...
C $9C84,3 Get attenuation from byte 6
N $9C87 This entry point is used by the routine at #R$9C4B.
C $9C87,3 Save in attenuation/frequency
N $9C8A This entry point is used by the routines at #R$9BFD, #R$9C1C and #R$9C4B.
@ $9C8A label=next_tune_data_buffer
C $9C8A,3 Next tune data buffer
C $9C8D,2 ...
C $9C8F,2 Loop for 4 channels
c $9C92 Handle relative jump
D $9C92 Used by the routines at #R$9BF8 and #R$9C46.
@ $9C92 label=update_counter_and_loop
C $9C92,1 Save tune byte
C $9C93,3 Get countdown
C $9C96,1 Was it zero?
C $9C97,2 Then set it and make relative jump
C $9C99,3 Else decrement countdown
C $9C9C,2 If not zero then make relative jump
C $9C9E,1 Else next tune address
c $9CA0 Make a relative jump
D $9CA0 Used by the routine at #R$9C92.
@ $9CA0 label=relative_jump
C $9CA0,3 Set countdown to tune byte
N $9CA3 This entry point is used by the routine at #R$9C92.
C $9CA3,1 Get tune byte (negative jump offset)
C $9CA4,2 Set MSB of offset
C $9CA6,1 Add offset to address
c $9CA8 Play sound FX
D $9CA8 Used by the routine at #R$9EA3.
R $9CA8 I:C Index of sound (1-9), maybe 1 is no sound?
@ $9CA8 label=play_sound
C $9CA8,3 Get tune playing
C $9CAB,1 If zero
C $9CAC,1 Then return
C $9CAD,2 Are we playing tune 6?
C $9CAF,2 Then skip ahead
C $9CB1,1 A = index of sound
C $9CB2,2 Is it < 2?
C $9CB4,1 Then return
N $9CB5 This entry point is used by the routines at #R$9B54 and #R$9E01.
@ $9CB5 label=play_sound_no_checks
C $9CB5,1 A = index of sound
C $9CB6,1 Save index
C $9CB7,3 Call next routine
C $9CBA,1 Restore index
C $9CBB,2 Is it 9? (if called from play_tune or #R$9E45)
C $9CBD,1 Return if not
C $9CBE,1 Index + 1 (now 10) (continue into #R$9CBF)
c $9CBF Copy data from #R$9CE7 to sound fx channel, and change pointer from sound data to sound fx data
D $9CBF Used by the routine at #R$9CA8.
R $9CBF label=init_play_sound_fx
C $9CBF,1 Multiply by 8
C $9CC0,1 ...
C $9CC1,1 ...
C $9CC2,1 DE = A
C $9CC3,2 ...
C $9CC5,3 Table address
C $9CC8,1 Add offset
C $9CC9,1 Get table byte
C $9CCA,1 Multiply by 2
C $9CCB,1 Save it
C $9CCC,1 Multiply by 4 more
C $9CCD,1 ...
C $9CCE,1 BC = A
C $9CCF,1 ...
C $9CD0,1 DE = table address
C $9CD1,3 HL = Sound fx data 1
C $9CD4,1 Add offset
C $9CD5,1 Save sound fx data address
C $9CD6,1 HL = table address, DE = sound fx data address
C $9CD7,3 Copy 8 bytes from #R$9CE7 to sound fx data
C $9CDA,2 ...
C $9CDC,1 DE = sound fx data address
C $9CDD,1 A = table byte * 2
C $9CDE,1 BC = A
C $9CDF,3 First pointer
C $9CE2,1 Add offset
C $9CE3,1 Set pointer LSB
C $9CE4,1 Next address
C $9CE5,1 Set pointer MSB
b $9CE7 Sound fx data
D $9CE7 Byte 0 in each row is the channel. Rows are copied into the corresponding sound fx data buffer.
@ $9CE7 label=sound_fx_data_table
B $9CE7,86,8*10,6
c $9D3D Sound fx done
D $9D3D Reset sound data pointer to point to sound data rather than fx data. Also sets sound fx data command to 0. Used by the routines at #R$9E75.
R $9D3D I:A Channel
@ $9D3D label=sound_fx_done
C $9D3D,1 Multiply channel by 2
C $9D3E,1 Store word offset in C
C $9D3F,1 Multiply by 4
C $9D40,1 Multiply by 8
C $9D41,1 DE = A
C $9D42,2 ...
C $9D44,4 Sound fx data 1
C $9D48,2 Add offset
C $9D4A,3 Get command (not used?)
C $9D4D,3 Set command to 0
C $9D50,1 Word offset (channel * 2)
C $9D51,4 First pointer
C $9D55,2 Add offset (IY now points to a pointer)
C $9D57,1 Word offset
C $9D58,1 Multiply by 2
C $9D59,1 Multiply by 4
C $9D5A,1 Multiply by 5, i.e. channel * 10
C $9D5B,1 DE = A
C $9D5C,3 Sound data base
C $9D5F,1 Add offset
C $9D60,3 Update pointer with sound data address
C $9D63,3 ...
c $9D67 Execute commands for all sound fx channels
D $9D67 Used by the routine at #R$9B99.
@ $9D67 label=execute_sound_fx_commands
C $9D67,4 Sound fx data 4 (start at the end)
C $9D6B,2 4 channels
N $9D6D This entry point is used by the routine at #R$9D89.
C $9D6D,3 Get index of sound command to call
C $9D70,1 Test bits and clear carry
C $9D71,3 Skip channel if bit 7 is reset
C $9D74,1 Multiply by 2, and shift out bit 7
C $9D75,1 DE = A
C $9D76,2 ...
C $9D78,4 Base address of jump table
C $9D7C,2 Add offset
C $9D7E,3 Get LSB
C $9D81,3 Get MSB
C $9D84,3 Return address
C $9D87,1 Push return address on stack
C $9D88,1 Jump to sound command
C $9D89,3 -8
C $9D8C,2 Move 8 bytes back
C $9D8E,2 Loop for 4 channels
@ $9D90 label=sound_fx_command_10
w $9D91 Sound command jump table
@ $9D91 label=sound_fx_command_jump_table
W $9D91,22,2
c $9DA7 Sound FX command 3
D $9DA7 Noise.
R $9DA7 I:B Channel index + 1
R $9DA7 I:IX Sound fx data
@ $9DA7 label=sound_fx_command_3
C $9DA7,3 Get attenuation/noise control (starts with $00)
C $9DAA,1 Increment
C $9DAB,1 And save
C $9DAC,2 Test if bits 0-3 were 0
C $9DAE,1 Restore incremented value
C $9DAF,2 If bits weren't 0 then skip next
C $9DB1,2 Add 1 to attenuation
C $9DB3,2 If it rolled over then sound FX done
C $9DB5,3 Save again
c $9DB9 Sound FX command 6
D $9DB9 Noise.
R $9DB9 I:B Channel index + 1
R $9DB9 I:IX Sound fx data
@ $9DB9 label=sound_fx_command_6
C $9DB9,3 Get attenuation/noise control (starts with $48)
C $9DBC,2 Add 4 (changes noise control?)
C $9DBE,2 If it rolled over then sound FX done
C $9DC0,3 Else save again
c $9DC4 Sound FX command 1,4
D $9DC4 Tone.
R $9DC4 I:B Channel index + 1
R $9DC4 I:IX Sound fx data
@ $9DC4 label=sound_fx_command_1_4
C $9DC4,3 Get frequency LSB (starts at $40 or $80)
C $9DC7,2 Subtract 12
C $9DC9,3 Save again
C $9DCC,1 Return if positive
C $9DCD,3 Get reset value (starts same as IX+$03)
C $9DD0,3 Reset value
C $9DD3,2 Value to increase attenuation by
C $9DD5,2 Jump to increase attenuation
c $9DD7 Sound FX command 2
D $9DD7 Tone.
R $9DD7 I:B Channel index + 1
R $9DD7 I:IX Sound fx data
@ $9DD7 label=sound_fx_command_2
C $9DD7,3 Get frequency LSB (starts at $70)
C $9DDA,2 Add 4
C $9DDC,3 Save again
C $9DDF,2 If it rolled over then sound fx done
C $9DE1,2 Else isolate bit 2 of frequency
C $9DE3,1 Invert
C $9DE4,3 Save in byte 0 to switch between noise and mute
c $9DE8 Sound FX command 0
D $9DE8 Noise.
R $9DE8 I:B Channel index + 1
R $9DE8 I:IX Sound fx data
@ $9DE8 label=sound_fx_command_0
C $9DE8,3 Decrement frequency LSB (starts at $00)
C $9DEB,3 Get frequency LSB
C $9DEE,1 Shift bit 0 into carry
C $9DEF,1 Return if bit 0 was set
N $9DF2 This entry point is used by the routine at #R$9DC4.
C $9DF2,3 AAAA00FF (starts at $26)
C $9DF5,1 Add 1 to attenuation
C $9DF6,3 Store again
C $9DF9,2 Return if attenuation has no rolled over to 0
C $9DFB,1 ...
N $9DFC This entry point is used by the routines at #R$9DA7 and #R$9DC4.
C $9DFC,1 Channel index + 1
C $9DFD,1 Channel index
C $9DFE,3 Sound fx done
c $9E01 Sound FX command 5,8
D $9E01 Tone.
R $9E01 I:B Channel index + 1
R $9E01 I:IX Sound fx data
@ $9E01 label=sound_fx_command_5_8
C $9E01,3 Get byte 3-4 of sound fx data 4, e.g. $8080
C $9E04,2 $0080
C $9E06,4 Get byte 1-2 of sound fx data 4, e.g. $00DC
C $9E0A,1 Add them, e.g. $005C
C $9E0B,1 $00
C $9E0C,3 Save again
C $9E0F,4 $80
C $9E13,2 If >= 4
C $9E15,2 Then skip ahead
C $9E17,4 Else get byte 6-7, e.g. $03C0
C $9E1B,1 Clear carry
C $9E1C,2 Subtract it
C $9E1E,1 Return if < 0
C $9E3F,3 Sound FX done
c $9E5C Sound FX command 7
D $9E5C Noise. When mines appear. Generates $FD, $F5, $ED, $E5, ..., and up again.
R $9E5C I:B Channel index + 1
R $9E5C I:IX Sound fx data
@ $9E5C label=sound_fx_command_7
C $9E5C,3 Get byte 2 (starts with $00)
C $9E5F,3 Add byte 3 (starts with $FC = -4)
C $9E62,2 If zero then sound FX done
C $9E64,2 If >= $30
C $9E66,2 Then skip next
C $9E68,4 Byte 3 = 4
C $9E6C,3 Byte 2 = byte 2 + byte 3 from before
C $9E6F,2 Set bits 0 and 3
C $9E71,3 Save in attenuation/noise control
c $9E75 Sound FX command 9
D $9E75 Tone (silent). Increases frequency up to $016C.
R $9E75 I:B Channel index + 1
R $9E75 I:IX Sound fx data
@ $9E75 label=sound_fx_command_9
C $9E75,3 Increment frequency LSB (starts at $00)
C $9E78,3 Increment frequency LSB
C $9E7B,2 If it didn't turn over, skip ahead
C $9E7D,3 Increment frequency MSB
C $9E80,3 Get attenuation/frequency of channel 4 (this channel)
C $9E83,3 Compare to this number
C $9E86,1 Clear carry
C $9E87,2 ...
C $9E89,1 And return if not the same
C $9E8A,3 Sound fx done for this channel
C $9E8D,1 Sound fx done for channel 0 (played together with noise)
C $9E8E,3 ...
c $9E91 Call play tune, preserve registers
D $9E91 Used by the routines at #R$82BF, #R$832A and #R$846B. I:A Index of tune
@ $9E91 label=call_play_tune
C $9E98,3 Play tune
c $9EA3 Call play sound, preserve registers
D $9EA3 Used by the routines at #R$8139, #R$832A, #R$8C52, #R$8E9D, #R$9934, #R$99A0, #R$99B1, #R$99D3, #R$A33B and #R$A6EC.
R $9EA3 I:A Index of sound
@ $9EA3 label=call_play_sound
C $9EAB,3 Play sound
b $9EB6 Sound frequency table
@ $9EB6 label=frequency_table
B $9EB6,52,8*6,4
w $9EEA Tune data
D $9EEA Each row contains 4 addresses for 4 channels Addresses are copied into byte 1 and 2 of the sound data buffer.
@ $9EEA label=tune_data_table
W $9EEA,64,8
b $9F2A Tune data 1
D $9F2A Tune data basically consist of pairs of 2 bytes #TABLE(default, default) { =h Byte offset | =h Purpose } { $00 | Duration } {     | If bit 7 if set, it has a special meaning: } {     | 1000000: load new address from next two bytes } {     | 1XXXXXX: subtract XXXXXXX from address } {     | 1111111: mute channel } { $01 | Frequency } {     | Bits 6-7 are used directly as bits 8-9 of the PSG frequency } {     | Bits 0-5 are used as index into #R$9EB6, which produces bits 0-7 of the PSG frequency } TABLE#
@ $9F2A label=tune_data_1
B $9F2A,20,8*2,4
b $9F3E Tune data 2
@ $9F3E label=tune_data_2
B $9F3E,16,8
b $9F4E Tune data 3
@ $9F4E label=tune_data_3
B $9F4E,20,8*2,4
b $9F62 Tune data 4
@ $9F62 label=tune_data_4
B $9F62,10,8,2
b $9F6C Tune data 5
@ $9F6C label=tune_data_5
B $9F6C,2,2
b $9F6E Tune data 6
@ $9F6E label=tune_data_6
B $9F6E,11,8,3
b $9F79 Tune data 7
@ $9F79 label=tune_data_7
B $9F79,10,8,2
b $9F83 Tune data 8
@ $9F83 label=tune_data_8
B $9F83,8,8
b $9F8B Tune data 9
@ $9F8B label=tune_data_9
B $9F8B,4,4
b $9F8F Tune data 10
@ $9F8F label=tune_data_10
B $9F8F,5,5
b $9F94 Tune data 11
@ $9F94 label=tune_data_11
B $9F94,106,8*13,2
b $9FFE Tune data 12
@ $9FFE label=tune_data_12
B $9FFE,88,8
b $A056 Tune data 13
@ $A056 label=tune_data_13
B $A056,7,7
b $A05D Tune data 14
@ $A05D label=tune_data_14
B $A05D,20,8*2,4
b $A071 Tune data 15
@ $A071 label=tune_data_15
B $A071,33,8*4,1
b $A092 Tune data 16
@ $A092 label=tune_data_16
B $A092,2,2
b $A094 Tune data 17
@ $A094 label=tune_data_17
B $A094,166,8*20,6
b $A13A Tune data 18
@ $A13A label=tune_data_18
B $A13A,4,4
b $A13E Tune data 19
@ $A13E label=tune_data_19
B $A13E,140,8*17,4
b $A1CA Tune data 20
@ $A1CA label=tune_data_20
B $A1CA,6,6
b $A1D0 Tune data 21
@ $A1D0 label=tune_data_21
B $A1D0,106,8*13,2
b $A23A Tune data 22
@ $A23A label=tune_data_22
B $A23A,5,5
b $A23F Tune data 23
@ $A23F label=tune_data_23
B $A23F,90,8*11,2
b $A299 Tune data 24
@ $A299 label=tune_data_24
B $A299,22,8*2,6
b $A2AF Tune data 25
@ $A2AF label=tune_data_25
B $A2AF,7,7
b $A2B6 Tune data 26
@ $A2B6 label=tune_data_26
B $A2B6,5,5
c $A2BB Send data for all channels to PSG
D $A2BB Used by the routine at #R$9B99.
@ $A2BB label=all_channels_data_to_psg
C $A2BB,2 Mute channel 1
C $A2BD,2 Tone 1 attenuation
C $A2BF,2 Tone 1 frequency
C $A2C1,4 IX=#R$7287
C $A2C5,3 Play tone or mute
C $A2C8,2 Mute channel 2
C $A2CA,2 Tone 2 attenuation
C $A2CC,2 Tone 2 frequency
C $A2CE,4 IX=#R$7291
C $A2D2,3 Play tone or mute
C $A2D5,2 Mute channel 3
C $A2D7,2 Tone 3 attenuation
C $A2D9,2 Tone 3 frequency
C $A2DB,4 IX=#R$729B
C $A2DF,3 Play tone or mute
C $A2E2,2 Mute noise
C $A2E4,2 Noise attenuation
C $A2E6,4 IX=#R$727D
C $A2EA,3 Get byte 0
C $A2ED,1 If it was zero
C $A2EE,2 Then jump ahead
C $A2F0,2 Else mute
c $A2F3 Send data for noise channel to PSG
D $A2F3 Used by the routine at #R$A2BB.
R $A2F3 I:(IX+$04) Attenuation/noise control AAAAXNNN
@ $A2F3 label=noise_data_to_psg
C $A2F3,3 Send attenuation to PSG
C $A2F6,3 Get sound byte
C $A2F9,2 Isolate bits 0-3
C $A2FB,3 Compare to stored value
C $A2FE,1 ...
C $A2FF,1 Return if same
C $A300,1 Else store new value
C $A301,2 and make noise (continue into #R$A303)
c $A303 Send attenuation or noise control bytes to PSG
D $A303 Used by the routines at #R$A2F3 and #R$A31D.
R $A303 I:C Operation in upper nybble 1CC0XXXX or 1CC1XXXX
R $A303 I:(IX+$04): Attenuation/noise AAAAXNNN or attenuation/freq AAAA00FF
@ $A303 label=attn_or_noise_to_psg
C $A303,3 Get sound byte
C $A306,2 If bit 4 of operation is 0, i.e. noise control
C $A308,2 Then skip shifting
C $A30A,1 Swap bits 4-7 and 0-3
C $A30B,1 ...
C $A30C,1 ...
C $A30D,1 ...
C $A30E,2 Isolate bits 0-3
C $A310,1 Apply operation (attenuation or noise control) to bits 4-7
C $A311,2 Send to PSG
c $A314 Send data for tone channel to PSG
D $A314 Used by the routine at #R$A2BB.
R $A314 I:A Mute operation for channel
R $A314 I:C Attenuation operation for channel
R $A314 I:D Tone operation for channel
R $A314 I:(IX+$00): $00 for tone else mute
@ $A314 label=tone_data_to_psg
C $A314,3 Get byte 0
C $A317,1 If byte 0 was 0 then this is not 0
C $A318,2 Jump for tone
C $A31A,2 Mute
c $A31D Send attenuation and frequency bytes to PSG
D $A31D Used by the routine at #R$A314. Note: The value is actually 111,861 / frequency, so higher numbers give lower notes
R $A31D I:C Attenuation operation in upper nybble (1CC1XXXX)
R $A31D I:D Tone operation in upper nybble (1CC0XXXX)
R $A31D I:(IX+$03) Frequency LSB
R $A31D I:(IX+$04) Attenuation/frequency MSB (AAAA00FF)
@ $A31D label=attn_and_freq_to_psg
C $A31D,3 Set attenuation
C $A320,3 Frequency LSB
C $A323,2 Isolate bits 0-3 of frequency
C $A325,1 Apply operation to bits 4-7
C $A326,2 Send to PSG
C $A328,3 Frequency LSB (FFFFFFFF)
C $A32B,2 Isolate bits 4-7 of frequency (FFFF0000)
C $A32D,1 Save it
C $A32E,3 Get frequency MSB (AAAA00FF)
C $A331,2 Isolate lower nybble with bits 8-9 of frequency (000000FF)
C $A333,1 Now FFFF00FF in wrong order
C $A334,1 FFFFF00F
C $A335,1 FFFFFF00
C $A336,1 0FFFFFF0
C $A337,1 00FFFFFF
C $A338,2 Send to PSG
c $A33B Initial game loop
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
C $A386,4 Sprite type $00 (ship body)
C $A38A,4 Polar y
C $A38E,4 Polar x
C $A392,4 Set color (red)
C $A396,1 Load sprite pattern
C $A397,1 Allocate sprite
C $A398,4 Sprite type $01 (ship exhaust)
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
c $A3E1 Explode
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
c $A471 Move explosion dots
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
b $A4BE Init data for wave sprites
D $A4BE Data for 24 waves, 4 bytes each
@ $A4BE label=wave_init_data
B $A4BE,96,4
b $A51E Init data for wave sprites (chance stage)
D $A51E Data for 24 waves, 4 bytes each
@ $A51E label=chance_wave_init_data
B $A51E,96,4
b $A57E Polar y for wave sprites
@ $A57E label=wave_init_polar_y
B $A57E,3,3
w $A581 Wave data address table
D $A581 Bits 0-3 of wave init byte 2 determines entry. Value is stored in sprite data bytes 6 and 7.
@ $A581 label=wave_address_table
W $A581,34,2
b $A5A3 Wave path 0
@ $A5A3 label=wave_path_0
B $A5A3,11,8,3
b $A5AE Wave path 1
@ $A5AE label=wave_path_1
B $A5AE,18,8*2,2
b $A5C0 Wave path 2
@ $A5C0 label=wave_path_2
B $A5C0,12,8,4
b $A5CC Wave path 3
@ $A5CC label=wave_path_3
B $A5CC,23,8*2,7
b $A5E3 Wave path 4
@ $A5E3 label=wave_path_4
B $A5E3,21,8*2,5
b $A5F8 Wave path 5
@ $A5F8 label=wave_path_5
B $A5F8,21,8*2,5
b $A60D Wave path 6
@ $A60D label=wave_path_6
B $A60D,11,8,3
b $A618 Wave path 7
@ $A618 label=wave_path_7
B $A618,11,8,3
b $A623 Wave path 8
@ $A623 label=wave_path_8
B $A623,11,8,3
b $A62E Wave path 9
@ $A62E label=wave_path_9
B $A62E,10,8,2
b $A638 Wave path 10
@ $A638 label=wave_path_10
B $A638,10,8,2
b $A642 Wave path 11
@ $A642 label=wave_path_11
B $A642,15,8,7
b $A651 Wave path 12
@ $A651 label=wave_path_12
B $A651,12,8,4
b $A65D Wave path 13
@ $A65D label=wave_path_13
B $A65D,15,8,7
b $A66C Wave path 14
@ $A66C label=wave_path_14
B $A66C,10,8,2
b $A676 Wave path 15
@ $A676 label=wave_path_15
B $A676,20,8*2,4
b $A68A Wave path 16
@ $A68A label=wave_path_16
B $A68A,15,8,7
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
R $A6EC I: HL Points to add (BCD, hundreds)
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
C $A73C,3 Get frame counter
C $A73F,2 Test bit 0
C $A741,1 Return every 2nd frame
C $A742,3 Controller: #R$71F1
C $A745,2 Segment 0
C $A747,3 DECODER (H = fire, L = joystick (bit 0: up, bit 1: right, bit 2: down, bit 3: left))
C $A74A,2 Reset fire
C $A74C,3 Movement table
C $A74F,1 Add joystick result (0 - 12, some values not possible)
C $A750,4 Sprite 0 data (ship body)
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
C $A7D0,4 Set color (yellow)
C $A7D4,1 Return
c $A7D5 Fire double shot
D $A7D5 Used by the routine at #R$A73C.
@ $A7D5 label=fire_double_shot
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
c $A805 Clear fire pressed
D $A805 Used by the routine at #R$A73C.
@ $A805 label=clear_fire_pressed
C $A805,2 Clear bit for fire pressed
C $A807,1 Return
c $A808 Display ship background patterns
D $A808 Used by the routines at #R$832A, #R$A33B, #R$A3E1 and #R$A73C.
@ $A808 label=display_ship_background_patterns
C $A80F,4 Buffer for generated structure
C $A817,4 Patterns address LSB
C $A81B,4 Patterns address MSB
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
b $A865 Controller movement table
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
b $A875 Adjust ship coordinates table
@ $A875 label=adjust_ship_x_y_table
B $A875,8,8
b $A87D Ship background patterns
D $A87D 16 frames of 4 patterns, organized as 16x16 sprite patterns. #UDGTABLE(no-border, no-border) { #UDGARRAY32,,4($A87D-$AA75-16)(graphics-A87D.png) } { #UDGARRAY32,,4($A885-$AA7D-16)(graphics-A885.png) } TABLE#
@ $A87D label=ship_patterns
B $A87D,512,8
c $AA7D Init center enemies
D $AA7D Used by the routine at #R$8024.
@ $AA7D label=init_center_enemies
C $AA7D,3 Set whole #R$7207 to $FF
C $AA80,3 ...
C $AA83,3 ...
C $AA86,2 ...
C $AA88,2 ...
C $AA8A,1 A = 0
C $AA8B,3 Clear number of map entries
C $AA8E,3 Clear center enemy processed
C $AA91,3 Clear y counter
C $AA94,3 Clear x counter
C $AA97,1 A = 1
C $AA98,3 Set y counter direction
C $AA9B,2 Set first name used for center enemies in buffer 1
C $AA9D,3 ...
C $AAA0,2 First name used for center enemies in buffer 2
C $AAA2,3 ...
c $AAA6 Allocate map entry
D $AAA6 Used by the routines at #R$87D5 and #R$8D21.
R $AAA6 I: A value to place in #R$7207 at an unused spot
@ $AAA6 label=allocate_map_entry
C $AAA9,1 Save value to write
C $AAAA,3 Get number of entries
C $AAAD,2 If map is full
C $AAAF,2 Then return
C $AAB1,3 If all waves completed flag is set
C $AAB4,2 The search backwards
C $AAB6,2 Else search forwards
C $AAB8,3 Start at end of #R$7207
C $AABB,2 Byte to search for
C $AABD,1 Check byte
C $AABE,2 Break out if not $FF
C $AAC0,1 Previous address
C $AAC1,2 Loop forever
C $AAC3,1 HL now points to group of $FF at the end of buffer
C $AAC4,2 Skip next loop
C $AAC6,3 Start at beginning of #R$7207
C $AAC9,2 Byte to search for
C $AACB,1 Check byte
C $AACC,2 Break out if found HL now points to first $FF in buffer
C $AACE,1 Next address
C $AACF,2 Loop forever
C $AAD1,1 Restore value to write
C $AAD2,1 Set byte to A
C $AAD3,3 Increment number of entries
C $AAD6,1 ...
C $AAD7,3 Set flag
C $AADA,2 ...
C $AADC,2 Skip popping AF
c $AAE3 Deallocate map entry
D $AAE3 Used by the routines at #R$99A0, #R$AB17 and #R$AB53.
R $AAE3 I:HL Address in #R$7207
@ $AAE3 label=deallocate_map_entry
C $AAE3,1 Save map address
C $AAE4,2 Set entry to $FF
C $AAE6,3 Set flag
C $AAE9,2 ...
C $AAEB,3 Decrement number of entries
C $AAEE,1 ...
C $AAEF,1 Restore map address
c $AAF1 Create enemy sprite from map entry
D $AAF1 Search for value >= $80 in map and deallocate if found. Then allocate a sprite with data from map. Used by the routine at #R$80E8.
@ $AAF1 label=create_sprite_from_map_entry
C $AAF1,3 Is all waves completed flag set?
C $AAF4,2 ...
C $AAF6,1 Return if not
C $AAF7,2 Is died flag set?
C $AAF9,1 Return if so
C $AAFA,3 Get stage data address in IY
C $AAFD,3 Get number of active enemies
C $AB00,3 Compare with byte 4 of stage data
C $AB03,1 Return if active enemies >= byte 4
C $AB04,3 Get number of map entries
C $AB07,1 Return if zero
C $AB08,1 ...
C $AB09,3 End of #R$7207
C $AB0C,2 Size of map
C $AB0E,2 Value to compare with
C $AB10,1 Test byte
C $AB11,2 If >= $80 then skip ahead
C $AB13,1 Previous byte
C $AB14,2 Loop through whole map
C $AB16,1 Not found - return
N $AB17 Create sprite
C $AB17,1 Get value from map
C $AB18,1 Save it
C $AB19,3 Deallocate map entry
C $AB1C,3 Now DE contains polar y,x
C $AB1F,1 Allocate sprite
C $AB20,3 Set polar x
C $AB23,3 Set polar x
C $AB26,4 Set sprite type
C $AB2A,1 Restore value from map
C $AB2B,3 Use it as color (may temporary since it's >= $80?)
C $AB2E,4 Set flag
C $AB32,1 Load sprite pattern
C $AB33,3 Increment number of active enemies
C $AB36,1 ...
c $AB38 Sprite coordinates from map
D $AB38 Returns polar sprite coordinates from an entry in the map. Used by the routines at #R$87F5, #R$9861, #R$AB17 and #R$AB72.
R $AB38 I:HL Map address
R $AB38 O:D Polar y
R $AB38 O:E Polar x
@ $AB38 label=polar_coordinates_from_map
C $AB38,1 Save map address
C $AB39,3 Base address of map
C $AB3C,1 Clear carry
C $AB3D,2 Map address - map base (offset 0 - 35)
C $AB3F,1 x2 = offset
C $AB40,3 Table address
C $AB43,1 Add offset
C $AB44,3 Get x counter
C $AB47,1 Add table value
C $AB48,2 Mod 64
C $AB4A,1 Store in E
C $AB4B,1 Next table address
C $AB4C,3 Get y counter
C $AB4F,1 Add table value
C $AB50,1 Store in D
C $AB51,1 Restore map address
c $AB53 Deallocate sprite from map
D $AB53 Search for sprite pattern in map and deallocate if found. Used by the routines at #R$9934 and #R$9A49.
R $AB53 I: IX sprite data
@ $AB53 label=deallocate_sprite_from_map
C $AB53,4 Test bit
C $AB57,1 Return if not set
C $AB5A,3 Map address
C $AB5D,2 Size of map
C $AB5F,3 Get sprite pattern
C $AB62,2 Set bit 7
C $AB64,1 Compare with map entry
C $AB65,2 Break out if found
C $AB67,1 Next map address
C $AB68,2 Loop through whole map
C $AB6A,2 Not found - return
c $AB72 Display distant enemies at the center of the screen
D $AB72 Used by the routines at #R$8024, #R$8139, #R$832A, #R$846B, #R$A33B and #R$A3E1.
@ $AB72 label=display_center_enemies
C $AB72,3 Countdown for when to update counters
C $AB75,1 -1
C $AB76,3 If > 0, then don't update other counters
C $AB79,2 Reset to 15
C $AB7B,3 Y counter
C $AB7E,3 Add direction 1 or -1
C $AB81,1 ...
C $AB82,3 Store y counter
C $AB85,3 If y counter > 0 then skip ahead
C $AB88,2 Else make positive
C $AB8A,2 If not 1
C $AB8C,2 Then skip ahead
C $AB8E,1 IF 1, get direction
C $AB8F,2 Reverse direction
C $AB91,1 Store direction
C $AB92,3 x counter
C $AB95,1 +1
C $AB96,2 Mod 64
C $AB98,3 Store x counter
C $AB9B,3 Set flag
C $AB9E,2 ...
C $ABA0,3 Get enemy to process
C $ABA3,2 If 36,
C $ABA5,3 Then jump to update name table
C $ABA8,1 If 0 then erase all enemies
C $ABA9,2 Else jump ahead
C $ABAB,3 Get first name used for center enemies
C $ABAE,2 Set MSB to 0
C $ABB0,1 Multiply by 8
C $ABB1,1 ...
C $ABB2,1 ...
C $ABB3,3 Add pattern table address
C $ABB6,1 ...
C $ABB7,3 Save VDP address
C $ABBA,3 Clear 16 patterns
C $ABBD,1 ...
C $ABBE,3 FILL_VRAM
C $ABC1,3 Get enemy to process
C $ABC4,1 BC = enemy to process
C $ABC5,2 ...
C $ABC7,3 Add map address
C $ABCA,1 ...
C $ABCB,2 If unallocated
C $ABCD,3 Then update counter and return
C $ABD0,3 Now DE contains polar y,x
C $ABD3,3 Convert polar to screen
C $ABD6,1 Save screen coordinates
C $ABD7,1 Get map value
C $ABD8,1 Isolate 3 bits
C $ABD9,1 ...
C $ABDA,2 ...
C $ABDC,1 And load into BC
C $ABDD,2 ...
C $ABDF,3 Add table base address
C $ABE2,1 ...
C $ABE3,3 Plot pixel
C $ABE6,1 Get x offset
C $ABE7,1 If zero
C $ABE8,2 Then skip ahead
C $ABEA,1 Add to screen x
C $ABEB,1 ...
C $ABEC,3 Plot pixel
C $ABEF,1 Next table address
C $ABF0,1 Restore screen coordinates
C $ABF1,1 Get y offset
C $ABF2,1 If zero
C $ABF3,2 Then skip ahead
C $ABF5,1 Add to screen x
C $ABF6,1 ...
C $ABF7,3 Plot pixel
C $ABFA,3 Update counter
C $ABFD,1 ...
c $ABFF Update name table to display center enemies
D $ABFF Used by the routine at #R$AB72.
@ $ABFF label=display_center_enemies_names
C $ABFF,3 Test flag
C $AC02,2 If not set
C $AC04,1 Then return
C $AC05,2 Else reset flag
C $AC07,3 Get number of map entries
C $AC0A,1 Skip ahead if zero
C $AC0B,2 ...
C $AC0D,3 Name table VDP address
C $AC10,3 Get first name used for center enemies
C $AC13,2 4 rows
C $AC15,2 4 columns
C $AC17,1 Write VDP byte
C $AC18,1 Next name
C $AC19,1 Next VDP address
C $AC1A,2 Loop for 4 columns
C $AC1C,3 One row down
C $AC1F,1 ...
C $AC20,1 ...
C $AC21,1 Row counter
C $AC22,2 Loop for 4 rows
C $AC24,3 Swap #R$72CE and #R$72CF
C $AC27,1 ...
C $AC28,1 ...
C $AC29,1 ...
C $AC2A,3 ...
C $AC2D,1 Reset center enemy to process
C $AC2E,3 ...
c $AC32 Erase center enemies
D $AC32 Used by the routine at #R$ABFF.
@ $AC32 label=erase_center_enemies
C $AC32,3 Name table VDP address
C $AC35,1 Space
C $AC36,2 4 rows
C $AC38,2 4 columns
C $AC3A,1 Write VDP byte
C $AC3B,1 Next VDP address
C $AC3C,2 Loop for 4 columns
C $AC3E,3 One row down
C $AC41,1 ...
C $AC42,1 ...
C $AC43,1 Row counter
C $AC44,2 Lopp for 4 rows
c $AC47 Plot pixel
D $AC47 Plot pixel in center enemies bit map. Used by the routine at #R$AB72.
R $AC47 D: Screen y
R $AC47 E: Screen x
R $AC47 I: HL Address in #R$ACCF
@ $AC47 label=plot_pixel
C $AC48,1 Screen y
C $AC49,2 - 80
C $AC4B,2 / 2
C $AC4D,2 Y offset (byte offset * 4)
C $AC4F,1 Store in C
C $AC50,1 Screen x
C $AC51,2 - 112
C $AC53,2 If < 0
C $AC55,1 Then set to 0
C $AC56,2 If < 32
C $AC58,2 Then skip ahead
C $AC5A,2 ELse set to 15
C $AC5C,2 / 8
C $AC5E,2 ...
C $AC60,2 ...
C $AC62,1 Add y offset
C $AC63,1 * 8
C $AC64,1 ...
C $AC65,1 ...
C $AC66,1 Store in C
C $AC67,1 Screen y
C $AC68,2 Pixel offset within pattern
C $AC6A,1 Add to offset
C $AC6B,1 Store in C
C $AC6C,2 B = 0
C $AC6E,3 Get VDP address of centre enemy patterns
C $AC71,1 VDP address
C $AC72,1 Screen x
C $AC73,2 Pixel x offset within pattern
C $AC75,2 Leftmost pixel
C $AC77,2 Skip ahead if zero offset
C $AC79,2 Shift right 0-7 times
C $AC7B,1 ...
C $AC7C,2 ...
C $AC7E,1 DE = VDP address, HL = coordinates
C $AC7F,3 Read VDP byte
C $AC82,1 Apply pixel
C $AC83,1 Write VDP byte
C $AC84,1 DE = coordinates
b $AC87 Start coordinates for sprites
D $AC87 Polar x, polar y
@ $AC87 label=start_coordinates_table
B $AC87,72,12
b $ACCF Table of pixel offsets for drawing center enemies
@ $ACCF label=pixel_offsets_table
B $ACCF,16,8
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
C $ACF9,4 VDP address of sprite allocation table
C $ACFD,3 Get number of allocated sprites
C $AD00,1 ...
C $AD01,1 Store in B
C $AD02,1 Save counter
C $AD03,1 Next allocation
C $AD04,1 Get sprite index
C $AD05,1 * 2
C $AD06,1 * 4
C $AD08,1 * 8
C $AD09,1 * 12 (may overflow?)
C $AD0A,1 Save sprite allocation table address
C $AD0B,3 First y address in sprite data table
C $AD0E,1 Add A to HL
C $AD0F,3 Write 4 bytes for each sprite
C $AD12,1 Save destination
C $AD13,3 WRITE_VRAM
C $AD16,1 Restore destination
C $AD17,3 Add 4 to destination
C $AD1A,1 ...
C $AD1B,1 ...
C $AD1C,1 Restore sprite allocation table address
C $AD1D,1 Restore counter
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
C $AD7B,4 Set counter to 0
C $AD7F,4 Set loaded patten index to none
C $AD83,4 Set y
c $AD8B Load sprite pattern (RST $30)
D $AD8B Ensure sprite pattern is loaded and set screen position Used by the routine at #R$801B.
R $AD8B I:IX Pointer to sprite data
@ $AD8B label=load_sprite_pattern
C $AD90,3 DE = Sprite type
C $AD93,2 ...
C $AD95,3 Table of offsets for each sprite type into table at #R$B8FA
C $AD98,1 Add sprite type
C $AD99,1 Get graphics pointer offset for sprite type
C $AD9A,3 Table of pointers to graphics
C $AD9D,1 HL now points to graphics pointer (control word)
C $AD9E,3 Get polar y, which determines which scale we want
C $ADA1,3 Pattern index within sprite type
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
C $ADB7,1 A = pattern index
C $ADB8,1 Compare with control word LSB (number of patterns for sprite type)
C $ADB9,2 Jump if number of patterns > pattern index (?)
C $ADBB,1 Get number of patterns
C $ADBC,1 Minus 1
C $ADBD,1 Advance to MSB (transformation)
C $ADBE,1 B = transformation
C $ADBF,1 C = number of patterns - 1
C $ADC0,3 Get polar x
C $ADC3,2 Plus 2
C $ADC5,2 Mod 64
C $ADC7,3 Save in sprite data
C $ADCA,1 If transformation = 0
C $ADCB,1 ...
C $ADCC,2 Then skip ahead
C $ADCE,1 Else set A = 0
C $ADCF,2 And skip ahead
C $ADD1,2 Divide polar x by 2
C $ADD3,2 B times
C $ADD5,1 * 4
C $ADD6,1 ...
C $ADD7,1 + number of patterns - 1
C $ADD8,1 Copy result into B, which is the index of pattern to fetch within sprite type
C $ADD9,3 Same as existing?
C $ADDC,2 If so, skip ahead
C $ADDE,3 Save new value
C $ADE1,3 HL = Sprite type
C $ADE4,2 ...
C $ADE6,1 * 2
C $ADE7,3 Table address
C $ADEA,1 #R$72E0 + sprite type * 2
C $ADEB,1 Get LSB of VDP address
C $ADEC,1 TO MSB
C $ADED,1 Get MSB of VDP address
C $ADEE,1 HL = Index of pattern to fetch within sprite type
C $ADEF,2 ...
C $ADF1,1 Multiply by 8
C $ADF2,1 ...
C $ADF3,1 ...
C $ADF4,1 And add base VDP address
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
C $AE14,2 If 1, i.e. ship exhaust
C $AE16,2 Then skip ahead
C $AE18,3 Polar y
C $AE1B,3 Polar x
C $AE1E,3 Polar to screen
C $AE21,3 Set y
C $AE24,3 Set x
C $AE27,2 If carry, sprite is outside visible screen, skip ahead
C $AE29,2 Return
C $AE2B,3 If sprite type is ship exhaust, set HL to table address
C $AE2E,3 Pattern index
C $AE31,2 Mod 4
C $AE33,2 If not zero, skip ahead
C $AE35,3 Get polar x (saved by #R$ADC7?)
C $AE38,1 / 2
C $AE39,2 0, 2, 4 ... $1E
C $AE3B,3 #R$AFDD+2
C $AE3E,1 Add A to HL
C $AE3F,3 Ship screen y
C $AE42,1 Add table value
C $AE43,3 Set y
C $AE46,1 Next table address
C $AE47,3 Ship screen x
C $AE4A,1 Add table value
C $AE4B,3 Set x
N $AE4E This entry point is used by the routines at #R$AE54 and #R$AE75.
c $AE54 Handle sprite outside visible screen
D $AE54 Used by the routine at #R$ADD1.
@ $AE54 label=handle_off_screen_sprite
C $AE54,3 Get sprite type
C $AE57,2 If < $0C
C $AE59,2 Then set off-screen values and return
C $AE5B,2 If >= $0C and < $0E
C $AE5D,2 Then jump ahead
C $AE5F,2 If >= $0E and < $12
C $AE61,2 Then just return
C $AE63,2 If >= $18
C $AE65,2 Then just return
C $AE67,2 If >= $12 and < $12 (not possible)
C $AE69,2 Then decrement total enemies
C $AE6B,2 If >= $14 and < $18
C $AE6D,2 Then decrement total enemies
C $AE6F,3 Decrement active enemy shots
C $AE72,1 ...
C $AE73,2 Set off-screen values and return
C $AE75,3 Decrement total enemies
C $AE78,1 ...
C $AE79,2 If < $15
C $AE7B,2 Then set off-screen values and return
C $AE7D,2 If >= $18
C $AE7F,2 Then set off-screen values and return
C $AE81,3 $15 - $17 Reset flag
C $AE84,2 ...
C $AE86,4 Set as not allocated
C $AE8A,4 Set x
C $AE8E,4 Set y
c $AE94 Upload sprite patterns
D $AE94 Fill VDP RAM from $2100 to $3868 with sprite patterns that may be rotated and flipped. One new pattern is generated with each call. Builds a table of VDP addresses in #R$72E0. Used by the routine at #R$90D6.
@ $AE94 label=upload_sprite_patterns
C $AE94,3 Get sprite type
C $AE97,2 If maxed out
C $AE99,1 Then return
C $AE9A,3 Get destination address (only used locally)
C $AE9D,1 Is it zero?
C $AE9E,1 ...
C $AE9F,2 No - skip ahead
C $AEA1,3 Yes - set it to $2100
C $AEA4,3 ...
C $AEA7,3 Set source to #R$72E0 (pointer to a RAM block)
C $AEAA,3 ...
C $AEAD,3 Get transformation process
C $AEB0,3 OR with pattern processed
C $AEB3,1 ...
C $AEB4,2 If any is non-zero skip ahead
C $AEB6,3 HL = #R$72E0 initially. Table for storing VDP addresses.
C $AEB9,4 DE = $2100 initially. Destination in VDP RAM.
C $AEBD,1 Write destination address to word pointed to table.
C $AEBE,1 ...
C $AEBF,1 ...
C $AEC0,1 ...
C $AEC1,3 Save updated pointer, e.g. $72E0
C $AEC4,3 Get sprite type
C $AEC7,3 Table of 29 offsets into table at #R$B8FA
C $AECA,1 Add A to HL
C $AECB,1 Load DE with offset
C $AECC,2 ...
C $AECE,3 Table of pointers to graphics
C $AED1,1 Add offset
C $AED2,3 Save address of pointer (control word)
C $AED5,3 Get pattern being processed
C $AED8,1 Increment
C $AED9,1 Double
C $AEDA,1 Add A to HL, so HL not points to a patten pointer in #R$B8FA
C $AEDB,1 Set DE = pointer to graphics
C $AEDC,1 ...
C $AEDD,1 ...
C $AEDE,1 Now HL points to graphics
C $AEDF,3 Get transformation processed
C $AEE2,2 0, 1, 2, 3
C $AEE4,1 0, 2, 4, 6
C $AEE5,1 0, 4, 8, 12
C $AEE6,1 0, 8, 16, 24
C $AEE7,1 Add A to HL
C $AEE8,3 Buffer
C $AEEB,4 Store as source address
C $AEEF,3 Copy 8 bytes
C $AEF2,2 of graphics data info buffer
C $AEF4,3 Get address of graphics pointer (control word)
C $AEF7,1 To MSB
C $AEF8,1 Get MSB (transformation)
C $AEF9,1 Is it 0, i.e. no transformation
C $AEFA,2 Then skip ahead
C $AEFC,4 Pointer to transformation
C $AF00,4 Is bit 2 set?
C $AF04,2 If not, skip ahead
C $AF06,3 Rotate left
C $AF09,4 Is bit 3 set?
C $AF0D,2 If not, skip ahead
C $AF0F,3 Upside down
C $AF12,3 Mirror
C $AF15,3 Source for writing to VDP RAM
C $AF18,4 Destination
C $AF1C,3 8 bytes
C $AF1F,3 WRITE_VRAM
C $AF22,3 Get destination address
C $AF25,3 Add 8
C $AF28,1 ...
C $AF29,3 Write back
@ $AF2C label=upload_next_pattern
C $AF2C,4 Get address of graphics pointer (control word)
C $AF30,3 Get pattern processed
C $AF33,1 Increment it
C $AF34,3 When it reaches LSB of control word (pattern count)
C $AF37,2 Then move to next transformation
C $AF39,3 Otherwise store new value
C $AF3C,1 Set carry flag
@ $AF3E label=upload_next_transformation
C $AF3F,3 Set pattens processed zero
C $AF42,3 Get transformation
C $AF45,1 Is it zero?
C $AF46,2 Then move to next sprite type
C $AF48,3 Get transformation processed
C $AF4B,1 Increment it
C $AF4C,2 When it reaches 16
C $AF4E,2 Then move to next sprite type
C $AF50,3 Otherwise store new value
C $AF53,1 Set carry flag
@ $AF55 label=upload_next_sprite_type
C $AF56,3 Set transformation processed to zero
C $AF59,3 Increment sprite type processed
C $AF5C,1 ...
C $AF5D,3 ...
C $AF60,3 When it's <= $1D (29), which is the last sprite type
C $AF63,1 ...
C $AF64,1 Then return
C $AF65,2 Else set it to $FF (done)
C $AF67,3 ...
c $AF6B Rotate pattern
D $AF6B Take a pattern pointed to by #R$72DE and rotate it left 90 degrees. Returns address of rotate pattern in #R$72DE. Used by the routine at #R$AE94.
@ $AF6B label=rotate
C $AF6B,3 HL = source address
C $AF6E,1 Copy source into IY
C $AF6F,2 ...
C $AF71,3 HL = destination address
C $AF74,1 ...
C $AF75,3 Store destination
C $AF78,2 8 bytes in pattern
C $AF7A,4 Shift bit 0 of source byte 0 into carry
C $AF7E,2 Shift carry into bit 0 of destination byte
C $AF80,4 Shift bit 0 of source byte 1 into carry
C $AF84,2 Shift carry into bit 0 of destination byte
C $AF86,4 Shift bit 0 of source byte 2 into carry
C $AF8A,2 Shift carry into bit 0 of destination byte
C $AF8C,4 Shift bit 0 of source byte 3 into carry
C $AF90,2 Shift carry into bit 0 of destination byte
C $AF92,4 Shift bit 0 of source byte 4 into carry
C $AF96,2 Shift carry into bit 0 of destination byte
C $AF98,4 Shift bit 0 of source byte 5 into carry
C $AF9C,2 Shift carry into bit 0 of destination byte
C $AF9E,4 Shift bit 0 of source byte 6 into carry
C $AFA2,2 Shift carry into bit 0 of destination byte
C $AFA4,4 Shift bit 0 of source byte 7 into carry
C $AFA8,2 Shift carry into bit 0 of destination byte
C $AFAA,1 Next destination
C $AFAB,2 Repeat 8 times
c $AFAE Flip pattern vertically
D $AFAE Take a pattern pointed to by #R$72DE and flip it vertically (upside down). Returns address of result in #R$72DE. Used by the routine at #R$AE94.
@ $AFAE label=flip_vertical
C $AFAE,4 DE = source address
C $AFB2,3 HL = right after end of destination buffer
C $AFB5,1 ...
C $AFB6,2 8 bytes in pattern
C $AFB8,1 Get source byte
C $AFB9,1 Destination address moves backwards
C $AFBA,1 Store result
C $AFBB,1 Next source
C $AFBC,2 Repeat 8 times
C $AFBE,3 Store destination
c $AFC2 Flip pattern horizontally
D $AFC2 Take a pattern pointed to by #R$72DE and flip it horizontally (mirrored). Returns address of result in #R$72DE. Used by the routine at #R$AE94.
@ $AFC2 label=flip_horizontal
C $AFC2,4 DE = source address
C $AFC6,3 HL = destination address
C $AFC9,1 ...
C $AFCA,3 Store destination
C $AFCD,1 HL = source, DE = destination
C $AFCE,2 8 bytes in pattern
C $AFD0,2 Result starts with 10000000
C $AFD2,2 Shift source byte left, bit 7 to carry
C $AFD4,1 Shift right, carry to bit 7, bit 0 to carry
C $AFD5,2 Repeat until bit 7 reaches carry (8 times)
C $AFD7,1 Store result
C $AFD8,1 Next destination
C $AFD9,1 Next source
C $AFDA,2 Repeat 8 times
b $AFDD Ship exhaust position relative to ship body
@ $AFDD label=exhaust_position_table
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
C $B1CD,3 If this is 128 or more (polar y > 116 or polar y < -11), then set position outside screen and return
C $B1D0,1 Calculate table address, with polar y = -11 corresponding to row 0
C $B1D1,2 and polar y = 0 corresponding to row 11
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
B $B8DD,1,1 Type $00
B $B8DE,1,1 Type $01
B $B8DF,1,1 Type $02
B $B8E0,1,1 Type $03
B $B8E1,1,1 Type $04
B $B8E2,1,1 Type $05
B $B8E3,1,1 Type $06
B $B8E4,1,1 Type $07
B $B8E5,1,1 Type $08
B $B8E6,1,1 Type $09
B $B8E7,1,1 Type $0A
B $B8E8,1,1 Type $0B
B $B8E9,1,1 Type $0C
B $B8EA,1,1 Type $0D
B $B8EB,1,1 Type $0E
B $B8EC,1,1 Type $0F
B $B8ED,1,1 Type $10
B $B8EE,1,1 Type $11
B $B8EF,1,1 Type $12
B $B8F0,1,1 Type $13
B $B8F1,1,1 Type $14
B $B8F2,1,1 Type $15
B $B8F3,1,1 Type $16
B $B8F4,1,1 Type $17
B $B8F5,1,1 Type $18
B $B8F6,1,1 Type $19
B $B8F7,1,1 Type $1A
B $B8F8,1,1 Type $1B
B $B8F9,1,1 Type $1C
w $B8FA Graphics pointers
D $B8FA For each sprite type we start with a word where the LSB is the number of patterns (n) in this sprite type, and the MSB is the transformations. Then follows n pointers to patterns in #R$B9E6.
@ $B8FA label=graphics_pointers_table
W $B8FA,2,2 $00 type $00
W $B8FC,2,2 $02
W $B8FE,2,2 $04
W $B900,2,2 $06
W $B902,2,2 $08
W $B904,2,2 $0A type $01
W $B906,2,2 $0C
W $B908,2,2 $0E
W $B90A,2,2 $10
W $B90C,2,2 $12
W $B90E,2,2 $14 type $02
W $B910,2,2 $16
W $B912,2,2 $18
W $B914,2,2 $1A
W $B916,2,2 $1C
W $B918,2,2 $1E type $03
W $B91A,2,2 $20
W $B91C,2,2 $22 type $04
W $B91E,2,2 $24
W $B920,2,2 $26
W $B922,2,2 $28
W $B924,2,2 $2A
W $B926,2,2 $2C type $05
W $B928,2,2 $2E
W $B92A,2,2 $30
W $B92C,2,2 $32
W $B92E,2,2 $34
W $B930,2,2 $36 type $06
W $B932,2,2 $38
W $B934,2,2 $3A type $07
W $B936,2,2 $3C
W $B938,2,2 $3E type $08
W $B93A,2,2 $40
W $B93C,2,2 $42 type $09
W $B93E,2,2 $44
W $B940,2,2 $46 type $0A
W $B942,2,2 $48
W $B944,2,2 $4A type $0B
W $B946,2,2 $4C
W $B948,2,2 $4E type $0C
W $B94A,2,2 $50
W $B94C,2,2 $52 type $0D
W $B94E,2,2 $54
W $B950,2,2 $56 type $0E
W $B952,2,2 $58
W $B954,2,2 $5A
W $B956,2,2 $5C
W $B958,2,2 $5E
W $B95A,2,2 $60 type $0F
W $B95C,2,2 $62
W $B95E,2,2 $64
W $B960,2,2 $66
W $B962,2,2 $68
W $B964,2,2 $6A type $10
W $B966,2,2 $6C
W $B968,2,2 $6E
W $B96A,2,2 $70
W $B96C,2,2 $72
W $B96E,2,2 $74 type $11
W $B970,2,2 $76
W $B972,2,2 $78
W $B974,2,2 $7A
W $B976,2,2 $7C
W $B978,2,2 $7D type $12
W $B97A,2,2 $80
W $B97C,2,2 $82
W $B97E,2,2 $84
W $B980,2,2 $86
W $B982,2,2 $88 type $13
W $B984,2,2 $8A
W $B986,2,2 $8C
W $B988,2,2 $8E
W $B98A,2,2 $90
W $B98C,2,2 $92 type $14
W $B98E,2,2 $94
W $B990,2,2 $96
W $B992,2,2 $98
W $B994,2,2 $9A
W $B996,2,2 $9C type $15
W $B998,2,2 $9E
W $B99A,2,2 $A0
W $B99C,2,2 $A2
W $B99E,2,2 $A4
W $B9A0,2,2 $A6 type $16
W $B9A2,2,2 $A8
W $B9A4,2,2 $AA
W $B9A6,2,2 $AC
W $B9A8,2,2 $AD
W $B9AA,2,2 $B0 type $17
W $B9AC,2,2 $B2
W $B9AE,2,2 $B4
W $B9B0,2,2 $B6
W $B9B2,2,2 $B8
W $B9B4,2,2 $BA type $18
W $B9B6,2,2 $BC
W $B9B8,2,2 $BE
W $B9BA,2,2 $C0
W $B9BC,2,2 $C2
W $B9BE,2,2 $C4 type $19
W $B9C0,2,2 $C6
W $B9C2,2,2 $C8
W $B9C4,2,2 $CA
W $B9C6,2,2 $CC
W $B9C8,2,2 $CB type $1A
W $B9CA,2,2 $D0
W $B9CC,2,2 $D2
W $B9CE,2,2 $D4
W $B9D0,2,2 $D6
W $B9D2,2,2 $D8 type $1B
W $B9D4,2,2 $DA
W $B9D6,2,2 $DC
W $B9D8,2,2 $DE
W $B9DA,2,2 $E0
W $B9DC,2,2 $E2 type $1C
W $B9DE,2,2 $E4
W $B9E0,2,2 $E6
W $B9E2,2,2 $E8
W $B9E4,2,2 $EA
b $B9E6 Graphics
D $B9E6 #UDGTABLE(default, default) { =h Address | =h Pattern | =h Sprite type } { $B9E6 | #UDG$B9E6 | $00 } { $B9EE | #UDG$B9EE |     } { $B9F6 | #UDG$B9F6 |     } { $B9FE | #UDG$B9FE |     } { $BA06 | #UDG$BA06 |     } { $BA0E | #UDG$BA0E |     } { $BA16 | #UDG$BA16 |     } { $BA1E | #UDG$BA1E |     } { $BA26 | #UDG$BA26 |     } { $BA2E | #UDG$BA2E |     } { $BA36 | #UDG$BA36 |     } { $BA3E | #UDG$BA3E |     } { $BA46 | #UDG$BA46 |     } { $BA4E | #UDG$BA4E |     } { $BA56 | #UDG$BA56 |     } { $BA5E | #UDG$BA5E |     } { $BA66 | #UDG$BA66 | $01 } { $BA6E | #UDG$BA6E |     } { $BA76 | #UDG$BA76 |     } { $BA7E | #UDG$BA7E |     } { $BA86 | #UDG$BA86 |     } { $BA8E | #UDG$BA8E |     } { $BA96 | #UDG$BA96 |     } { $BA9E | #UDG$BA9E |     } { $BAA6 | #UDG$BAA6 |     } { $BAAE | #UDG$BAAE |     } { $BAB6 | #UDG$BAB6 |     } { $BABE | #UDG$BABE |     } { $BAC6 | #UDG$BAC6 |     } { $BACE | #UDG$BACE |     } { $BAD6 | #UDG$BAD6 |     } { $BADE | #UDG$BADE |     } { $BAE6 | #UDG$BAE6 | $02 } { $BAEE | #UDG$BAEE |     } { $BAF6 | #UDG$BAF6 |     } { $BAFE | #UDG$BAFE |     } { $BB06 | #UDG$BB06 | $03 } { $BB0E | #UDG$BB0E | $04 } { $BB16 | #UDG$BB16 |     } { $BB1E | #UDG$BB1E |     } { $BB26 | #UDG$BB26 |     } { $BB2E | #UDG$BB2E | $05 } { $BB36 | #UDG$BB36 |     } { $BB3E | #UDG$BB3E |     } { $BB46 | #UDG$BB46 |     } { $BB4E | #UDG$BB4E | $06 } { $BB56 | #UDG$BB56 | $07 } { $BB5E | #UDG$BB5E | $08 } { $BB66 | #UDG$BB66 | $09 } { $BB6E | #UDG$BB6E | $0A } { $BB76 | #UDG$BB76 | $0B } { $BB7E | #UDG$BB7E | $0C } { $BB86 | #UDG$BB86 | $0E } { $BB8E | #UDG$BB8E |     } { $BB96 | #UDG$BB96 |     } { $BB9E | #UDG$BB9E |     } { $BBA6 | #UDG$BBA6 |     } { $BBAE | #UDG$BBAE |     } { $BBB6 | #UDG$BBB6 |     } { $BBBE | #UDG$BBBE |     } { $BBC6 | #UDG$BBC6 |     } { $BBCE | #UDG$BBCE |     } { $BBD6 | #UDG$BBD6 |     } { $BBDE | #UDG$BBDE |     } { $BBE6 | #UDG$BBE6 |     } { $BBEE | #UDG$BBEE |     } { $BBF6 | #UDG$BBF6 |     } { $BBFE | #UDG$BBFE |     } { $BC06 | #UDG$BC06 | $0F } { $BC0E | #UDG$BC0E |     } { $BC16 | #UDG$BC16 |     } { $BC1E | #UDG$BC1E |     } { $BC26 | #UDG$BC26 |     } { $BC2E | #UDG$BC2E |     } { $BC36 | #UDG$BC36 |     } { $BC3E | #UDG$BC3E |     } { $BC46 | #UDG$BC46 |     } { $BC4E | #UDG$BC4E |     } { $BC56 | #UDG$BC56 |     } { $BC5E | #UDG$BC5E |     } { $BC66 | #UDG$BC66 |     } { $BC6E | #UDG$BC6E |     } { $BC76 | #UDG$BC76 |     } { $BC7E | #UDG$BC7E |     } { $BC86 | #UDG$BC86 | $10 } { $BC8E | #UDG$BC8E |     } { $BC96 | #UDG$BC96 |     } { $BC9E | #UDG$BC9E |     } { $BCA6 | #UDG$BCA6 |     } { $BCAE | #UDG$BCAE |     } { $BCB6 | #UDG$BCB6 |     } { $BCBE | #UDG$BCBE |     } { $BCC6 | #UDG$BCC6 |     } { $BCCE | #UDG$BCCE |     } { $BCD6 | #UDG$BCD6 |     } { $BCDE | #UDG$BCDE |     } { $BCE6 | #UDG$BCE6 |     } { $BCEE | #UDG$BCEE |     } { $BCF6 | #UDG$BCF6 |     } { $BCFE | #UDG$BCFE |     } { $BD06 | #UDG$BD06 | $11 } { $BD0E | #UDG$BD0E |     } { $BD16 | #UDG$BD16 |     } { $BD1E | #UDG$BD1E |     } { $BD26 | #UDG$BD26 |     } { $BD2E | #UDG$BD2E |     } { $BD36 | #UDG$BD36 |     } { $BD3E | #UDG$BD3E |     } { $BD46 | #UDG$BD46 |     } { $BD4E | #UDG$BD4E |     } { $BD56 | #UDG$BD56 |     } { $BD5E | #UDG$BD5E |     } { $BD66 | #UDG$BD66 |     } { $BD6E | #UDG$BD6E |     } { $BD76 | #UDG$BD76 |     } { $BD7E | #UDG$BD7E |     } { $BD86 | #UDG$BD86 | $12 } { $BD8E | #UDG$BD8E |     } { $BD96 | #UDG$BD96 |     } { $BD9E | #UDG$BD9E |     } { $BDA6 | #UDG$BDA6 | $13 } { $BDAE | #UDG$BDAE |     } { $BDB6 | #UDG$BDB6 |     } { $BDBE | #UDG$BDBE |     } { $BDC6 | #UDG$BDC6 | $14 } { $BDCE | #UDG$BDCE |     } { $BDD6 | #UDG$BDD6 |     } { $BDDE | #UDG$BDDE |     } { $BDE6 | #UDG$BDE6 | $0D } { $BDEE | #UDG$BDEE | $15 } { $BDF6 | #UDG$BDF6 |     } { $BDFE | #UDG$BDFE |     } { $BE06 | #UDG$BE06 |     } { $BE0E | #UDG$BE0E |     } { $BE16 | #UDG$BE16 |     } { $BE1E | #UDG$BE1E |     } { $BE26 | #UDG$BE26 |     } { $BE2E | #UDG$BE2E |     } { $BE36 | #UDG$BE36 |     } { $BE3E | #UDG$BE3E |     } { $BE46 | #UDG$BE46 |     } { $BE4E | #UDG$BE4E | $16 } { $BE56 | #UDG$BE56 |     } { $BE5E | #UDG$BE5E |     } { $BE66 | #UDG$BE66 |     } { $BE6E | #UDG$BE6E |     } { $BE76 | #UDG$BE76 |     } { $BE7E | #UDG$BE7E |     } { $BE86 | #UDG$BE86 |     } { $BE8E | #UDG$BE8E |     } { $BE96 | #UDG$BE96 |     } { $BE9E | #UDG$BE9E |     } { $BEA6 | #UDG$BEA6 |     } { $BEAE | #UDG$BEAE | $17 } { $BEB6 | #UDG$BEB6 |     } { $BEBE | #UDG$BEBE |     } { $BEC6 | #UDG$BEC6 |     } { $BECE | #UDG$BECE |     } { $BED6 | #UDG$BED6 |     } { $BEDE | #UDG$BEDE |     } { $BEE6 | #UDG$BEE6 |     } { $BEEE | #UDG$BEEE |     } { $BEF6 | #UDG$BEF6 |     } { $BEFE | #UDG$BEFE |     } { $BF06 | #UDG$BF06 |     } { $BF0E | #UDG$BF0E | $18 } { $BF16 | #UDG$BF16 |     } { $BF1E | #UDG$BF1E |     } { $BF26 | #UDG$BF26 |     } { $BF2E | #UDG$BF2E | $19 } { $BF36 | #UDG$BF36 |     } { $BF3E | #UDG$BF3E |     } { $BF46 | #UDG$BF46 |     } { $BF4E | #UDG$BF4E | $1A } { $BF56 | #UDG$BF56 |     } { $BF5E | #UDG$BF5E |     } { $BF66 | #UDG$BF66 |     } { $BF6E | #UDG$BF6E | $1B } { $BF76 | #UDG$BF76 |     } { $BF7E | #UDG$BF7E |     } { $BF86 | #UDG$BF86 |     } { $BF8E | #UDG$BF8E | $1C } { $BF96 | #UDG$BF96 |     } { $BF9E | #UDG$BF9E |     } { $BFA6 | #UDG$BFA6 |     } TABLE#
@ $B9E6 label=graphics_patterns
B $B9E6,1480,8
c $BFAE Random number generator (RST $20)
D $BFAE Used by the routine at #R$8015.
@ $BFAE label=rnd
s $BFCF Unused
B $BFCF,49,8*6,1
s $C000 Unused
S $C000,16384,$4000
