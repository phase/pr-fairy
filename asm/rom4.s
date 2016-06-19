	.include "asm/macros.s"

	.syntax unified

	.text

	thumb_func_start write_word_to_mem
write_word_to_mem: @ 8052D00
	strb r0, [r1]
	lsrs r2, r0, 8
	strb r2, [r1, 0x1]
	lsrs r2, r0, 16
	strb r2, [r1, 0x2]
	lsrs r0, 24
	strb r0, [r1, 0x3]
	bx lr
	thumb_func_end write_word_to_mem

	thumb_func_start sub_8052D10
sub_8052D10: @ 8052D10
	push {r4,lr}
	adds r4, r0, 0
	adds r3, r1, 0
	movs r2, 0
_08052D18:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, 0x1
	cmp r2, 0x3
	ble _08052D18
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8052D10

	thumb_func_start set_player_trainer_id
set_player_trainer_id: @ 8052D2C
	push {r4,lr}
	bl Random
	adds r4, r0, 0
	bl Random
	lsls r4, 16
	lsls r0, 16
	lsrs r0, 16
	orrs r4, r0
	ldr r1, _08052D50
	adds r0, r4, 0
	bl write_word_to_mem
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08052D50: .4byte 0x02024eae
	thumb_func_end set_player_trainer_id

	thumb_func_start sub_8052D54
sub_8052D54: @ 8052D54
	ldr r2, _08052D74
	movs r0, 0x1
	strb r0, [r2, 0x14]
	ldrb r1, [r2, 0x15]
	subs r0, 0x3
	ands r0, r1
	movs r1, 0x3
	negs r1, r1
	ands r0, r1
	subs r1, 0x2
	ands r0, r1
	subs r1, 0x4
	ands r0, r1
	strb r0, [r2, 0x15]
	bx lr
	.align 2, 0
_08052D74: .4byte 0x02024ea4
	thumb_func_end sub_8052D54

	thumb_func_start sub_8052D78
sub_8052D78: @ 8052D78
	push {r4,lr}
	ldr r0, _08052DA0
	movs r1, 0
	strb r1, [r0]
	ldr r4, _08052DA4
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x34
	bl memset
	adds r4, 0x34
	adds r0, r4, 0
	movs r1, 0
	movs r2, 0x34
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08052DA0: .4byte 0x03005ce8
_08052DA4: .4byte 0x02024ecc
	thumb_func_end sub_8052D78

	thumb_func_start sub_8052DA8
sub_8052DA8: @ 8052DA8
	push {r4-r7,lr}
	bl sub_80B2D1C
	ldr r0, _08052DD8
	ldr r4, _08052DDC
	ldr r1, _08052DE0
	adds r3, r0, r1
	movs r2, 0x4
_08052DB8:
	adds r1, r3, 0
	adds r0, r4, 0
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5-r7}
	stm r1!, {r5-r7}
	ldm r0!, {r5,r6}
	stm r1!, {r5,r6}
	adds r3, 0x20
	subs r2, 0x1
	cmp r2, 0
	bge _08052DB8
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052DD8: .4byte 0x02025734
_08052DDC: .4byte gUnknown_08216604
_08052DE0: .4byte 0x00002efc
	thumb_func_end sub_8052DA8

	thumb_func_start sub_8052DE4
sub_8052DE4: @ 8052DE4
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _08052DFC
	ldr r2, _08052E00
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08052DFC: .4byte 0x02024f4c
_08052E00: .4byte 0x050001fa
	thumb_func_end sub_8052DE4

	thumb_func_start sub_8052E04
sub_8052E04: @ 8052E04
	push {lr}
	sub sp, 0x4
	movs r3, 0x1
	negs r3, r3
	str r3, [sp]
	movs r0, 0x19
	movs r1, 0x28
	adds r2, r3, 0
	bl warp1_set
	bl warp_in
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end sub_8052E04

	thumb_func_start ClearSav2
ClearSav2: @ 8052E24
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08052E44
	ldr r2, _08052E48
	mov r0, sp
	bl CpuSet
	bl sub_8052D54
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08052E44: .4byte 0x02024ea4
_08052E48: .4byte 0x01000448
	thumb_func_end ClearSav2

	thumb_func_start sub_8052E4C
sub_8052E4C: @ 8052E4C
	push {lr}
	ldr r1, _08052E68
	movs r0, 0
	strb r0, [r1]
	bl sub_808C0A0
	bl zero_player_party_data
	bl zero_enemy_party_data
	bl sub_80A3684
	pop {r0}
	bx r0
	.align 2, 0
_08052E68: .4byte 0x020297ec
	thumb_func_end sub_8052E4C

	thumb_func_start NewGameInitData
NewGameInitData: @ 8052E6C
	push {r4,r5,lr}
	ldr r0, _08052F3C
	ldrh r0, [r0]
	cmp r0, 0
	beq _08052E7A
	cmp r0, 0x2
	bne _08052E7E
_08052E7A:
	bl RtcReset
_08052E7E:
	ldr r1, _08052F40
	movs r0, 0x1
	strb r0, [r1]
	bl zero_player_party_data
	bl zero_enemy_party_data
	bl sub_808C02C
	bl sub_8052DE4
	ldr r4, _08052F44
	movs r2, 0xEB
	lsls r2, 6
	adds r0, r4, 0
	movs r1, 0
	bl memset
	bl sub_80A2B18
	ldr r0, _08052F48
	movs r5, 0
	strb r5, [r0, 0x9]
	bl set_player_trainer_id
	bl PlayTimeCounter_Reset
	bl sub_8052D78
	bl sub_8069030
	bl sub_80BD7A8
	bl sub_80BDAB4
	bl sub_80BB5B4
	bl sub_80B4A90
	movs r0, 0x92
	lsls r0, 3
	adds r1, r4, r0
	ldr r0, _08052F4C
	str r0, [r1]
	bl sub_80AB1B0
	bl sub_80530AC
	bl sub_8052DA8
	bl GameFreakRTC_Reset
	bl sub_80C5B84
	bl sub_80C5BDC
	ldr r0, _08052F50
	strb r5, [r0]
	bl zero_player_party_data
	bl sub_80961D8
	bl sub_81341F8
	bl sub_813420C
	ldr r0, _08052F54
	adds r4, r0
	strh r5, [r4]
	bl sub_80A3714
	bl sub_8139C18
	bl sub_810C994
	bl sub_8133F80
	bl sub_80E6764
	bl sub_80F7AA4
	bl sub_80FA17C
	bl sub_810FA54
	bl sub_8145A78
	bl sub_8052E04
	ldr r0, _08052F58
	bl script_env_2_execute_new_script
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052F3C: .4byte 0x03005eb8
_08052F40: .4byte 0x020297ec
_08052F44: .4byte 0x02025734
_08052F48: .4byte 0x02024ea4
_08052F4C: .4byte 0x00000bb8
_08052F50: .4byte 0x03004350
_08052F54: .4byte 0x00000496
_08052F58: .4byte gUnknown_0819FA81
	thumb_func_end NewGameInitData

	thumb_func_start sub_8052F5C
sub_8052F5C: @ 8052F5C
	push {lr}
	ldr r0, _08052F88
	bl script_env_2_execute_new_script
	ldr r1, _08052F8C
	movs r0, 0x92
	lsls r0, 3
	adds r1, r0
	ldr r0, [r1]
	lsrs r0, 1
	str r0, [r1]
	bl sp000_heal_pokemon
	bl sub_8053050
	bl sub_8053570
	bl warp_in
	pop {r0}
	bx r0
	.align 2, 0
_08052F88: .4byte gUnknown_0819FC74
_08052F8C: .4byte 0x02025734
	thumb_func_end sub_8052F5C

	thumb_func_start flag_var_implications_of_teleport_
flag_var_implications_of_teleport_: @ 8052F90
	push {lr}
	bl player_avatar_init_params_reset
	ldr r0, _08052FB8
	bl FlagReset
	ldr r0, _08052FBC
	bl FlagReset
	ldr r0, _08052FC0
	bl FlagReset
	ldr r0, _08052FC4
	bl FlagReset
	ldr r0, _08052FC8
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_08052FB8: .4byte 0x0000082b
_08052FBC: .4byte 0x0000082d
_08052FC0: .4byte 0x0000082c
_08052FC4: .4byte 0x00000829
_08052FC8: .4byte 0x00000828
	thumb_func_end flag_var_implications_of_teleport_

	thumb_func_start new_game
new_game: @ 8052FCC
	push {lr}
	bl player_avatar_init_params_reset
	ldr r0, _08052FFC
	bl FlagReset
	ldr r0, _08053000
	bl FlagReset
	ldr r0, _08053004
	bl FlagReset
	ldr r0, _08053008
	bl FlagReset
	ldr r0, _0805300C
	bl FlagReset
	ldr r0, _08053010
	bl script_env_2_execute_new_script
	pop {r0}
	bx r0
	.align 2, 0
_08052FFC: .4byte 0x0000082b
_08053000: .4byte 0x0000082d
_08053004: .4byte 0x0000082c
_08053008: .4byte 0x00000829
_0805300C: .4byte 0x00000828
_08053010: .4byte gUnknown_0819FC9F
	thumb_func_end new_game

	thumb_func_start sub_8053014
sub_8053014: @ 8053014
	push {lr}
	bl player_avatar_init_params_reset
	ldr r0, _0805303C
	bl FlagReset
	ldr r0, _08053040
	bl FlagReset
	ldr r0, _08053044
	bl FlagReset
	ldr r0, _08053048
	bl FlagReset
	ldr r0, _0805304C
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_0805303C: .4byte 0x0000082b
_08053040: .4byte 0x0000082d
_08053044: .4byte 0x0000082c
_08053048: .4byte 0x00000829
_0805304C: .4byte 0x00000828
	thumb_func_end sub_8053014

	thumb_func_start sub_8053050
sub_8053050: @ 8053050
	push {lr}
	bl player_avatar_init_params_reset
	ldr r0, _08053078
	bl FlagReset
	ldr r0, _0805307C
	bl FlagReset
	ldr r0, _08053080
	bl FlagReset
	ldr r0, _08053084
	bl FlagReset
	ldr r0, _08053088
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_08053078: .4byte 0x0000082b
_0805307C: .4byte 0x0000082d
_08053080: .4byte 0x0000082c
_08053084: .4byte 0x00000829
_08053088: .4byte 0x00000828
	thumb_func_end sub_8053050

	thumb_func_start sub_805308C
sub_805308C: @ 805308C
	push {lr}
	ldr r0, _080530A8
	bl FlagReset
	bl sub_8054164
	bl wild_pokemon_reroll
	bl mapnumbers_history_shift_sav1_0_2_4_out
	bl sub_8134348
	pop {r0}
	bx r0
	.align 2, 0
_080530A8: .4byte 0x0000082c
	thumb_func_end sub_805308C

	thumb_func_start sub_80530AC
sub_80530AC: @ 80530AC
	push {lr}
	ldr r0, _080530C8
	movs r2, 0
	movs r1, 0x31
	ldr r3, _080530CC
	adds r0, r3
_080530B8:
	str r2, [r0]
	subs r0, 0x4
	subs r1, 0x1
	cmp r1, 0
	bge _080530B8
	pop {r0}
	bx r0
	.align 2, 0
_080530C8: .4byte 0x02025734
_080530CC: .4byte 0x00001604
	thumb_func_end sub_80530AC

	thumb_func_start sav12_xor_increment
sav12_xor_increment: @ 80530D0
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x31
	bhi _08053100
	ldr r0, _080530F4
	lsls r1, 2
	movs r2, 0xAA
	lsls r2, 5
	adds r0, r2
	adds r1, r0
	ldr r2, [r1]
	ldr r0, _080530F8
	cmp r2, r0
	bhi _080530FC
	adds r0, r2, 0x1
	b _080530FE
	.align 2, 0
_080530F4: .4byte 0x02025734
_080530F8: .4byte 0x00fffffe
_080530FC:
	ldr r0, _08053104
_080530FE:
	str r0, [r1]
_08053100:
	pop {r0}
	bx r0
	.align 2, 0
_08053104: .4byte 0x00ffffff
	thumb_func_end sav12_xor_increment

	thumb_func_start sub_8053108
sub_8053108: @ 8053108
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x31
	bhi _08053128
	ldr r0, _08053124
	lsls r1, 2
	movs r2, 0xAA
	lsls r2, 5
	adds r0, r2
	adds r1, r0
	ldr r0, [r1]
	b _0805312A
	.align 2, 0
_08053124: .4byte 0x02025734
_08053128:
	movs r0, 0
_0805312A:
	pop {r1}
	bx r1
	thumb_func_end sub_8053108

	thumb_func_start sav12_xor_set
sav12_xor_set: @ 8053130
	push {lr}
	adds r2, r1, 0
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x31
	bhi _0805314A
	ldr r0, _08053150
	lsls r1, 2
	movs r3, 0xAA
	lsls r3, 5
	adds r0, r3
	adds r1, r0
	str r2, [r1]
_0805314A:
	pop {r0}
	bx r0
	.align 2, 0
_08053150: .4byte 0x02025734
	thumb_func_end sav12_xor_set

	thumb_func_start sub_8053154
sub_8053154: @ 8053154
	push {r4,lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r4, _0805318C
	ldr r2, _08053190
	mov r0, sp
	adds r1, r4, 0
	bl CpuSet
	ldr r0, _08053194
	ldr r1, [r0, 0x4]
	ldr r0, [r1, 0x4]
	ldrb r1, [r1]
	lsls r2, r1, 1
	adds r2, r1
	lsls r2, 1
	movs r1, 0x80
	lsls r1, 19
	orrs r2, r1
	adds r1, r4, 0
	bl CpuSet
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805318C: .4byte 0x02026354
_08053190: .4byte 0x05000180
_08053194: .4byte 0x0202e828
	thumb_func_end sub_8053154

	thumb_func_start sub_8053198
sub_8053198: @ 8053198
	push {lr}
	ldr r0, _080531B8
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0x4]
	ldr r3, _080531BC
	movs r2, 0x3F
_080531A4:
	ldr r0, [r1, 0x10]
	str r0, [r3, 0x10]
	adds r1, 0x18
	adds r3, 0x18
	subs r2, 0x1
	cmp r2, 0
	bge _080531A4
	pop {r0}
	bx r0
	.align 2, 0
_080531B8: .4byte 0x0202e828
_080531BC: .4byte 0x02026354
	thumb_func_end sub_8053198

	thumb_func_start update_saveblock1_field_object_coords
update_saveblock1_field_object_coords: @ 80531C0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	movs r1, 0
	ldr r3, _080531E0
_080531D2:
	ldrb r0, [r3]
	cmp r0, r5
	bne _080531E4
	strh r4, [r3, 0x4]
	strh r2, [r3, 0x6]
	b _080531EC
	.align 2, 0
_080531E0: .4byte 0x02026354
_080531E4:
	adds r3, 0x18
	adds r1, 0x1
	cmp r1, 0x3F
	ble _080531D2
_080531EC:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end update_saveblock1_field_object_coords

	thumb_func_start update_saveblock1_field_object_movement_behavior
update_saveblock1_field_object_movement_behavior: @ 80531F4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	ldr r2, _0805320C
_08053202:
	ldrb r0, [r2]
	cmp r0, r4
	bne _08053210
	strb r1, [r2, 0x9]
	b _08053218
	.align 2, 0
_0805320C: .4byte 0x02026354
_08053210:
	adds r2, 0x18
	adds r3, 0x1
	cmp r3, 0x3F
	ble _08053202
_08053218:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end update_saveblock1_field_object_movement_behavior

	thumb_func_start mapdata_load_assets_to_gpu_and_full_redraw
mapdata_load_assets_to_gpu_and_full_redraw: @ 8053220
	push {r4,lr}
	bl move_tilemap_camera_to_upper_left_corner
	ldr r4, _08053244
	ldr r0, [r4]
	bl copy_map_tileset1_tileset2_to_vram
	ldr r0, [r4]
	bl apply_map_tileset1_tileset2_palette
	bl DrawWholeMapView
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053244: .4byte 0x0202e828
	thumb_func_end mapdata_load_assets_to_gpu_and_full_redraw

	thumb_func_start get_mapdata_header
get_mapdata_header: @ 8053248
	push {lr}
	ldr r0, _08053258
	ldrh r1, [r0, 0x32]
	cmp r1, 0
	bne _0805325C
	movs r0, 0
	b _08053266
	.align 2, 0
_08053258: .4byte 0x02025734
_0805325C:
	ldr r0, _0805326C
	subs r1, 0x1
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
_08053266:
	pop {r1}
	bx r1
	.align 2, 0
_0805326C: .4byte gUnknown_08304F18
	thumb_func_end get_mapdata_header

	thumb_func_start warp_shift
warp_shift: @ 8053270
	ldr r2, _0805329C
	ldr r3, _080532A0
	ldr r0, [r3, 0x4]
	ldr r1, [r3, 0x8]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _080532A4
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r3, 0x4]
	str r1, [r3, 0x8]
	ldr r2, _080532A8
	ldr r0, _080532AC
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r2, _080532B0
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_0805329C: .4byte 0x020297f0
_080532A0: .4byte 0x02025734
_080532A4: .4byte 0x020297f8
_080532A8: .4byte 0x02029800
_080532AC: .4byte gUnknown_08216624
_080532B0: .4byte 0x02029808
	thumb_func_end warp_shift

	thumb_func_start warp_set
warp_set: @ 80532B4
	push {r4,r5,lr}
	ldr r4, [sp, 0xC]
	ldr r5, [sp, 0x10]
	strb r1, [r0]
	strb r2, [r0, 0x1]
	strb r3, [r0, 0x2]
	lsls r4, 24
	asrs r4, 24
	strh r4, [r0, 0x4]
	lsls r5, 24
	asrs r5, 24
	strh r5, [r0, 0x6]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end warp_set

	thumb_func_start warp_data_is_not_neg_1
warp_data_is_not_neg_1: @ 80532D4
	push {lr}
	adds r1, r0, 0
	movs r2, 0
	ldrsb r2, [r1, r2]
	movs r0, 0x1
	negs r0, r0
	cmp r2, r0
	bne _08053308
	movs r0, 0x1
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _08053308
	movs r2, 0x2
	ldrsb r2, [r1, r2]
	cmp r2, r0
	bne _08053308
	movs r0, 0x4
	ldrsh r3, [r1, r0]
	cmp r3, r2
	bne _08053308
	movs r2, 0x6
	ldrsh r0, [r1, r2]
	cmp r0, r3
	bne _08053308
	movs r0, 0x1
	b _0805330A
_08053308:
	movs r0, 0
_0805330A:
	pop {r1}
	bx r1
	thumb_func_end warp_data_is_not_neg_1

	thumb_func_start get_mapheader_by_bank_and_number
get_mapheader_by_bank_and_number: @ 8053310
	lsls r0, 16
	lsls r1, 16
	ldr r2, _08053324
	lsrs r0, 14
	adds r0, r2
	ldr r0, [r0]
	lsrs r1, 14
	adds r1, r0
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08053324: .4byte gUnknown_08308588
	thumb_func_end get_mapheader_by_bank_and_number

	thumb_func_start warp1_get_mapheader
warp1_get_mapheader: @ 8053328
	push {lr}
	ldr r1, _08053348
	movs r0, 0
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x1]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	pop {r1}
	bx r1
	.align 2, 0
_08053348: .4byte 0x020297f8
	thumb_func_end warp1_get_mapheader

	thumb_func_start set_current_map_header_from_sav1_save_old_name
set_current_map_header_from_sav1_save_old_name: @ 805334C
	push {r4-r6,lr}
	ldr r5, _08053384
	ldr r4, _08053388
	movs r0, 0x4
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x5
	ldrsb r1, [r4, r1]
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r1, r5, 0
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldm r0!, {r2,r3,r6}
	stm r1!, {r2,r3,r6}
	ldr r0, [r0]
	str r0, [r1]
	ldrh r0, [r5, 0x12]
	strh r0, [r4, 0x32]
	bl get_mapdata_header
	str r0, [r5]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053384: .4byte 0x0202e828
_08053388: .4byte 0x02025734
	thumb_func_end set_current_map_header_from_sav1_save_old_name

	thumb_func_start sub_805338C
sub_805338C: @ 805338C
	push {r4,r5,lr}
	ldr r4, _080533C4
	ldr r1, _080533C8
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	adds r1, r4, 0
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldm r0!, {r2,r3,r5}
	stm r1!, {r2,r3,r5}
	ldr r0, [r0]
	str r0, [r1]
	bl get_mapdata_header
	str r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080533C4: .4byte 0x0202e828
_080533C8: .4byte 0x02025734
	thumb_func_end sub_805338C

	thumb_func_start sub_80533CC
sub_80533CC: @ 80533CC
	push {r4,lr}
	ldr r0, _080533FC
	movs r1, 0x6
	ldrsb r1, [r0, r1]
	adds r3, r0, 0
	cmp r1, 0
	blt _08053404
	movs r1, 0x6
	ldrsb r1, [r3, r1]
	ldr r0, _08053400
	ldr r2, [r0, 0x4]
	ldrb r0, [r2, 0x1]
	cmp r1, r0
	bge _08053404
	ldr r0, [r2, 0x8]
	lsls r1, 3
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r3]
	ldr r0, [r2, 0x8]
	adds r1, r0
	ldrh r0, [r1, 0x2]
	b _08053434
	.align 2, 0
_080533FC: .4byte 0x02025734
_08053400: .4byte 0x0202e828
_08053404:
	ldrh r2, [r3, 0x8]
	movs r1, 0x8
	ldrsh r0, [r3, r1]
	cmp r0, 0
	blt _0805341E
	ldrh r1, [r3, 0xA]
	movs r4, 0xA
	ldrsh r0, [r3, r4]
	cmp r0, 0
	blt _0805341E
	strh r2, [r3]
	strh r1, [r3, 0x2]
	b _08053436
_0805341E:
	ldr r0, _0805343C
	ldr r2, [r0]
	ldr r0, [r2]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
	strh r0, [r3]
	ldr r0, [r2, 0x4]
	lsrs r1, r0, 31
	adds r0, r1
	asrs r0, 1
_08053434:
	strh r0, [r3, 0x2]
_08053436:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805343C: .4byte 0x0202e828
	thumb_func_end sub_80533CC

	thumb_func_start warp_in
warp_in: @ 8053440
	push {lr}
	bl warp_shift
	bl set_current_map_header_from_sav1_save_old_name
	bl sub_80533CC
	pop {r0}
	bx r0
	thumb_func_end warp_in

	thumb_func_start warp1_set
warp1_set: @ 8053454
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _0805348C
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805348C: .4byte 0x020297f8
	thumb_func_end warp1_set

	thumb_func_start warp1_set_2
warp1_set_2: @ 8053490
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	asrs r0, 24
	lsls r1, 24
	asrs r1, 24
	lsls r2, 24
	asrs r2, 24
	movs r3, 0x1
	negs r3, r3
	str r3, [sp]
	bl warp1_set
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end warp1_set_2

	thumb_func_start saved_warp2_set
saved_warp2_set: @ 80534B0
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r0, _080534E8
	lsls r1, 24
	asrs r1, 24
	lsls r2, 24
	asrs r2, 24
	lsls r3, 24
	asrs r3, 24
	movs r4, 0x14
	negs r4, r4
	adds r4, r0
	mov r12, r4
	ldrb r4, [r4]
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	mov r5, r12
	movs r4, 0x2
	ldrsb r4, [r5, r4]
	str r4, [sp, 0x4]
	bl warp_set
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080534E8: .4byte 0x02025748
	thumb_func_end saved_warp2_set

	thumb_func_start saved_warp2_set_2
saved_warp2_set_2: @ 80534EC
	push {r4,r5,lr}
	sub sp, 0x8
	ldr r4, [sp, 0x14]
	ldr r5, [sp, 0x18]
	ldr r0, _0805351C
	lsls r1, 24
	asrs r1, 24
	lsls r2, 24
	asrs r2, 24
	lsls r3, 24
	asrs r3, 24
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	lsls r5, 24
	asrs r5, 24
	str r5, [sp, 0x4]
	bl warp_set
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805351C: .4byte 0x02025748
	thumb_func_end saved_warp2_set_2

	thumb_func_start copy_saved_warp2_bank_and_enter_x_to_warp1
copy_saved_warp2_bank_and_enter_x_to_warp1: @ 8053520
	ldr r2, _08053530
	ldr r0, _08053534
	ldr r1, [r0, 0x18]
	ldr r0, [r0, 0x14]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08053530: .4byte 0x020297f8
_08053534: .4byte 0x02025734
	thumb_func_end copy_saved_warp2_bank_and_enter_x_to_warp1

	thumb_func_start sub_8053538
sub_8053538: @ 8053538
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	bl sub_80FA8CC
	adds r4, r0, 0
	cmp r4, 0
	beq _08053566
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	movs r2, 0x1
	negs r2, r2
	movs r3, 0x2
	ldrsb r3, [r4, r3]
	ldrb r4, [r4, 0x4]
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	bl warp1_set
_08053566:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8053538

	thumb_func_start sub_8053570
sub_8053570: @ 8053570
	ldr r2, _08053580
	ldr r0, _08053584
	ldr r1, [r0, 0x20]
	ldr r0, [r0, 0x1C]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08053580: .4byte 0x020297f8
_08053584: .4byte 0x02025734
	thumb_func_end sub_8053570

	thumb_func_start sub_8053588
sub_8053588: @ 8053588
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	bl sub_80FA8CC
	adds r5, r0, 0
	cmp r5, 0
	beq _080535B8
	ldr r0, _080535C0
	movs r1, 0
	ldrsb r1, [r5, r1]
	movs r2, 0x1
	ldrsb r2, [r5, r2]
	movs r3, 0x1
	negs r3, r3
	movs r4, 0x2
	ldrsb r4, [r5, r4]
	str r4, [sp]
	movs r4, 0x4
	ldrsb r4, [r5, r4]
	str r4, [sp, 0x4]
	bl warp_set
_080535B8:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080535C0: .4byte 0x02025750
	thumb_func_end sub_8053588

	thumb_func_start sub_80535C4
sub_80535C4: @ 80535C4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 16
	lsrs r7, r1, 16
	bl sav1_map_get_light_level
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08053634
	movs r0, 0
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x1]
	lsls r1, 24
	asrs r1, 24
	bl get_map_light_level_by_bank_and_number
	lsls r0, 24
	lsrs r5, r0, 24
	adds r0, r4, 0
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	cmp r0, 0
	beq _0805362A
	adds r0, r5, 0
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0805362A
	ldr r1, _08053638
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	subs r3, r6, 0x7
	lsls r3, 24
	asrs r3, 24
	subs r4, r7, 0x6
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	bl sub_805363C
_0805362A:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053634: .4byte 0x020297f8
_08053638: .4byte 0x02025734
	thumb_func_end sub_80535C4

	thumb_func_start sub_805363C
sub_805363C: @ 805363C
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _08053674
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053674: .4byte 0x02025758
	thumb_func_end sub_805363C

	thumb_func_start sub_8053678
sub_8053678: @ 8053678
	ldr r2, _08053688
	ldr r0, _0805368C
	ldr r1, [r0, 0x28]
	ldr r0, [r0, 0x24]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08053688: .4byte 0x020297f8
_0805368C: .4byte 0x02025734
	thumb_func_end sub_8053678

	thumb_func_start sub_8053690
sub_8053690: @ 8053690
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _080536C8
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080536C8: .4byte 0x02029800
	thumb_func_end sub_8053690

	thumb_func_start warp1_set_to_warp2
warp1_set_to_warp2: @ 80536CC
	ldr r2, _080536DC
	ldr r0, _080536E0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_080536DC: .4byte 0x020297f8
_080536E0: .4byte 0x02029800
	thumb_func_end warp1_set_to_warp2

	thumb_func_start sub_80536E4
sub_80536E4: @ 80536E4
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _0805371C
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805371C: .4byte 0x02029808
	thumb_func_end sub_80536E4

	thumb_func_start sub_8053720
sub_8053720: @ 8053720
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r4, _08053748
	adds r0, r4, 0
	bl warp_data_is_not_neg_1
	cmp r0, 0x1
	bne _08053754
	ldr r2, _0805374C
	ldr r0, _08053750
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	b _0805376E
	.align 2, 0
_08053748: .4byte 0x02029808
_0805374C: .4byte 0x020297f8
_08053750: .4byte 0x020297f0
_08053754:
	movs r0, 0
	ldrsb r0, [r4, r0]
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	movs r2, 0x1
	negs r2, r2
	lsls r3, r5, 24
	asrs r3, 24
	lsls r4, r6, 24
	asrs r4, 24
	str r4, [sp]
	bl warp1_set
_0805376E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8053720

	thumb_func_start sub_8053778
sub_8053778: @ 8053778
	ldr r2, _08053788
	ldr r0, _0805378C
	ldr r1, [r0, 0x10]
	ldr r0, [r0, 0xC]
	str r0, [r2]
	str r1, [r2, 0x4]
	bx lr
	.align 2, 0
_08053788: .4byte 0x020297f8
_0805378C: .4byte 0x02025734
	thumb_func_end sub_8053778

	thumb_func_start unref_sub_8053790
unref_sub_8053790: @ 8053790
	push {r4-r6,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	ldr r1, [sp, 0x18]
	ldr r0, _080537C8
	lsls r4, 24
	asrs r4, 24
	lsls r5, 24
	asrs r5, 24
	lsls r6, 24
	asrs r6, 24
	lsls r3, 24
	asrs r3, 24
	str r3, [sp]
	lsls r1, 24
	asrs r1, 24
	str r1, [sp, 0x4]
	adds r1, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl warp_set
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080537C8: .4byte 0x02025740
	thumb_func_end unref_sub_8053790

	thumb_func_start sub_80537CC
sub_80537CC: @ 80537CC
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	bl sub_80FA8CC
	adds r5, r0, 0
	cmp r5, 0
	beq _080537FC
	ldr r0, _08053804
	movs r1, 0
	ldrsb r1, [r5, r1]
	movs r2, 0x1
	ldrsb r2, [r5, r2]
	movs r3, 0x1
	negs r3, r3
	movs r4, 0x2
	ldrsb r4, [r5, r4]
	str r4, [sp]
	movs r4, 0x4
	ldrsb r4, [r5, r4]
	str r4, [sp, 0x4]
	bl warp_set
_080537FC:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053804: .4byte 0x02025740
	thumb_func_end sub_80537CC

	thumb_func_start gpu_sync_bg_hide
gpu_sync_bg_hide: @ 8053808
	ldr r2, _08053814
	ldr r0, [r2, 0x14]
	ldr r1, [r2, 0x18]
	str r0, [r2, 0xC]
	str r1, [r2, 0x10]
	bx lr
	.align 2, 0
_08053814: .4byte 0x02025734
	thumb_func_end gpu_sync_bg_hide

	thumb_func_start sub_8053818
sub_8053818: @ 8053818
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0805382C
	ldr r0, [r0, 0xC]
	ldr r3, [r0]
	ldr r1, [r0, 0x4]
	cmp r1, 0
	bne _08053834
	b _08053848
	.align 2, 0
_0805382C: .4byte 0x0202e828
_08053830:
	adds r0, r1, 0
	b _0805384A
_08053834:
	movs r2, 0
	cmp r2, r3
	bge _08053848
_0805383A:
	ldrb r0, [r1]
	cmp r0, r4
	beq _08053830
	adds r2, 0x1
	adds r1, 0xC
	cmp r2, r3
	blt _0805383A
_08053848:
	movs r0, 0
_0805384A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8053818

	thumb_func_start sub_8053850
sub_8053850: @ 8053850
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	bl sub_8053818
	adds r1, r0, 0
	cmp r1, 0
	beq _08053888
	movs r0, 0x8
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, 0x9]
	lsls r1, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	lsls r3, r4, 24
	asrs r3, 24
	lsls r4, r5, 24
	asrs r4, 24
	str r4, [sp]
	bl warp1_set
	b _080538A4
_08053888:
	bl mapheader_run_script_with_tag_x6
	ldr r0, _0805389C
	bl warp_data_is_not_neg_1
	cmp r0, 0
	beq _080538A0
	movs r0, 0
	b _080538A6
	.align 2, 0
_0805389C: .4byte 0x02029800
_080538A0:
	bl warp1_set_to_warp2
_080538A4:
	movs r0, 0x1
_080538A6:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8053850

	thumb_func_start sub_80538B0
sub_80538B0: @ 80538B0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x6
	adds r1, r3, 0
	bl sub_8053850
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80538B0

	thumb_func_start sub_80538D0
sub_80538D0: @ 80538D0
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	lsls r3, 16
	lsrs r3, 16
	lsls r2, 16
	lsrs r2, 16
	movs r0, 0x5
	adds r1, r3, 0
	bl sub_8053850
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_80538D0

	thumb_func_start sub_80538F0
sub_80538F0: @ 80538F0
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsls r1, 24
	lsrs r5, r0, 24
	asrs r0, 24
	lsrs r4, r1, 24
	asrs r1, 24
	movs r3, 0x1
	negs r3, r3
	str r3, [sp]
	adds r2, r3, 0
	bl warp1_set
	bl sub_8053F0C
	bl warp_shift
	bl set_current_map_header_from_sav1_save_old_name
	bl sub_8053154
	bl sub_806906C
	bl wild_pokemon_reroll
	bl prev_quest_postbuffer_cursor_backup_reset
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8082BD0
	bl InTrainerHill
	bl sub_80806E4
	bl sub_8054164
	bl sub_8053C98
	bl sav1_reset_battle_music_maybe
	bl mapheader_run_script_with_tag_x3
	bl not_trainer_hill_battle_pyramid
	ldr r4, _08053990
	ldr r0, [r4]
	bl sub_8056D38
	ldr r0, [r4]
	bl apply_map_tileset2_palette
	movs r4, 0x6
_0805395C:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_807D874
	adds r4, 0x1
	cmp r4, 0xB
	ble _0805395C
	bl sub_8072ED0
	bl mapnumbers_history_shift_sav1_0_2_4_out
	bl sub_8134394
	bl sub_808073C
	bl wild_encounter_reset_coro_args
	bl mapheader_run_script_with_tag_x5
	bl AddMapNamePopUpWindowTask
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053990: .4byte 0x0202e828
	thumb_func_end sub_80538F0

	thumb_func_start sub_8053994
sub_8053994: @ 8053994
	push {r4-r6,lr}
	adds r6, r0, 0
	bl set_current_map_header_from_sav1_save_old_name
	bl sub_8053154
	ldr r4, _08053A2C
	ldrb r0, [r4, 0x17]
	bl is_light_level_1_2_3_5_or_6
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r4, 0x17]
	bl is_light_level_8_or_9
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_806906C
	bl wild_pokemon_reroll
	bl prev_quest_postbuffer_cursor_backup_reset
	ldr r1, _08053A30
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl sub_8082BD0
	cmp r6, 0x1
	beq _080539E2
	bl InTrainerHill
_080539E2:
	bl sub_80806E4
	bl sub_8054164
	cmp r5, 0
	beq _080539F4
	ldr r0, _08053A34
	bl FlagReset
_080539F4:
	bl sub_8053C98
	bl sav1_reset_battle_music_maybe
	bl mapheader_run_script_with_tag_x3
	bl mapnumbers_history_shift_sav1_0_2_4_out
	bl sub_8134348
	bl not_trainer_hill_battle_pyramid
	cmp r6, 0x1
	beq _08053A24
	cmp r4, 0
	beq _08053A24
	ldr r1, _08053A38
	ldr r0, [r1]
	ldr r1, [r1, 0x4]
	bl UpdateTVScreensOnMap
	movs r0, 0x1
	bl sub_80BBCCC
_08053A24:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08053A2C: .4byte 0x0202e828
_08053A30: .4byte 0x02025734
_08053A34: .4byte 0x00000828
_08053A38: .4byte 0x03004870
	thumb_func_end sub_8053994

	thumb_func_start player_avatar_init_params_reset
player_avatar_init_params_reset: @ 8053A3C
	ldr r1, _08053A48
	movs r0, 0x1
	strb r0, [r1, 0x1]
	strb r0, [r1]
	bx lr
	.align 2, 0
_08053A48: .4byte 0x02029810
	thumb_func_end player_avatar_init_params_reset

	thumb_func_start walkrun_find_lowest_active_bit_in_bitfield
walkrun_find_lowest_active_bit_in_bitfield: @ 8053A4C
	push {r4,lr}
	bl player_get_direction_lower_nybble
	ldr r4, _08053A68
	strb r0, [r4, 0x1]
	movs r0, 0x2
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053A6C
	movs r0, 0x2
	b _08053A9E
	.align 2, 0
_08053A68: .4byte 0x02029810
_08053A6C:
	movs r0, 0x4
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053A7C
	movs r0, 0x4
	b _08053A9E
_08053A7C:
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053A8C
	movs r0, 0x8
	b _08053A9E
_08053A8C:
	movs r0, 0x10
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053A9C
	movs r0, 0x10
	b _08053A9E
_08053A9C:
	movs r0, 0x1
_08053A9E:
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end walkrun_find_lowest_active_bit_in_bitfield

	thumb_func_start sub_8053AA8
sub_8053AA8: @ 8053AA8
	push {r4-r7,lr}
	bl sav1_map_get_light_level
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	bl cur_mapdata_block_role_at_screen_center_acc_to_sav1
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r6, _08053AF4
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8053B00
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08053AF8
	ands r7, r0
	orrs r7, r1
	adds r0, r6, 0
	adds r2, r4, 0
	adds r3, r5, 0
	bl sub_8053B60
	lsls r0, 24
	lsrs r0, 16
	ldr r1, _08053AFC
	ands r7, r1
	orrs r7, r0
	str r7, [r6]
	adds r0, r6, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08053AF4: .4byte 0x02029810
_08053AF8: .4byte 0xffffff00
_08053AFC: .4byte 0xffff00ff
	thumb_func_end sub_8053AA8

	thumb_func_start sub_8053B00
sub_8053B00: @ 8053B00
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0x8
	beq _08053B1C
	ldr r0, _08053B24
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _08053B56
_08053B1C:
	cmp r4, 0x5
	bne _08053B28
	movs r0, 0x10
	b _08053B58
	.align 2, 0
_08053B24: .4byte 0x0000082d
_08053B28:
	lsls r0, r5, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08053B3C
	movs r0, 0x8
	b _08053B58
_08053B3C:
	bl sub_8053C44
	cmp r0, 0x1
	bne _08053B56
	ldrb r0, [r6]
	cmp r0, 0x2
	bne _08053B4E
	movs r0, 0x2
	b _08053B58
_08053B4E:
	cmp r0, 0x4
	bne _08053B56
	movs r0, 0x4
	b _08053B58
_08053B56:
	movs r0, 0x1
_08053B58:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8053B00

	thumb_func_start sub_8053B60
sub_8053B60: @ 8053B60
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 16
	lsrs r4, r2, 16
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, _08053BC0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08053B80
	cmp r5, 0x6
	beq _08053BE0
_08053B80:
	lsls r4, 24
	lsrs r5, r4, 24
	adds r0, r5, 0
	bl sub_8056F24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053BBC
	adds r0, r5, 0
	bl sub_8056F08
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053C16
	adds r0, r5, 0
	bl sub_8056EAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053C16
	adds r0, r5, 0
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08053BC4
_08053BBC:
	movs r0, 0x2
	b _08053C1C
	.align 2, 0
_08053BC0: .4byte 0x0000082d
_08053BC4:
	adds r0, r5, 0
	bl MetatileBehavior_IsNorthArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053C16
	adds r0, r5, 0
	bl MetatileBehavior_IsWestArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08053BE4
_08053BE0:
	movs r0, 0x4
	b _08053C1C
_08053BE4:
	adds r0, r5, 0
	bl MetatileBehavior_IsEastArrowWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08053BF6
	movs r0, 0x3
	b _08053C1C
_08053BF6:
	ldrb r0, [r6]
	cmp r0, 0x10
	bne _08053C00
	cmp r7, 0x8
	beq _08053C1A
_08053C00:
	cmp r0, 0x8
	bne _08053C08
	cmp r7, 0x10
	beq _08053C1A
_08053C08:
	lsrs r0, r4, 24
	bl MetatileBehavior_IsLadder
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053C1A
_08053C16:
	movs r0, 0x1
	b _08053C1C
_08053C1A:
	ldrb r0, [r6, 0x1]
_08053C1C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8053B60

	thumb_func_start cur_mapdata_block_role_at_screen_center_acc_to_sav1
cur_mapdata_block_role_at_screen_center_acc_to_sav1: @ 8053C24
	push {lr}
	ldr r1, _08053C40
	movs r2, 0
	ldrsh r0, [r1, r2]
	adds r0, 0x7
	movs r2, 0x2
	ldrsh r1, [r1, r2]
	adds r1, 0x7
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_08053C40: .4byte 0x02025734
	thumb_func_end cur_mapdata_block_role_at_screen_center_acc_to_sav1

	thumb_func_start sub_8053C44
sub_8053C44: @ 8053C44
	push {lr}
	ldr r0, _08053C80
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	adds r2, r0, 0
	cmp r1, 0x1D
	bne _08053C5E
	ldrb r0, [r2, 0x5]
	subs r0, 0xB
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08053C7C
_08053C5E:
	ldr r0, _08053C84
	ldrb r0, [r0, 0x17]
	cmp r0, 0x8
	beq _08053C90
	cmp r0, 0x9
	beq _08053C90
	cmp r0, 0x5
	beq _08053C90
	ldrh r1, [r2, 0x4]
	ldr r0, _08053C88
	cmp r1, r0
	beq _08053C90
	ldr r0, _08053C8C
	cmp r1, r0
	beq _08053C90
_08053C7C:
	movs r0, 0x1
	b _08053C92
	.align 2, 0
_08053C80: .4byte 0x02025734
_08053C84: .4byte 0x0202e828
_08053C88: .4byte 0x00002418
_08053C8C: .4byte 0x00002a18
_08053C90:
	movs r0, 0
_08053C92:
	pop {r1}
	bx r1
	thumb_func_end sub_8053C44

	thumb_func_start sub_8053C98
sub_8053C98: @ 8053C98
	push {lr}
	ldr r0, _08053CA8
	ldrb r1, [r0, 0x15]
	cmp r1, 0
	bne _08053CB0
	ldr r0, _08053CAC
	b _08053CD2
	.align 2, 0
_08053CA8: .4byte 0x0202e828
_08053CAC: .4byte 0x02025734
_08053CB0:
	ldr r0, _08053CC4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08053CCC
	ldr r0, _08053CC8
	adds r0, 0x30
	movs r1, 0x1
	b _08053CD4
	.align 2, 0
_08053CC4: .4byte 0x00000828
_08053CC8: .4byte 0x02025734
_08053CCC:
	ldr r0, _08053CDC
	ldr r1, _08053CE0
	ldr r1, [r1]
_08053CD2:
	adds r0, 0x30
_08053CD4:
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08053CDC: .4byte 0x02025734
_08053CE0: .4byte gUnknown_0839ACE8
	thumb_func_end sub_8053C98

	thumb_func_start sub_8053CE4
sub_8053CE4: @ 8053CE4
	push {lr}
	adds r1, r0, 0
	cmp r1, 0
	blt _08053CF4
	ldr r0, _08053D00
	ldr r0, [r0]
	cmp r1, r0
	ble _08053CF6
_08053CF4:
	movs r1, 0
_08053CF6:
	ldr r0, _08053D04
	adds r0, 0x30
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08053D00: .4byte gUnknown_0839ACE8
_08053D04: .4byte 0x02025734
	thumb_func_end sub_8053CE4

	thumb_func_start sav1_get_flash_used_on_map
sav1_get_flash_used_on_map: @ 8053D08
	ldr r0, _08053D10
	adds r0, 0x30
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08053D10: .4byte 0x02025734
	thumb_func_end sav1_get_flash_used_on_map

	thumb_func_start sub_8053D14
sub_8053D14: @ 8053D14
	push {lr}
	ldr r1, _08053D28
	strh r0, [r1, 0x32]
	bl get_mapdata_header
	ldr r1, _08053D2C
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08053D28: .4byte 0x02025734
_08053D2C: .4byte 0x0202e828
	thumb_func_end sub_8053D14

	thumb_func_start sub_8053D30
sub_8053D30: @ 8053D30
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08053D60
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08053D64
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0
	bne _08053D64
	movs r0, 0x1
	ldrsb r0, [r4, r0]
	cmp r0, 0x5
	blt _08053D64
	cmp r0, 0x8
	ble _08053D5C
	cmp r0, 0x2B
	bgt _08053D64
	cmp r0, 0x27
	blt _08053D64
_08053D5C:
	movs r0, 0x1
	b _08053D66
	.align 2, 0
_08053D60: .4byte 0x0000082a
_08053D64:
	movs r0, 0
_08053D66:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8053D30

	thumb_func_start sub_8053D6C
sub_8053D6C: @ 8053D6C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, _08053D90
	bl VarGet
	lsls r0, 16
	cmp r0, 0
	bne _08053D8A
	movs r0, 0
	ldrsb r0, [r4, r0]
	cmp r0, 0x20
	bne _08053D8A
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	bls _08053D94
_08053D8A:
	movs r0, 0
	b _08053D96
	.align 2, 0
_08053D90: .4byte 0x000040b3
_08053D94:
	movs r0, 0x1
_08053D96:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8053D6C

	thumb_func_start sub_8053D9C
sub_8053D9C: @ 8053D9C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8053D30
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bne _08053DB2
	.ifdef SAPPHIRE
	ldr r0, _sub_8053D9C_LegendaryMusic
	.else
	movs r0, 0xDE
	lsls r0, 1
	.endif
	b _08053DDC
	.ifdef SAPPHIRE
	.align 2, 0
_sub_8053D9C_LegendaryMusic: .4byte 443 @ OOAME (Kyogre's Heavy Rain theme)
	.endif
_08053DB2:
	adds r0, r4, 0
	bl sub_8053D6C
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	beq _08053DD8
	movs r0, 0
	ldrsb r0, [r4, r0]
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrh r0, [r0, 0x10]
	b _08053DDC
_08053DD8:
	movs r0, 0xCB
	lsls r0, 1
_08053DDC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8053D9C

	thumb_func_start sav1_map_get_music
sav1_map_get_music: @ 8053DE4
	push {r4,lr}
	ldr r0, _08053E04
	ldrh r1, [r0, 0x4]
	movs r0, 0xD0
	lsls r0, 5
	cmp r1, r0
	bne _08053E0C
	bl sav1_get_weather_probably
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8
	bne _08053E0C
	ldr r0, _08053E08
	b _08053E40
	.align 2, 0
_08053E04: .4byte 0x02025734
_08053E08: .4byte 0x00000199
_08053E0C:
	ldr r4, _08053E24
	adds r0, r4, 0
	bl sub_8053D9C
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _08053E28
	cmp r1, r0
	beq _08053E2C
	adds r0, r1, 0
	b _08053E40
	.align 2, 0
_08053E24: .4byte 0x02025738
_08053E28: .4byte 0x00007fff
_08053E2C:
	subs r0, r4, 0x4
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0x17
	ble _08053E3C
	movs r0, 0xC9
	lsls r0, 1
	b _08053E40
_08053E3C:
	movs r0, 0xB4
	lsls r0, 1
_08053E40:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sav1_map_get_music

	thumb_func_start warp1_target_get_music
warp1_target_get_music: @ 8053E48
	push {lr}
	ldr r0, _08053E60
	bl sub_8053D9C
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r0, _08053E64
	cmp r1, r0
	beq _08053E68
	adds r0, r1, 0
	b _08053E80
	.align 2, 0
_08053E60: .4byte 0x020297f8
_08053E64: .4byte 0x00007fff
_08053E68:
	ldr r0, _08053E78
	ldrh r1, [r0, 0x4]
	movs r0, 0x80
	lsls r0, 2
	cmp r1, r0
	beq _08053E7C
	subs r0, 0x6E
	b _08053E80
	.align 2, 0
_08053E78: .4byte 0x02025734
_08053E7C:
	movs r0, 0xB4
	lsls r0, 1
_08053E80:
	pop {r1}
	bx r1
	thumb_func_end warp1_target_get_music

	thumb_func_start call_map_music_set_to_zero
call_map_music_set_to_zero: @ 8053E84
	push {lr}
	bl map_music_set_to_zero
	pop {r0}
	bx r0
	thumb_func_end call_map_music_set_to_zero

	thumb_func_start sub_8053E90
sub_8053E90: @ 8053E90
	push {r4,lr}
	bl sav1_map_get_music
	lsls r0, 16
	lsrs r4, r0, 16
	.ifdef SAPPHIRE
	ldr r0, _sub_8053E90_LegendaryMusic
	.else
	movs r0, 0xDE
	lsls r0, 1
	.endif
	cmp r4, r0
	beq _08053ED6
	ldr r1, _08053EB0
	ldrh r0, [r1, 0x2C]
	cmp r0, 0
	beq _08053EB4
	adds r4, r0, 0
	b _08053ED6
	.align 2, 0
	.ifdef SAPPHIRE
_sub_8053E90_LegendaryMusic: .4byte 443 @ OOAME (Kyogre's Heavy Rain theme)
	.endif
_08053EB0: .4byte 0x02025734
_08053EB4:
	bl sav1_map_get_light_level
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	bne _08053EC8
	ldr r4, _08053EC4
	b _08053ED6
	.align 2, 0
_08053EC4: .4byte 0x0000019b
_08053EC8:
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053ED6
	ldr r4, _08053EF0
_08053ED6:
	bl current_map_music_get
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _08053EE8
	adds r0, r4, 0
	bl current_map_music_set
_08053EE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053EF0: .4byte 0x0000016d
	thumb_func_end sub_8053E90

	thumb_func_start sav1_set_battle_music_maybe
sav1_set_battle_music_maybe: @ 8053EF4
	ldr r1, _08053EFC
	strh r0, [r1, 0x2C]
	bx lr
	.align 2, 0
_08053EFC: .4byte 0x02025734
	thumb_func_end sav1_set_battle_music_maybe

	thumb_func_start sav1_reset_battle_music_maybe
sav1_reset_battle_music_maybe: @ 8053F00
	ldr r1, _08053F08
	movs r0, 0
	strh r0, [r1, 0x2C]
	bx lr
	.align 2, 0
_08053F08: .4byte 0x02025734
	thumb_func_end sav1_reset_battle_music_maybe

	thumb_func_start sub_8053F0C
sub_8053F0C: @ 8053F0C
	push {r4-r6,lr}
	ldr r0, _08053F6C
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053F7C
	bl warp1_target_get_music
	lsls r0, 16
	lsrs r5, r0, 16
	bl current_map_music_get
	lsls r0, 16
	lsrs r4, r0, 16
	.ifdef SAPPHIRE
	ldr r0, _sub_8053F0C_LegendaryMusic
	.else
	movs r0, 0xDE
	lsls r0, 1
	.endif
	cmp r5, r0
	beq _08053F4E
	subs r0, 0x21
	cmp r4, r0
	beq _08053F7C
	ldr r6, _08053F70
	cmp r4, r6
	beq _08053F7C
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053F4E
	adds r5, r6, 0
_08053F4E:
	cmp r5, r4
	beq _08053F7C
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08053F74
	adds r0, r5, 0
	movs r1, 0x4
	movs r2, 0x4
	bl sub_8074D94
	b _08053F7C
	.align 2, 0
_08053F6C: .4byte 0x00004001
	.ifdef SAPPHIRE
_sub_8053F0C_LegendaryMusic: .4byte 443 @ OOAME (Kyogre's Heavy Rain theme)
	.endif
_08053F70: .4byte 0x0000016d
_08053F74:
	adds r0, r5, 0
	movs r1, 0x8
	bl sub_8074D60
_08053F7C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8053F0C

	thumb_func_start sub_8053F84
sub_8053F84: @ 8053F84
	push {r4,lr}
	bl current_map_music_get
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	bl sav1_map_get_music
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _08053FAA
	bl sav1_map_get_music
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x8
	bl sub_8074D60
_08053FAA:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8053F84

	thumb_func_start sub_8053FB0
sub_8053FB0: @ 8053FB0
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	bl current_map_music_get
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r4
	beq _08053FD2
	.ifdef SAPPHIRE
	ldr r0, _sub_8053FB0_LegendaryMusic
	.else
	movs r0, 0xDE
	lsls r0, 1
	.endif
	cmp r1, r0
	beq _08053FD2
	adds r0, r4, 0
	movs r1, 0x8
	bl sub_8074D60
_08053FD2:
	pop {r4}
	pop {r0}
	bx r0
	.ifdef SAPPHIRE
	.align 2, 0
_sub_8053FB0_LegendaryMusic: .4byte 443 @ OOAME (Kyogre's Heavy Rain theme)
	.endif
	thumb_func_end sub_8053FB0

	thumb_func_start is_warp1_light_level_8_or_9
is_warp1_light_level_8_or_9: @ 8053FD8
	push {lr}
	bl warp1_get_mapheader
	ldrb r0, [r0, 0x17]
	bl is_light_level_8_or_9
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08053FF0
	movs r0, 0x4
	b _08053FF2
_08053FF0:
	movs r0, 0x2
_08053FF2:
	pop {r1}
	bx r1
	thumb_func_end is_warp1_light_level_8_or_9

	thumb_func_start sub_8053FF8
sub_8053FF8: @ 8053FF8
	push {r4,lr}
	bl warp1_target_get_music
	lsls r0, 16
	lsrs r4, r0, 16
	ldr r0, _08054030
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08054028
	bl current_map_music_get
	lsls r0, 16
	lsrs r0, 16
	cmp r4, r0
	beq _08054028
	bl is_warp1_light_level_8_or_9
	lsls r0, 24
	lsrs r0, 24
	bl sub_8074D28
_08054028:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054030: .4byte 0x00004001
	thumb_func_end sub_8053FF8

	thumb_func_start sub_8054034
sub_8054034: @ 8054034
	push {lr}
	bl sub_8074E14
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end sub_8054034

	thumb_func_start sub_8054044
sub_8054044: @ 8054044
	push {lr}
	movs r0, 0x4
	bl sub_8074D28
	pop {r0}
	bx r0
	thumb_func_end sub_8054044

	thumb_func_start sub_8054050
sub_8054050: @ 8054050
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	ldr r0, _080540C8
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08054084
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	beq _080540C0
_08054084:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x58
	bl __umodsi3
	adds r4, r0, 0
	adds r4, 0xD4
	lsls r4, 24
	lsrs r4, 24
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x1E
	bl __umodsi3
	adds r2, r0, 0
	adds r2, 0x32
	ldr r0, _080540CC
	ldrh r0, [r0]
	lsls r4, 24
	asrs r4, 24
	lsls r2, 24
	asrs r2, 24
	adds r1, r4, 0
	movs r3, 0x1
	bl sub_8075090
_080540C0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080540C8: .4byte 0x02029816
_080540CC: .4byte 0x02029814
	thumb_func_end sub_8054050

	thumb_func_start sub_80540D0
sub_80540D0: @ 80540D0
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	movs r1, 0
	ldrsh r0, [r6, r1]
	cmp r0, 0x4
	bhi _0805415E
	lsls r0, 2
	ldr r1, _080540E8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080540E8: .4byte _080540EC
	.align 2, 0
_080540EC:
	.4byte _08054100
	.4byte _08054114
	.4byte _08054130
	.4byte _0805414A
	.4byte _0805415E
_08054100:
	ldr r0, _0805410C
	ldrh r0, [r0]
	cmp r0, 0
	bne _08054110
	movs r0, 0x4
	b _0805415C
	.align 2, 0
_0805410C: .4byte 0x02029814
_08054110:
	movs r0, 0x1
	b _0805415C
_08054114:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x96
	lsls r1, 4
	bl __umodsi3
	movs r1, 0x96
	lsls r1, 3
	adds r0, r1
	strh r0, [r5]
	movs r0, 0x3
	b _0805415C
_08054130:
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r4, 0x96
	lsls r4, 3
	adds r1, r4, 0
	bl __umodsi3
	adds r0, r4
	strh r0, [r5]
	movs r0, 0x3
	b _0805415C
_0805414A:
	ldrh r0, [r5]
	subs r0, 0x1
	strh r0, [r5]
	lsls r0, 16
	cmp r0, 0
	bne _0805415E
	bl sub_8054050
	movs r0, 0x2
_0805415C:
	strh r0, [r6]
_0805415E:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80540D0

	thumb_func_start sub_8054164
sub_8054164: @ 8054164
	push {lr}
	ldr r0, _08054188
	ldrh r1, [r0, 0x4]
	movs r0, 0xB4
	lsls r0, 6
	cmp r1, r0
	bne _08054190
	bl sub_810D32C
	lsls r0, 24
	cmp r0, 0
	bne _08054190
	ldr r1, _0805418C
	movs r0, 0x1
	strb r0, [r1]
	bl sub_8085514
	b _08054196
	.align 2, 0
_08054188: .4byte 0x02025734
_0805418C: .4byte 0x02029816
_08054190:
	ldr r0, _080541A0
	bl wild_pokemon_rand_for_map
_08054196:
	ldr r1, _080541A4
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080541A0: .4byte 0x02029816
_080541A4: .4byte 0x02029814
	thumb_func_end sub_8054164

	thumb_func_start get_map_light_level_by_bank_and_number
get_map_light_level_by_bank_and_number: @ 80541A8
	push {lr}
	lsls r0, 24
	asrs r0, 8
	lsrs r0, 16
	lsls r1, 24
	asrs r1, 8
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x17]
	pop {r1}
	bx r1
	thumb_func_end get_map_light_level_by_bank_and_number

	thumb_func_start get_map_light_level_from_warp
get_map_light_level_from_warp: @ 80541C0
	push {lr}
	movs r2, 0
	ldrsb r2, [r0, r2]
	movs r1, 0x1
	ldrsb r1, [r0, r1]
	adds r0, r2, 0
	bl get_map_light_level_by_bank_and_number
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end get_map_light_level_from_warp

	thumb_func_start sav1_map_get_light_level
sav1_map_get_light_level: @ 80541D8
	push {lr}
	ldr r0, _080541E8
	bl get_map_light_level_from_warp
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080541E8: .4byte 0x02025738
	thumb_func_end sav1_map_get_light_level

	thumb_func_start get_map_light_from_warp0
get_map_light_from_warp0: @ 80541EC
	push {lr}
	ldr r0, _080541FC
	bl get_map_light_level_from_warp
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080541FC: .4byte 0x020297f0
	thumb_func_end get_map_light_from_warp0

	thumb_func_start is_light_level_1_2_3_5_or_6
is_light_level_1_2_3_5_or_6: @ 8054200
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0805421A
	cmp r0, 0x1
	beq _0805421A
	cmp r0, 0x5
	beq _0805421A
	cmp r0, 0x2
	beq _0805421A
	cmp r0, 0x6
	bne _0805421E
_0805421A:
	movs r0, 0x1
	b _08054220
_0805421E:
	movs r0, 0
_08054220:
	pop {r1}
	bx r1
	thumb_func_end is_light_level_1_2_3_5_or_6

	thumb_func_start is_light_level_1_2_3_or_6
is_light_level_1_2_3_or_6: @ 8054224
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _0805423A
	cmp r0, 0x1
	beq _0805423A
	cmp r0, 0x6
	beq _0805423A
	cmp r0, 0x2
	bne _0805423E
_0805423A:
	movs r0, 0x1
	b _08054240
_0805423E:
	movs r0, 0
_08054240:
	pop {r1}
	bx r1
	thumb_func_end is_light_level_1_2_3_or_6

	thumb_func_start is_light_level_8_or_9
is_light_level_8_or_9: @ 8054244
	push {lr}
	lsls r0, 24
	movs r1, 0xF8
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08054258
	movs r0, 0
	b _0805425A
_08054258:
	movs r0, 0x1
_0805425A:
	pop {r1}
	bx r1
	thumb_func_end is_light_level_8_or_9

	thumb_func_start unref_sub_8054260
unref_sub_8054260: @ 8054260
	push {lr}
	ldr r1, _08054280
	movs r0, 0x14
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x15]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	pop {r1}
	bx r1
	.align 2, 0
_08054280: .4byte 0x02025734
	thumb_func_end unref_sub_8054260

	thumb_func_start sav1_map_get_name
sav1_map_get_name: @ 8054284
	push {lr}
	ldr r1, _080542A4
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x14]
	pop {r1}
	bx r1
	.align 2, 0
_080542A4: .4byte 0x02025734
	thumb_func_end sav1_map_get_name

	thumb_func_start sav1_map_get_battletype
sav1_map_get_battletype: @ 80542A8
	push {lr}
	ldr r1, _080542C8
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r1, 0x5]
	lsls r1, 24
	asrs r1, 24
	lsls r1, 16
	lsrs r1, 16
	bl get_mapheader_by_bank_and_number
	ldrb r0, [r0, 0x1B]
	pop {r1}
	bx r1
	.align 2, 0
_080542C8: .4byte 0x02025734
	thumb_func_end sav1_map_get_battletype

	thumb_func_start ResetSafariZoneFlag_
ResetSafariZoneFlag_: @ 80542CC
	push {lr}
	bl ResetSafariZoneFlag
	pop {r0}
	bx r0
	thumb_func_end ResetSafariZoneFlag_

	thumb_func_start is_c1_link_related_active
is_c1_link_related_active: @ 80542D8
	push {lr}
	ldr r0, _080542E8
	ldr r1, [r0]
	ldr r0, _080542EC
	cmp r1, r0
	beq _080542F0
	movs r0, 0
	b _080542F2
	.align 2, 0
_080542E8: .4byte 0x03001770
_080542EC: .4byte sub_8055354
_080542F0:
	movs r0, 0x1
_080542F2:
	pop {r1}
	bx r1
	thumb_func_end is_c1_link_related_active

	thumb_func_start c1_overworld_normal
c1_overworld_normal: @ 80542F8
	push {r4-r6,lr}
	sub sp, 0x4
	lsls r0, 16
	lsrs r0, 16
	adds r5, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r4, r1, 0
	bl sub_8059204
	mov r6, sp
	mov r0, sp
	bl sub_8067EEC
	mov r0, sp
	adds r1, r5, 0
	adds r2, r4, 0
	bl process_overworld_input
	bl script_env_2_is_enabled
	lsls r0, 24
	cmp r0, 0
	bne _08054346
	mov r0, sp
	bl sub_8068024
	cmp r0, 0x1
	bne _0805433C
	bl script_env_2_enable
	bl HideMapNamePopUpWindow
	b _08054346
_0805433C:
	ldrb r0, [r6, 0x2]
	adds r1, r5, 0
	adds r2, r4, 0
	bl player_step
_08054346:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end c1_overworld_normal

	thumb_func_start c1_overworld
c1_overworld: @ 8054350
	push {lr}
	ldr r2, _08054368
	ldr r1, [r2, 0x4]
	ldr r0, _0805436C
	cmp r1, r0
	bne _08054364
	ldrh r0, [r2, 0x2E]
	ldrh r1, [r2, 0x2C]
	bl c1_overworld_normal
_08054364:
	pop {r0}
	bx r0
	.align 2, 0
_08054368: .4byte 0x03001770
_0805436C: .4byte c2_overworld
	thumb_func_end c1_overworld

	thumb_func_start c2_overworld_basic
c2_overworld_basic: @ 8054370
	push {lr}
	bl script_env_2_run_current_script
	bl RunTasks
	bl AnimateSprites
	bl CameraUpdate
	bl UpdateCameraPanning
	bl BuildOamBuffer
	bl UpdatePaletteFade
	bl sub_8072EDC
	pop {r0}
	bx r0
	thumb_func_end c2_overworld_basic

	thumb_func_start sub_8054398
sub_8054398: @ 8054398
	push {lr}
	bl c2_overworld_basic
	pop {r0}
	bx r0
	thumb_func_end sub_8054398

	thumb_func_start c2_overworld
c2_overworld: @ 80543A4
	push {r4,lr}
	ldr r0, _080543CC
	ldrb r0, [r0, 0x7]
	lsrs r0, 7
	adds r4, r0, 0
	cmp r4, 0
	beq _080543B8
	movs r0, 0
	bl SetVBlankCallback
_080543B8:
	bl c2_overworld_basic
	cmp r4, 0
	beq _080543C4
	bl SetFieldVBlankCallback
_080543C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080543CC: .4byte 0x0202f388
	thumb_func_end c2_overworld

	thumb_func_start set_callback1
set_callback1: @ 80543D0
	ldr r1, _080543D8
	str r0, [r1]
	bx lr
	.align 2, 0
_080543D8: .4byte 0x03001770
	thumb_func_end set_callback1

	thumb_func_start sub_80543DC
sub_80543DC: @ 80543DC
	ldr r1, _080543E4
	str r0, [r1]
	bx lr
	.align 2, 0
_080543E4: .4byte 0x03000584
	thumb_func_end sub_80543DC

	thumb_func_start sub_80543E8
sub_80543E8: @ 80543E8
	push {lr}
	ldr r0, _080543F8
	ldr r0, [r0]
	cmp r0, 0
	beq _080543FC
	bl _call_via_r0
	b _08054400
	.align 2, 0
_080543F8: .4byte 0x0300485c
_080543FC:
	bl mapldr_default
_08054400:
	ldr r1, _0805440C
	movs r0, 0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805440C: .4byte 0x0300485c
	thumb_func_end sub_80543E8

	thumb_func_start c2_load_new_map_2
c2_load_new_map_2: @ 8054410
	push {lr}
	bl sub_80547A8
	bl sub_8074D08
	bl ResetSafariZoneFlag_
	bl NewGameInitData
	bl player_avatar_init_params_reset
	bl PlayTimeCounter_Start
	bl script_env_1_init
	bl script_env_2_disable
	ldr r1, _08054454
	ldr r0, _08054458
	str r0, [r1]
	ldr r0, _0805445C
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _08054460
	bl set_callback1
	ldr r0, _08054464
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08054454: .4byte 0x0300485c
_08054458: .4byte sub_80C76A0
_0805445C: .4byte 0x03001bac
_08054460: .4byte c1_overworld
_08054464: .4byte c2_overworld
	thumb_func_end c2_load_new_map_2

	thumb_func_start c2_whiteout
c2_whiteout: @ 8054468
	push {lr}
	sub sp, 0x4
	ldr r1, _080544C4
	ldr r0, _080544C8
	adds r1, r0
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	bls _080544BE
	bl sub_80547A8
	bl sub_8074D08
	bl ResetSafariZoneFlag_
	bl sub_8052F5C
	bl player_avatar_init_params_reset
	bl script_env_1_init
	bl script_env_2_disable
	ldr r1, _080544CC
	ldr r0, _080544D0
	str r0, [r1]
	mov r1, sp
	movs r0, 0
	strb r0, [r1]
	mov r0, sp
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _080544D4
	bl set_callback1
	ldr r0, _080544D8
	bl SetMainCallback2
_080544BE:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080544C4: .4byte 0x03001770
_080544C8: .4byte 0x0000043c
_080544CC: .4byte 0x0300485c
_080544D0: .4byte sub_8080B60
_080544D4: .4byte c1_overworld
_080544D8: .4byte c2_overworld
	thumb_func_end c2_whiteout

	thumb_func_start c2_load_new_map
c2_load_new_map: @ 80544DC
	push {lr}
	bl sub_80547A8
	bl script_env_1_init
	bl script_env_2_disable
	movs r0, 0
	bl set_callback1
	ldr r0, _08054500
	bl SetMainCallback2
	ldr r1, _08054504
	ldr r0, _08054508
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_08054500: .4byte sub_810CC80
_08054504: .4byte 0x03001770
_08054508: .4byte CB2_NewGame
	thumb_func_end c2_load_new_map

	thumb_func_start CB2_NewGame
CB2_NewGame: @ 805450C
	push {lr}
	ldr r0, _08054528
	bl do_load_map_stuff_loop
	bl SetFieldVBlankCallback
	ldr r0, _0805452C
	bl set_callback1
	ldr r0, _08054530
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_08054528: .4byte 0x03001bac
_0805452C: .4byte c1_overworld
_08054530: .4byte c2_overworld
	thumb_func_end CB2_NewGame

	thumb_func_start sub_8054534
sub_8054534: @ 8054534
	push {r4,lr}
	ldr r0, _08054578
	ldr r1, _0805457C
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, 0
	bne _08054554
	bl sub_80547A8
	bl script_env_1_init
	bl script_env_2_disable
	movs r0, 0
	bl set_callback1
_08054554:
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_805493C
	cmp r0, 0
	beq _08054570
	bl SetFieldVBlankCallback
	ldr r0, _08054580
	bl set_callback1
	ldr r0, _08054584
	bl SetMainCallback2
_08054570:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054578: .4byte 0x03001770
_0805457C: .4byte 0x0000043c
_08054580: .4byte c1_overworld
_08054584: .4byte c2_overworld
	thumb_func_end sub_8054534

	thumb_func_start sub_8054588
sub_8054588: @ 8054588
	push {lr}
	bl sub_80547A8
	ldr r0, _080545A0
	ldr r1, _080545A4
	str r1, [r0]
	ldr r0, _080545A8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_080545A0: .4byte 0x0300485c
_080545A4: .4byte sub_8080AC4
_080545A8: .4byte c2_80567AC
	thumb_func_end sub_8054588

	thumb_func_start c2_80567AC
c2_80567AC: @ 80545AC
	push {lr}
	ldr r0, _080545D4
	bl sub_805483C
	cmp r0, 0
	beq _080545CE
	bl SetFieldVBlankCallback
	ldr r0, _080545D8
	bl set_callback1
	ldr r0, _080545DC
	bl sub_80543DC
	ldr r0, _080545E0
	bl SetMainCallback2
_080545CE:
	pop {r0}
	bx r0
	.align 2, 0
_080545D4: .4byte 0x03001bac
_080545D8: .4byte sub_8055354
_080545DC: .4byte sub_8055390
_080545E0: .4byte c2_overworld
	thumb_func_end c2_80567AC

	thumb_func_start c2_exit_to_overworld_2_switch
c2_exit_to_overworld_2_switch: @ 80545E4
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _080545FC
	ldr r0, _080545F8
	bl SetMainCallback2
	b _08054606
	.align 2, 0
_080545F8: .4byte c2_exit_to_overworld_2_link
_080545FC:
	bl sub_80547A8
	ldr r0, _0805460C
	bl SetMainCallback2
_08054606:
	pop {r0}
	bx r0
	.align 2, 0
_0805460C: .4byte c2_exit_to_overworld_2_local
	thumb_func_end c2_exit_to_overworld_2_switch

	thumb_func_start c2_exit_to_overworld_2_local
c2_exit_to_overworld_2_local: @ 8054610
	push {lr}
	ldr r0, _0805462C
	bl sub_8054A4C
	cmp r0, 0
	beq _08054626
	bl SetFieldVBlankCallback
	ldr r0, _08054630
	bl SetMainCallback2
_08054626:
	pop {r0}
	bx r0
	.align 2, 0
_0805462C: .4byte 0x03001bac
_08054630: .4byte c2_overworld
	thumb_func_end c2_exit_to_overworld_2_local

	thumb_func_start c2_exit_to_overworld_2_link
c2_exit_to_overworld_2_link: @ 8054634
	push {lr}
	bl sub_8055870
	cmp r0, 0
	bne _0805464E
	ldr r0, _08054654
	bl sub_8054A9C
	cmp r0, 0
	beq _0805464E
	ldr r0, _08054658
	bl SetMainCallback2
_0805464E:
	pop {r0}
	bx r0
	.align 2, 0
_08054654: .4byte 0x03001bac
_08054658: .4byte c2_overworld
	thumb_func_end c2_exit_to_overworld_2_link

	thumb_func_start sub_805465C
sub_805465C: @ 805465C
	push {lr}
	bl sub_80547A8
	bl sub_8074D08
	bl sub_8054F70
	ldr r0, _0805468C
	bl set_callback1
	ldr r0, _08054690
	bl sub_80543DC
	ldr r1, _08054694
	ldr r0, _08054698
	str r0, [r1]
	bl script_env_1_init
	bl script_env_2_disable
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_0805468C: .4byte sub_8055354
_08054690: .4byte sub_8055390
_08054694: .4byte 0x0300485c
_08054698: .4byte sub_8080A3C
	thumb_func_end sub_805465C

	thumb_func_start sub_805469C
sub_805469C: @ 805469C
	push {lr}
	bl sub_80547A8
	ldr r1, _080546B0
	ldr r0, _080546B4
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_080546B0: .4byte 0x0300485c
_080546B4: .4byte atk17_seteffectuser
	thumb_func_end sub_805469C

	thumb_func_start sub_80546B8
sub_80546B8: @ 80546B8
	push {lr}
	bl sub_80547A8
	ldr r1, _080546CC
	ldr r0, _080546D0
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_080546CC: .4byte 0x0300485c
_080546D0: .4byte sub_80809B0
	thumb_func_end sub_80546B8

	thumb_func_start c2_exit_to_overworld_1_continue_scripts_restart_music
c2_exit_to_overworld_1_continue_scripts_restart_music: @ 80546D4
	push {lr}
	bl sub_80547A8
	ldr r1, _080546E8
	ldr r0, _080546EC
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_080546E8: .4byte 0x0300485c
_080546EC: .4byte sub_8080990
	thumb_func_end c2_exit_to_overworld_1_continue_scripts_restart_music

	thumb_func_start sub_80546F0
sub_80546F0: @ 80546F0
	push {lr}
	bl sub_80547A8
	ldr r1, _08054704
	ldr r0, _08054708
	str r0, [r1]
	bl c2_exit_to_overworld_2_switch
	pop {r0}
	bx r0
	.align 2, 0
_08054704: .4byte 0x0300485c
_08054708: .4byte sub_8080B60
	thumb_func_end sub_80546F0

	thumb_func_start sub_805470C
sub_805470C: @ 805470C
	push {lr}
	ldr r0, _08054730
	ldrb r0, [r0, 0x1A]
	cmp r0, 0x1
	bne _08054726
	bl sub_80BBB24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08054726
	bl AddMapNamePopUpWindowTask
_08054726:
	bl sub_8080B60
	pop {r0}
	bx r0
	.align 2, 0
_08054730: .4byte 0x0202e828
	thumb_func_end sub_805470C

	thumb_func_start CB2_ContinueSavedGame
CB2_ContinueSavedGame: @ 8054734
	push {lr}
	bl sub_80547A8
	bl sub_8074D08
	bl ResetSafariZoneFlag_
	bl sub_805338C
	bl sub_8053198
	bl sub_806451C
	bl InTrainerHill
	bl sub_805308C
	bl sub_8055FC0
	bl PlayTimeCounter_Start
	bl script_env_1_init
	bl script_env_2_disable
	bl sub_80479F8
	cmp r0, 0x1
	bne _08054788
	bl sub_8047A04
	bl sub_8053778
	bl warp_in
	ldr r0, _08054784
	bl SetMainCallback2
	b _08054798
	.align 2, 0
_08054784: .4byte c2_load_new_map
_08054788:
	ldr r0, _0805479C
	ldr r1, _080547A0
	str r1, [r0]
	ldr r0, _080547A4
	bl set_callback1
	bl c2_exit_to_overworld_2_switch
_08054798:
	pop {r0}
	bx r0
	.align 2, 0
_0805479C: .4byte 0x0300485c
_080547A0: .4byte sub_805470C
_080547A4: .4byte c1_overworld
	thumb_func_end CB2_ContinueSavedGame

	thumb_func_start sub_80547A8
sub_80547A8: @ 80547A8
	push {r4,lr}
	ldr r4, _080547D8
	ldrh r3, [r4]
	movs r0, 0
	strh r0, [r4]
	ldr r2, _080547DC
	ldrh r1, [r2]
	ldr r0, _080547E0
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, 0x1
	orrs r0, r1
	strh r0, [r2]
	strh r3, [r4]
	movs r0, 0
	bl SetVBlankCallback
	movs r0, 0
	bl SetHBlankCallback
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080547D8: .4byte 0x04000208
_080547DC: .4byte 0x04000200
_080547E0: .4byte 0x0000fffd
	thumb_func_end sub_80547A8

	thumb_func_start SetFieldVBlankCallback
SetFieldVBlankCallback: @ 80547E4
	push {lr}
	ldr r0, _080547F0
	bl SetVBlankCallback
	pop {r0}
	bx r0
	.align 2, 0
_080547F0: .4byte VBlankCB_Field
	thumb_func_end SetFieldVBlankCallback

	thumb_func_start VBlankCB_Field
VBlankCB_Field: @ 80547F4
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl sub_8089668
	bl sub_8057A58
	bl TransferPlttBuffer
	bl sub_8072E74
	pop {r0}
	bx r0
	thumb_func_end VBlankCB_Field

	thumb_func_start sub_8054814
sub_8054814: @ 8054814
	push {lr}
	bl sav1_get_flash_used_on_map
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08054832
	bl sub_80815E0
	ldr r2, _08054838
	ldr r0, [r2]
	ldr r1, [r2, 0x4]
	ldr r2, [r2, 0x8]
	bl sub_80895F8
_08054832:
	pop {r0}
	bx r0
	.align 2, 0
_08054838: .4byte gUnknown_08216694
	thumb_func_end sub_8054814

	thumb_func_start sub_805483C
sub_805483C: @ 805483C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xD
	bhi _08054934
	lsls r0, 2
	ldr r1, _08054850
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054850: .4byte _08054854
	.align 2, 0
_08054854:
	.4byte _0805488C
	.4byte _080548A2
	.4byte _080548AA
	.4byte _080548B2
	.4byte _080548C4
	.4byte _080548E4
	.4byte _080548EA
	.4byte _080548F8
	.4byte _08054908
	.4byte _08054918
	.4byte _0805491E
	.4byte _08054928
	.4byte _08054924
	.4byte _08054930
_0805488C:
	bl sub_80547A8
	bl script_env_1_init
	bl script_env_2_disable
	bl sub_8054F70
	bl sub_8054BA8
	b _08054928
_080548A2:
	movs r0, 0x1
	bl sub_8053994
	b _08054928
_080548AA:
	movs r0, 0x1
	bl sub_8054D4C
	b _08054928
_080548B2:
	bl sub_8054E98
	bl sub_8054D90
	bl sub_8054EC8
	bl sub_8054E60
	b _08054928
_080548C4:
	bl sub_8054814
	bl sub_8054C54
	ldr r0, _080548DC
	bl SetUpWindowConfig
	ldr r0, _080548E0
	bl sub_8071C4C
	b _08054928
	.align 2, 0
_080548DC: .4byte gWindowConfig_81E6C3C
_080548E0: .4byte gWindowConfig_81E6CE4
_080548E4:
	bl move_tilemap_camera_to_upper_left_corner
	b _08054928
_080548EA:
	ldr r0, _080548F4
	ldr r0, [r0]
	bl sub_8056D28
	b _08054928
	.align 2, 0
_080548F4: .4byte 0x0202e828
_080548F8:
	ldr r0, _08054904
	ldr r0, [r0]
	bl sub_8056D38
	b _08054928
	.align 2, 0
_08054904: .4byte 0x0202e828
_08054908:
	ldr r0, _08054914
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08054928
	.align 2, 0
_08054914: .4byte 0x0202e828
_08054918:
	bl DrawWholeMapView
	b _08054928
_0805491E:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	b _08054928
_08054924:
	bl sub_80543E8
_08054928:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08054934
_08054930:
	movs r0, 0x1
	b _08054936
_08054934:
	movs r0, 0
_08054936:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805483C

	thumb_func_start sub_805493C
sub_805493C: @ 805493C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	cmp r0, 0xD
	bls _0805494A
	b _08054A44
_0805494A:
	lsls r0, 2
	ldr r1, _08054954
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054954: .4byte _08054958
	.align 2, 0
_08054958:
	.4byte _08054990
	.4byte _0805499C
	.4byte _080549A2
	.4byte _080549AA
	.4byte _080549B4
	.4byte _080549D4
	.4byte _080549DA
	.4byte _080549E8
	.4byte _080549F8
	.4byte _08054A08
	.4byte _08054A0E
	.4byte _08054A14
	.4byte _08054A34
	.4byte _08054A40
_08054990:
	bl sub_80547A8
	adds r0, r5, 0
	bl sub_8053994
	b _08054A38
_0805499C:
	bl sub_8054BA8
	b _08054A38
_080549A2:
	adds r0, r5, 0
	bl sub_8054D4C
	b _08054A38
_080549AA:
	bl mli4_mapscripts_and_other
	bl sub_8054E34
	b _08054A38
_080549B4:
	bl sub_8054814
	bl sub_8054C54
	ldr r0, _080549CC
	bl SetUpWindowConfig
	ldr r0, _080549D0
	bl sub_8071C4C
	b _08054A38
	.align 2, 0
_080549CC: .4byte gWindowConfig_81E6C3C
_080549D0: .4byte gWindowConfig_81E6CE4
_080549D4:
	bl move_tilemap_camera_to_upper_left_corner
	b _08054A38
_080549DA:
	ldr r0, _080549E4
	ldr r0, [r0]
	bl sub_8056D28
	b _08054A38
	.align 2, 0
_080549E4: .4byte 0x0202e828
_080549E8:
	ldr r0, _080549F4
	ldr r0, [r0]
	bl sub_8056D38
	b _08054A38
	.align 2, 0
_080549F4: .4byte 0x0202e828
_080549F8:
	ldr r0, _08054A04
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08054A38
	.align 2, 0
_08054A04: .4byte 0x0202e828
_08054A08:
	bl DrawWholeMapView
	b _08054A38
_08054A0E:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	b _08054A38
_08054A14:
	ldr r0, _08054A30
	ldrb r0, [r0, 0x1A]
	cmp r0, 0x1
	bne _08054A38
	bl sub_80BBB24
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08054A38
	bl AddMapNamePopUpWindowTask
	b _08054A38
	.align 2, 0
_08054A30: .4byte 0x0202e828
_08054A34:
	bl sub_80543E8
_08054A38:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08054A44
_08054A40:
	movs r0, 0x1
	b _08054A46
_08054A44:
	movs r0, 0
_08054A46:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805493C

	thumb_func_start sub_8054A4C
sub_8054A4C: @ 8054A4C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x1
	beq _08054A7E
	cmp r0, 0x1
	bgt _08054A60
	cmp r0, 0
	beq _08054A6A
	b _08054A94
_08054A60:
	cmp r0, 0x2
	beq _08054A84
	cmp r0, 0x3
	beq _08054A90
	b _08054A94
_08054A6A:
	bl sub_8054BA8
	movs r0, 0
	bl sub_8054D4C
	bl sub_8054E20
	bl sub_8054E34
	b _08054A88
_08054A7E:
	bl sub_8054C2C
	b _08054A88
_08054A84:
	bl sub_80543E8
_08054A88:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08054A94
_08054A90:
	movs r0, 0x1
	b _08054A96
_08054A94:
	movs r0, 0
_08054A96:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8054A4C

	thumb_func_start sub_8054A9C
sub_8054A9C: @ 8054A9C
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4]
	cmp r0, 0xD
	bhi _08054B86
	lsls r0, 2
	ldr r1, _08054AB0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054AB0: .4byte _08054AB4
	.align 2, 0
_08054AB4:
	.4byte _08054AEC
	.4byte _08054AF6
	.4byte _08054AFE
	.4byte _08054B0C
	.4byte _08054B2C
	.4byte _08054B32
	.4byte _08054B40
	.4byte _08054B50
	.4byte _08054B60
	.4byte _08054B66
	.4byte _08054B70
	.4byte _08054B70
	.4byte _08054B6C
	.4byte _08054B78
_08054AEC:
	bl sub_80547A8
	bl sub_8054BA8
	b _08054B70
_08054AF6:
	movs r0, 0x1
	bl sub_8054D4C
	b _08054B70
_08054AFE:
	bl sub_8054F48
	bl sub_8054E20
	bl sub_8054E7C
	b _08054B70
_08054B0C:
	bl sub_8054814
	bl sub_8054C54
	ldr r0, _08054B24
	bl SetUpWindowConfig
	ldr r0, _08054B28
	bl sub_8071C4C
	b _08054B70
	.align 2, 0
_08054B24: .4byte gWindowConfig_81E6C3C
_08054B28: .4byte gWindowConfig_81E6CE4
_08054B2C:
	bl move_tilemap_camera_to_upper_left_corner
	b _08054B70
_08054B32:
	ldr r0, _08054B3C
	ldr r0, [r0]
	bl sub_8056D28
	b _08054B70
	.align 2, 0
_08054B3C: .4byte 0x0202e828
_08054B40:
	ldr r0, _08054B4C
	ldr r0, [r0]
	bl sub_8056D38
	b _08054B70
	.align 2, 0
_08054B4C: .4byte 0x0202e828
_08054B50:
	ldr r0, _08054B5C
	ldr r0, [r0]
	bl apply_map_tileset1_tileset2_palette
	b _08054B70
	.align 2, 0
_08054B5C: .4byte 0x0202e828
_08054B60:
	bl DrawWholeMapView
	b _08054B70
_08054B66:
	bl cur_mapheader_run_tileset_funcs_after_some_cpuset
	b _08054B70
_08054B6C:
	bl sub_80543E8
_08054B70:
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	b _08054B86
_08054B78:
	bl SetFieldVBlankCallback
	ldrb r0, [r4]
	adds r0, 0x1
	strb r0, [r4]
	movs r0, 0x1
	b _08054B88
_08054B86:
	movs r0, 0
_08054B88:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8054A9C

	thumb_func_start do_load_map_stuff_loop
do_load_map_stuff_loop: @ 8054B90
	push {r4,lr}
	adds r4, r0, 0
_08054B94:
	adds r0, r4, 0
	movs r1, 0
	bl sub_805493C
	cmp r0, 0
	beq _08054B94
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end do_load_map_stuff_loop

	thumb_func_start sub_8054BA8
sub_8054BA8: @ 8054BA8
	push {r4-r7,lr}
	sub sp, 0x4
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	bl remove_some_task
	ldr r2, _08054C1C
	mov r0, sp
	strh r4, [r0]
	ldr r1, _08054C20
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _08054C24
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _08054C28
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_08054BE2:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _08054BE2
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	bl LoadOam
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054C1C: .4byte 0x05000002
_08054C20: .4byte 0x040000d4
_08054C24: .4byte 0x810001ff
_08054C28: .4byte 0x81000800
	thumb_func_end sub_8054BA8

	thumb_func_start sub_8054C2C
sub_8054C2C: @ 8054C2C
	push {lr}
	bl sub_8054814
	bl sub_8054C54
	ldr r0, _08054C4C
	bl SetUpWindowConfig
	ldr r0, _08054C50
	bl sub_8071C4C
	bl mapdata_load_assets_to_gpu_and_full_redraw
	pop {r0}
	bx r0
	.align 2, 0
_08054C4C: .4byte gWindowConfig_81E6C3C
_08054C50: .4byte gWindowConfig_81E6CE4
	thumb_func_end sub_8054C2C

	thumb_func_start sub_8054C54
sub_8054C54: @ 8054C54
	push {r4-r6,lr}
	ldr r0, _08054D08
	movs r3, 0
	strh r3, [r0]
	ldr r1, _08054D0C
	ldr r2, _08054D10
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r4, _08054D14
	adds r0, r4, 0
	strh r0, [r1]
	ldr r0, _08054D18
	movs r1, 0xFF
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	subs r0, 0x2
	ldr r6, _08054D1C
	adds r1, r6, 0
	strh r1, [r0]
	adds r0, 0x4
	strh r1, [r0]
	ldr r4, _08054D20
	ldr r1, _08054D24
	ldrh r0, [r1, 0x2]
	ldrh r2, [r1, 0x4]
	orrs r0, r2
	ldrh r1, [r1, 0x6]
	orrs r0, r1
	movs r2, 0x82
	lsls r2, 5
	adds r1, r2, 0
	orrs r0, r1
	strh r0, [r4]
	ldr r1, _08054D28
	ldr r4, _08054D2C
	adds r0, r4, 0
	strh r0, [r1]
	ldr r5, _08054D30
	ldr r0, [r5]
	strh r3, [r0]
	ldr r4, _08054D34
	ldr r0, [r4]
	strh r3, [r0]
	ldr r2, _08054D38
	ldr r0, [r2]
	strh r3, [r0]
	ldr r0, [r5, 0x4]
	strh r3, [r0]
	ldr r0, [r4, 0x4]
	strh r3, [r0]
	ldr r1, [r2, 0x4]
	ldr r6, _08054D3C
	adds r0, r6, 0
	strh r0, [r1]
	ldr r0, [r5, 0x8]
	strh r3, [r0]
	ldr r0, [r4, 0x8]
	strh r3, [r0]
	ldr r1, [r2, 0x8]
	subs r6, 0xFF
	adds r0, r6, 0
	strh r0, [r1]
	ldr r0, [r5, 0xC]
	strh r3, [r0]
	ldr r0, [r4, 0xC]
	strh r3, [r0]
	ldr r1, [r2, 0xC]
	ldr r2, _08054D40
	adds r0, r2, 0
	strh r0, [r1]
	movs r3, 0x80
	lsls r3, 19
	ldr r2, _08054D44
	ldrh r0, [r2, 0x2]
	ldr r4, _08054D48
	adds r1, r4, 0
	orrs r0, r1
	ldrh r1, [r2, 0x4]
	orrs r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	ldrh r1, [r2, 0x6]
	orrs r0, r1
	strh r0, [r3]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054D08: .4byte 0x0400004c
_08054D0C: .4byte 0x04000048
_08054D10: .4byte 0x00001f1f
_08054D14: .4byte 0x00000101
_08054D18: .4byte 0x04000040
_08054D1C: .4byte 0x0000ffff
_08054D20: .4byte 0x04000050
_08054D24: .4byte gUnknown_081E29E0
_08054D28: .4byte 0x04000052
_08054D2C: .4byte 0x0000070d
_08054D30: .4byte gBGHOffsetRegs
_08054D34: .4byte gBGVOffsetRegs
_08054D38: .4byte gBGControlRegs
_08054D3C: .4byte 0x00001d41
_08054D40: .4byte 0x00001e43
_08054D44: .4byte gUnknown_081E29D8
_08054D48: .4byte 0x00007060
	thumb_func_end sub_8054C54

	thumb_func_start sub_8054D4C
sub_8054D4C: @ 8054D4C
	push {r4,lr}
	adds r4, r0, 0
	bl ResetTasks
	bl ResetSpriteData
	bl ResetPaletteFade
	bl dp12_8087EA4
	bl ResetCameraUpdateInfo
	bl InstallCameraPanAheadCallback
	movs r0, 0
	bl sub_805C7C4
	bl FieldEffectActiveListClear
	bl sub_8064A74
	bl sub_807C828
	bl sub_8080750
	cmp r4, 0
	bne _08054D86
	bl overworld_ensure_per_step_coros_running
_08054D86:
	bl mapheader_run_script_with_tag_x5
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8054D4C

	thumb_func_start sub_8054D90
sub_8054D90: @ 8054D90
	push {lr}
	ldr r0, _08054DB0
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08054DB4
	strh r1, [r0]
	bl sub_805AA98
	movs r0, 0
	movs r1, 0
	bl sub_805B55C
	bl mapheader_run_first_tag4_script_list_match
	pop {r0}
	bx r0
	.align 2, 0
_08054DB0: .4byte 0x0300489c
_08054DB4: .4byte 0x03004898
	thumb_func_end sub_8054D90

	thumb_func_start mli4_mapscripts_and_other
mli4_mapscripts_and_other: @ 8054DB8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _08054E14
	movs r1, 0
	strh r1, [r0]
	ldr r0, _08054E18
	strh r1, [r0]
	bl sub_805AA98
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sav1_camera_get_focus_coords
	bl sub_8053AA8
	adds r5, r0, 0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldrb r2, [r5, 0x1]
	ldr r3, _08054E1C
	ldrb r3, [r3, 0x8]
	bl InitPlayerAvatar
	ldrb r0, [r5]
	bl SetPlayerAvatarTransitionFlags
	bl player_avatar_init_params_reset
	movs r0, 0
	movs r1, 0
	bl sub_805B55C
	bl ResetBerryTreeSparkleFlags
	bl mapheader_run_first_tag4_script_list_match
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08054E14: .4byte 0x0300489c
_08054E18: .4byte 0x03004898
_08054E1C: .4byte 0x02024ea4
	thumb_func_end mli4_mapscripts_and_other

	thumb_func_start sub_8054E20
sub_8054E20: @ 8054E20
	push {lr}
	movs r0, 0
	movs r1, 0
	bl sub_805B710
	bl sub_80C8080
	pop {r0}
	bx r0
	thumb_func_end sub_8054E20

	thumb_func_start sub_8054E34
sub_8054E34: @ 8054E34
	push {lr}
	ldr r2, _08054E58
	ldr r3, _08054E5C
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrb r0, [r3, 0x4]
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_08054E58: .4byte 0x030048a0
_08054E5C: .4byte 0x0202e858
	thumb_func_end sub_8054E34

	thumb_func_start sub_8054E60
sub_8054E60: @ 8054E60
	push {lr}
	ldr r0, _08054E78
	ldrb r0, [r0]
	bl sub_8055AE8
	lsls r0, 24
	lsrs r0, 24
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_08054E78: .4byte 0x03004860
	thumb_func_end sub_8054E60

	thumb_func_start sub_8054E7C
sub_8054E7C: @ 8054E7C
	push {lr}
	ldr r0, _08054E94
	ldrb r0, [r0]
	bl sub_8055AE8
	lsls r0, 24
	lsrs r0, 24
	bl InitCameraUpdateCallback
	pop {r0}
	bx r0
	.align 2, 0
_08054E94: .4byte 0x03004860
	thumb_func_end sub_8054E7C

	thumb_func_start sub_8054E98
sub_8054E98: @ 8054E98
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sav1_camera_get_focus_coords
	mov r2, sp
	ldr r0, _08054EC4
	ldrb r1, [r0]
	ldrh r0, [r2]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	bl sub_8056C50
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054EC4: .4byte 0x03004860
	thumb_func_end sub_8054E98

	thumb_func_start sub_8054EC8
sub_8054EC8: @ 8054EC8
	push {r4-r7,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl sav1_camera_get_focus_coords
	mov r3, sp
	mov r2, sp
	ldr r0, _08054F38
	ldrb r1, [r0]
	ldrh r0, [r2]
	subs r0, r1
	strh r0, [r3]
	movs r5, 0
	ldr r0, _08054F3C
	adds r7, r4, 0
	ldrb r0, [r0]
	cmp r5, r0
	bcs _08054F2A
	ldr r6, _08054F40
_08054EF4:
	lsls r4, r5, 24
	lsrs r4, 24
	mov r0, sp
	ldrh r1, [r0]
	adds r1, r5, r1
	lsls r1, 16
	asrs r1, 16
	movs r0, 0
	ldrsh r2, [r7, r0]
	lsls r0, r5, 3
	subs r0, r5
	lsls r0, 2
	adds r0, r6
	ldrb r3, [r0, 0x13]
	adds r0, r4, 0
	bl sub_8055980
	adds r0, r4, 0
	bl sub_8055E5C
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldr r0, _08054F3C
	ldrb r0, [r0]
	cmp r5, r0
	bcc _08054EF4
_08054F2A:
	ldr r0, _08054F44
	bl sub_8055340
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054F38: .4byte 0x03004860
_08054F3C: .4byte 0x03004864
_08054F40: .4byte 0x03002970
_08054F44: .4byte 0x03002910
	thumb_func_end sub_8054EC8

	thumb_func_start sub_8054F48
sub_8054F48: @ 8054F48
	push {r4,lr}
	movs r4, 0
	b _08054F5C
_08054F4E:
	lsls r0, r4, 24
	lsrs r0, 24
	bl sub_8055E5C
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r4, r0, 16
_08054F5C:
	ldr r0, _08054F6C
	ldrb r0, [r0]
	cmp r4, r0
	bcc _08054F4E
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054F6C: .4byte 0x03004864
	thumb_func_end sub_8054F48

	thumb_func_start sub_8054F70
sub_8054F70: @ 8054F70
	push {lr}
	ldr r1, _08054F84
	movs r2, 0x80
	adds r0, r1, 0x3
_08054F78:
	strb r2, [r0]
	subs r0, 0x1
	cmp r0, r1
	bge _08054F78
	pop {r0}
	bx r0
	.align 2, 0
_08054F84: .4byte 0x03000580
	thumb_func_end sub_8054F70

	thumb_func_start sub_8054F88
sub_8054F88: @ 8054F88
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08054FA8
	ldrb r2, [r0]
	movs r1, 0
	cmp r1, r2
	bge _08054FB6
	ldr r4, _08054FAC
_08054F9A:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	beq _08054FB0
	movs r0, 0
	b _08054FB8
	.align 2, 0
_08054FA8: .4byte 0x03004864
_08054FAC: .4byte 0x03000580
_08054FB0:
	adds r1, 0x1
	cmp r1, r2
	blt _08054F9A
_08054FB6:
	movs r0, 0x1
_08054FB8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8054F88

	thumb_func_start sub_8054FC0
sub_8054FC0: @ 8054FC0
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08054FE0
	ldrb r2, [r0]
	movs r1, 0
	cmp r1, r2
	bge _08054FEE
	ldr r4, _08054FE4
_08054FD2:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _08054FE8
	movs r0, 0x1
	b _08054FF0
	.align 2, 0
_08054FE0: .4byte 0x03004864
_08054FE4: .4byte 0x03000580
_08054FE8:
	adds r1, 0x1
	cmp r1, r2
	blt _08054FD2
_08054FEE:
	movs r0, 0
_08054FF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8054FC0

	thumb_func_start sub_8054FF8
sub_8054FF8: @ 8054FF8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	adds r6, r2, 0
	mov r9, r3
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	ldr r0, _08055048
	adds r5, r7, r0
	ldrb r0, [r5]
	cmp r0, 0x80
	beq _08055018
	b _08055192
_08055018:
	adds r0, r6, 0
	bl sub_8055648
	adds r4, r0, 0
	cmp r4, 0
	beq _08055050
	bl sub_8055758
	mov r1, r9
	strh r0, [r1]
	movs r0, 0x81
	strb r0, [r5]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	bne _08055038
	b _08055206
_08055038:
	ldr r0, _0805504C
	bl sub_80543DC
	adds r0, r4, 0
	bl sub_8055808
	b _08055206
	.align 2, 0
_08055048: .4byte 0x03000580
_0805504C: .4byte sub_80553E4
_08055050:
	movs r0, 0x83
	bl sub_8054FC0
	cmp r0, 0x1
	bne _08055078
	movs r0, 0x81
	strb r0, [r5]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	bne _08055066
	b _08055206
_08055066:
	ldr r0, _08055074
	bl sub_80543DC
	bl sub_805585C
	b _08055206
	.align 2, 0
_08055074: .4byte sub_80553E4
_08055078:
	mov r0, r8
	subs r0, 0x12
	cmp r0, 0xA
	bls _08055082
	b _08055192
_08055082:
	lsls r0, 2
	ldr r1, _0805508C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805508C: .4byte _08055090
	.align 2, 0
_08055090:
	.4byte _080550E8
	.4byte _08055192
	.4byte _08055192
	.4byte _08055192
	.4byte _08055192
	.4byte _08055192
	.4byte _080550BC
	.4byte _08055114
	.4byte _08055192
	.4byte _08055144
	.4byte _08055170
_080550BC:
	adds r0, r6, 0
	bl sub_8055630
	cmp r0, 0
	beq _08055192
	ldr r0, _080550E0
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055192
	ldr r0, _080550E4
	bl sub_80543DC
	bl sub_80557F4
	b _08055192
	.align 2, 0
_080550E0: .4byte 0x03000580
_080550E4: .4byte sub_80553E4
_080550E8:
	adds r0, r6, 0
	bl sub_8055660
	cmp r0, 0x1
	bne _08055192
	ldr r0, _0805510C
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055192
	ldr r0, _08055110
	bl sub_80543DC
	bl sub_8055824
	b _08055192
	.align 2, 0
_0805510C: .4byte 0x03000580
_08055110: .4byte sub_80553E4
_08055114:
	adds r0, r6, 0
	bl sub_805568C
	adds r4, r0, 0
	cmp r4, 0
	beq _08055192
	ldr r0, _0805513C
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055192
	ldr r0, _08055140
	bl sub_80543DC
	adds r0, r4, 0
	bl sub_8055840
	b _08055192
	.align 2, 0
_0805513C: .4byte 0x03000580
_08055140: .4byte sub_80553E4
_08055144:
	adds r0, r6, 0
	bl sub_8055618
	cmp r0, 0
	beq _08055192
	ldr r0, _08055168
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055192
	ldr r0, _0805516C
	bl sub_80543DC
	bl sub_80557E8
	b _08055192
	.align 2, 0
_08055168: .4byte 0x03000580
_0805516C: .4byte sub_8055408
_08055170:
	adds r0, r6, 0
	bl sub_8055618
	cmp r0, 0
	beq _08055192
	ldr r0, _080551A4
	adds r0, r7, r0
	movs r1, 0x81
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055192
	ldr r0, _080551A8
	bl sub_80543DC
	bl sub_80557E8
_08055192:
	mov r0, r8
	cmp r0, 0x17
	beq _080551B8
	cmp r0, 0x17
	bgt _080551AC
	cmp r0, 0x16
	beq _080551C8
	b _08055206
	.align 2, 0
_080551A4: .4byte 0x03000580
_080551A8: .4byte sub_8055438
_080551AC:
	mov r1, r8
	cmp r1, 0x1A
	beq _080551D8
	cmp r1, 0x1D
	beq _080551F8
	b _08055206
_080551B8:
	ldr r0, _080551C4
	adds r0, r7, r0
	movs r1, 0x83
	strb r1, [r0]
	b _08055206
	.align 2, 0
_080551C4: .4byte 0x03000580
_080551C8:
	ldr r0, _080551D4
	adds r0, r7, r0
	movs r1, 0x82
	strb r1, [r0]
	b _08055206
	.align 2, 0
_080551D4: .4byte 0x03000580
_080551D8:
	ldr r0, _080551F0
	adds r0, r7, r0
	movs r1, 0x80
	strb r1, [r0]
	ldrb r0, [r6, 0x1]
	cmp r0, 0
	beq _08055206
	ldr r0, _080551F4
	bl sub_80543DC
	b _08055206
	.align 2, 0
_080551F0: .4byte 0x03000580
_080551F4: .4byte sub_8055390
_080551F8:
	ldr r0, _08055214
	adds r1, r7, r0
	ldrb r0, [r1]
	cmp r0, 0x82
	bne _08055206
	movs r0, 0x81
	strb r0, [r1]
_08055206:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055214: .4byte 0x03000580
	thumb_func_end sub_8054FF8

	thumb_func_start sub_8055218
sub_8055218: @ 8055218
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x14
	mov r8, r1
	movs r6, 0
	add r4, sp, 0x10
	mov r9, r4
	adds r7, r0, 0
_0805522C:
	ldrh r5, [r7]
	movs r0, 0
	strh r0, [r4]
	adds r0, r6, 0
	mov r1, r8
	mov r2, sp
	bl sub_80555B0
	adds r0, r6, 0
	adds r1, r5, 0
	mov r2, sp
	adds r3, r4, 0
	bl sub_8054FF8
	ldr r0, _0805527C
	adds r0, r6, r0
	ldrb r0, [r0]
	cmp r0, 0x80
	bne _0805525C
	adds r0, r5, 0
	bl sub_805530C
	mov r1, r9
	strh r0, [r1]
_0805525C:
	lsls r0, r6, 24
	lsrs r0, 24
	ldrb r1, [r4]
	bl sub_8055BFC
	adds r7, 0x2
	adds r6, 0x1
	cmp r6, 0x3
	ble _0805522C
	add sp, 0x14
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805527C: .4byte 0x03000580
	thumb_func_end sub_8055218

	thumb_func_start sub_8055280
sub_8055280: @ 8055280
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	ldr r2, _08055298
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xC
	bhi _080552A0
	ldr r0, _0805529C
	strh r1, [r0]
	b _080552A6
	.align 2, 0
_08055298: .4byte 0xffef0000
_0805529C: .4byte 0x03004858
_080552A0:
	ldr r1, _080552AC
	movs r0, 0x11
	strh r0, [r1]
_080552A6:
	pop {r0}
	bx r0
	.align 2, 0
_080552AC: .4byte 0x03004858
	thumb_func_end sub_8055280

	thumb_func_start sub_80552B0
sub_80552B0: @ 80552B0
	push {lr}
	ldr r2, _080552C4
	ldrh r1, [r2, 0x2C]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080552C8
	movs r0, 0x13
	b _08055308
	.align 2, 0
_080552C4: .4byte 0x03001770
_080552C8:
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _080552D4
	movs r0, 0x12
	b _08055308
_080552D4:
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _080552E0
	movs r0, 0x14
	b _08055308
_080552E0:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080552EC
	movs r0, 0x15
	b _08055308
_080552EC:
	ldrh r1, [r2, 0x2E]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _080552FA
	movs r0, 0x18
	b _08055308
_080552FA:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08055306
	movs r0, 0x11
	b _08055308
_08055306:
	movs r0, 0x19
_08055308:
	pop {r1}
	bx r1
	thumb_func_end sub_80552B0

	thumb_func_start sub_805530C
sub_805530C: @ 805530C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	adds r1, r0, 0
	cmp r0, 0x13
	beq _08055332
	cmp r0, 0x13
	bgt _08055322
	cmp r0, 0x12
	beq _08055336
	b _0805533A
_08055322:
	cmp r1, 0x14
	beq _0805532E
	cmp r1, 0x15
	bne _0805533A
	movs r0, 0x4
	b _0805533C
_0805532E:
	movs r0, 0x3
	b _0805533C
_08055332:
	movs r0, 0x1
	b _0805533C
_08055336:
	movs r0, 0x2
	b _0805533C
_0805533A:
	movs r0, 0
_0805533C:
	pop {r1}
	bx r1
	thumb_func_end sub_805530C

	thumb_func_start sub_8055340
sub_8055340: @ 8055340
	push {lr}
	movs r2, 0x11
	adds r1, r0, 0x6
_08055346:
	strh r2, [r1]
	subs r1, 0x2
	cmp r1, r0
	bge _08055346
	pop {r0}
	bx r0
	thumb_func_end sub_8055340

	thumb_func_start sub_8055354
sub_8055354: @ 8055354
	push {r4,r5,lr}
	ldr r0, _08055384
	ldrb r4, [r0]
	ldr r5, _08055388
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8055218
	ldr r0, _0805538C
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 16
	lsrs r0, 16
	bl sub_8055280
	adds r0, r5, 0
	bl sub_8055340
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055384: .4byte 0x03004860
_08055388: .4byte 0x03002910
_0805538C: .4byte 0x03000584
	thumb_func_end sub_8055354

	thumb_func_start sub_8055390
sub_8055390: @ 8055390
	push {r4,lr}
	adds r4, r0, 0
	bl script_env_2_is_enabled
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080553A4
	movs r0, 0x11
	b _080553DA
_080553A4:
	ldr r1, _080553B4
	ldr r2, _080553B8
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _080553BC
	movs r0, 0x1B
	b _080553DA
	.align 2, 0
_080553B4: .4byte 0x03003070
_080553B8: .4byte 0x00000fbd
_080553BC:
	ldr r2, _080553CC
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _080553D0
	movs r0, 0x1C
	b _080553DA
	.align 2, 0
_080553CC: .4byte 0x00000339
_080553D0:
	adds r0, r4, 0
	bl sub_80552B0
	lsls r0, 16
	lsrs r0, 16
_080553DA:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8055390

	thumb_func_start sub_80553E0
sub_80553E0: @ 80553E0
	movs r0, 0x11
	bx lr
	thumb_func_end sub_80553E0

	thumb_func_start sub_80553E4
sub_80553E4: @ 80553E4
	push {r4,lr}
	bl script_env_2_is_enabled
	lsls r0, 24
	lsrs r0, 24
	movs r4, 0x11
	cmp r0, 0x1
	beq _080553FC
	movs r4, 0x1A
	ldr r0, _08055404
	bl sub_80543DC
_080553FC:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08055404: .4byte sub_80553E0
	thumb_func_end sub_80553E4

	thumb_func_start sub_8055408
sub_8055408: @ 8055408
	push {r4,lr}
	ldr r0, _0805542C
	ldr r1, _08055430
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x11
	cmp r0, 0x2
	bhi _08055424
	movs r4, 0x1A
	bl script_env_2_disable
	ldr r0, _08055434
	bl sub_80543DC
_08055424:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805542C: .4byte 0x03003070
_08055430: .4byte 0x00000fbd
_08055434: .4byte sub_80553E0
	thumb_func_end sub_8055408

	thumb_func_start sub_8055438
sub_8055438: @ 8055438
	push {r4,lr}
	ldr r0, _0805545C
	ldr r1, _08055460
	adds r0, r1
	ldrb r0, [r0]
	movs r4, 0x11
	cmp r0, 0x2
	bhi _08055454
	movs r4, 0x1A
	bl script_env_2_disable
	ldr r0, _08055464
	bl sub_80543DC
_08055454:
	adds r0, r4, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805545C: .4byte 0x03003070
_08055460: .4byte 0x00000339
_08055464: .4byte sub_80553E0
	thumb_func_end sub_8055438

	thumb_func_start sub_8055468
sub_8055468: @ 8055468
	movs r0, 0x11
	bx lr
	thumb_func_end sub_8055468

	thumb_func_start sub_805546C
sub_805546C: @ 805546C
	push {lr}
	ldr r1, _08055490
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x82
	bne _0805549C
	ldr r0, _08055494
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0805549C
	ldr r0, _08055498
	bl sub_80543DC
	movs r0, 0x1D
	b _0805549E
	.align 2, 0
_08055490: .4byte 0x03000580
_08055494: .4byte 0x03001770
_08055498: .4byte sub_8055468
_0805549C:
	movs r0, 0x11
_0805549E:
	pop {r1}
	bx r1
	thumb_func_end sub_805546C

	thumb_func_start sub_80554A4
sub_80554A4: @ 80554A4
	push {lr}
	ldr r0, _080554B4
	bl sub_80543DC
	movs r0, 0x16
	pop {r1}
	bx r1
	.align 2, 0
_080554B4: .4byte sub_805546C
	thumb_func_end sub_80554A4

	thumb_func_start sub_80554B8
sub_80554B8: @ 80554B8
	movs r0, 0x11
	bx lr
	thumb_func_end sub_80554B8

	thumb_func_start sub_80554BC
sub_80554BC: @ 80554BC
	push {lr}
	movs r0, 0x83
	bl sub_8054F88
	cmp r0, 0x1
	bne _080554D4
	ldr r0, _080554DC
	bl script_env_1_execute_new_script
	ldr r0, _080554E0
	bl sub_80543DC
_080554D4:
	movs r0, 0x11
	pop {r1}
	bx r1
	.align 2, 0
_080554DC: .4byte gUnknown_081A4508
_080554E0: .4byte sub_80554B8
	thumb_func_end sub_80554BC

	thumb_func_start sub_80554E4
sub_80554E4: @ 80554E4
	push {lr}
	ldr r0, _080554F4
	bl sub_80543DC
	movs r0, 0x17
	pop {r1}
	bx r1
	.align 2, 0
_080554F4: .4byte sub_80554BC
	thumb_func_end sub_80554E4

	thumb_func_start sub_80554F8
sub_80554F8: @ 80554F8
	push {lr}
	movs r0, 0x83
	bl sub_8054FC0
	cmp r0, 0x1
	beq _0805554A
	ldr r0, _08055524
	ldr r2, [r0]
	ldr r1, _08055528
	adds r3, r0, 0
	cmp r2, r1
	bne _08055534
	ldr r1, _0805552C
	ldr r0, _08055530
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x82
	beq _08055534
	movs r0, 0
	b _08055562
	.align 2, 0
_08055524: .4byte 0x03000584
_08055528: .4byte sub_805546C
_0805552C: .4byte 0x03000580
_08055530: .4byte 0x03004860
_08055534:
	ldr r1, [r3]
	ldr r0, _08055550
	cmp r1, r0
	bne _0805555C
	ldr r1, _08055554
	ldr r0, _08055558
	ldrb r0, [r0]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x81
	bne _0805555C
_0805554A:
	movs r0, 0x2
	b _08055562
	.align 2, 0
_08055550: .4byte sub_8055468
_08055554: .4byte 0x03000580
_08055558: .4byte 0x03004860
_0805555C:
	movs r0, 0x82
	bl sub_8054F88
_08055562:
	pop {r1}
	bx r1
	thumb_func_end sub_80554F8

	thumb_func_start unref_sub_8055568
unref_sub_8055568: @ 8055568
	push {lr}
	movs r0, 0x83
	bl sub_8054FC0
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8055568

	thumb_func_start sub_8055574
sub_8055574: @ 8055574
	push {lr}
	ldr r0, _08055584
	bl sub_80543DC
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08055584: .4byte sub_80554A4
	thumb_func_end sub_8055574

	thumb_func_start sub_8055588
sub_8055588: @ 8055588
	push {lr}
	ldr r0, _08055598
	bl sub_80543DC
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08055598: .4byte sub_80553E4
	thumb_func_end sub_8055588

	thumb_func_start sub_805559C
sub_805559C: @ 805559C
	push {lr}
	ldr r0, _080555AC
	bl sub_80543DC
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080555AC: .4byte sub_80554E4
	thumb_func_end sub_805559C

	thumb_func_start sub_80555B0
sub_80555B0: @ 80555B0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r2, 0
	strb r4, [r6]
	movs r0, 0
	cmp r4, r1
	bne _080555C2
	movs r0, 0x1
_080555C2:
	strb r0, [r6, 0x1]
	ldr r1, _08055614
	lsls r0, r4, 2
	adds r0, r1
	ldrb r0, [r0, 0x3]
	strb r0, [r6, 0x2]
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8055B30
	strb r0, [r6, 0x3]
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	mov r1, sp
	adds r2, r5, 0
	bl sub_8055B08
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	ldrh r0, [r5]
	strh r0, [r6, 0x6]
	adds r0, r4, 0
	bl sub_8055B50
	strb r0, [r6, 0x8]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	strh r0, [r6, 0xC]
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055614: .4byte 0x02029818
	thumb_func_end sub_80555B0

	thumb_func_start sub_8055618
sub_8055618: @ 8055618
	push {lr}
	ldrb r0, [r0, 0x2]
	cmp r0, 0x2
	beq _08055624
	cmp r0, 0
	bne _08055628
_08055624:
	movs r0, 0x1
	b _0805562A
_08055628:
	movs r0, 0
_0805562A:
	pop {r1}
	bx r1
	thumb_func_end sub_8055618

	thumb_func_start sub_8055630
sub_8055630: @ 8055630
	push {lr}
	ldrb r0, [r0, 0x2]
	cmp r0, 0x2
	beq _0805563C
	cmp r0, 0
	bne _08055640
_0805563C:
	movs r0, 0x1
	b _08055642
_08055640:
	movs r0, 0
_08055642:
	pop {r1}
	bx r1
	thumb_func_end sub_8055630

	thumb_func_start sub_8055648
sub_8055648: @ 8055648
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1, 0x2]
	cmp r0, 0x2
	bne _0805565A
	adds r0, r1, 0x4
	bl sub_8068E24
	b _0805565C
_0805565A:
	movs r0, 0
_0805565C:
	pop {r1}
	bx r1
	thumb_func_end sub_8055648

	thumb_func_start sub_8055660
sub_8055660: @ 8055660
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x2]
	cmp r0, 0x2
	beq _0805566E
	cmp r0, 0
	bne _08055684
_0805566E:
	ldrb r0, [r4, 0xC]
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, 24
	cmp r0, 0
	beq _08055684
	ldrb r0, [r4, 0x3]
	cmp r0, 0x1
	bne _08055684
	movs r0, 0x1
	b _08055686
_08055684:
	movs r0, 0
_08055686:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8055660

	thumb_func_start sub_805568C
sub_805568C: @ 805568C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldrb r0, [r4, 0x2]
	cmp r0, 0
	beq _080556A0
	cmp r0, 0x2
	beq _080556A0
	movs r0, 0
	b _0805574E
_080556A0:
	ldr r0, [r4, 0x4]
	ldr r1, [r4, 0x8]
	str r0, [sp]
	str r1, [sp, 0x4]
	ldr r3, _08055710
	ldrb r0, [r4, 0x3]
	lsls r0, 3
	adds r0, r3
	ldr r0, [r0]
	mov r1, sp
	ldrh r1, [r1]
	adds r0, r1
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08055714
	ldr r2, [sp]
	ands r2, r1
	orrs r2, r0
	str r2, [sp]
	asrs r1, r2, 16
	ldrb r0, [r4, 0x3]
	lsls r0, 3
	adds r3, 0x4
	adds r0, r3
	ldr r0, [r0]
	adds r0, r1
	lsls r0, 16
	ldr r1, _08055718
	ands r1, r2
	orrs r1, r0
	str r1, [sp]
	ldr r2, _0805571C
	ldr r0, [sp, 0x4]
	ands r0, r2
	str r0, [sp, 0x4]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	asrs r1, 16
	bl sub_8055B9C
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	cmp r1, 0x4
	beq _08055744
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	beq _0805570C
	ldr r0, _08055720
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, 0x80
	beq _08055728
_0805570C:
	ldr r0, _08055724
	b _0805574E
	.align 2, 0
_08055710: .4byte gUnknown_0821664C
_08055714: .4byte 0xffff0000
_08055718: .4byte 0x0000ffff
_0805571C: .4byte 0xffffff00
_08055720: .4byte 0x03000580
_08055724: .4byte gUnknown_081A4495
_08055728:
	adds r0, r2, 0
	bl sub_8083BF4
	cmp r0, 0
	bne _0805573C
	ldr r0, _08055738
	b _0805574E
	.align 2, 0
_08055738: .4byte gUnknown_081A4479
_0805573C:
	ldr r0, _08055740
	b _0805574E
	.align 2, 0
_08055740: .4byte gUnknown_081A4487
_08055744:
	ldrb r1, [r4, 0xC]
	ldrb r2, [r4, 0x3]
	mov r0, sp
	bl sub_80682A8
_0805574E:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805568C

	thumb_func_start sub_8055758
sub_8055758: @ 8055758
	push {lr}
	adds r1, r0, 0
	ldr r0, _080557A4
	cmp r1, r0
	beq _0805579E
	ldr r0, _080557A8
	cmp r1, r0
	beq _080557E0
	ldr r0, _080557AC
	cmp r1, r0
	beq _0805579E
	ldr r0, _080557B0
	cmp r1, r0
	beq _080557E0
	ldr r0, _080557B4
	cmp r1, r0
	beq _0805579E
	ldr r0, _080557B8
	cmp r1, r0
	beq _080557E0
	ldr r0, _080557BC
	cmp r1, r0
	beq _0805579E
	ldr r0, _080557C0
	cmp r1, r0
	beq _080557E0
	ldr r0, _080557C4
	cmp r1, r0
	beq _0805579E
	ldr r0, _080557C8
	cmp r1, r0
	beq _080557E0
	ldr r0, _080557CC
	cmp r1, r0
	bne _080557D0
_0805579E:
	movs r0, 0xA
	b _080557E2
	.align 2, 0
_080557A4: .4byte gUnknown_081A4383
_080557A8: .4byte gUnknown_081A439E
_080557AC: .4byte gUnknown_081A43B9
_080557B0: .4byte gUnknown_081A43D4
_080557B4: .4byte gUnknown_081A4418
_080557B8: .4byte gUnknown_081A442D
_080557BC: .4byte gUnknown_081A4442
_080557C0: .4byte gUnknown_081A4457
_080557C4: .4byte gUnknown_081A436F
_080557C8: .4byte gUnknown_081A4379
_080557CC: .4byte gUnknown_081A43F0
_080557D0:
	ldr r0, _080557DC
	cmp r1, r0
	beq _080557E0
	movs r0, 0
	b _080557E2
	.align 2, 0
_080557DC: .4byte gUnknown_081A43FA
_080557E0:
	movs r0, 0x9
_080557E2:
	pop {r1}
	bx r1
	thumb_func_end sub_8055758

	thumb_func_start sub_80557E8
sub_80557E8: @ 80557E8
	push {lr}
	bl script_env_2_enable
	pop {r0}
	bx r0
	thumb_func_end sub_80557E8

	thumb_func_start sub_80557F4
sub_80557F4: @ 80557F4
	push {lr}
	movs r0, 0x6
	bl audio_play
	bl sub_8071310
	bl script_env_2_enable
	pop {r0}
	bx r0
	thumb_func_end sub_80557F4

	thumb_func_start sub_8055808
sub_8055808: @ 8055808
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x5
	bl audio_play
	adds r0, r4, 0
	bl script_env_1_execute_new_script
	bl script_env_2_enable
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8055808

	thumb_func_start sub_8055824
sub_8055824: @ 8055824
	push {lr}
	movs r0, 0x6
	bl audio_play
	ldr r0, _0805583C
	bl script_env_1_execute_new_script
	bl script_env_2_enable
	pop {r0}
	bx r0
	.align 2, 0
_0805583C: .4byte gUnknown_081A44E5
	thumb_func_end sub_8055824

	thumb_func_start sub_8055840
sub_8055840: @ 8055840
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x5
	bl audio_play
	adds r0, r4, 0
	bl script_env_1_execute_new_script
	bl script_env_2_enable
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8055840

	thumb_func_start sub_805585C
sub_805585C: @ 805585C
	push {lr}
	ldr r0, _0805586C
	bl script_env_1_execute_new_script
	bl script_env_2_enable
	pop {r0}
	bx r0
	.align 2, 0
_0805586C: .4byte gUnknown_081A44FE
	thumb_func_end sub_805585C

	thumb_func_start sub_8055870
sub_8055870: @ 8055870
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0
	bne _0805587E
	movs r0, 0
	b _080558A4
_0805587E:
	ldr r0, _08055890
	ldr r1, _08055894
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0805589C
	ldr r1, _08055898
	movs r0, 0x1
	b _080558A0
	.align 2, 0
_08055890: .4byte 0x03003070
_08055894: .4byte 0x00000fbd
_08055898: .4byte 0x03000588
_0805589C:
	ldr r1, _080558A8
	movs r0, 0
_080558A0:
	strb r0, [r1]
	ldrb r0, [r1]
_080558A4:
	pop {r1}
	bx r1
	.align 2, 0
_080558A8: .4byte 0x03000588
	thumb_func_end sub_8055870

	thumb_func_start sub_80558AC
sub_80558AC: @ 80558AC
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _08055908
	bl sub_8007B24
	cmp r0, 0x1
	bne _08055908
	ldr r0, _080558F4
	ldr r1, [r0]
	ldr r0, _080558F8
	cmp r1, r0
	beq _080558F0
	ldr r0, _080558FC
	cmp r1, r0
	bne _08055908
	ldr r0, _08055900
	ldrb r2, [r0]
	movs r1, 0
	strb r1, [r0]
	cmp r2, 0x1
	beq _080558F0
	ldr r2, _08055904
	ldrb r1, [r2, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08055908
	ldrb r1, [r2, 0xA]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08055908
_080558F0:
	movs r0, 0x1
	b _0805590A
	.align 2, 0
_080558F4: .4byte 0x03000584
_080558F8: .4byte sub_8055408
_080558FC: .4byte sub_80553E4
_08055900: .4byte 0x03000588
_08055904: .4byte 0x0202f388
_08055908:
	movs r0, 0
_0805590A:
	pop {r1}
	bx r1
	thumb_func_end sub_80558AC

	thumb_func_start sub_8055910
sub_8055910: @ 8055910
	push {lr}
	bl is_c1_link_related_active
	cmp r0, 0x1
	bne _0805592C
	bl sub_8007B24
	cmp r0, 0x1
	bne _0805592C
	ldr r0, _08055930
	ldr r1, [r0]
	ldr r0, _08055934
	cmp r1, r0
	beq _08055938
_0805592C:
	movs r0, 0
	b _0805593A
	.align 2, 0
_08055930: .4byte 0x03000584
_08055934: .4byte sub_8055438
_08055938:
	movs r0, 0x1
_0805593A:
	pop {r1}
	bx r1
	thumb_func_end sub_8055910

	thumb_func_start sub_8055940
sub_8055940: @ 8055940
	push {lr}
	bl sub_8007B24
	cmp r0, 0
	beq _0805594E
	movs r0, 0x1
	b _08055950
_0805594E:
	movs r0, 0
_08055950:
	pop {r1}
	bx r1
	thumb_func_end sub_8055940

	thumb_func_start sub_8055954
sub_8055954: @ 8055954
	movs r1, 0
	str r1, [r0]
	bx lr
	thumb_func_end sub_8055954

	thumb_func_start strange_npc_table_clear
strange_npc_table_clear: @ 805595C
	push {lr}
	ldr r0, _0805596C
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_0805596C: .4byte 0x02029818
	thumb_func_end strange_npc_table_clear

	thumb_func_start sub_8055970
sub_8055970: @ 8055970
	push {lr}
	movs r1, 0
	movs r2, 0x24
	bl memset
	pop {r0}
	bx r0
	thumb_func_end sub_8055970

	thumb_func_start sub_8055980
sub_8055980: @ 8055980
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r1
	mov r10, r2
	mov r8, r3
	lsls r0, 24
	lsrs r7, r0, 24
	mov r0, r9
	lsls r0, 16
	lsrs r0, 16
	mov r9, r0
	mov r1, r10
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	bl sub_805AB54
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	lsls r4, r7, 2
	ldr r0, _08055A24
	adds r4, r0
	lsls r5, r6, 3
	adds r5, r6
	lsls r5, 2
	ldr r0, _08055A28
	adds r5, r0
	adds r0, r4, 0
	bl sub_8055954
	adds r0, r5, 0
	bl sub_8055970
	movs r2, 0
	movs r1, 0x1
	movs r0, 0x1
	strb r0, [r4]
	strb r7, [r4, 0x1]
	strb r6, [r4, 0x2]
	strb r2, [r4, 0x3]
	ldrb r0, [r5]
	orrs r0, r1
	mov r2, r8
	ands r2, r1
	lsls r2, 1
	movs r1, 0x3
	negs r1, r1
	ands r0, r1
	orrs r0, r2
	strb r0, [r5]
	movs r0, 0x2
	strb r0, [r5, 0x19]
	movs r0, 0x40
	strb r0, [r5, 0x4]
	mov r0, r9
	lsls r0, 16
	asrs r0, 16
	mov r9, r0
	mov r1, r10
	lsls r1, 16
	asrs r1, 16
	mov r10, r1
	adds r0, r5, 0
	mov r1, r9
	mov r2, r10
	bl sub_8055A2C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055A24: .4byte 0x02029818
_08055A28: .4byte 0x030048a0
	thumb_func_end sub_8055980

	thumb_func_start sub_8055A2C
sub_8055A2C: @ 8055A2C
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r1, r2, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	strh r0, [r4, 0x10]
	strh r1, [r4, 0x12]
	strh r0, [r4, 0x14]
	strh r1, [r4, 0x16]
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0xC
	adds r3, r4, 0
	adds r3, 0xE
	bl sub_80603CC
	ldrh r0, [r4, 0xC]
	adds r0, 0x8
	strh r0, [r4, 0xC]
	adds r0, r4, 0
	bl FieldObjectUpdateZCoord
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8055A2C

	thumb_func_start unref_sub_8055A6C
unref_sub_8055A6C: @ 8055A6C
	push {lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	ldr r1, _08055A94
	lsrs r0, 22
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, 0
	beq _08055A8E
	ldrb r0, [r1, 0x2]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08055A98
	adds r1, r0
	strb r2, [r1, 0x19]
_08055A8E:
	pop {r0}
	bx r0
	.align 2, 0
_08055A94: .4byte 0x02029818
_08055A98: .4byte 0x030048a0
	thumb_func_end unref_sub_8055A6C

	thumb_func_start unref_sub_8055A9C
unref_sub_8055A9C: @ 8055A9C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 22
	ldr r1, _08055ADC
	adds r5, r0, r1
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055AE0
	adds r4, r0, r1
	ldrb r0, [r4, 0x4]
	cmp r0, 0x40
	beq _08055AC8
	adds r1, r0, 0
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055AE4
	adds r0, r1
	bl DestroySprite
_08055AC8:
	movs r0, 0
	strb r0, [r5]
	ldrb r1, [r4]
	subs r0, 0x2
	ands r0, r1
	strb r0, [r4]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055ADC: .4byte 0x02029818
_08055AE0: .4byte 0x030048a0
_08055AE4: .4byte 0x02020004
	thumb_func_end unref_sub_8055A9C

	thumb_func_start sub_8055AE8
sub_8055AE8: @ 8055AE8
	lsls r0, 24
	ldr r1, _08055B00
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055B04
	adds r0, r1
	ldrb r0, [r0, 0x4]
	bx lr
	.align 2, 0
_08055B00: .4byte 0x02029818
_08055B04: .4byte 0x030048a0
	thumb_func_end sub_8055AE8

	thumb_func_start sub_8055B08
sub_8055B08: @ 8055B08
	lsls r0, 24
	ldr r3, _08055B28
	lsrs r0, 22
	adds r0, r3
	ldrb r3, [r0, 0x2]
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	ldr r3, _08055B2C
	adds r0, r3
	ldrh r3, [r0, 0x10]
	strh r3, [r1]
	ldrh r0, [r0, 0x12]
	strh r0, [r2]
	bx lr
	.align 2, 0
_08055B28: .4byte 0x02029818
_08055B2C: .4byte 0x030048a0
	thumb_func_end sub_8055B08

	thumb_func_start sub_8055B30
sub_8055B30: @ 8055B30
	lsls r0, 24
	ldr r1, _08055B48
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055B4C
	adds r0, r1
	ldrb r0, [r0, 0x19]
	bx lr
	.align 2, 0
_08055B48: .4byte 0x02029818
_08055B4C: .4byte 0x030048a0
	thumb_func_end sub_8055B30

	thumb_func_start sub_8055B50
sub_8055B50: @ 8055B50
	lsls r0, 24
	ldr r1, _08055B6C
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055B70
	adds r0, r1
	ldrb r0, [r0, 0xB]
	lsls r0, 28
	lsrs r0, 28
	bx lr
	.align 2, 0
_08055B6C: .4byte 0x02029818
_08055B70: .4byte 0x030048a0
	thumb_func_end sub_8055B50

	thumb_func_start unref_sub_8055B74
unref_sub_8055B74: @ 8055B74
	lsls r0, 24
	ldr r1, _08055B94
	lsrs r0, 22
	adds r0, r1
	ldrb r1, [r0, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055B98
	adds r0, r1
	adds r0, 0x21
	movs r1, 0
	ldrsb r1, [r0, r1]
	movs r0, 0x10
	subs r0, r1
	bx lr
	.align 2, 0
_08055B94: .4byte 0x02029818
_08055B98: .4byte 0x030048a0
	thumb_func_end unref_sub_8055B74

	thumb_func_start sub_8055B9C
sub_8055B9C: @ 8055B9C
	push {r4-r6,lr}
	movs r2, 0
	ldr r5, _08055BE0
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r3, r1, 16
_08055BAA:
	lsls r0, r2, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, 0
	beq _08055BE8
	ldrb r0, [r1, 0x3]
	cmp r0, 0
	beq _08055BBE
	cmp r0, 0x2
	bne _08055BE8
_08055BBE:
	ldrb r1, [r1, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055BE4
	adds r1, r0, r1
	movs r6, 0x10
	ldrsh r0, [r1, r6]
	cmp r0, r4
	bne _08055BE8
	movs r6, 0x12
	ldrsh r0, [r1, r6]
	cmp r0, r3
	bne _08055BE8
	adds r0, r2, 0
	b _08055BF4
	.align 2, 0
_08055BE0: .4byte 0x02029818
_08055BE4: .4byte 0x030048a0
_08055BE8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _08055BAA
	movs r0, 0x4
_08055BF4:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8055B9C

	thumb_func_start sub_8055BFC
sub_8055BFC: @ 8055BFC
	push {r4-r6,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	adds r2, r3, 0
	lsrs r0, 22
	ldr r1, _08055C2C
	adds r5, r0, r1
	ldrb r1, [r5, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055C30
	adds r6, r0, r1
	ldrb r0, [r5]
	cmp r0, 0
	beq _08055C58
	cmp r3, 0xA
	bls _08055C34
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	b _08055C58
	.align 2, 0
_08055C2C: .4byte 0x02029818
_08055C30: .4byte 0x030048a0
_08055C34:
	ldr r4, _08055C60
	ldr r1, _08055C64
	ldrb r0, [r5, 0x3]
	lsls r0, 2
	adds r0, r1
	ldr r3, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl _call_via_r3
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r2, [r0]
	adds r0, r5, 0
	adds r1, r6, 0
	bl _call_via_r2
_08055C58:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055C60: .4byte gUnknown_082166D8
_08055C64: .4byte gUnknown_082166A0
	thumb_func_end sub_8055BFC

	thumb_func_start sub_8055C68
sub_8055C68: @ 8055C68
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _08055C84
	lsls r3, r2, 2
	adds r3, r4
	ldr r3, [r3]
	bl _call_via_r3
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08055C84: .4byte gUnknown_082166AC
	thumb_func_end sub_8055C68

	thumb_func_start sub_8055C88
sub_8055C88: @ 8055C88
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8055C88

	thumb_func_start sub_8055C8C
sub_8055C8C: @ 8055C8C
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	ldr r4, _08055CA8
	lsls r3, r2, 2
	adds r3, r4
	ldr r3, [r3]
	bl _call_via_r3
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08055CA8: .4byte gUnknown_082166AC
	thumb_func_end sub_8055C8C

	thumb_func_start sub_8055CAC
sub_8055CAC: @ 8055CAC
	movs r0, 0
	bx lr
	thumb_func_end sub_8055CAC

	thumb_func_start sub_8055CB0
sub_8055CB0: @ 8055CB0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	ldrb r1, [r5, 0x19]
	bl npc_something3
	strb r0, [r5, 0x19]
	ldrb r1, [r5, 0x19]
	mov r6, sp
	adds r6, 0x2
	adds r0, r5, 0
	mov r2, sp
	adds r3, r6, 0
	bl FieldObjectMoveDestCoords
	ldrb r0, [r4, 0x2]
	ldrb r1, [r5, 0x19]
	mov r2, sp
	movs r3, 0
	ldrsh r2, [r2, r3]
	movs r4, 0
	ldrsh r3, [r6, r4]
	bl npc_080587EC
	lsls r0, 24
	cmp r0, 0
	bne _08055D0E
	adds r1, r5, 0
	adds r1, 0x21
	movs r0, 0x10
	strb r0, [r1]
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r3, 0
	ldrsh r2, [r6, r3]
	adds r0, r5, 0
	bl npc_coords_shift
	adds r0, r5, 0
	bl FieldObjectUpdateZCoord
	movs r0, 0x1
	b _08055D10
_08055D0E:
	movs r0, 0
_08055D10:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8055CB0

	thumb_func_start sub_8055D18
sub_8055D18: @ 8055D18
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, r2, 24
	lsrs r0, 24
	ldrb r1, [r4, 0x19]
	bl npc_something3
	strb r0, [r4, 0x19]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8055D18

	thumb_func_start sub_8055D30
sub_8055D30: @ 8055D30
	movs r1, 0
	strb r1, [r0, 0x3]
	bx lr
	thumb_func_end sub_8055D30

	thumb_func_start sub_8055D38
sub_8055D38: @ 8055D38
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r4, 0
	adds r5, 0x21
	ldrb r0, [r5]
	subs r0, 0x1
	strb r0, [r5]
	movs r0, 0x1
	strb r0, [r6, 0x3]
	ldrb r0, [r4, 0x19]
	adds r1, 0xC
	adds r2, r4, 0
	adds r2, 0xE
	bl MoveCoords
	ldrb r0, [r5]
	cmp r0, 0
	bne _08055D68
	adds r0, r4, 0
	bl npc_coords_shift_still
	movs r0, 0x2
	strb r0, [r6, 0x3]
_08055D68:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8055D38

	thumb_func_start npc_something3
npc_something3: @ 8055D70
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r2, r1, 24
	subs r0, 0x1
	cmp r0, 0x9
	bhi _08055DC8
	lsls r0, 2
	ldr r1, _08055D8C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055D8C: .4byte _08055D90
	.align 2, 0
_08055D90:
	.4byte _08055DB8
	.4byte _08055DBC
	.4byte _08055DC0
	.4byte _08055DC4
	.4byte _08055DC8
	.4byte _08055DC8
	.4byte _08055DB8
	.4byte _08055DBC
	.4byte _08055DC0
	.4byte _08055DC4
_08055DB8:
	movs r0, 0x2
	b _08055DCA
_08055DBC:
	movs r0, 0x1
	b _08055DCA
_08055DC0:
	movs r0, 0x3
	b _08055DCA
_08055DC4:
	movs r0, 0x4
	b _08055DCA
_08055DC8:
	adds r0, r2, 0
_08055DCA:
	pop {r1}
	bx r1
	thumb_func_end npc_something3

	thumb_func_start npc_080587EC
npc_080587EC: @ 8055DD0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r2, 16
	lsrs r2, 16
	mov r12, r2
	lsls r3, 16
	movs r4, 0
	ldr r0, _08055E34
	mov r9, r0
	lsrs r2, r3, 16
	mov r10, r2
	asrs r6, r3, 16
_08055DF4:
	mov r7, r12
	lsls r3, r7, 16
	mov r0, r10
	lsls r5, r0, 16
	cmp r4, r8
	beq _08055E38
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	mov r2, r9
	adds r1, r0, r2
	movs r7, 0x10
	ldrsh r0, [r1, r7]
	asrs r2, r3, 16
	cmp r0, r2
	bne _08055E1C
	movs r7, 0x12
	ldrsh r0, [r1, r7]
	cmp r0, r6
	beq _08055E2E
_08055E1C:
	movs r7, 0x14
	ldrsh r0, [r1, r7]
	cmp r0, r2
	bne _08055E38
	movs r0, 0x16
	ldrsh r1, [r1, r0]
	asrs r0, r5, 16
	cmp r1, r0
	bne _08055E38
_08055E2E:
	movs r0, 0x1
	b _08055E4E
	.align 2, 0
_08055E34: .4byte 0x030048a0
_08055E38:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08055DF4
	asrs r0, r3, 16
	asrs r1, r5, 16
	bl MapGridIsImpassableAt
	lsls r0, 24
	lsrs r0, 24
_08055E4E:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end npc_080587EC

	thumb_func_start sub_8055E5C
sub_8055E5C: @ 8055E5C
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r2, r5, 2
	ldr r0, _08055EC8
	adds r2, r0
	ldrb r1, [r2, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055ECC
	adds r4, r0, r1
	ldrb r0, [r2]
	cmp r0, 0
	beq _08055EBE
	ldrb r1, [r4]
	lsls r1, 30
	lsrs r1, 31
	movs r0, 0
	bl sub_805983C
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08055ED0
	movs r2, 0
	str r2, [sp]
	movs r3, 0
	bl AddPseudoFieldObject
	strb r0, [r4, 0x4]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055ED4
	adds r0, r1
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x2
	orrs r1, r2
	strb r1, [r3]
	strh r5, [r0, 0x2E]
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
_08055EBE:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055EC8: .4byte 0x02029818
_08055ECC: .4byte 0x030048a0
_08055ED0: .4byte sub_8055ED8
_08055ED4: .4byte 0x02020004
	thumb_func_end sub_8055E5C

	thumb_func_start sub_8055ED8
sub_8055ED8: @ 8055ED8
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r0, 0x2E
	ldrsh r4, [r5, r0]
	lsls r4, 2
	ldr r0, _08055F3C
	adds r4, r0
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08055F40
	adds r6, r0, r1
	ldrh r0, [r6, 0xC]
	strh r0, [r5, 0x20]
	ldrh r0, [r6, 0xE]
	strh r0, [r5, 0x22]
	ldrb r0, [r6, 0xB]
	lsrs r0, 4
	adds r1, r5, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
	ldrb r0, [r6, 0xB]
	lsrs r0, 4
	bl ZCoordToPriority
	movs r1, 0x3
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
	ldrb r0, [r4, 0x3]
	cmp r0, 0
	bne _08055F44
	ldrb r0, [r6, 0x19]
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	b _08055F56
	.align 2, 0
_08055F3C: .4byte 0x02029818
_08055F40: .4byte 0x030048a0
_08055F44:
	ldrb r0, [r6, 0x19]
	bl get_go_image_anim_num
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnimIfDifferent
_08055F56:
	adds r0, r5, 0
	movs r1, 0
	bl sub_806487C
	ldrb r0, [r6]
	lsls r0, 29
	cmp r0, 0
	bge _08055F88
	ldrh r0, [r5, 0x3C]
	movs r1, 0x4
	ands r1, r0
	lsls r1, 16
	adds r3, r5, 0
	adds r3, 0x3E
	lsrs r1, 18
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
_08055F88:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8055ED8

	thumb_func_start mapconnection_get_mapheader
mapconnection_get_mapheader: @ 8055F90
	push {lr}
	ldrb r2, [r0, 0x8]
	ldrb r1, [r0, 0x9]
	adds r0, r2, 0
	bl get_mapheader_by_bank_and_number
	pop {r1}
	bx r1
	thumb_func_end mapconnection_get_mapheader

	thumb_func_start not_trainer_hill_battle_pyramid
not_trainer_hill_battle_pyramid: @ 8055FA0
	push {r4,lr}
	ldr r4, _08055FBC
	adds r0, r4, 0
	bl mapheader_copy_mapdata_with_padding
	ldr r0, [r4, 0x4]
	bl sub_80BB970
	bl mapheader_run_script_with_tag_x1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055FBC: .4byte 0x0202e828
	thumb_func_end not_trainer_hill_battle_pyramid

	thumb_func_start sub_8055FC0
sub_8055FC0: @ 8055FC0
	push {r4,lr}
	ldr r4, _08055FF0
	adds r0, r4, 0
	bl mapheader_copy_mapdata_with_padding
	movs r0, 0
	bl sub_80BBCCC
	ldr r0, [r4, 0x4]
	bl sub_80BB970
	bl sub_8056670
	bl mapheader_run_script_with_tag_x1
	ldr r1, _08055FF4
	ldr r0, [r1]
	ldr r1, [r1, 0x4]
	bl UpdateTVScreensOnMap
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055FF0: .4byte 0x0202e828
_08055FF4: .4byte 0x03004870
	thumb_func_end sub_8055FC0

	thumb_func_start mapheader_copy_mapdata_with_padding
mapheader_copy_mapdata_with_padding: @ 8055FF8
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	ldr r5, [r6]
	ldr r0, _08056044
	str r0, [sp]
	ldr r4, _08056048
	ldr r2, _0805604C
	mov r0, sp
	adds r1, r4, 0
	bl CpuFastSet
	ldr r2, _08056050
	str r4, [r2, 0x8]
	ldr r1, [r5]
	adds r1, 0xF
	str r1, [r2]
	ldr r0, [r5, 0x4]
	adds r0, 0xE
	str r0, [r2, 0x4]
	muls r1, r0
	movs r0, 0xA0
	lsls r0, 6
	cmp r1, r0
	bgt _0805603A
	ldr r0, [r5, 0xC]
	ldrh r1, [r5]
	ldrh r2, [r5, 0x4]
	bl map_copy_with_padding
	adds r0, r6, 0
	bl sub_80560AC
_0805603A:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056044: .4byte 0x03ff03ff
_08056048: .4byte 0x02029828
_0805604C: .4byte 0x01001400
_08056050: .4byte 0x03004870
	thumb_func_end mapheader_copy_mapdata_with_padding

	thumb_func_start map_copy_with_padding
map_copy_with_padding: @ 8056054
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r0, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _080560A8
	ldr r4, [r0, 0x8]
	ldr r1, [r0]
	lsls r0, r1, 3
	subs r0, r1
	lsls r0, 1
	adds r0, 0xE
	adds r4, r0
	cmp r2, 0
	beq _0805609C
	mov r0, r8
	lsls r6, r0, 1
	adds r5, r2, 0
	movs r0, 0x1E
	adds r0, r6
	mov r9, r0
_08056088:
	adds r0, r7, 0
	adds r1, r4, 0
	mov r2, r8
	bl CpuSet
	add r4, r9
	adds r7, r6
	subs r5, 0x1
	cmp r5, 0
	bne _08056088
_0805609C:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080560A8: .4byte 0x03004870
	thumb_func_end map_copy_with_padding

	thumb_func_start sub_80560AC
sub_80560AC: @ 80560AC
	push {r4-r7,lr}
	adds r6, r0, 0
	ldr r0, [r6, 0xC]
	ldr r1, [r0]
	ldr r5, [r0, 0x4]
	ldr r2, _080560E0
	ldr r0, _080560E4
	ldr r0, [r0]
	str r0, [r2]
	cmp r1, 0
	ble _0805612C
	adds r4, r2, 0
	adds r7, r1, 0
_080560C6:
	adds r0, r5, 0
	bl mapconnection_get_mapheader
	adds r1, r0, 0
	ldr r2, [r5, 0x4]
	ldrb r0, [r5]
	cmp r0, 0x2
	beq _080560FE
	cmp r0, 0x2
	bgt _080560E8
	cmp r0, 0x1
	beq _080560F2
	b _08056124
	.align 2, 0
_080560E0: .4byte 0x0202e850
_080560E4: .4byte gUnknown_08308E28
_080560E8:
	cmp r0, 0x3
	beq _0805610A
	cmp r0, 0x4
	beq _08056116
	b _08056124
_080560F2:
	adds r0, r6, 0
	bl sub_8056198
	ldrb r0, [r4]
	movs r1, 0x1
	b _08056120
_080560FE:
	adds r0, r6, 0
	bl sub_8056200
	ldrb r0, [r4]
	movs r1, 0x2
	b _08056120
_0805610A:
	adds r0, r6, 0
	bl sub_8056260
	ldrb r0, [r4]
	movs r1, 0x4
	b _08056120
_08056116:
	adds r0, r6, 0
	bl sub_80562C0
	ldrb r0, [r4]
	movs r1, 0x8
_08056120:
	orrs r0, r1
	strb r0, [r4]
_08056124:
	subs r7, 0x1
	adds r5, 0xC
	cmp r7, 0
	bne _080560C6
_0805612C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_80560AC

	thumb_func_start sub_8056134
sub_8056134: @ 8056134
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r5, [sp, 0x18]
	ldr r4, [r2]
	ldr r7, [r4]
	adds r2, r7, 0
	muls r2, r5
	adds r2, r3
	lsls r2, 1
	ldr r3, [r4, 0xC]
	adds r6, r3, r2
	ldr r3, _08056190
	ldr r2, [r3]
	muls r1, r2
	adds r1, r0
	lsls r1, 1
	ldr r0, [r3, 0x8]
	adds r5, r0, r1
	ldr r0, [sp, 0x20]
	cmp r0, 0
	ble _08056186
	adds r4, r0, 0
	ldr r3, _08056194
	mov r8, r3
_08056166:
	adds r0, r6, 0
	adds r1, r5, 0
	ldr r2, [sp, 0x1C]
	mov r3, r8
	ands r2, r3
	bl CpuSet
	ldr r0, _08056190
	ldr r0, [r0]
	lsls r0, 1
	adds r5, r0
	lsls r0, r7, 1
	adds r6, r0
	subs r4, 0x1
	cmp r4, 0
	bne _08056166
_08056186:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056190: .4byte 0x03004870
_08056194: .4byte 0x001fffff
	thumb_func_end sub_8056134

	thumb_func_start sub_8056198
sub_8056198: @ 8056198
	push {r4-r7,lr}
	sub sp, 0xC
	adds r3, r0, 0
	adds r5, r1, 0
	cmp r5, 0
	beq _080561F2
	ldr r0, [r5]
	ldr r4, [r0]
	adds r2, 0x7
	ldr r0, [r3]
	ldr r0, [r0, 0x4]
	adds r7, r0, 0x7
	cmp r2, 0
	bge _080561CC
	negs r6, r2
	adds r2, r4
	ldr r0, _080561C8
	ldr r3, [r0]
	cmp r2, r3
	bge _080561C2
	adds r3, r2, 0
_080561C2:
	movs r2, 0
	b _080561DC
	.align 2, 0
_080561C8: .4byte 0x03004870
_080561CC:
	movs r6, 0
	adds r0, r2, r4
	ldr r1, _080561FC
	ldr r1, [r1]
	subs r3, r1, r2
	cmp r0, r1
	bge _080561DC
	adds r3, r4, 0
_080561DC:
	movs r0, 0
	str r0, [sp]
	str r3, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	adds r0, r2, 0
	adds r1, r7, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_8056134
_080561F2:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080561FC: .4byte 0x03004870
	thumb_func_end sub_8056198

	thumb_func_start sub_8056200
sub_8056200: @ 8056200
	push {r4-r7,lr}
	sub sp, 0xC
	adds r5, r1, 0
	cmp r5, 0
	beq _08056254
	ldr r0, [r5]
	ldr r4, [r0]
	ldr r0, [r0, 0x4]
	adds r2, 0x7
	subs r7, r0, 0x7
	cmp r2, 0
	bge _08056230
	negs r6, r2
	adds r2, r4
	ldr r0, _0805622C
	ldr r3, [r0]
	cmp r2, r3
	bge _08056226
	adds r3, r2, 0
_08056226:
	movs r2, 0
	b _08056240
	.align 2, 0
_0805622C: .4byte 0x03004870
_08056230:
	movs r6, 0
	adds r0, r2, r4
	ldr r1, _0805625C
	ldr r1, [r1]
	subs r3, r1, r2
	cmp r0, r1
	bge _08056240
	adds r3, r4, 0
_08056240:
	str r7, [sp]
	str r3, [sp, 0x4]
	movs r0, 0x7
	str r0, [sp, 0x8]
	adds r0, r2, 0
	movs r1, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_8056134
_08056254:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805625C: .4byte 0x03004870
	thumb_func_end sub_8056200

	thumb_func_start sub_8056260
sub_8056260: @ 8056260
	push {r4-r7,lr}
	sub sp, 0xC
	adds r5, r1, 0
	cmp r5, 0
	beq _080562B4
	ldr r0, [r5]
	ldr r1, [r0]
	ldr r4, [r0, 0x4]
	adds r2, 0x7
	subs r7, r1, 0x7
	cmp r2, 0
	bge _08056290
	negs r6, r2
	adds r1, r2, r4
	ldr r0, _0805628C
	ldr r3, [r0, 0x4]
	cmp r1, r3
	bge _08056286
	adds r3, r1, 0
_08056286:
	movs r2, 0
	b _080562A0
	.align 2, 0
_0805628C: .4byte 0x03004870
_08056290:
	movs r6, 0
	adds r0, r2, r4
	ldr r1, _080562BC
	ldr r1, [r1, 0x4]
	subs r3, r1, r2
	cmp r0, r1
	bge _080562A0
	adds r3, r4, 0
_080562A0:
	str r6, [sp]
	movs r0, 0x7
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
	movs r0, 0
	adds r1, r2, 0
	adds r2, r5, 0
	adds r3, r7, 0
	bl sub_8056134
_080562B4:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080562BC: .4byte 0x03004870
	thumb_func_end sub_8056260

	thumb_func_start sub_80562C0
sub_80562C0: @ 80562C0
	push {r4-r7,lr}
	sub sp, 0xC
	adds r3, r0, 0
	adds r5, r1, 0
	cmp r5, 0
	beq _08056318
	ldr r0, [r5]
	ldr r4, [r0, 0x4]
	ldr r0, [r3]
	ldr r0, [r0]
	adds r7, r0, 0x7
	adds r2, 0x7
	cmp r2, 0
	bge _080562F4
	negs r6, r2
	adds r1, r2, r4
	ldr r0, _080562F0
	ldr r3, [r0, 0x4]
	cmp r1, r3
	bge _080562EA
	adds r3, r1, 0
_080562EA:
	movs r2, 0
	b _08056304
	.align 2, 0
_080562F0: .4byte 0x03004870
_080562F4:
	movs r6, 0
	adds r0, r2, r4
	ldr r1, _08056320
	ldr r1, [r1, 0x4]
	subs r3, r1, r2
	cmp r0, r1
	bge _08056304
	adds r3, r4, 0
_08056304:
	str r6, [sp]
	movs r0, 0x8
	str r0, [sp, 0x4]
	str r3, [sp, 0x8]
	adds r0, r7, 0
	adds r1, r2, 0
	adds r2, r5, 0
	movs r3, 0
	bl sub_8056134
_08056318:
	add sp, 0xC
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056320: .4byte 0x03004870
	thumb_func_end sub_80562C0

	thumb_func_start MapGridGetZCoordAt
MapGridGetZCoordAt: @ 8056324
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	cmp r2, 0
	blt _08056354
	ldr r1, _08056350
	ldr r3, [r1]
	cmp r2, r3
	bge _08056354
	cmp r4, 0
	blt _08056354
	ldr r0, [r1, 0x4]
	cmp r4, r0
	bge _08056354
	adds r0, r3, 0
	muls r0, r4
	adds r0, r2, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _08056376
	.align 2, 0
_08056350: .4byte 0x03004870
_08056354:
	ldr r0, _08056380
	ldr r3, [r0]
	adds r1, r2, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r4, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	orrs r1, r0
_08056376:
	ldr r0, _08056384
	cmp r1, r0
	beq _08056388
	lsrs r0, r1, 12
	b _0805638A
	.align 2, 0
_08056380: .4byte 0x0202e828
_08056384: .4byte 0x000003ff
_08056388:
	movs r0, 0
_0805638A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MapGridGetZCoordAt

	thumb_func_start MapGridIsImpassableAt
MapGridIsImpassableAt: @ 8056390
	push {r4,lr}
	adds r2, r0, 0
	adds r4, r1, 0
	cmp r2, 0
	blt _080563C0
	ldr r1, _080563BC
	ldr r3, [r1]
	cmp r2, r3
	bge _080563C0
	cmp r4, 0
	blt _080563C0
	ldr r0, [r1, 0x4]
	cmp r4, r0
	bge _080563C0
	adds r0, r3, 0
	muls r0, r4
	adds r0, r2, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	b _080563E2
	.align 2, 0
_080563BC: .4byte 0x03004870
_080563C0:
	ldr r0, _080563F4
	ldr r3, [r0]
	adds r1, r2, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r4, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	orrs r1, r0
_080563E2:
	ldr r0, _080563F8
	cmp r1, r0
	beq _080563FC
	movs r0, 0xC0
	lsls r0, 4
	ands r1, r0
	lsrs r0, r1, 10
	b _080563FE
	.align 2, 0
_080563F4: .4byte 0x0202e828
_080563F8: .4byte 0x000003ff
_080563FC:
	movs r0, 0x1
_080563FE:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end MapGridIsImpassableAt

	thumb_func_start MapGridGetMetatileIdAt
MapGridGetMetatileIdAt: @ 8056404
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	cmp r5, 0
	blt _08056434
	ldr r1, _08056430
	ldr r2, [r1]
	cmp r5, r2
	bge _08056434
	cmp r6, 0
	blt _08056434
	ldr r0, [r1, 0x4]
	cmp r6, r0
	bge _08056434
	adds r0, r2, 0
	muls r0, r6
	adds r0, r5, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r4, [r0]
	b _08056458
	.align 2, 0
_08056430: .4byte 0x03004870
_08056434:
	ldr r0, _08056464
	ldr r3, [r0]
	adds r1, r5, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r6, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	adds r4, r0, 0
	orrs r4, r1
_08056458:
	ldr r0, _08056468
	cmp r4, r0
	beq _0805646C
	ands r4, r0
	adds r0, r4, 0
	b _08056490
	.align 2, 0
_08056464: .4byte 0x0202e828
_08056468: .4byte 0x000003ff
_0805646C:
	ldr r0, _08056498
	ldr r3, [r0]
	adds r1, r5, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r6, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r1, r2, 0
	orrs r0, r1
	ands r0, r4
_08056490:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08056498: .4byte 0x0202e828
	thumb_func_end MapGridGetMetatileIdAt

	thumb_func_start MapGridGetMetatileBehaviorAt
MapGridGetMetatileBehaviorAt: @ 805649C
	push {lr}
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	lsrs r0, 16
	bl GetBehaviorByMetatileId
	adds r1, r0, 0
	movs r0, 0xFF
	ands r0, r1
	pop {r1}
	bx r1
	thumb_func_end MapGridGetMetatileBehaviorAt

	thumb_func_start MapGridGetMetatileLayerTypeAt
MapGridGetMetatileLayerTypeAt: @ 80564B4
	push {lr}
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	lsrs r0, 16
	bl GetBehaviorByMetatileId
	adds r1, r0, 0
	movs r0, 0xF0
	lsls r0, 8
	ands r0, r1
	lsrs r0, 12
	pop {r1}
	bx r1
	thumb_func_end MapGridGetMetatileLayerTypeAt

	thumb_func_start MapGridSetMetatileIdAt
MapGridSetMetatileIdAt: @ 80564D0
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r2, 16
	lsrs r5, r2, 16
	cmp r3, 0
	blt _08056508
	ldr r2, _08056510
	ldr r4, [r2]
	cmp r3, r4
	bge _08056508
	cmp r1, 0
	blt _08056508
	ldr r0, [r2, 0x4]
	cmp r1, r0
	bge _08056508
	muls r1, r4
	adds r1, r3, r1
	ldr r0, [r2, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	movs r2, 0xF0
	lsls r2, 8
	ands r2, r0
	ldr r0, _08056514
	ands r0, r5
	orrs r2, r0
	strh r2, [r1]
_08056508:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056510: .4byte 0x03004870
_08056514: .4byte 0x00000fff
	thumb_func_end MapGridSetMetatileIdAt

	thumb_func_start MapGridSetMetatileEntryAt
MapGridSetMetatileEntryAt: @ 8056518
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r2, 16
	lsrs r5, r2, 16
	cmp r3, 0
	blt _08056544
	ldr r2, _0805654C
	ldr r4, [r2]
	cmp r3, r4
	bge _08056544
	cmp r1, 0
	blt _08056544
	ldr r0, [r2, 0x4]
	cmp r1, r0
	bge _08056544
	adds r0, r4, 0
	muls r0, r1
	adds r0, r3, r0
	ldr r1, [r2, 0x8]
	lsls r0, 1
	adds r0, r1
	strh r5, [r0]
_08056544:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805654C: .4byte 0x03004870
	thumb_func_end MapGridSetMetatileEntryAt

	thumb_func_start GetBehaviorByMetatileId
GetBehaviorByMetatileId: @ 8056550
	push {lr}
	lsls r0, 16
	lsrs r2, r0, 16
	adds r3, r2, 0
	ldr r0, _0805656C
	cmp r2, r0
	bhi _08056574
	ldr r0, _08056570
	ldr r0, [r0]
	ldr r0, [r0, 0x10]
	ldr r1, [r0, 0x10]
	lsls r0, r2, 1
	b _08056592
	.align 2, 0
_0805656C: .4byte 0x000001ff
_08056570: .4byte 0x0202e828
_08056574:
	ldr r0, _08056580
	cmp r2, r0
	bls _08056584
	movs r0, 0xFF
	b _08056596
	.align 2, 0
_08056580: .4byte 0x000003ff
_08056584:
	ldr r0, _0805659C
	ldr r0, [r0]
	ldr r0, [r0, 0x14]
	ldr r1, [r0, 0x10]
	lsls r0, r3, 1
	adds r0, r1
	ldr r1, _080565A0
_08056592:
	adds r0, r1
	ldrh r0, [r0]
_08056596:
	pop {r1}
	bx r1
	.align 2, 0
_0805659C: .4byte 0x0202e828
_080565A0: .4byte 0xfffffc00
	thumb_func_end GetBehaviorByMetatileId

	thumb_func_start save_serialize_map
save_serialize_map: @ 80565A4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, _0805660C
	ldr r0, _08056610
	ldr r0, [r0]
	mov r8, r0
	adds r0, r5, 0
	subs r0, 0x34
	movs r1, 0
	ldrsh r6, [r0, r1]
	movs r2, 0x2
	ldrsh r0, [r0, r2]
	adds r1, r0, 0
	adds r1, 0xE
	cmp r0, r1
	bge _080565FE
	mov r12, r1
	ldr r1, _08056614
	mov r9, r1
	lsls r7, r6, 1
_080565D0:
	adds r1, r6, 0
	adds r3, r1, 0
	adds r3, 0xF
	adds r4, r0, 0x1
	cmp r1, r3
	bge _080565F8
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 1
	add r0, r9
	adds r2, r7, r0
	subs r1, r3, r1
_080565EA:
	ldrh r0, [r2]
	strh r0, [r5]
	adds r5, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _080565EA
_080565F8:
	adds r0, r4, 0
	cmp r0, r12
	blt _080565D0
_080565FE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805660C: .4byte 0x02025768
_08056610: .4byte 0x03004870
_08056614: .4byte 0x02029828
	thumb_func_end save_serialize_map

	thumb_func_start sub_8056618
sub_8056618: @ 8056618
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r4, _0805663C
	ldr r3, _08056640
_08056622:
	lsls r0, r1, 1
	adds r0, r4
	ldrh r0, [r0]
	orrs r2, r0
	adds r0, r1, 0x1
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, r3
	bls _08056622
	cmp r2, 0
	beq _08056644
	movs r0, 0
	b _08056646
	.align 2, 0
_0805663C: .4byte 0x02025768
_08056640: .4byte 0x000001ff
_08056644:
	movs r0, 0x1
_08056646:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8056618

	thumb_func_start sav2_mapdata_clear
sav2_mapdata_clear: @ 805664C
	push {lr}
	sub sp, 0x4
	mov r1, sp
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08056668
	ldr r2, _0805666C
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08056668: .4byte 0x02025768
_0805666C: .4byte 0x01000100
	thumb_func_end sav2_mapdata_clear

	thumb_func_start sub_8056670
sub_8056670: @ 8056670
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r5, _080566E4
	bl sub_8056618
	cmp r0, 0
	bne _080566D6
	ldr r0, _080566E8
	ldr r0, [r0]
	mov r8, r0
	adds r0, r5, 0
	subs r0, 0x34
	movs r1, 0
	ldrsh r6, [r0, r1]
	movs r2, 0x2
	ldrsh r0, [r0, r2]
	adds r1, r0, 0
	adds r1, 0xE
	cmp r0, r1
	bge _080566D2
	mov r12, r1
	ldr r1, _080566EC
	mov r9, r1
	lsls r7, r6, 1
_080566A4:
	adds r1, r6, 0
	adds r3, r1, 0
	adds r3, 0xF
	adds r4, r0, 0x1
	cmp r1, r3
	bge _080566CC
	mov r2, r8
	muls r2, r0
	adds r0, r2, 0
	lsls r0, 1
	add r0, r9
	adds r2, r7, r0
	subs r1, r3, r1
_080566BE:
	ldrh r0, [r5]
	strh r0, [r2]
	adds r5, 0x2
	adds r2, 0x2
	subs r1, 0x1
	cmp r1, 0
	bne _080566BE
_080566CC:
	adds r0, r4, 0
	cmp r0, r12
	blt _080566A4
_080566D2:
	bl sav2_mapdata_clear
_080566D6:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080566E4: .4byte 0x02025768
_080566E8: .4byte 0x03004870
_080566EC: .4byte 0x02029828
	thumb_func_end sub_8056670

	thumb_func_start sub_80566F0
sub_80566F0: @ 80566F0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r1, r0, 24
	adds r2, r1, 0
	ldr r0, _08056734
	mov r10, r0
	ldr r0, _08056738
	ldr r0, [r0]
	str r0, [sp]
	movs r3, 0
	mov r9, r3
	mov r8, r3
	mov r0, r10
	subs r0, 0x34
	movs r6, 0
	ldrsh r4, [r0, r6]
	str r4, [sp, 0x4]
	movs r3, 0x2
	ldrsh r5, [r0, r3]
	movs r7, 0xF
	movs r4, 0xE
	mov r12, r4
	cmp r1, 0x2
	beq _08056746
	cmp r1, 0x2
	bgt _0805673C
	cmp r1, 0x1
	beq _0805674E
	b _08056766
	.align 2, 0
_08056734: .4byte 0x02025768
_08056738: .4byte 0x03004870
_0805673C:
	cmp r2, 0x3
	beq _08056758
	cmp r2, 0x4
	beq _08056760
	b _08056766
_08056746:
	adds r5, 0x1
	movs r6, 0xD
	mov r12, r6
	b _08056766
_0805674E:
	movs r0, 0x1
	mov r8, r0
	movs r1, 0xD
	mov r12, r1
	b _08056766
_08056758:
	ldr r3, [sp, 0x4]
	adds r3, 0x1
	str r3, [sp, 0x4]
	b _08056764
_08056760:
	movs r4, 0x1
	mov r9, r4
_08056764:
	movs r7, 0xE
_08056766:
	movs r1, 0
	cmp r1, r12
	bge _080567A8
_0805676C:
	adds r4, r1, 0x1
	cmp r7, 0
	beq _080567A2
	adds r0, r1, r5
	ldr r6, [sp]
	adds r2, r6, 0
	muls r2, r0
	add r1, r8
	lsls r0, r1, 4
	subs r0, r1
	add r0, r9
	ldr r1, [sp, 0x4]
	adds r2, r1, r2
	adds r3, r7, 0
	lsls r2, 1
	ldr r6, _080567BC
	adds r2, r6
	lsls r0, 1
	mov r6, r10
	adds r1, r0, r6
_08056794:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, 0x2
	adds r2, 0x2
	subs r3, 0x1
	cmp r3, 0
	bne _08056794
_080567A2:
	adds r1, r4, 0
	cmp r1, r12
	blt _0805676C
_080567A8:
	bl sav2_mapdata_clear
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080567BC: .4byte 0x02029828
	thumb_func_end sub_80566F0

	thumb_func_start GetMapBorderIdAt
GetMapBorderIdAt: @ 80567C0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	cmp r4, 0
	blt _080567FC
	ldr r1, _080567F4
	ldr r2, [r1]
	cmp r4, r2
	bge _080567FC
	cmp r5, 0
	blt _080567FC
	ldr r0, [r1, 0x4]
	cmp r5, r0
	bge _080567FC
	adds r0, r2, 0
	muls r0, r5
	adds r0, r4, r0
	ldr r1, [r1, 0x8]
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
	ldr r0, _080567F8
	cmp r1, r0
	beq _08056894
	b _08056824
	.align 2, 0
_080567F4: .4byte 0x03004870
_080567F8: .4byte 0x000003ff
_080567FC:
	ldr r0, _08056840
	ldr r3, [r0]
	adds r1, r4, 0x1
	movs r2, 0x1
	ands r1, r2
	adds r0, r5, 0x1
	ands r0, r2
	lsls r0, 1
	adds r1, r0
	ldr r0, [r3, 0x8]
	lsls r1, 1
	adds r1, r0
	ldrh r1, [r1]
	movs r2, 0xC0
	lsls r2, 4
	adds r0, r2, 0
	orrs r0, r1
	ldr r1, _08056844
	cmp r0, r1
	beq _08056894
_08056824:
	ldr r1, _08056848
	ldr r0, [r1]
	subs r0, 0x8
	cmp r4, r0
	blt _08056850
	ldr r0, _0805684C
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08056894
	movs r0, 0x4
	b _080568A6
	.align 2, 0
_08056840: .4byte 0x0202e828
_08056844: .4byte 0x000003ff
_08056848: .4byte 0x03004870
_0805684C: .4byte 0x0202e850
_08056850:
	cmp r4, 0x6
	bgt _08056868
	ldr r0, _08056864
	ldrb r1, [r0]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08056894
	movs r0, 0x3
	b _080568A6
	.align 2, 0
_08056864: .4byte 0x0202e850
_08056868:
	ldr r0, [r1, 0x4]
	subs r0, 0x7
	cmp r5, r0
	blt _08056884
	ldr r0, _08056880
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08056894
	movs r0, 0x1
	b _080568A6
	.align 2, 0
_08056880: .4byte 0x0202e850
_08056884:
	cmp r5, 0x6
	bgt _080568A4
	ldr r0, _0805689C
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080568A0
_08056894:
	movs r0, 0x1
	negs r0, r0
	b _080568A6
	.align 2, 0
_0805689C: .4byte 0x0202e850
_080568A0:
	movs r0, 0x2
	b _080568A6
_080568A4:
	movs r0, 0
_080568A6:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetMapBorderIdAt

	thumb_func_start GetPostCameraMoveMapBorderId
GetPostCameraMoveMapBorderId: @ 80568AC
	push {r4,lr}
	adds r3, r1, 0
	ldr r1, _080568D0
	movs r4, 0
	ldrsh r2, [r1, r4]
	adds r0, 0x7
	adds r2, r0
	movs r0, 0x2
	ldrsh r1, [r1, r0]
	adds r3, 0x7
	adds r1, r3
	adds r0, r2, 0
	bl GetMapBorderIdAt
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080568D0: .4byte 0x02025734
	thumb_func_end GetPostCameraMoveMapBorderId

	thumb_func_start CanCameraMoveInDirection
CanCameraMoveInDirection: @ 80568D4
	push {r4,r5,lr}
	ldr r4, _08056908
	movs r1, 0
	ldrsh r3, [r4, r1]
	ldr r2, _0805690C
	lsls r0, 3
	adds r1, r0, r2
	ldr r1, [r1]
	adds r1, 0x7
	adds r3, r1
	movs r5, 0x2
	ldrsh r1, [r4, r5]
	adds r2, 0x4
	adds r0, r2
	ldr r0, [r0]
	adds r0, 0x7
	adds r1, r0
	adds r0, r3, 0
	bl GetMapBorderIdAt
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _08056910
	movs r0, 0x1
	b _08056912
	.align 2, 0
_08056908: .4byte 0x02025734
_0805690C: .4byte gUnknown_0821664C
_08056910:
	movs r0, 0
_08056912:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end CanCameraMoveInDirection

	thumb_func_start sub_8056918
sub_8056918: @ 8056918
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	adds r7, r3, 0
	bl mapconnection_get_mapheader
	adds r3, r0, 0
	cmp r4, 0x2
	beq _08056978
	cmp r4, 0x2
	bgt _08056936
	cmp r4, 0x1
	beq _08056964
	b _08056988
_08056936:
	cmp r4, 0x3
	beq _08056950
	cmp r4, 0x4
	bne _08056988
	ldr r1, _0805694C
	negs r0, r6
	strh r0, [r1]
	ldr r2, [r5, 0x4]
	ldrh r0, [r1, 0x2]
	subs r0, r2
	b _08056986
	.align 2, 0
_0805694C: .4byte 0x02025734
_08056950:
	ldr r1, _08056960
	ldr r0, [r3]
	ldr r0, [r0]
	strh r0, [r1]
	ldr r2, [r5, 0x4]
	ldrh r0, [r1, 0x2]
	subs r0, r2
	b _08056986
	.align 2, 0
_08056960: .4byte 0x02025734
_08056964:
	ldr r1, _08056974
	ldr r2, [r5, 0x4]
	ldrh r0, [r1]
	subs r0, r2
	strh r0, [r1]
	negs r0, r7
	b _08056986
	.align 2, 0
_08056974: .4byte 0x02025734
_08056978:
	ldr r1, _08056990
	ldr r2, [r5, 0x4]
	ldrh r0, [r1]
	subs r0, r2
	strh r0, [r1]
	ldr r0, [r3]
	ldr r0, [r0, 0x4]
_08056986:
	strh r0, [r1, 0x2]
_08056988:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056990: .4byte 0x02025734
	thumb_func_end sub_8056918

	thumb_func_start CameraMove
CameraMove: @ 8056994
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	str r1, [sp]
	ldr r1, _080569D4
	ldrb r0, [r1]
	movs r1, 0x2
	negs r1, r1
	ands r1, r0
	ldr r2, _080569D4
	strb r1, [r2]
	mov r0, r10
	ldr r1, [sp]
	bl GetPostCameraMoveMapBorderId
	adds r7, r0, 0
	adds r0, r7, 0x1
	cmp r0, 0x1
	bhi _080569DC
	ldr r0, _080569D8
	ldrh r1, [r0]
	add r1, r10
	strh r1, [r0]
	ldrh r1, [r0, 0x2]
	ldr r2, [sp]
	adds r1, r2
	strh r1, [r0, 0x2]
	b _08056A42
	.align 2, 0
_080569D4: .4byte 0x0202e844
_080569D8: .4byte 0x02025734
_080569DC:
	bl save_serialize_map
	ldr r5, _08056A5C
	movs r0, 0
	ldrsh r6, [r5, r0]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	mov r8, r1
	lsls r0, r7, 24
	lsrs r0, 24
	mov r9, r0
	adds r1, r6, 0
	mov r2, r8
	bl sub_8056A64
	adds r4, r0, 0
	adds r1, r7, 0
	mov r2, r10
	ldr r3, [sp]
	bl sub_8056918
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	bl sub_80538F0
	ldr r1, _08056A60
	ldrb r0, [r1]
	movs r1, 0x1
	orrs r0, r1
	ldr r2, _08056A60
	strb r0, [r2]
	movs r1, 0
	ldrsh r0, [r5, r1]
	subs r6, r0
	str r6, [r2, 0x4]
	movs r2, 0x2
	ldrsh r0, [r5, r2]
	mov r1, r8
	subs r1, r0
	ldr r2, _08056A60
	str r1, [r2, 0x8]
	ldrh r0, [r5]
	add r0, r10
	strh r0, [r5]
	ldrh r0, [r5, 0x2]
	ldr r1, [sp]
	adds r0, r1
	strh r0, [r5, 0x2]
	mov r0, r9
	bl sub_80566F0
_08056A42:
	ldr r0, _08056A60
	ldrb r0, [r0]
	lsls r0, 31
	lsrs r0, 31
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08056A5C: .4byte 0x02025734
_08056A60: .4byte 0x0202e844
	thumb_func_end CameraMove

	thumb_func_start sub_8056A64
sub_8056A64: @ 8056A64
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r1
	mov r8, r2
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _08056AA0
	ldr r0, [r0, 0xC]
	ldr r7, [r0]
	ldr r4, [r0, 0x4]
	movs r5, 0
	cmp r5, r7
	bge _08056AAC
_08056A82:
	ldrb r0, [r4]
	cmp r0, r6
	bne _08056AA4
	adds r0, r6, 0
	mov r1, r9
	mov r2, r8
	adds r3, r4, 0
	bl sub_8056ABC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08056AA4
	adds r0, r4, 0
	b _08056AAE
	.align 2, 0
_08056AA0: .4byte 0x0202e828
_08056AA4:
	adds r5, 0x1
	adds r4, 0xC
	cmp r5, r7
	blt _08056A82
_08056AAC:
	movs r0, 0
_08056AAE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8056A64

	thumb_func_start sub_8056ABC
sub_8056ABC: @ 8056ABC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r1, 0
	mov r8, r2
	adds r5, r3, 0
	lsls r0, 24
	lsrs r4, r0, 24
	adds r6, r4, 0
	adds r0, r5, 0
	bl mapconnection_get_mapheader
	adds r2, r0, 0
	cmp r4, 0x1
	blt _08056B14
	cmp r4, 0x2
	bgt _08056AF4
	ldr r0, _08056AF0
	ldr r0, [r0]
	ldr r1, [r0]
	ldr r0, [r2]
	ldr r2, [r0]
	ldr r3, [r5, 0x4]
	adds r0, r7, 0
	b _08056B06
	.align 2, 0
_08056AF0: .4byte 0x0202e828
_08056AF4:
	cmp r6, 0x4
	bgt _08056B14
	ldr r0, _08056B10
	ldr r0, [r0]
	ldr r1, [r0, 0x4]
	ldr r0, [r2]
	ldr r2, [r0, 0x4]
	ldr r3, [r5, 0x4]
	mov r0, r8
_08056B06:
	bl sub_8056B20
	lsls r0, 24
	lsrs r0, 24
	b _08056B16
	.align 2, 0
_08056B10: .4byte 0x0202e828
_08056B14:
	movs r0, 0
_08056B16:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8056ABC

	thumb_func_start sub_8056B20
sub_8056B20: @ 8056B20
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r2, 0
	adds r2, r3, 0
	cmp r3, 0
	bge _08056B2E
	movs r3, 0
_08056B2E:
	adds r2, r0, r2
	cmp r2, r1
	bge _08056B36
	adds r1, r2, 0
_08056B36:
	cmp r3, r4
	bgt _08056B42
	cmp r4, r1
	bgt _08056B42
	movs r0, 0x1
	b _08056B44
_08056B42:
	movs r0, 0
_08056B44:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8056B20

	thumb_func_start sub_8056B4C
sub_8056B4C: @ 8056B4C
	push {lr}
	cmp r0, 0
	blt _08056B5A
	cmp r0, r1
	bge _08056B5A
	movs r0, 0x1
	b _08056B5C
_08056B5A:
	movs r0, 0
_08056B5C:
	pop {r1}
	bx r1
	thumb_func_end sub_8056B4C

	thumb_func_start sub_8056B60
sub_8056B60: @ 8056B60
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl mapconnection_get_mapheader
	adds r1, r0, 0
	ldrb r0, [r4]
	cmp r0, 0x1
	blt _08056B98
	cmp r0, 0x2
	bgt _08056B86
	ldr r0, [r4, 0x4]
	subs r0, r5, r0
	ldr r1, [r1]
	ldr r1, [r1]
	bl sub_8056B4C
	b _08056B9A
_08056B86:
	cmp r0, 0x4
	bgt _08056B98
	ldr r0, [r4, 0x4]
	subs r0, r6, r0
	ldr r1, [r1]
	ldr r1, [r1, 0x4]
	bl sub_8056B4C
	b _08056B9A
_08056B98:
	movs r0, 0
_08056B9A:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8056B60

	thumb_func_start sub_8056BA0
sub_8056BA0: @ 8056BA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _08056BC0
	ldr r0, [r2, 0xC]
	cmp r0, 0
	bne _08056BC8
	b _08056C3E
	.align 2, 0
_08056BC0: .4byte 0x0202e828
_08056BC4:
	adds r0, r4, 0
	b _08056C40
_08056BC8:
	ldr r7, [r0]
	ldr r4, [r0, 0x4]
	movs r6, 0
	cmp r6, r7
	bge _08056C3E
	lsls r0, r1, 16
	asrs r5, r0, 16
	mov r9, r2
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	mov r10, r0
_08056BE0:
	ldrb r1, [r4]
	adds r3, r1, 0
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bls _08056C36
	cmp r1, 0x2
	bne _08056BF6
	cmp r5, 0x6
	bgt _08056C36
_08056BF6:
	cmp r1, 0x1
	bne _08056C06
	mov r2, r9
	ldr r0, [r2]
	ldr r0, [r0, 0x4]
	adds r0, 0x7
	cmp r5, r0
	blt _08056C36
_08056C06:
	mov r0, r8
	lsls r2, r0, 16
	cmp r1, 0x3
	bne _08056C14
	mov r1, r10
	cmp r1, 0x6
	bgt _08056C36
_08056C14:
	cmp r3, 0x4
	bne _08056C26
	asrs r1, r2, 16
	mov r3, r9
	ldr r0, [r3]
	ldr r0, [r0]
	adds r0, 0x7
	cmp r1, r0
	blt _08056C36
_08056C26:
	asrs r1, r2, 16
	subs r1, 0x7
	adds r0, r4, 0
	subs r2, r5, 0x7
	bl sub_8056B60
	cmp r0, 0x1
	beq _08056BC4
_08056C36:
	adds r6, 0x1
	adds r4, 0xC
	cmp r6, r7
	blt _08056BE0
_08056C3E:
	movs r0, 0
_08056C40:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8056BA0

	thumb_func_start sub_8056C50
sub_8056C50: @ 8056C50
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	ldr r2, _08056C64
	subs r0, 0x7
	strh r0, [r2]
	subs r1, 0x7
	strh r1, [r2, 0x2]
	bx lr
	.align 2, 0
_08056C64: .4byte 0x02025734
	thumb_func_end sub_8056C50

	thumb_func_start sav1_camera_get_focus_coords
sav1_camera_get_focus_coords: @ 8056C68
	ldr r3, _08056C78
	ldrh r2, [r3]
	adds r2, 0x7
	strh r2, [r0]
	ldrh r0, [r3, 0x2]
	adds r0, 0x7
	strh r0, [r1]
	bx lr
	.align 2, 0
_08056C78: .4byte 0x02025734
	thumb_func_end sav1_camera_get_focus_coords

	thumb_func_start unref_sub_8056C7C
unref_sub_8056C7C: @ 8056C7C
	ldr r2, _08056C84
	strh r0, [r2]
	strh r1, [r2, 0x2]
	bx lr
	.align 2, 0
_08056C84: .4byte 0x02025734
	thumb_func_end unref_sub_8056C7C

	thumb_func_start GetCameraCoords
GetCameraCoords: @ 8056C88
	ldr r3, _08056C94
	ldrh r2, [r3]
	strh r2, [r0]
	ldrh r0, [r3, 0x2]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08056C94: .4byte 0x02025734
	thumb_func_end GetCameraCoords

	thumb_func_start sub_8056C98
sub_8056C98: @ 8056C98
	push {lr}
	adds r2, r0, 0
	cmp r2, 0
	beq _08056CB8
	ldrb r0, [r2]
	cmp r0, 0
	bne _08056CB2
	ldr r0, [r2, 0x4]
	movs r2, 0x80
	lsls r2, 5
	bl CpuFastSet
	b _08056CB8
_08056CB2:
	ldr r0, [r2, 0x4]
	bl LZ77UnCompVram
_08056CB8:
	pop {r0}
	bx r0
	thumb_func_end sub_8056C98

	thumb_func_start sub_8056CBC
sub_8056CBC: @ 8056CBC
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	cmp r4, 0
	beq _08056D1E
	ldrb r1, [r4, 0x1]
	cmp r1, 0
	bne _08056CEE
	mov r0, sp
	strh r1, [r0]
	lsls r1, r5, 16
	lsrs r1, 16
	movs r2, 0x2
	bl LoadPalette
	ldr r0, [r4, 0x8]
	adds r0, 0x2
	adds r1, r5, 0x1
	lsls r1, 16
	lsrs r1, 16
	subs r2, r6, 0x2
	lsls r2, 16
	b _08056CFC
_08056CEE:
	cmp r1, 0x1
	bne _08056D04
	ldr r0, [r4, 0x8]
	adds r0, 0xC0
	lsls r1, r5, 16
	lsrs r1, 16
	lsls r2, r6, 16
_08056CFC:
	lsrs r2, 16
	bl LoadPalette
	b _08056D1E
_08056D04:
	ldr r0, [r4, 0x8]
	movs r4, 0x80
	lsls r4, 18
	adds r1, r4, 0
	bl LZ77UnCompVram
	lsls r1, r5, 16
	lsrs r1, 16
	lsls r2, r6, 16
	lsrs r2, 16
	adds r0, r4, 0
	bl LoadPalette
_08056D1E:
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8056CBC

	thumb_func_start sub_8056D28
sub_8056D28: @ 8056D28
	push {lr}
	movs r1, 0xC0
	lsls r1, 19
	ldr r0, [r0, 0x10]
	bl sub_8056C98
	pop {r0}
	bx r0
	thumb_func_end sub_8056D28

	thumb_func_start sub_8056D38
sub_8056D38: @ 8056D38
	push {lr}
	ldr r1, _08056D48
	ldr r0, [r0, 0x14]
	bl sub_8056C98
	pop {r0}
	bx r0
	.align 2, 0
_08056D48: .4byte 0x06004000
	thumb_func_end sub_8056D38

	thumb_func_start apply_map_tileset1_palette
apply_map_tileset1_palette: @ 8056D4C
	push {lr}
	ldr r0, [r0, 0x10]
	movs r1, 0
	movs r2, 0xC0
	bl sub_8056CBC
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset1_palette

	thumb_func_start apply_map_tileset2_palette
apply_map_tileset2_palette: @ 8056D5C
	push {lr}
	ldr r0, [r0, 0x14]
	movs r1, 0x60
	movs r2, 0xC0
	bl sub_8056CBC
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset2_palette

	thumb_func_start copy_map_tileset1_tileset2_to_vram
copy_map_tileset1_tileset2_to_vram: @ 8056D6C
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _08056D7E
	bl sub_8056D28
	adds r0, r4, 0
	bl sub_8056D38
_08056D7E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end copy_map_tileset1_tileset2_to_vram

	thumb_func_start apply_map_tileset1_tileset2_palette
apply_map_tileset1_tileset2_palette: @ 8056D84
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _08056D96
	bl apply_map_tileset1_palette
	adds r0, r4, 0
	bl apply_map_tileset2_palette
_08056D96:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end apply_map_tileset1_tileset2_palette

	thumb_func_start sub_8056D9C
sub_8056D9C: @ 8056D9C
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8056D9C

	thumb_func_start sub_8056DA0
sub_8056DA0: @ 8056DA0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08056DB8
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08056DBC
	movs r0, 0
	b _08056DBE
	.align 2, 0
_08056DB8: .4byte gUnknown_08308E2C
_08056DBC:
	movs r0, 0x1
_08056DBE:
	pop {r1}
	bx r1
	thumb_func_end sub_8056DA0

	thumb_func_start MetatileBehavior_IsJumpEast
MetatileBehavior_IsJumpEast: @ 8056DC4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x38
	beq _08056DD2
	movs r0, 0
	b _08056DD4
_08056DD2:
	movs r0, 0x1
_08056DD4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpEast

	thumb_func_start MetatileBehavior_IsJumpWest
MetatileBehavior_IsJumpWest: @ 8056DD8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x39
	beq _08056DE6
	movs r0, 0
	b _08056DE8
_08056DE6:
	movs r0, 0x1
_08056DE8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpWest

	thumb_func_start MetatileBehavior_IsJumpNorth
MetatileBehavior_IsJumpNorth: @ 8056DEC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3A
	beq _08056DFA
	movs r0, 0
	b _08056DFC
_08056DFA:
	movs r0, 0x1
_08056DFC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpNorth

	thumb_func_start MetatileBehavior_IsJumpSouth
MetatileBehavior_IsJumpSouth: @ 8056E00
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3B
	beq _08056E0E
	movs r0, 0
	b _08056E10
_08056E0E:
	movs r0, 0x1
_08056E10:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsJumpSouth

	thumb_func_start sub_8056E14
sub_8056E14: @ 8056E14
	push {lr}
	lsls r0, 24
	movs r1, 0xFE
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08056E28
	movs r0, 0
	b _08056E2A
_08056E28:
	movs r0, 0x1
_08056E2A:
	pop {r1}
	bx r1
	thumb_func_end sub_8056E14

	thumb_func_start MetatileBehavior_IsSandOrDeepSand
MetatileBehavior_IsSandOrDeepSand: @ 8056E30
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x21
	beq _08056E3E
	cmp r0, 0x6
	bne _08056E42
_08056E3E:
	movs r0, 0x1
	b _08056E44
_08056E42:
	movs r0, 0
_08056E44:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSandOrDeepSand

	thumb_func_start MetatileBehavior_IsDeepSand
MetatileBehavior_IsDeepSand: @ 8056E48
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6
	beq _08056E56
	movs r0, 0
	b _08056E58
_08056E56:
	movs r0, 0x1
_08056E58:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsDeepSand

	thumb_func_start MetatileBehavior_IsReflective
MetatileBehavior_IsReflective: @ 8056E5C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _08056E7A
	cmp r0, 0x16
	beq _08056E7A
	cmp r0, 0x1A
	beq _08056E7A
	cmp r0, 0x20
	beq _08056E7A
	cmp r0, 0x14
	beq _08056E7A
	cmp r0, 0x2B
	bne _08056E7E
_08056E7A:
	movs r0, 0x1
	b _08056E80
_08056E7E:
	movs r0, 0
_08056E80:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsReflective

	thumb_func_start MetatileBehavior_IsIce
MetatileBehavior_IsIce: @ 8056E84
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	beq _08056E92
	movs r0, 0
	b _08056E94
_08056E92:
	movs r0, 0x1
_08056E94:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIce

	thumb_func_start is_tile_x69_2_warp_door
is_tile_x69_2_warp_door: @ 8056E98
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x69
	beq _08056EA6
	movs r0, 0
	b _08056EA8
_08056EA6:
	movs r0, 0x1
_08056EA8:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x69_2_warp_door

	thumb_func_start sub_8056EAC
sub_8056EAC: @ 8056EAC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8D
	beq _08056EBA
	cmp r0, 0x69
	bne _08056EBE
_08056EBA:
	movs r0, 0x1
	b _08056EC0
_08056EBE:
	movs r0, 0
_08056EC0:
	pop {r1}
	bx r1
	thumb_func_end sub_8056EAC

	thumb_func_start MetatileBehavior_IsEscalator
MetatileBehavior_IsEscalator: @ 8056EC4
	push {lr}
	lsls r0, 24
	movs r1, 0x96
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x1
	bls _08056ED8
	movs r0, 0
	b _08056EDA
_08056ED8:
	movs r0, 0x1
_08056EDA:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEscalator

	thumb_func_start unref_sub_8056EE0
unref_sub_8056EE0: @ 8056EE0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	beq _08056EEE
	movs r0, 0
	b _08056EF0
_08056EEE:
	movs r0, 0x1
_08056EF0:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8056EE0

	thumb_func_start MetatileBehavior_IsLadder
MetatileBehavior_IsLadder: @ 8056EF4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x61
	beq _08056F02
	movs r0, 0
	b _08056F04
_08056F02:
	movs r0, 0x1
_08056F04:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLadder

	thumb_func_start sub_8056F08
sub_8056F08: @ 8056F08
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x60
	beq _08056F1A
	cmp r0, 0x6C
	beq _08056F1A
	cmp r0, 0x6E
	bne _08056F1E
_08056F1A:
	movs r0, 0x1
	b _08056F20
_08056F1E:
	movs r0, 0
_08056F20:
	pop {r1}
	bx r1
	thumb_func_end sub_8056F08

	thumb_func_start sub_8056F24
sub_8056F24: @ 8056F24
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x6E
	beq _08056F32
	movs r0, 0
	b _08056F34
_08056F32:
	movs r0, 0x1
_08056F34:
	pop {r1}
	bx r1
	thumb_func_end sub_8056F24

	thumb_func_start MetatileBehavior_IsSurfableWaterOrUnderwater
MetatileBehavior_IsSurfableWaterOrUnderwater: @ 8056F38
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08056F50
	adds r0, r1
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _08056F54
	movs r0, 0
	b _08056F56
	.align 2, 0
_08056F50: .4byte gUnknown_08308E2C
_08056F54:
	movs r0, 0x1
_08056F56:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSurfableWaterOrUnderwater

	thumb_func_start MetatileBehavior_IsEastArrowWarp
MetatileBehavior_IsEastArrowWarp: @ 8056F5C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x62
	beq _08056F6A
	movs r0, 0
	b _08056F6C
_08056F6A:
	movs r0, 0x1
_08056F6C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastArrowWarp

	thumb_func_start MetatileBehavior_IsWestArrowWarp
MetatileBehavior_IsWestArrowWarp: @ 8056F70
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x63
	beq _08056F7E
	movs r0, 0
	b _08056F80
_08056F7E:
	movs r0, 0x1
_08056F80:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestArrowWarp

	thumb_func_start MetatileBehavior_IsNorthArrowWarp
MetatileBehavior_IsNorthArrowWarp: @ 8056F84
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x64
	beq _08056F92
	cmp r0, 0x1B
	bne _08056F96
_08056F92:
	movs r0, 0x1
	b _08056F98
_08056F96:
	movs r0, 0
_08056F98:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthArrowWarp

	thumb_func_start MetatileBehavior_IsSouthArrowWarp
MetatileBehavior_IsSouthArrowWarp: @ 8056F9C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x65
	beq _08056FAE
	cmp r0, 0x6D
	beq _08056FAE
	cmp r0, 0x1C
	bne _08056FB2
_08056FAE:
	movs r0, 0x1
	b _08056FB4
_08056FB2:
	movs r0, 0
_08056FB4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthArrowWarp

	thumb_func_start unref_sub_8056FB8
unref_sub_8056FB8: @ 8056FB8
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r5, 0
	adds r0, r4, 0
	bl MetatileBehavior_IsEastArrowWarp
	lsls r0, 24
	cmp r0, 0
	bne _08056FF0
	adds r0, r4, 0
	bl MetatileBehavior_IsWestArrowWarp
	lsls r0, 24
	cmp r0, 0
	bne _08056FF0
	adds r0, r4, 0
	bl MetatileBehavior_IsNorthArrowWarp
	lsls r0, 24
	cmp r0, 0
	bne _08056FF0
	adds r0, r4, 0
	bl MetatileBehavior_IsSouthArrowWarp
	lsls r0, 24
	cmp r0, 0
	beq _08056FF2
_08056FF0:
	movs r5, 0x1
_08056FF2:
	adds r0, r5, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8056FB8

	thumb_func_start sub_8056FFC
sub_8056FFC: @ 8056FFC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xC0
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x8
	bls _08057032
	adds r0, r1, 0
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08057032
	cmp r1, 0xD0
	beq _08057032
	cmp r1, 0xD2
	beq _08057032
	cmp r1, 0x13
	beq _08057032
	cmp r1, 0x20
	beq _08057032
	cmp r1, 0xBB
	beq _08057032
	cmp r1, 0xBC
	bne _08057036
_08057032:
	movs r0, 0x1
	b _08057038
_08057036:
	movs r0, 0
_08057038:
	pop {r1}
	bx r1
	thumb_func_end sub_8056FFC

	thumb_func_start MetatileBehavior_IsIce_2
MetatileBehavior_IsIce_2: @ 805703C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x20
	beq _0805704A
	movs r0, 0
	b _0805704C
_0805704A:
	movs r0, 0x1
_0805704C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIce_2

	thumb_func_start MetatileBehavior_IsTrickHouseSlipperyFloor
MetatileBehavior_IsTrickHouseSlipperyFloor: @ 8057050
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x48
	beq _0805705E
	movs r0, 0
	b _08057060
_0805705E:
	movs r0, 0x1
_08057060:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsTrickHouseSlipperyFloor

	thumb_func_start MetatileBehavior_0x05
MetatileBehavior_0x05: @ 8057064
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x5
	beq _08057072
	movs r0, 0
	b _08057074
_08057072:
	movs r0, 0x1
_08057074:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_0x05

	thumb_func_start MetatileBehavior_IsWalkNorth
MetatileBehavior_IsWalkNorth: @ 8057078
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x42
	beq _08057086
	movs r0, 0
	b _08057088
_08057086:
	movs r0, 0x1
_08057088:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkNorth

	thumb_func_start MetatileBehavior_IsWalkSouth
MetatileBehavior_IsWalkSouth: @ 805708C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x43
	beq _0805709A
	movs r0, 0
	b _0805709C
_0805709A:
	movs r0, 0x1
_0805709C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkSouth

	thumb_func_start MetatileBehavior_IsWalkWest
MetatileBehavior_IsWalkWest: @ 80570A0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x41
	beq _080570AE
	movs r0, 0
	b _080570B0
_080570AE:
	movs r0, 0x1
_080570B0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkWest

	thumb_func_start MetatileBehavior_IsWalkEast
MetatileBehavior_IsWalkEast: @ 80570B4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	beq _080570C2
	movs r0, 0
	b _080570C4
_080570C2:
	movs r0, 0x1
_080570C4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWalkEast

	thumb_func_start MetatileBehavior_IsNorthwardCurrent
MetatileBehavior_IsNorthwardCurrent: @ 80570C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x52
	beq _080570D6
	movs r0, 0
	b _080570D8
_080570D6:
	movs r0, 0x1
_080570D8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthwardCurrent

	thumb_func_start MetatileBehavior_IsSouthwardCurrent
MetatileBehavior_IsSouthwardCurrent: @ 80570DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x53
	beq _080570EA
	movs r0, 0
	b _080570EC
_080570EA:
	movs r0, 0x1
_080570EC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthwardCurrent

	thumb_func_start MetatileBehavior_IsWestwardCurrent
MetatileBehavior_IsWestwardCurrent: @ 80570F0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x51
	beq _080570FE
	movs r0, 0
	b _08057100
_080570FE:
	movs r0, 0x1
_08057100:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestwardCurrent

	thumb_func_start MetatileBehavior_IsEastwardCurrent
MetatileBehavior_IsEastwardCurrent: @ 8057104
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x50
	beq _08057112
	movs r0, 0
	b _08057114
_08057112:
	movs r0, 0x1
_08057114:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastwardCurrent

	thumb_func_start MetatileBehavior_IsSlideNorth
MetatileBehavior_IsSlideNorth: @ 8057118
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x46
	beq _08057126
	movs r0, 0
	b _08057128
_08057126:
	movs r0, 0x1
_08057128:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideNorth

	thumb_func_start MetatileBehavior_IsSlideSouth
MetatileBehavior_IsSlideSouth: @ 805712C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x47
	beq _0805713A
	movs r0, 0
	b _0805713C
_0805713A:
	movs r0, 0x1
_0805713C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideSouth

	thumb_func_start MetatileBehavior_IsSlideWest
MetatileBehavior_IsSlideWest: @ 8057140
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x45
	beq _0805714E
	movs r0, 0
	b _08057150
_0805714E:
	movs r0, 0x1
_08057150:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideWest

	thumb_func_start MetatileBehavior_IsSlideEast
MetatileBehavior_IsSlideEast: @ 8057154
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x44
	beq _08057162
	movs r0, 0
	b _08057164
_08057162:
	movs r0, 0x1
_08057164:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSlideEast

	thumb_func_start MetatileBehavior_IsCounter
MetatileBehavior_IsCounter: @ 8057168
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x80
	beq _08057176
	movs r0, 0
	b _08057178
_08057176:
	movs r0, 0x1
_08057178:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsCounter

	thumb_func_start MetatileBehavior_IsPlayerFacingTVScreen
MetatileBehavior_IsPlayerFacingTVScreen: @ 805717C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r1, 0x2
	bne _0805718E
	cmp r0, 0x86
	beq _08057192
_0805718E:
	movs r0, 0
	b _08057194
_08057192:
	movs r0, 0x1
_08057194:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPlayerFacingTVScreen

	thumb_func_start MetatileBehavior_IsPC
MetatileBehavior_IsPC: @ 8057198
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x83
	beq _080571A6
	movs r0, 0
	b _080571A8
_080571A6:
	movs r0, 0x1
_080571A8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPC

	thumb_func_start is_tile_x84
is_tile_x84: @ 80571AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x84
	beq _080571BA
	movs r0, 0
	b _080571BC
_080571BA:
	movs r0, 0x1
_080571BC:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x84

	thumb_func_start sub_80571C0
sub_80571C0: @ 80571C0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x91
	beq _080571E2
	cmp r0, 0x93
	beq _080571E2
	cmp r0, 0x95
	beq _080571E2
	cmp r0, 0x97
	beq _080571E2
	cmp r0, 0x99
	beq _080571E2
	cmp r0, 0x9B
	beq _080571E2
	cmp r0, 0x9D
	bne _080571E6
_080571E2:
	movs r0, 0x1
	b _080571E8
_080571E6:
	movs r0, 0
_080571E8:
	pop {r1}
	bx r1
	thumb_func_end sub_80571C0

	thumb_func_start sub_80571EC
sub_80571EC: @ 80571EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x90
	beq _08057202
	cmp r0, 0x92
	beq _08057202
	cmp r0, 0x94
	beq _08057202
	cmp r0, 0x9A
	bne _08057206
_08057202:
	movs r0, 0x1
	b _08057208
_08057206:
	movs r0, 0
_08057208:
	pop {r1}
	bx r1
	thumb_func_end sub_80571EC

	thumb_func_start sub_805720C
sub_805720C: @ 805720C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x96
	beq _0805721A
	cmp r0, 0x9C
	bne _0805721E
_0805721A:
	movs r0, 0x1
	b _08057220
_0805721E:
	movs r0, 0
_08057220:
	pop {r1}
	bx r1
	thumb_func_end sub_805720C

	thumb_func_start is_tile_x98
is_tile_x98: @ 8057224
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x98
	beq _08057232
	movs r0, 0
	b _08057234
_08057232:
	movs r0, 0x1
_08057234:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x98

	thumb_func_start sub_8057238
sub_8057238: @ 8057238
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB0
	beq _08057246
	movs r0, 0
	b _08057248
_08057246:
	movs r0, 0x1
_08057248:
	pop {r1}
	bx r1
	thumb_func_end sub_8057238

	thumb_func_start sub_805724C
sub_805724C: @ 805724C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB1
	beq _0805725A
	movs r0, 0
	b _0805725C
_0805725A:
	movs r0, 0x1
_0805725C:
	pop {r1}
	bx r1
	thumb_func_end sub_805724C

	thumb_func_start unref_sub_8057260
unref_sub_8057260: @ 8057260
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB2
	beq _0805726E
	movs r0, 0
	b _08057270
_0805726E:
	movs r0, 0x1
_08057270:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8057260

	thumb_func_start sub_8057274
sub_8057274: @ 8057274
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB3
	beq _08057282
	movs r0, 0
	b _08057284
_08057282:
	movs r0, 0x1
_08057284:
	pop {r1}
	bx r1
	thumb_func_end sub_8057274

	thumb_func_start sub_8057288
sub_8057288: @ 8057288
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB9
	beq _08057296
	movs r0, 0
	b _08057298
_08057296:
	movs r0, 0x1
_08057298:
	pop {r1}
	bx r1
	thumb_func_end sub_8057288

	thumb_func_start sub_805729C
sub_805729C: @ 805729C
	push {lr}
	lsls r0, 24
	cmp r0, 0
	beq _080572A8
	movs r0, 0
	b _080572AA
_080572A8:
	movs r0, 0x1
_080572AA:
	pop {r1}
	bx r1
	thumb_func_end sub_805729C

	thumb_func_start sub_80572B0
sub_80572B0: @ 80572B0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB7
	beq _080572BE
	movs r0, 0
	b _080572C0
_080572BE:
	movs r0, 0x1
_080572C0:
	pop {r1}
	bx r1
	thumb_func_end sub_80572B0

	thumb_func_start unref_sub_80572C4
unref_sub_80572C4: @ 80572C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB2
	beq _080572D2
	movs r0, 0
	b _080572D4
_080572D2:
	movs r0, 0x1
_080572D4:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_80572C4

	thumb_func_start sub_80572D8
sub_80572D8: @ 80572D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB5
	beq _080572E6
	movs r0, 0
	b _080572E8
_080572E6:
	movs r0, 0x1
_080572E8:
	pop {r1}
	bx r1
	thumb_func_end sub_80572D8

	thumb_func_start sub_80572EC
sub_80572EC: @ 80572EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC3
	beq _080572FA
	movs r0, 0
	b _080572FC
_080572FA:
	movs r0, 0x1
_080572FC:
	pop {r1}
	bx r1
	thumb_func_end sub_80572EC

	thumb_func_start sub_8057300
sub_8057300: @ 8057300
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC2
	beq _0805730E
	movs r0, 0
	b _08057310
_0805730E:
	movs r0, 0x1
_08057310:
	pop {r1}
	bx r1
	thumb_func_end sub_8057300

	thumb_func_start sub_8057314
sub_8057314: @ 8057314
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB8
	beq _08057322
	movs r0, 0
	b _08057324
_08057322:
	movs r0, 0x1
_08057324:
	pop {r1}
	bx r1
	thumb_func_end sub_8057314

	thumb_func_start sub_8057328
sub_8057328: @ 8057328
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBE
	beq _08057336
	movs r0, 0
	b _08057338
_08057336:
	movs r0, 0x1
_08057338:
	pop {r1}
	bx r1
	thumb_func_end sub_8057328

	thumb_func_start sub_805733C
sub_805733C: @ 805733C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBD
	beq _0805734A
	movs r0, 0
	b _0805734C
_0805734A:
	movs r0, 0x1
_0805734C:
	pop {r1}
	bx r1
	thumb_func_end sub_805733C

	thumb_func_start sub_8057350
sub_8057350: @ 8057350
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBA
	beq _0805735E
	movs r0, 0
	b _08057360
_0805735E:
	movs r0, 0x1
_08057360:
	pop {r1}
	bx r1
	thumb_func_end sub_8057350

	thumb_func_start sub_8057364
sub_8057364: @ 8057364
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBF
	beq _08057372
	movs r0, 0
	b _08057374
_08057372:
	movs r0, 0x1
_08057374:
	pop {r1}
	bx r1
	thumb_func_end sub_8057364

	thumb_func_start sub_8057378
sub_8057378: @ 8057378
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC4
	beq _08057386
	movs r0, 0
	b _08057388
_08057386:
	movs r0, 0x1
_08057388:
	pop {r1}
	bx r1
	thumb_func_end sub_8057378

	thumb_func_start sub_805738C
sub_805738C: @ 805738C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC5
	beq _0805739A
	movs r0, 0
	b _0805739C
_0805739A:
	movs r0, 0x1
_0805739C:
	pop {r1}
	bx r1
	thumb_func_end sub_805738C

	thumb_func_start MetatileBehavior_HasRipples
MetatileBehavior_HasRipples: @ 80573A0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _080573B2
	cmp r0, 0x16
	beq _080573B2
	cmp r0, 0x14
	bne _080573B6
_080573B2:
	movs r0, 0x1
	b _080573B8
_080573B6:
	movs r0, 0
_080573B8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_HasRipples

	thumb_func_start MetatileBehavior_IsPuddle
MetatileBehavior_IsPuddle: @ 80573BC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x16
	beq _080573CA
	movs r0, 0
	b _080573CC
_080573CA:
	movs r0, 0x1
_080573CC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPuddle

	thumb_func_start MetatileBehavior_IsTallGrass
MetatileBehavior_IsTallGrass: @ 80573D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	beq _080573DE
	movs r0, 0
	b _080573E0
_080573DE:
	movs r0, 0x1
_080573E0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsTallGrass

	thumb_func_start MetatileBehavior_IsLongGrass
MetatileBehavior_IsLongGrass: @ 80573E4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	beq _080573F2
	movs r0, 0
	b _080573F4
_080573F2:
	movs r0, 0x1
_080573F4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsLongGrass

	thumb_func_start MetatileBehavior_IsBerryTreeSoil
MetatileBehavior_IsBerryTreeSoil: @ 80573F8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA0
	beq _08057406
	movs r0, 0
	b _08057408
_08057406:
	movs r0, 0x1
_08057408:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBerryTreeSoil

	thumb_func_start MetatileBehavior_IsAsh
MetatileBehavior_IsAsh: @ 805740C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x24
	beq _0805741A
	movs r0, 0
	b _0805741C
_0805741A:
	movs r0, 0x1
_0805741C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsAsh

	thumb_func_start MetatileBehavior_IsUnusedFootprintMetatile
MetatileBehavior_IsUnusedFootprintMetatile: @ 8057420
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x25
	beq _0805742E
	movs r0, 0
	b _08057430
_0805742E:
	movs r0, 0x1
_08057430:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsUnusedFootprintMetatile

	thumb_func_start sub_8057434
sub_8057434: @ 8057434
	push {lr}
	lsls r0, 24
	movs r1, 0x90
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x3
	bls _08057448
	movs r0, 0
	b _0805744A
_08057448:
	movs r0, 0x1
_0805744A:
	pop {r1}
	bx r1
	thumb_func_end sub_8057434

	thumb_func_start sub_8057450
sub_8057450: @ 8057450
	push {lr}
	lsls r0, 24
	movs r1, 0x90
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x3
	bls _08057462
	movs r0, 0
_08057462:
	pop {r1}
	bx r1
	thumb_func_end sub_8057450

	thumb_func_start sub_8057468
sub_8057468: @ 8057468
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	bne _0805748C
	adds r0, r4, 0
	bl sub_8056DA0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805748C
	movs r0, 0x1
	b _0805748E
_0805748C:
	movs r0, 0
_0805748E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8057468

	thumb_func_start sub_8057494
sub_8057494: @ 8057494
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080574BA
	adds r0, r4, 0
	bl sub_8056DA0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080574BA
	movs r0, 0x1
	b _080574BC
_080574BA:
	movs r0, 0
_080574BC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8057494

	thumb_func_start sub_80574C4
sub_80574C4: @ 80574C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	beq _080574D2
	movs r0, 0
	b _080574D4
_080574D2:
	movs r0, 0x1
_080574D4:
	pop {r1}
	bx r1
	thumb_func_end sub_80574C4

	thumb_func_start sub_80574D8
sub_80574D8: @ 80574D8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xC
	beq _080574E6
	movs r0, 0
	b _080574E8
_080574E6:
	movs r0, 0x1
_080574E8:
	pop {r1}
	bx r1
	thumb_func_end sub_80574D8

	thumb_func_start sub_80574EC
sub_80574EC: @ 80574EC
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xEF
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x1
	bls _08057502
	cmp r1, 0x14
	bne _08057506
_08057502:
	movs r0, 0x1
	b _08057508
_08057506:
	movs r0, 0
_08057508:
	pop {r1}
	bx r1
	thumb_func_end sub_80574EC

	thumb_func_start sub_805750C
sub_805750C: @ 805750C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x19
	beq _0805751A
	cmp r0, 0x2A
	bne _0805751E
_0805751A:
	movs r0, 0x1
	b _08057520
_0805751E:
	movs r0, 0
_08057520:
	pop {r1}
	bx r1
	thumb_func_end sub_805750C

	thumb_func_start MetatileBehavior_IsShallowFlowingWater
MetatileBehavior_IsShallowFlowingWater: @ 8057524
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x17
	beq _08057536
	cmp r0, 0x1B
	beq _08057536
	cmp r0, 0x1C
	bne _0805753A
_08057536:
	movs r0, 0x1
	b _0805753C
_0805753A:
	movs r0, 0
_0805753C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsShallowFlowingWater

	thumb_func_start sub_8057540
sub_8057540: @ 8057540
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x26
	beq _0805754E
	movs r0, 0
	b _08057550
_0805754E:
	movs r0, 0x1
_08057550:
	pop {r1}
	bx r1
	thumb_func_end sub_8057540

	thumb_func_start sub_8057554
sub_8057554: @ 8057554
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x27
	beq _08057562
	movs r0, 0
	b _08057564
_08057562:
	movs r0, 0x1
_08057564:
	pop {r1}
	bx r1
	thumb_func_end sub_8057554

	thumb_func_start sub_8057568
sub_8057568: @ 8057568
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x15
	beq _0805757A
	cmp r0, 0x11
	beq _0805757A
	cmp r0, 0x12
	bne _0805757E
_0805757A:
	movs r0, 0x1
	b _08057580
_0805757E:
	movs r0, 0
_08057580:
	pop {r1}
	bx r1
	thumb_func_end sub_8057568

	thumb_func_start unref_sub_8057584
unref_sub_8057584: @ 8057584
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x18
	beq _08057592
	cmp r0, 0x1A
	bne _08057596
_08057592:
	movs r0, 0x1
	b _08057598
_08057596:
	movs r0, 0
_08057598:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8057584

	thumb_func_start sub_805759C
sub_805759C: @ 805759C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsSurfableWaterOrUnderwater
	lsls r0, 24
	cmp r0, 0
	beq _080575BE
	adds r0, r4, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	cmp r0, 0
	bne _080575BE
	movs r0, 0x1
	b _080575C0
_080575BE:
	movs r0, 0
_080575C0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805759C

	thumb_func_start MetatileBehavior_IsEastBlocked
MetatileBehavior_IsEastBlocked: @ 80575C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x30
	beq _080575E2
	cmp r0, 0x34
	beq _080575E2
	cmp r0, 0x36
	beq _080575E2
	cmp r0, 0xC1
	beq _080575E2
	cmp r0, 0xBE
	bne _080575E6
_080575E2:
	movs r0, 0x1
	b _080575E8
_080575E6:
	movs r0, 0
_080575E8:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsEastBlocked

	thumb_func_start MetatileBehavior_IsWestBlocked
MetatileBehavior_IsWestBlocked: @ 80575EC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x31
	beq _08057606
	cmp r0, 0x35
	beq _08057606
	cmp r0, 0x37
	beq _08057606
	cmp r0, 0xC1
	beq _08057606
	cmp r0, 0xBE
	bne _0805760A
_08057606:
	movs r0, 0x1
	b _0805760C
_0805760A:
	movs r0, 0
_0805760C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWestBlocked

	thumb_func_start MetatileBehavior_IsNorthBlocked
MetatileBehavior_IsNorthBlocked: @ 8057610
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x32
	beq _08057626
	cmp r0, 0x34
	beq _08057626
	cmp r0, 0x35
	beq _08057626
	cmp r0, 0xC0
	bne _0805762A
_08057626:
	movs r0, 0x1
	b _0805762C
_0805762A:
	movs r0, 0
_0805762C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsNorthBlocked

	thumb_func_start MetatileBehavior_IsSouthBlocked
MetatileBehavior_IsSouthBlocked: @ 8057630
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x33
	beq _08057646
	cmp r0, 0x36
	beq _08057646
	cmp r0, 0x37
	beq _08057646
	cmp r0, 0xC0
	bne _0805764A
_08057646:
	movs r0, 0x1
	b _0805764C
_0805764A:
	movs r0, 0
_0805764C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSouthBlocked

	thumb_func_start MetatileBehavior_IsShortGrass
MetatileBehavior_IsShortGrass: @ 8057650
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x7
	beq _0805765E
	movs r0, 0
	b _08057660
_0805765E:
	movs r0, 0x1
_08057660:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsShortGrass

	thumb_func_start MetatileBehavior_IsHotSprings
MetatileBehavior_IsHotSprings: @ 8057664
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x28
	beq _08057672
	movs r0, 0
	b _08057674
_08057672:
	movs r0, 0x1
_08057674:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsHotSprings

	thumb_func_start MetatileBehavior_IsWaterfall
MetatileBehavior_IsWaterfall: @ 8057678
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	beq _08057686
	movs r0, 0
	b _08057688
_08057686:
	movs r0, 0x1
_08057688:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsWaterfall

	thumb_func_start MetatileBehavior_IsFortreeBridge
MetatileBehavior_IsFortreeBridge: @ 805768C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x78
	beq _0805769A
	movs r0, 0
	b _0805769C
_0805769A:
	movs r0, 0x1
_0805769C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsFortreeBridge

	thumb_func_start sub_80576A0
sub_80576A0: @ 80576A0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x74
	beq _080576AE
	movs r0, 0
	b _080576B0
_080576AE:
	movs r0, 0x1
_080576B0:
	pop {r1}
	bx r1
	thumb_func_end sub_80576A0

	thumb_func_start sub_80576B4
sub_80576B4: @ 80576B4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x75
	beq _080576C2
	movs r0, 0
	b _080576C4
_080576C2:
	movs r0, 0x1
_080576C4:
	pop {r1}
	bx r1
	thumb_func_end sub_80576B4

	thumb_func_start sub_80576C8
sub_80576C8: @ 80576C8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x76
	beq _080576D6
	movs r0, 0
	b _080576D8
_080576D6:
	movs r0, 0x1
_080576D8:
	pop {r1}
	bx r1
	thumb_func_end sub_80576C8

	thumb_func_start sub_80576DC
sub_80576DC: @ 80576DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x77
	beq _080576EA
	movs r0, 0
	b _080576EC
_080576EA:
	movs r0, 0x1
_080576EC:
	pop {r1}
	bx r1
	thumb_func_end sub_80576DC

	thumb_func_start MetatileBehavior_IsPacifidlogLog
MetatileBehavior_IsPacifidlogLog: @ 80576F0
	push {lr}
	lsls r0, 24
	movs r1, 0x8C
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x3
	bls _08057704
	movs r0, 0
	b _08057706
_08057704:
	movs r0, 0x1
_08057706:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsPacifidlogLog

	thumb_func_start is_tile_x8C
is_tile_x8C: @ 805770C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8C
	beq _0805771A
	movs r0, 0
	b _0805771C
_0805771A:
	movs r0, 0x1
_0805771C:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x8C

	thumb_func_start is_tile_x85
is_tile_x85: @ 8057720
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x85
	beq _0805772E
	movs r0, 0
	b _08057730
_0805772E:
	movs r0, 0x1
_08057730:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x85

	thumb_func_start is_tile_x8B
is_tile_x8B: @ 8057734
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8B
	beq _08057742
	movs r0, 0
	b _08057744
_08057742:
	movs r0, 0x1
_08057744:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x8B

	thumb_func_start is_tile_x8A
is_tile_x8A: @ 8057748
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8A
	beq _08057756
	movs r0, 0
	b _08057758
_08057756:
	movs r0, 0x1
_08057758:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x8A

	thumb_func_start is_tile_x87
is_tile_x87: @ 805775C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x87
	beq _0805776A
	movs r0, 0
	b _0805776C
_0805776A:
	movs r0, 0x1
_0805776C:
	pop {r1}
	bx r1
	thumb_func_end is_tile_x87

	thumb_func_start MetatileBehavior_0xBB
MetatileBehavior_0xBB: @ 8057770
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBB
	beq _0805777E
	movs r0, 0
	b _08057780
_0805777E:
	movs r0, 0x1
_08057780:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_0xBB

	thumb_func_start MetatileBehavior_0xBC
MetatileBehavior_0xBC: @ 8057784
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xBC
	beq _08057792
	movs r0, 0
	b _08057794
_08057792:
	movs r0, 0x1
_08057794:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_0xBC

	thumb_func_start sub_8057798
sub_8057798: @ 8057798
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x29
	beq _080577A6
	movs r0, 0
	b _080577A8
_080577A6:
	movs r0, 0x1
_080577A8:
	pop {r1}
	bx r1
	thumb_func_end sub_8057798

	thumb_func_start is_role_x68
is_role_x68: @ 80577AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x68
	beq _080577BA
	movs r0, 0
	b _080577BC
_080577BA:
	movs r0, 0x1
_080577BC:
	pop {r1}
	bx r1
	thumb_func_end is_role_x68

	thumb_func_start MetatileBehavior_IsAquaHideoutWarp
MetatileBehavior_IsAquaHideoutWarp: @ 80577C0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x67
	beq _080577CE
	movs r0, 0
	b _080577D0
_080577CE:
	movs r0, 0x1
_080577D0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsAquaHideoutWarp

	thumb_func_start MetatileBehavior_IsSurfableFishableWater
MetatileBehavior_IsSurfableFishableWater: @ 80577D4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _080577F8
	cmp r0, 0x15
	beq _080577F8
	cmp r0, 0x11
	beq _080577F8
	cmp r0, 0x12
	beq _080577F8
	cmp r0, 0x14
	beq _080577F8
	subs r0, 0x50
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _080577FC
_080577F8:
	movs r0, 0x1
	b _080577FE
_080577FC:
	movs r0, 0
_080577FE:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSurfableFishableWater

	thumb_func_start sub_8057804
sub_8057804: @ 8057804
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	beq _08057812
	movs r0, 0
	b _08057814
_08057812:
	movs r0, 0x1
_08057814:
	pop {r1}
	bx r1
	thumb_func_end sub_8057804

	thumb_func_start sub_8057818
sub_8057818: @ 8057818
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x66
	beq _08057826
	movs r0, 0
	b _08057828
_08057826:
	movs r0, 0x1
_08057828:
	pop {r1}
	bx r1
	thumb_func_end sub_8057818

	thumb_func_start sub_805782C
sub_805782C: @ 805782C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD2
	beq _0805783A
	movs r0, 0
	b _0805783C
_0805783A:
	movs r0, 0x1
_0805783C:
	pop {r1}
	bx r1
	thumb_func_end sub_805782C

	thumb_func_start MetatileBehavior_IsMuddySlope
MetatileBehavior_IsMuddySlope: @ 8057840
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD0
	beq _0805784E
	movs r0, 0
	b _08057850
_0805784E:
	movs r0, 0x1
_08057850:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsMuddySlope

	thumb_func_start MetatileBehavior_IsBumpySlope
MetatileBehavior_IsBumpySlope: @ 8057854
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD1
	beq _08057862
	movs r0, 0
	b _08057864
_08057862:
	movs r0, 0x1
_08057864:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsBumpySlope

	thumb_func_start MetatileBehavior_IsIsolatedVerticalRail
MetatileBehavior_IsIsolatedVerticalRail: @ 8057868
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD3
	beq _08057876
	movs r0, 0
	b _08057878
_08057876:
	movs r0, 0x1
_08057878:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIsolatedVerticalRail

	thumb_func_start MetatileBehavior_IsIsolatedHorizontalRail
MetatileBehavior_IsIsolatedHorizontalRail: @ 805787C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD4
	beq _0805788A
	movs r0, 0
	b _0805788C
_0805788A:
	movs r0, 0x1
_0805788C:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsIsolatedHorizontalRail

	thumb_func_start MetatileBehavior_IsVerticalRail
MetatileBehavior_IsVerticalRail: @ 8057890
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD5
	beq _0805789E
	movs r0, 0
	b _080578A0
_0805789E:
	movs r0, 0x1
_080578A0:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsVerticalRail

	thumb_func_start MetatileBehavior_IsHorizontalRail
MetatileBehavior_IsHorizontalRail: @ 80578A4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xD6
	beq _080578B2
	movs r0, 0
	b _080578B4
_080578B2:
	movs r0, 0x1
_080578B4:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsHorizontalRail

	thumb_func_start MetatileBehavior_IsSeaweed
MetatileBehavior_IsSeaweed: @ 80578B8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x22
	beq _080578C6
	cmp r0, 0x2A
	bne _080578CA
_080578C6:
	movs r0, 0x1
	b _080578CC
_080578CA:
	movs r0, 0
_080578CC:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsSeaweed

	thumb_func_start MetatileBehavior_IsRunningDisallowed
MetatileBehavior_IsRunningDisallowed: @ 80578D0
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xA
	beq _080578EC
	cmp r0, 0x3
	beq _080578EC
	cmp r0, 0x28
	beq _080578EC
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, 24
	cmp r0, 0
	beq _080578F0
_080578EC:
	movs r0, 0x1
	b _080578F2
_080578F0:
	movs r0, 0
_080578F2:
	pop {r1}
	bx r1
	thumb_func_end MetatileBehavior_IsRunningDisallowed

	thumb_func_start sub_80578F8
sub_80578F8: @ 80578F8
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	movs r2, 0xFE
	lsls r2, 24
	adds r0, r2
	lsrs r0, 24
	cmp r0, 0x1
	bls _08057912
	cmp r1, 0x24
	beq _08057912
	cmp r1, 0x9
	bne _08057916
_08057912:
	movs r0, 0x1
	b _08057918
_08057916:
	movs r0, 0
_08057918:
	pop {r1}
	bx r1
	thumb_func_end sub_80578F8

	thumb_func_start sub_805791C
sub_805791C: @ 805791C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x8E
	beq _0805792A
	movs r0, 0
	b _0805792C
_0805792A:
	movs r0, 0x1
_0805792C:
	pop {r1}
	bx r1
	thumb_func_end sub_805791C

	thumb_func_start sub_8057930
sub_8057930: @ 8057930
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE0
	beq _0805793E
	movs r0, 0
	b _08057940
_0805793E:
	movs r0, 0x1
_08057940:
	pop {r1}
	bx r1
	thumb_func_end sub_8057930

	thumb_func_start sub_8057944
sub_8057944: @ 8057944
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE1
	beq _08057952
	movs r0, 0
	b _08057954
_08057952:
	movs r0, 0x1
_08057954:
	pop {r1}
	bx r1
	thumb_func_end sub_8057944

	thumb_func_start sub_8057958
sub_8057958: @ 8057958
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE2
	beq _08057966
	movs r0, 0
	b _08057968
_08057966:
	movs r0, 0x1
_08057968:
	pop {r1}
	bx r1
	thumb_func_end sub_8057958

	thumb_func_start sub_805796C
sub_805796C: @ 805796C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE3
	beq _0805797A
	movs r0, 0
	b _0805797C
_0805797A:
	movs r0, 0x1
_0805797C:
	pop {r1}
	bx r1
	thumb_func_end sub_805796C

	thumb_func_start sub_8057980
sub_8057980: @ 8057980
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE4
	beq _0805798E
	movs r0, 0
	b _08057990
_0805798E:
	movs r0, 0x1
_08057990:
	pop {r1}
	bx r1
	thumb_func_end sub_8057980

	thumb_func_start sub_8057994
sub_8057994: @ 8057994
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE5
	beq _080579A2
	movs r0, 0
	b _080579A4
_080579A2:
	movs r0, 0x1
_080579A4:
	pop {r1}
	bx r1
	thumb_func_end sub_8057994

	thumb_func_start sub_80579A8
sub_80579A8: @ 80579A8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xE6
	beq _080579B6
	movs r0, 0
	b _080579B8
_080579B6:
	movs r0, 0x1
_080579B8:
	pop {r1}
	bx r1
	thumb_func_end sub_80579A8

	thumb_func_start move_tilemap_camera_to_upper_left_corner_
move_tilemap_camera_to_upper_left_corner_: @ 80579BC
	movs r1, 0
	strb r1, [r0, 0x2]
	strb r1, [r0, 0x3]
	strb r1, [r0]
	strb r1, [r0, 0x1]
	movs r1, 0x1
	strb r1, [r0, 0x4]
	bx lr
	thumb_func_end move_tilemap_camera_to_upper_left_corner_

	thumb_func_start tilemap_move_something
tilemap_move_something: @ 80579CC
	ldrb r3, [r0, 0x2]
	adds r3, r1
	strb r3, [r0, 0x2]
	ldrb r1, [r0, 0x2]
	movs r3, 0x1F
	ands r1, r3
	strb r1, [r0, 0x2]
	ldrb r1, [r0, 0x3]
	adds r1, r2
	strb r1, [r0, 0x3]
	ldrb r1, [r0, 0x3]
	ands r1, r3
	strb r1, [r0, 0x3]
	bx lr
	thumb_func_end tilemap_move_something

	thumb_func_start coords8_add
coords8_add: @ 80579E8
	ldrb r3, [r0]
	adds r3, r1
	strb r3, [r0]
	ldrb r1, [r0, 0x1]
	adds r1, r2
	strb r1, [r0, 0x1]
	bx lr
	thumb_func_end coords8_add

	thumb_func_start move_tilemap_camera_to_upper_left_corner
move_tilemap_camera_to_upper_left_corner: @ 80579F8
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r0, _08057A44
	bl move_tilemap_camera_to_upper_left_corner_
	mov r0, sp
	movs r6, 0
	strh r6, [r0]
	ldr r4, _08057A48
	ldr r5, _08057A4C
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuSet
	mov r0, sp
	adds r0, 0x2
	strh r6, [r0]
	ldr r2, _08057A50
	adds r1, r4, r2
	adds r2, r5, 0
	bl CpuSet
	add r0, sp, 0x4
	ldr r2, _08057A54
	adds r1, r2, 0
	strh r1, [r0]
	movs r1, 0x80
	lsls r1, 4
	adds r4, r1
	adds r1, r4, 0
	adds r2, r5, 0
	bl CpuSet
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057A44: .4byte 0x03000590
_08057A48: .4byte 0x020221cc
_08057A4C: .4byte 0x01000400
_08057A50: .4byte 0xfffff800
_08057A54: .4byte 0x00003014
	thumb_func_end move_tilemap_camera_to_upper_left_corner

	thumb_func_start sub_8057A58
sub_8057A58: @ 8057A58
	push {r4-r7,lr}
	ldr r5, _08057AE8
	ldr r1, [r5, 0x4]
	ldr r6, _08057AEC
	ldr r4, _08057AF0
	ldrh r0, [r4]
	ldrb r2, [r6]
	adds r0, r2
	strh r0, [r1]
	ldr r3, _08057AF4
	ldr r1, [r3, 0x4]
	ldr r2, _08057AF8
	ldrh r0, [r2]
	ldrb r7, [r6, 0x1]
	adds r0, r7
	adds r0, 0x8
	strh r0, [r1]
	ldr r1, [r5, 0x8]
	ldrh r0, [r4]
	ldrb r7, [r6]
	adds r0, r7
	strh r0, [r1]
	ldr r1, [r3, 0x8]
	ldrh r0, [r2]
	ldrb r7, [r6, 0x1]
	adds r0, r7
	adds r0, 0x8
	strh r0, [r1]
	ldr r1, [r5, 0xC]
	ldrh r0, [r4]
	ldrb r4, [r6]
	adds r0, r4
	strh r0, [r1]
	ldr r1, [r3, 0xC]
	ldrh r0, [r2]
	ldrb r7, [r6, 0x1]
	adds r0, r7
	adds r0, 0x8
	strh r0, [r1]
	ldrb r0, [r6, 0x4]
	cmp r0, 0
	beq _08057AE0
	ldr r0, _08057AFC
	ldr r2, _08057B00
	str r2, [r0]
	ldr r1, _08057B04
	str r1, [r0, 0x4]
	ldr r3, _08057B08
	str r3, [r0, 0x8]
	ldr r1, [r0, 0x8]
	movs r4, 0x80
	lsls r4, 4
	adds r1, r2, r4
	str r1, [r0]
	ldr r1, _08057B0C
	str r1, [r0, 0x4]
	str r3, [r0, 0x8]
	ldr r1, [r0, 0x8]
	movs r7, 0x80
	lsls r7, 5
	adds r2, r7
	str r2, [r0]
	ldr r1, _08057B10
	str r1, [r0, 0x4]
	str r3, [r0, 0x8]
	ldr r0, [r0, 0x8]
	movs r0, 0
	strb r0, [r6, 0x4]
_08057AE0:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057AE8: .4byte gBGHOffsetRegs
_08057AEC: .4byte 0x03000590
_08057AF0: .4byte 0x03000598
_08057AF4: .4byte gBGVOffsetRegs
_08057AF8: .4byte 0x0300059a
_08057AFC: .4byte 0x040000d4
_08057B00: .4byte 0x020219cc
_08057B04: .4byte 0x0600e800
_08057B08: .4byte 0x80000400
_08057B0C: .4byte 0x0600e000
_08057B10: .4byte 0x0600f000
	thumb_func_end sub_8057A58

	thumb_func_start sub_8057B14
sub_8057B14: @ 8057B14
	push {r4,lr}
	ldr r3, _08057B34
	ldr r2, _08057B38
	ldrh r2, [r2]
	ldrb r4, [r3]
	adds r2, r4
	strh r2, [r0]
	ldr r0, _08057B3C
	ldrh r0, [r0]
	ldrb r3, [r3, 0x1]
	adds r0, r3
	adds r0, 0x8
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057B34: .4byte 0x03000590
_08057B38: .4byte 0x03000598
_08057B3C: .4byte 0x0300059a
	thumb_func_end sub_8057B14

	thumb_func_start DrawWholeMapView
DrawWholeMapView: @ 8057B40
	push {lr}
	ldr r1, _08057B60
	movs r2, 0
	ldrsh r0, [r1, r2]
	movs r2, 0x2
	ldrsh r1, [r1, r2]
	ldr r2, _08057B64
	ldr r2, [r2]
	bl DrawWholeMapViewInternal
	ldr r1, _08057B68
	movs r0, 0x1
	strb r0, [r1, 0x4]
	pop {r0}
	bx r0
	.align 2, 0
_08057B60: .4byte 0x02025734
_08057B64: .4byte 0x0202e828
_08057B68: .4byte 0x03000590
	thumb_func_end DrawWholeMapView

	thumb_func_start DrawWholeMapViewInternal
DrawWholeMapViewInternal: @ 8057B6C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	mov r9, r1
	mov r8, r2
	movs r1, 0
_08057B80:
	ldr r2, _08057BEC
	ldrb r0, [r2, 0x3]
	adds r0, r1, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08057B94
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08057B94:
	lsls r6, r0, 5
	movs r4, 0
	adds r7, r1, 0x2
	str r7, [sp]
	lsrs r5, r1, 1
_08057B9E:
	ldr r1, _08057BEC
	ldrb r0, [r1, 0x2]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08057BB2
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08057BB2:
	adds r1, r6, r0
	lsls r1, 16
	lsrs r1, 16
	lsrs r2, r4, 1
	add r2, r10
	mov r0, r8
	mov r7, r9
	adds r3, r7, r5
	bl DrawMetatileAt
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08057B9E
	ldr r1, [sp]
	lsls r0, r1, 24
	lsrs r1, r0, 24
	cmp r1, 0x1F
	bls _08057B80
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057BEC: .4byte 0x03000590
	thumb_func_end DrawWholeMapViewInternal

	thumb_func_start RedrawMapSlicesForCameraUpdate
RedrawMapSlicesForCameraUpdate: @ 8057BF0
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	adds r7, r2, 0
	ldr r0, _08057C38
	ldr r4, [r0]
	cmp r6, 0
	ble _08057C08
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8057D48
_08057C08:
	cmp r6, 0
	bge _08057C14
	adds r0, r5, 0
	adds r1, r4, 0
	bl RedrawMapSliceEast
_08057C14:
	cmp r7, 0
	ble _08057C20
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8057C3C
_08057C20:
	cmp r7, 0
	bge _08057C2C
	adds r0, r5, 0
	adds r1, r4, 0
	bl RedrawMapSliceSouth
_08057C2C:
	movs r0, 0x1
	strb r0, [r5, 0x4]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057C38: .4byte 0x0202e828
	thumb_func_end RedrawMapSlicesForCameraUpdate

	thumb_func_start sub_8057C3C
sub_8057C3C: @ 8057C3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r1
	ldrb r0, [r5, 0x3]
	adds r0, 0x1C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08057C58
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08057C58:
	lsls r7, r0, 5
	movs r4, 0
	ldr r6, _08057CA0
_08057C5E:
	ldrb r0, [r5, 0x2]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08057C70
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08057C70:
	adds r1, r7, r0
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	ldrsh r2, [r6, r0]
	lsrs r0, r4, 1
	adds r2, r0
	movs r0, 0x2
	ldrsh r3, [r6, r0]
	adds r3, 0xE
	mov r0, r8
	bl DrawMetatileAt
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08057C5E
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057CA0: .4byte 0x02025734
	thumb_func_end sub_8057C3C

	thumb_func_start RedrawMapSliceSouth
RedrawMapSliceSouth: @ 8057CA4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r1
	ldrb r0, [r5, 0x3]
	lsls r7, r0, 5
	movs r4, 0
	ldr r6, _08057CF0
_08057CB6:
	ldrb r0, [r5, 0x2]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08057CC8
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08057CC8:
	adds r1, r7, r0
	movs r0, 0
	ldrsh r2, [r6, r0]
	lsrs r0, r4, 1
	adds r2, r0
	movs r0, 0x2
	ldrsh r3, [r6, r0]
	mov r0, r8
	bl DrawMetatileAt
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08057CB6
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057CF0: .4byte 0x02025734
	thumb_func_end RedrawMapSliceSouth

	thumb_func_start RedrawMapSliceEast
RedrawMapSliceEast: @ 8057CF4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r1
	ldrb r6, [r5, 0x2]
	movs r4, 0
_08057D02:
	ldrb r0, [r5, 0x3]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08057D14
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08057D14:
	lsls r1, r0, 5
	adds r1, r6
	lsls r1, 16
	lsrs r1, 16
	ldr r0, _08057D44
	movs r3, 0
	ldrsh r2, [r0, r3]
	movs r7, 0x2
	ldrsh r3, [r0, r7]
	lsrs r0, r4, 1
	adds r3, r0
	mov r0, r8
	bl DrawMetatileAt
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08057D02
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057D44: .4byte 0x02025734
	thumb_func_end RedrawMapSliceEast

	thumb_func_start sub_8057D48
sub_8057D48: @ 8057D48
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	mov r8, r1
	ldrb r0, [r6, 0x2]
	adds r0, 0x1C
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x1F
	bls _08057D66
	adds r0, r5, 0
	subs r0, 0x20
	lsls r0, 24
	lsrs r5, r0, 24
_08057D66:
	movs r4, 0
	ldr r7, _08057DAC
_08057D6A:
	ldrb r0, [r6, 0x3]
	adds r0, r4, r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1F
	bls _08057D7C
	subs r0, 0x20
	lsls r0, 24
	lsrs r0, 24
_08057D7C:
	lsls r1, r0, 5
	adds r1, r5
	lsls r1, 16
	lsrs r1, 16
	movs r0, 0
	ldrsh r2, [r7, r0]
	adds r2, 0xE
	movs r0, 0x2
	ldrsh r3, [r7, r0]
	lsrs r0, r4, 1
	adds r3, r0
	mov r0, r8
	bl DrawMetatileAt
	adds r0, r4, 0x2
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1F
	bls _08057D6A
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057DAC: .4byte 0x02025734
	thumb_func_end sub_8057D48

	thumb_func_start CurrentMapDrawMetatileAt
CurrentMapDrawMetatileAt: @ 8057DB0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r6, _08057DE4
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl MapPosToBgTilemapOffset
	adds r1, r0, 0
	cmp r1, 0
	blt _08057DDC
	ldr r0, _08057DE8
	ldr r0, [r0]
	lsls r1, 16
	lsrs r1, 16
	adds r2, r4, 0
	adds r3, r5, 0
	bl DrawMetatileAt
	movs r0, 0x1
	strb r0, [r6, 0x4]
_08057DDC:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057DE4: .4byte 0x03000590
_08057DE8: .4byte 0x0202e828
	thumb_func_end CurrentMapDrawMetatileAt

	thumb_func_start DrawDoorMetatileAt
DrawDoorMetatileAt: @ 8057DEC
	push {r4-r6,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	ldr r6, _08057E1C
	adds r0, r6, 0
	adds r1, r3, 0
	adds r2, r4, 0
	bl MapPosToBgTilemapOffset
	cmp r0, 0
	blt _08057E14
	lsls r2, r0, 16
	lsrs r2, 16
	movs r0, 0x1
	adds r1, r5, 0
	bl DrawMetatile
	movs r0, 0x1
	strb r0, [r6, 0x4]
_08057E14:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08057E1C: .4byte 0x03000590
	thumb_func_end DrawDoorMetatileAt

	thumb_func_start DrawMetatileAt
DrawMetatileAt: @ 8057E20
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	adds r6, r2, 0
	adds r7, r3, 0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	adds r0, r6, 0
	adds r1, r7, 0
	bl MapGridGetMetatileIdAt
	lsls r0, 16
	lsrs r4, r0, 16
	movs r0, 0x80
	lsls r0, 3
	cmp r4, r0
	bls _08057E48
	movs r4, 0
_08057E48:
	ldr r0, _08057E54
	cmp r4, r0
	bhi _08057E58
	ldr r0, [r5, 0x10]
	ldr r5, [r0, 0xC]
	b _08057E64
	.align 2, 0
_08057E54: .4byte 0x000001ff
_08057E58:
	ldr r0, [r5, 0x14]
	ldr r5, [r0, 0xC]
	ldr r1, _08057E84
	adds r0, r4, r1
	lsls r0, 16
	lsrs r4, r0, 16
_08057E64:
	adds r0, r6, 0
	adds r1, r7, 0
	bl MapGridGetMetatileLayerTypeAt
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r4, 4
	adds r1, r5, r1
	mov r2, r8
	bl DrawMetatile
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057E84: .4byte 0xfffffe00
	thumb_func_end DrawMetatileAt

	thumb_func_start DrawMetatile
DrawMetatile: @ 8057E88
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r7, r1, 0
	lsls r2, 16
	lsrs r6, r2, 16
	cmp r0, 0x1
	beq _08057F28
	cmp r0, 0x1
	bgt _08057EA6
	cmp r0, 0
	bne _08057EA4
	b _08057FA0
_08057EA4:
	b _08058010
_08057EA6:
	cmp r0, 0x2
	beq _08057EAC
	b _08058010
_08057EAC:
	ldr r0, _08057F24
	mov r12, r0
	lsls r1, r6, 1
	mov r9, r1
	movs r5, 0xC0
	lsls r5, 5
	add r5, r12
	adds r1, r5
	ldrh r0, [r7]
	movs r2, 0
	mov r8, r2
	strh r0, [r1]
	adds r4, r6, 0x1
	lsls r4, 1
	adds r1, r4, r5
	ldrh r0, [r7, 0x2]
	strh r0, [r1]
	adds r3, r6, 0
	adds r3, 0x20
	lsls r3, 1
	adds r1, r3, r5
	ldrh r0, [r7, 0x4]
	strh r0, [r1]
	adds r2, r6, 0
	adds r2, 0x21
	lsls r2, 1
	adds r5, r2, r5
	ldrh r0, [r7, 0x6]
	strh r0, [r5]
	movs r1, 0x80
	lsls r1, 5
	add r1, r12
	mov r5, r9
	adds r0, r5, r1
	mov r5, r8
	strh r5, [r0]
	adds r0, r4, r1
	strh r5, [r0]
	adds r0, r3, r1
	strh r5, [r0]
	adds r1, r2, r1
	strh r5, [r1]
	movs r5, 0x80
	lsls r5, 4
	add r5, r12
	add r9, r5
	ldrh r0, [r7, 0x8]
	mov r1, r9
	strh r0, [r1]
	adds r4, r5
	ldrh r0, [r7, 0xA]
	strh r0, [r4]
	adds r3, r5
	ldrh r0, [r7, 0xC]
	strh r0, [r3]
	adds r2, r5
	ldrh r0, [r7, 0xE]
	strh r0, [r2]
	b _08058010
	.align 2, 0
_08057F24: .4byte 0x020211cc
_08057F28:
	ldr r2, _08057F98
	mov r12, r2
	lsls r3, r6, 1
	mov r8, r3
	movs r2, 0xC0
	lsls r2, 5
	add r2, r12
	adds r1, r3, r2
	ldrh r0, [r7]
	movs r5, 0
	mov r9, r5
	strh r0, [r1]
	adds r5, r6, 0x1
	lsls r5, 1
	adds r1, r5, r2
	ldrh r0, [r7, 0x2]
	strh r0, [r1]
	adds r4, r6, 0
	adds r4, 0x20
	lsls r4, 1
	adds r1, r4, r2
	ldrh r0, [r7, 0x4]
	strh r0, [r1]
	adds r3, r6, 0
	adds r3, 0x21
	lsls r3, 1
	adds r2, r3, r2
	ldrh r0, [r7, 0x6]
	strh r0, [r2]
	movs r1, 0x80
	lsls r1, 5
	add r1, r12
	mov r0, r8
	adds r2, r0, r1
	ldrh r0, [r7, 0x8]
	strh r0, [r2]
	adds r2, r5, r1
	ldrh r0, [r7, 0xA]
	strh r0, [r2]
	adds r2, r4, r1
	ldrh r0, [r7, 0xC]
	strh r0, [r2]
	adds r1, r3, r1
	ldrh r0, [r7, 0xE]
	strh r0, [r1]
	ldr r1, _08057F9C
	add r8, r1
	mov r0, r9
	mov r2, r8
	strh r0, [r2]
	adds r5, r1
	strh r0, [r5]
	adds r4, r1
	strh r0, [r4]
	adds r3, r1
	b _0805800E
	.align 2, 0
_08057F98: .4byte 0x020211cc
_08057F9C: .4byte 0x020219cc
_08057FA0:
	ldr r1, _0805801C
	mov r9, r1
	lsls r2, r6, 1
	mov r8, r2
	movs r1, 0xC0
	lsls r1, 5
	add r1, r9
	adds r0, r2, r1
	ldr r2, _08058020
	strh r2, [r0]
	adds r5, r6, 0x1
	lsls r5, 1
	adds r0, r5, r1
	strh r2, [r0]
	adds r4, r6, 0
	adds r4, 0x20
	lsls r4, 1
	adds r0, r4, r1
	strh r2, [r0]
	adds r3, r6, 0
	adds r3, 0x21
	lsls r3, 1
	adds r1, r3, r1
	strh r2, [r1]
	movs r1, 0x80
	lsls r1, 5
	add r1, r9
	mov r0, r8
	adds r2, r0, r1
	ldrh r0, [r7]
	strh r0, [r2]
	adds r2, r5, r1
	ldrh r0, [r7, 0x2]
	strh r0, [r2]
	adds r2, r4, r1
	ldrh r0, [r7, 0x4]
	strh r0, [r2]
	adds r1, r3, r1
	ldrh r0, [r7, 0x6]
	strh r0, [r1]
	movs r2, 0x80
	lsls r2, 4
	add r2, r9
	add r8, r2
	ldrh r0, [r7, 0x8]
	mov r1, r8
	strh r0, [r1]
	adds r5, r2
	ldrh r0, [r7, 0xA]
	strh r0, [r5]
	adds r4, r2
	ldrh r0, [r7, 0xC]
	strh r0, [r4]
	adds r3, r2
	ldrh r0, [r7, 0xE]
_0805800E:
	strh r0, [r3]
_08058010:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805801C: .4byte 0x020211cc
_08058020: .4byte 0x00003014
	thumb_func_end DrawMetatile

	thumb_func_start MapPosToBgTilemapOffset
MapPosToBgTilemapOffset: @ 8058024
	push {r4,r5,lr}
	adds r3, r0, 0
	ldr r4, _08058054
	movs r5, 0
	ldrsh r0, [r4, r5]
	subs r1, r0
	lsls r1, 1
	cmp r1, 0x1F
	bhi _0805804C
	ldrb r0, [r3, 0x2]
	adds r1, r0
	cmp r1, 0x1F
	ble _08058040
	subs r1, 0x20
_08058040:
	movs r5, 0x2
	ldrsh r0, [r4, r5]
	subs r0, r2, r0
	lsls r2, r0, 1
	cmp r2, 0x1F
	bls _08058058
_0805804C:
	movs r0, 0x1
	negs r0, r0
	b _08058066
	.align 2, 0
_08058054: .4byte 0x02025734
_08058058:
	ldrb r0, [r3, 0x3]
	adds r2, r0
	cmp r2, 0x1F
	ble _08058062
	subs r2, 0x20
_08058062:
	lsls r0, r2, 5
	adds r0, r1
_08058066:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end MapPosToBgTilemapOffset

	thumb_func_start CameraUpdateCallback
CameraUpdateCallback: @ 805806C
	push {lr}
	adds r3, r0, 0
	ldr r2, [r3, 0x4]
	cmp r2, 0
	beq _0805808C
	ldr r1, _08058090
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r0, r1
	movs r2, 0x32
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x8]
	movs r1, 0x34
	ldrsh r0, [r0, r1]
	str r0, [r3, 0xC]
_0805808C:
	pop {r0}
	bx r0
	.align 2, 0
_08058090: .4byte 0x02020004
	thumb_func_end CameraUpdateCallback

	thumb_func_start ResetCameraUpdateInfo
ResetCameraUpdateInfo: @ 8058094
	ldr r1, _080580A8
	movs r0, 0
	str r0, [r1, 0x8]
	str r0, [r1, 0xC]
	str r0, [r1, 0x10]
	str r0, [r1, 0x14]
	str r0, [r1, 0x4]
	str r0, [r1]
	bx lr
	.align 2, 0
_080580A8: .4byte 0x03004880
	thumb_func_end ResetCameraUpdateInfo

	thumb_func_start InitCameraUpdateCallback
InitCameraUpdateCallback: @ 80580AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080580E0
	ldr r1, [r4, 0x4]
	cmp r1, 0
	beq _080580C8
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _080580E4
	adds r0, r1
	bl DestroySprite
_080580C8:
	adds r0, r5, 0
	bl AddCameraObject
	lsls r0, 24
	lsrs r0, 24
	str r0, [r4, 0x4]
	ldr r0, _080580E8
	str r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080580E0: .4byte 0x03004880
_080580E4: .4byte 0x02020004
_080580E8: .4byte CameraUpdateCallback
	thumb_func_end InitCameraUpdateCallback

	thumb_func_start CameraUpdate
CameraUpdate: @ 80580EC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	ldr r6, _080581EC
	ldr r1, [r6]
	cmp r1, 0
	beq _08058100
	adds r0, r6, 0
	bl _call_via_r1
_08058100:
	ldr r7, [r6, 0x8]
	ldr r0, [r6, 0xC]
	mov r8, r0
	movs r4, 0
	movs r5, 0
	ldr r1, [r6, 0x10]
	ldr r0, [r6, 0x14]
	cmp r1, 0
	bne _0805811E
	cmp r7, 0
	beq _0805811E
	subs r4, 0x1
	cmp r7, 0
	ble _0805811E
	movs r4, 0x1
_0805811E:
	cmp r0, 0
	bne _08058132
	mov r2, r8
	cmp r2, 0
	beq _08058132
	movs r5, 0x1
	negs r5, r5
	cmp r2, 0
	ble _08058132
	movs r5, 0x1
_08058132:
	cmp r1, 0
	beq _08058144
	cmn r1, r7
	bne _08058144
	movs r4, 0x1
	negs r4, r4
	cmp r7, 0
	ble _08058144
	movs r4, 0x1
_08058144:
	cmp r0, 0
	beq _08058158
	mov r3, r8
	cmn r0, r3
	bne _08058158
	movs r4, 0x1
	negs r4, r4
	cmp r3, 0
	ble _08058158
	movs r4, 0x1
_08058158:
	ldr r2, _080581EC
	ldr r0, [r2, 0x10]
	adds r1, r0, r7
	str r1, [r2, 0x10]
	adds r0, r1, 0
	cmp r1, 0
	bge _08058168
	adds r0, 0xF
_08058168:
	asrs r0, 4
	lsls r0, 4
	subs r0, r1, r0
	str r0, [r2, 0x10]
	ldr r0, [r2, 0x14]
	mov r3, r8
	adds r1, r0, r3
	str r1, [r2, 0x14]
	adds r0, r1, 0
	cmp r1, 0
	bge _08058180
	adds r0, 0xF
_08058180:
	asrs r0, 4
	lsls r0, 4
	subs r0, r1, r0
	str r0, [r2, 0x14]
	cmp r4, 0
	bne _08058190
	cmp r5, 0
	beq _080581C6
_08058190:
	adds r0, r4, 0
	adds r1, r5, 0
	bl CameraMove
	adds r0, r4, 0
	adds r1, r5, 0
	bl UpdateFieldObjectsForCameraUpdate
	adds r0, r4, 0
	adds r1, r5, 0
	bl RotatingGatePuzzleCameraUpdate
	bl ResetBerryTreeSparkleFlags
	ldr r6, _080581F0
	lsls r4, 1
	lsls r5, 1
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl tilemap_move_something
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl RedrawMapSlicesForCameraUpdate
_080581C6:
	ldr r0, _080581F0
	adds r1, r7, 0
	mov r2, r8
	bl coords8_add
	ldr r1, _080581F4
	ldrh r0, [r1]
	subs r0, r7
	strh r0, [r1]
	ldr r1, _080581F8
	ldrh r0, [r1]
	mov r2, r8
	subs r0, r2
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080581EC: .4byte 0x03004880
_080581F0: .4byte 0x03000590
_080581F4: .4byte 0x0300489c
_080581F8: .4byte 0x03004898
	thumb_func_end CameraUpdate

	thumb_func_start camera_move_and_redraw
camera_move_and_redraw: @ 80581FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl CameraMove
	lsls r0, r4, 16
	asrs r0, 16
	lsls r1, r5, 16
	asrs r1, 16
	bl UpdateFieldObjectsForCameraUpdate
	bl DrawWholeMapView
	ldr r1, _08058230
	lsls r4, 4
	ldrh r0, [r1]
	subs r0, r4
	strh r0, [r1]
	ldr r1, _08058234
	lsls r5, 4
	ldrh r0, [r1]
	subs r0, r5
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058230: .4byte 0x0300489c
_08058234: .4byte 0x03004898
	thumb_func_end camera_move_and_redraw

	thumb_func_start SetCameraPanningCallback
SetCameraPanningCallback: @ 8058238
	ldr r1, _08058240
	str r0, [r1]
	bx lr
	.align 2, 0
_08058240: .4byte 0x030005a0
	thumb_func_end SetCameraPanningCallback

	thumb_func_start SetCameraPanning
SetCameraPanning: @ 8058244
	ldr r2, _08058254
	strh r0, [r2]
	ldr r0, _08058258
	lsls r1, 16
	asrs r1, 16
	adds r1, 0x20
	strh r1, [r0]
	bx lr
	.align 2, 0
_08058254: .4byte 0x03000598
_08058258: .4byte 0x0300059a
	thumb_func_end SetCameraPanning

	thumb_func_start InstallCameraPanAheadCallback
InstallCameraPanAheadCallback: @ 805825C
	ldr r1, _08058278
	ldr r0, _0805827C
	str r0, [r1]
	ldr r1, _08058280
	movs r0, 0
	strb r0, [r1]
	ldr r1, _08058284
	movs r0, 0
	strh r0, [r1]
	ldr r1, _08058288
	movs r0, 0x20
	strh r0, [r1]
	bx lr
	.align 2, 0
_08058278: .4byte 0x030005a0
_0805827C: .4byte CameraPanningCB_PanAhead
_08058280: .4byte 0x0300059c
_08058284: .4byte 0x03000598
_08058288: .4byte 0x0300059a
	thumb_func_end InstallCameraPanAheadCallback

	thumb_func_start UpdateCameraPanning
UpdateCameraPanning: @ 805828C
	push {lr}
	ldr r0, _080582BC
	ldr r0, [r0]
	cmp r0, 0
	beq _0805829A
	bl _call_via_r0
_0805829A:
	ldr r2, _080582C0
	ldr r0, _080582C4
	ldr r1, _080582C8
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r2]
	ldr r2, _080582CC
	ldr r0, _080582D0
	ldr r1, _080582D4
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r1
	subs r0, 0x8
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080582BC: .4byte 0x030005a0
_080582C0: .4byte 0x030024d0
_080582C4: .4byte 0x0300489c
_080582C8: .4byte 0x03000598
_080582CC: .4byte 0x030027e0
_080582D0: .4byte 0x03004898
_080582D4: .4byte 0x0300059a
	thumb_func_end UpdateCameraPanning

	thumb_func_start CameraPanningCB_PanAhead
CameraPanningCB_PanAhead: @ 80582D8
	push {lr}
	ldr r0, _080582E8
	ldrb r0, [r0]
	cmp r0, 0
	bne _080582EC
	bl InstallCameraPanAheadCallback
	b _08058374
	.align 2, 0
_080582E8: .4byte 0x0202e854
_080582EC:
	ldr r0, _08058304
	ldrb r0, [r0, 0x3]
	cmp r0, 0x1
	bne _0805830C
	ldr r0, _08058308
	ldrb r1, [r0]
	movs r2, 0x1
	eors r1, r2
	strb r1, [r0]
	cmp r1, 0
	beq _08058374
	b _08058312
	.align 2, 0
_08058304: .4byte 0x0202e858
_08058308: .4byte 0x0300059c
_0805830C:
	ldr r1, _08058334
	movs r0, 0
	strb r0, [r1]
_08058312:
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805833C
	ldr r2, _08058338
	ldrh r3, [r2]
	movs r0, 0
	ldrsh r1, [r2, r0]
	movs r0, 0x8
	negs r0, r0
	cmp r1, r0
	ble _08058374
	subs r0, r3, 0x2
	b _08058372
	.align 2, 0
_08058334: .4byte 0x0300059c
_08058338: .4byte 0x0300059a
_0805833C:
	cmp r0, 0x1
	bne _08058358
	ldr r1, _08058354
	ldrh r2, [r1]
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0x47
	bgt _08058374
	adds r0, r2, 0x2
	strh r0, [r1]
	b _08058374
	.align 2, 0
_08058354: .4byte 0x0300059a
_08058358:
	ldr r2, _08058368
	ldrh r0, [r2]
	movs r3, 0
	ldrsh r1, [r2, r3]
	cmp r1, 0x1F
	bgt _0805836C
	adds r0, 0x2
	b _08058372
	.align 2, 0
_08058368: .4byte 0x0300059a
_0805836C:
	cmp r1, 0x20
	ble _08058374
	subs r0, 0x2
_08058372:
	strh r0, [r2]
_08058374:
	pop {r0}
	bx r0
	thumb_func_end CameraPanningCB_PanAhead

	thumb_func_start sub_8058378
sub_8058378: @ 8058378
	push {lr}
	ldr r1, _08058388
	movs r2, 0x40
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_08058388: .4byte 0x06007f00
	thumb_func_end sub_8058378

	thumb_func_start door_build_blockdef
door_build_blockdef: @ 805838C
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	movs r4, 0
	adds r1, r6, 0
_08058398:
	ldrb r0, [r2]
	lsls r0, 28
	lsrs r3, r0, 16
	adds r2, 0x1
	adds r0, r5, r4
	orrs r3, r0
	strh r3, [r1]
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x3
	ble _08058398
	cmp r4, 0x7
	bgt _080583C6
	lsls r0, r4, 1
	adds r1, r0, r6
_080583B6:
	ldrb r0, [r2]
	lsls r3, r0, 12
	adds r2, 0x1
	strh r3, [r1]
	adds r1, 0x2
	adds r4, 0x1
	cmp r4, 0x7
	ble _080583B6
_080583C6:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end door_build_blockdef

	thumb_func_start sub_80583CC
sub_80583CC: @ 80583CC
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	adds r6, r1, 0
	adds r4, r2, 0
	movs r1, 0xFE
	lsls r1, 2
	mov r0, sp
	bl door_build_blockdef
	subs r1, r6, 0x1
	adds r0, r5, 0
	mov r2, sp
	bl DrawDoorMetatileAt
	movs r1, 0xFF
	lsls r1, 2
	adds r4, 0x4
	mov r0, sp
	adds r2, r4, 0
	bl door_build_blockdef
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, sp
	bl DrawDoorMetatileAt
	add sp, 0x10
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80583CC

	thumb_func_start sub_805840C
sub_805840C: @ 805840C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	subs r1, r5, 0x1
	bl CurrentMapDrawMetatileAt
	adds r0, r4, 0
	adds r1, r5, 0
	bl CurrentMapDrawMetatileAt
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_805840C

	thumb_func_start sub_8058428
sub_8058428: @ 8058428
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r6, r2, 0
	adds r7, r3, 0
	ldrh r1, [r4, 0x2]
	ldr r0, _08058444
	cmp r1, r0
	bne _08058448
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_805840C
	b _0805845C
	.align 2, 0
_08058444: .4byte 0x0000ffff
_08058448:
	ldrh r1, [r4, 0x2]
	ldr r0, [r5, 0x4]
	adds r0, r1
	bl sub_8058378
	ldr r2, [r5, 0x8]
	adds r0, r6, 0
	adds r1, r7, 0
	bl sub_80583CC
_0805845C:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8058428

	thumb_func_start sub_8058464
sub_8058464: @ 8058464
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	cmp r0, 0
	bne _0805848A
	movs r2, 0x8
	ldrsh r1, [r4, r2]
	lsls r1, 2
	adds r1, r5, r1
	movs r0, 0xC
	ldrsh r2, [r4, r0]
	movs r0, 0xE
	ldrsh r3, [r4, r0]
	adds r0, r6, 0
	bl sub_8058428
_0805848A:
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r2, 0x8
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r1, r0
	bne _080584B8
	movs r0, 0
	strh r0, [r4, 0xA]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0]
	cmp r0, 0
	bne _080584BE
	movs r0, 0
	b _080584C0
_080584B8:
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
_080584BE:
	movs r0, 0x1
_080584C0:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8058464

	thumb_func_start task50_overworld_door
task50_overworld_door: @ 80584C8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, r4, 2
	adds r2, r4
	lsls r2, 3
	ldr r0, _080584FC
	adds r2, r0
	ldrh r1, [r2]
	lsls r1, 16
	ldrh r0, [r2, 0x2]
	orrs r1, r0
	ldrh r0, [r2, 0x4]
	lsls r0, 16
	ldrh r3, [r2, 0x6]
	orrs r0, r3
	bl sub_8058464
	cmp r0, 0
	bne _080584F6
	adds r0, r4, 0
	bl DestroyTask
_080584F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080584FC: .4byte 0x03004b28
	thumb_func_end task50_overworld_door

	thumb_func_start door_frame_last
door_frame_last: @ 8058500
	push {lr}
	adds r1, r0, 0
	b _08058508
_08058506:
	adds r1, 0x4
_08058508:
	ldrb r0, [r1]
	cmp r0, 0
	bne _08058506
	subs r0, r1, 0x4
	pop {r1}
	bx r1
	thumb_func_end door_frame_last

	thumb_func_start door_find
door_find: @ 8058514
	push {lr}
	adds r2, r0, 0
	lsls r1, 16
	lsrs r1, 16
	b _0805852A
_0805851E:
	ldrh r0, [r2]
	cmp r0, r1
	bne _08058528
	adds r0, r2, 0
	b _08058532
_08058528:
	adds r2, 0xC
_0805852A:
	ldr r0, [r2, 0x4]
	cmp r0, 0
	bne _0805851E
	movs r0, 0
_08058532:
	pop {r1}
	bx r1
	thumb_func_end door_find

	thumb_func_start task_overworld_door_add_if_inactive
task_overworld_door_add_if_inactive: @ 8058538
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r7, r2, 0
	mov r8, r3
	ldr r4, _08058584
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0805858C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r2, _08058588
	adds r1, r2
	strh r7, [r1, 0xC]
	mov r2, r8
	strh r2, [r1, 0xE]
	strh r5, [r1, 0x2]
	lsrs r2, r5, 16
	strh r2, [r1]
	strh r6, [r1, 0x6]
	lsrs r2, r6, 16
	strh r2, [r1, 0x4]
	lsls r0, 24
	asrs r0, 24
	b _08058590
	.align 2, 0
_08058584: .4byte task50_overworld_door
_08058588: .4byte 0x03004b28
_0805858C:
	movs r0, 0x1
	negs r0, r0
_08058590:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end task_overworld_door_add_if_inactive

	thumb_func_start sub_805859C
sub_805859C: @ 805859C
	push {lr}
	adds r0, r1, 0
	adds r1, r2, 0
	bl sub_805840C
	pop {r0}
	bx r0
	thumb_func_end sub_805859C

	thumb_func_start sub_80585AC
sub_80585AC: @ 80585AC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl door_find
	adds r4, r0, 0
	cmp r4, 0
	beq _080585E2
	ldr r1, _080585E8
	adds r0, r1, 0
	bl door_frame_last
	adds r1, r0, 0
	adds r0, r4, 0
	adds r2, r5, 0
	adds r3, r6, 0
	bl sub_8058428
_080585E2:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080585E8: .4byte gUnknown_0830F87C
	thumb_func_end sub_80585AC

	thumb_func_start sub_80585EC
sub_80585EC: @ 80585EC
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl door_find
	cmp r0, 0
	beq _08058620
	ldr r1, _0805861C
	adds r2, r5, 0
	adds r3, r6, 0
	bl task_overworld_door_add_if_inactive
	lsls r0, 24
	asrs r0, 24
	b _08058624
	.align 2, 0
_0805861C: .4byte gUnknown_0830F87C
_08058620:
	movs r0, 0x1
	negs r0, r0
_08058624:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80585EC

	thumb_func_start sub_805862C
sub_805862C: @ 805862C
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	adds r0, r5, 0
	adds r1, r6, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl door_find
	cmp r0, 0
	beq _08058660
	ldr r1, _0805865C
	adds r2, r5, 0
	adds r3, r6, 0
	bl task_overworld_door_add_if_inactive
	lsls r0, 24
	asrs r0, 24
	b _08058664
	.align 2, 0
_0805865C: .4byte gUnknown_0830F890
_08058660:
	movs r0, 0x1
	negs r0, r0
_08058664:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805862C

	thumb_func_start cur_mapdata_get_door_x2_at
cur_mapdata_get_door_x2_at: @ 805866C
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	adds r1, r2, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r4, 0
	bl door_find
	cmp r0, 0
	beq _08058690
	ldrb r0, [r0, 0x2]
	lsls r0, 24
	asrs r0, 24
	b _08058694
_08058690:
	movs r0, 0x1
	negs r0, r0
_08058694:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end cur_mapdata_get_door_x2_at

	thumb_func_start unref_sub_805869C
unref_sub_805869C: @ 805869C
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _080586B0
	adds r1, r3, 0
	bl sub_80585EC
	pop {r0}
	bx r0
	.align 2, 0
_080586B0: .4byte gUnknown_0830F9B4
	thumb_func_end unref_sub_805869C

	thumb_func_start sub_80586B4
sub_80586B4: @ 80586B4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056EAC
	lsls r0, 24
	cmp r0, 0
	beq _080586D6
	ldr r0, _080586DC
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80585AC
_080586D6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080586DC: .4byte gUnknown_0830F9B4
	thumb_func_end sub_80586B4

	thumb_func_start sub_80586E0
sub_80586E0: @ 80586E0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056EAC
	lsls r0, 24
	cmp r0, 0
	beq _08058702
	ldr r0, _08058708
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_805859C
_08058702:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08058708: .4byte gUnknown_0830F9B4
	thumb_func_end sub_80586E0

	thumb_func_start sub_805870C
sub_805870C: @ 805870C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056EAC
	lsls r0, 24
	cmp r0, 0
	beq _08058738
	ldr r0, _08058734
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_805862C
	lsls r0, 24
	asrs r0, 24
	b _0805873C
	.align 2, 0
_08058734: .4byte gUnknown_0830F9B4
_08058738:
	movs r0, 0x1
	negs r0, r0
_0805873C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805870C

	thumb_func_start task_overworld_door_add_if_role_69_for_opening_door_at
task_overworld_door_add_if_role_69_for_opening_door_at: @ 8058744
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056EAC
	lsls r0, 24
	cmp r0, 0
	beq _08058770
	ldr r0, _0805876C
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_80585EC
	lsls r0, 24
	asrs r0, 24
	b _08058774
	.align 2, 0
_0805876C: .4byte gUnknown_0830F9B4
_08058770:
	movs r0, 0x1
	negs r0, r0
_08058774:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end task_overworld_door_add_if_role_69_for_opening_door_at

	thumb_func_start sub_805877C
sub_805877C: @ 805877C
	push {lr}
	ldr r0, _0805878C
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0805878C: .4byte task50_overworld_door
	thumb_func_end sub_805877C

	thumb_func_start sub_8058790
sub_8058790: @ 8058790
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _080587A8
	adds r1, r3, 0
	bl cur_mapdata_get_door_x2_at
	lsls r0, 24
	cmp r0, 0
	beq _080587AC
	movs r0, 0x12
	b _080587AE
	.align 2, 0
_080587A8: .4byte gUnknown_0830F9B4
_080587AC:
	movs r0, 0x8
_080587AE:
	pop {r1}
	bx r1
	thumb_func_end sub_8058790

	thumb_func_start sub_80587B4
sub_80587B4: @ 80587B4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _080587D0
	adds r0, r2
	ldr r2, _080587D4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_080587D0: .4byte 0x030048a0
_080587D4: .4byte sub_80587D8
	thumb_func_end sub_80587B4

	thumb_func_start sub_80587D8
sub_80587D8: @ 80587D8
	movs r0, 0
	bx lr
	thumb_func_end sub_80587D8

	thumb_func_start player_step
player_step: @ 80587DC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	ldr r4, _0805884C
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058850
	adds r5, r0, r1
	adds r0, r5, 0
	bl sub_8059D60
	ldrb r0, [r4, 0x6]
	cmp r0, 0
	bne _08058842
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_80E5B38
	adds r0, r5, 0
	mov r1, r8
	bl sub_8058854
	lsls r0, 24
	cmp r0, 0
	bne _08058842
	adds r0, r5, 0
	bl npc_clear_strange_bits
	bl DoPlayerAvatarTransition
	bl TryDoMetatileBehaviorForcedMovment
	lsls r0, 24
	cmp r0, 0
	bne _08058842
	mov r0, r8
	adds r1, r7, 0
	adds r2, r6, 0
	bl MovePlayerAvatarUsingKeypadInput
	bl PlayerAllowForcedMovementIfMovingSameDirection
_08058842:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805884C: .4byte 0x0202e858
_08058850: .4byte 0x030048a0
	thumb_func_end player_step

	thumb_func_start sub_8058854
sub_8058854: @ 8058854
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0805889E
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	bne _0805889E
	adds r0, r4, 0
	bl FieldObjectGetSpecialAnim
	lsls r0, 24
	movs r1, 0xE7
	lsls r1, 24
	adds r0, r1
	lsrs r0, 24
	cmp r0, 0x3
	bhi _0805889A
	cmp r5, 0
	beq _0805889A
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	cmp r0, r5
	beq _0805889A
	adds r0, r4, 0
	bl FieldObjectClearAnim
	b _0805889E
_0805889A:
	movs r0, 0x1
	b _080588A0
_0805889E:
	movs r0, 0
_080588A0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8058854

	thumb_func_start npc_clear_strange_bits
npc_clear_strange_bits: @ 80588A8
	ldrb r2, [r0, 0x1]
	movs r1, 0x11
	negs r1, r1
	ands r1, r2
	movs r2, 0x5
	negs r2, r2
	ands r1, r2
	adds r2, 0x2
	ands r1, r2
	strb r1, [r0, 0x1]
	ldr r2, _080588C8
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_080588C8: .4byte 0x0202e858
	thumb_func_end npc_clear_strange_bits

	thumb_func_start MovePlayerAvatarUsingKeypadInput
MovePlayerAvatarUsingKeypadInput: @ 80588CC
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 16
	lsrs r2, 16
	ldr r0, _080588F0
	ldrb r1, [r0]
	movs r0, 0x6
	ands r0, r1
	cmp r0, 0
	beq _080588F4
	adds r0, r3, 0
	adds r1, r4, 0
	bl MovePlayerOnBike
	b _080588FC
	.align 2, 0
_080588F0: .4byte 0x0202e858
_080588F4:
	adds r0, r3, 0
	adds r1, r2, 0
	bl MovePlayerNotOnBike
_080588FC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end MovePlayerAvatarUsingKeypadInput

	thumb_func_start PlayerAllowForcedMovementIfMovingSameDirection
PlayerAllowForcedMovementIfMovingSameDirection: @ 8058904
	push {lr}
	ldr r2, _0805891C
	ldrb r0, [r2, 0x2]
	cmp r0, 0x2
	bne _08058916
	ldrb r1, [r2]
	movs r0, 0xDF
	ands r0, r1
	strb r0, [r2]
_08058916:
	pop {r0}
	bx r0
	.align 2, 0
_0805891C: .4byte 0x0202e858
	thumb_func_end PlayerAllowForcedMovementIfMovingSameDirection

	thumb_func_start TryDoMetatileBehaviorForcedMovment
TryDoMetatileBehaviorForcedMovment: @ 8058920
	push {r4,lr}
	ldr r4, _08058940
	bl GetForcedMovementByMetatileBehavior
	lsls r0, 24
	lsrs r0, 22
	adds r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08058940: .4byte gUnknown_0830FBA0
	thumb_func_end TryDoMetatileBehaviorForcedMovment

	thumb_func_start GetForcedMovementByMetatileBehavior
GetForcedMovementByMetatileBehavior: @ 8058944
	push {r4-r6,lr}
	ldr r3, _08058980
	ldrb r1, [r3]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	bne _08058996
	ldr r2, _08058984
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r5, [r0, 0x1E]
	movs r4, 0
	ldr r6, _08058988
_08058964:
	lsls r0, r4, 2
	adds r0, r6
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _0805898C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r0, 24
	b _08058998
	.align 2, 0
_08058980: .4byte 0x0202e858
_08058984: .4byte 0x030048a0
_08058988: .4byte gUnknown_0830FB58
_0805898C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x11
	bls _08058964
_08058996:
	movs r0, 0
_08058998:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetForcedMovementByMetatileBehavior

	thumb_func_start ForcedMovement_None
ForcedMovement_None: @ 80589A0
	push {r4,lr}
	ldr r4, _080589E4
	ldrb r1, [r4]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _080589DA
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080589E8
	adds r0, r1
	ldrb r2, [r0, 0x1]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	movs r2, 0x8
	orrs r1, r2
	strb r1, [r0, 0x1]
	ldrb r1, [r0, 0x18]
	lsls r1, 28
	lsrs r1, 28
	bl FieldObjectSetDirection
	ldrb r1, [r4]
	movs r0, 0xBF
	ands r0, r1
	strb r0, [r4]
_080589DA:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080589E4: .4byte 0x0202e858
_080589E8: .4byte 0x030048a0
	thumb_func_end ForcedMovement_None

	thumb_func_start DoForcedMovement
DoForcedMovement: @ 80589EC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r9, r1
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _08058A2C
	adds r0, r5, 0
	bl CheckForPlayerAvatarCollision
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	ldrb r0, [r6]
	movs r1, 0x40
	mov r10, r1
	movs r1, 0
	mov r8, r1
	mov r1, r10
	orrs r0, r1
	strb r0, [r6]
	cmp r4, 0
	beq _08058A48
	bl ForcedMovement_None
	cmp r4, 0x4
	bhi _08058A30
	movs r0, 0
	b _08058A54
	.align 2, 0
_08058A2C: .4byte 0x0202e858
_08058A30:
	cmp r7, 0x6
	bne _08058A3A
	adds r0, r5, 0
	bl PlayerJumpLedge
_08058A3A:
	ldrb r0, [r6]
	mov r1, r10
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0x2
	strb r0, [r6, 0x2]
	b _08058A52
_08058A48:
	movs r0, 0x2
	strb r0, [r6, 0x2]
	adds r0, r5, 0
	bl _call_via_r9
_08058A52:
	movs r0, 0x1
_08058A54:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end DoForcedMovement

	thumb_func_start DoForcedMovementInCurrentDirection
DoForcedMovementInCurrentDirection: @ 8058A64
	push {lr}
	adds r1, r0, 0
	ldr r0, _08058A90
	ldrb r2, [r0, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _08058A94
	adds r0, r2
	ldrb r2, [r0, 0x1]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r0, 0x1]
	ldrb r0, [r0, 0x18]
	lsrs r0, 4
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058A90: .4byte 0x0202e858
_08058A94: .4byte 0x030048a0
	thumb_func_end DoForcedMovementInCurrentDirection

	thumb_func_start ForcedMovement_Slip
ForcedMovement_Slip: @ 8058A98
	push {lr}
	ldr r0, _08058AA8
	bl DoForcedMovementInCurrentDirection
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058AA8: .4byte sub_80593C4
	thumb_func_end ForcedMovement_Slip

	thumb_func_start sub_8058AAC
sub_8058AAC: @ 8058AAC
	push {lr}
	ldr r1, _08058AC0
	movs r0, 0x1
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058AC0: .4byte PlayerGoSpeed0
	thumb_func_end sub_8058AAC

	thumb_func_start sub_8058AC4
sub_8058AC4: @ 8058AC4
	push {lr}
	ldr r1, _08058AD8
	movs r0, 0x2
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058AD8: .4byte PlayerGoSpeed0
	thumb_func_end sub_8058AC4

	thumb_func_start sub_8058ADC
sub_8058ADC: @ 8058ADC
	push {lr}
	ldr r1, _08058AF0
	movs r0, 0x3
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058AF0: .4byte PlayerGoSpeed0
	thumb_func_end sub_8058ADC

	thumb_func_start sub_8058AF4
sub_8058AF4: @ 8058AF4
	push {lr}
	ldr r1, _08058B08
	movs r0, 0x4
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058B08: .4byte PlayerGoSpeed0
	thumb_func_end sub_8058AF4

	thumb_func_start sub_8058B0C
sub_8058B0C: @ 8058B0C
	push {lr}
	ldr r1, _08058B20
	movs r0, 0x1
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058B20: .4byte npc_use_some_d2s
	thumb_func_end sub_8058B0C

	thumb_func_start sub_8058B24
sub_8058B24: @ 8058B24
	push {lr}
	ldr r1, _08058B38
	movs r0, 0x2
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058B38: .4byte npc_use_some_d2s
	thumb_func_end sub_8058B24

	thumb_func_start sub_8058B3C
sub_8058B3C: @ 8058B3C
	push {lr}
	ldr r1, _08058B50
	movs r0, 0x3
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058B50: .4byte npc_use_some_d2s
	thumb_func_end sub_8058B3C

	thumb_func_start sub_8058B54
sub_8058B54: @ 8058B54
	push {lr}
	ldr r1, _08058B68
	movs r0, 0x4
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058B68: .4byte npc_use_some_d2s
	thumb_func_end sub_8058B54

	thumb_func_start ForcedMovement_Slide
ForcedMovement_Slide: @ 8058B6C
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08058B9C
	ldrb r3, [r2, 0x5]
	lsls r2, r3, 3
	adds r2, r3
	lsls r2, 2
	ldr r3, _08058BA0
	adds r2, r3
	ldrb r3, [r2, 0x1]
	movs r4, 0x4
	orrs r3, r4
	movs r4, 0x2
	orrs r3, r4
	strb r3, [r2, 0x1]
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08058B9C: .4byte 0x0202e858
_08058BA0: .4byte 0x030048a0
	thumb_func_end ForcedMovement_Slide

	thumb_func_start ForcedMovement_SlideSouth
ForcedMovement_SlideSouth: @ 8058BA4
	push {lr}
	ldr r1, _08058BB8
	movs r0, 0x1
	bl ForcedMovement_Slide
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058BB8: .4byte sub_80593C4
	thumb_func_end ForcedMovement_SlideSouth

	thumb_func_start ForcedMovement_SlideNorth
ForcedMovement_SlideNorth: @ 8058BBC
	push {lr}
	ldr r1, _08058BD0
	movs r0, 0x2
	bl ForcedMovement_Slide
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058BD0: .4byte sub_80593C4
	thumb_func_end ForcedMovement_SlideNorth

	thumb_func_start ForcedMovement_SlideWest
ForcedMovement_SlideWest: @ 8058BD4
	push {lr}
	ldr r1, _08058BE8
	movs r0, 0x3
	bl ForcedMovement_Slide
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058BE8: .4byte sub_80593C4
	thumb_func_end ForcedMovement_SlideWest

	thumb_func_start ForcedMovement_SlideEast
ForcedMovement_SlideEast: @ 8058BEC
	push {lr}
	ldr r1, _08058C00
	movs r0, 0x4
	bl ForcedMovement_Slide
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08058C00: .4byte sub_80593C4
	thumb_func_end ForcedMovement_SlideEast

	thumb_func_start sub_8058C04
sub_8058C04: @ 8058C04
	push {lr}
	bl sub_8059F94
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8058C04

	thumb_func_start sub_8058C10
sub_8058C10: @ 8058C10
	push {lr}
	bl sub_805A06C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8058C10

	thumb_func_start ForcedMovement_MuddySlope
ForcedMovement_MuddySlope: @ 8058C1C
	push {r4,lr}
	ldr r0, _08058C60
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08058C64
	adds r4, r0, r1
	ldrb r1, [r4, 0x18]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0x20
	bne _08058C42
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3
	bgt _08058C6C
_08058C42:
	movs r0, 0
	bl sub_80E6010
	ldrb r0, [r4, 0x1]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldr r1, _08058C68
	movs r0, 0x1
	bl DoForcedMovement
	lsls r0, 24
	lsrs r0, 24
	b _08058C6E
	.align 2, 0
_08058C60: .4byte 0x0202e858
_08058C64: .4byte 0x030048a0
_08058C68: .4byte sub_80593C4
_08058C6C:
	movs r0, 0
_08058C6E:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end ForcedMovement_MuddySlope

	thumb_func_start MovePlayerNotOnBike
MovePlayerNotOnBike: @ 8058C74
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	ldr r6, _08058CA0
	adds r0, r4, 0
	bl CheckMovementInputNotOnBike
	lsls r0, 24
	lsrs r0, 22
	adds r0, r6
	ldr r2, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r2
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058CA0: .4byte gUnknown_0830FBEC
	thumb_func_end MovePlayerNotOnBike

	thumb_func_start CheckMovementInputNotOnBike
CheckMovementInputNotOnBike: @ 8058CA4
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08058CBC
	ldr r0, _08058CB8
	strb r4, [r0, 0x2]
	movs r0, 0
	b _08058CDE
	.align 2, 0
_08058CB8: .4byte 0x0202e858
_08058CBC:
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	beq _08058CD8
	ldr r1, _08058CD4
	ldrb r0, [r1, 0x2]
	cmp r0, 0x2
	beq _08058CD8
	movs r0, 0x1
	b _08058CDC
	.align 2, 0
_08058CD4: .4byte 0x0202e858
_08058CD8:
	ldr r1, _08058CE4
	movs r0, 0x2
_08058CDC:
	strb r0, [r1, 0x2]
_08058CDE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08058CE4: .4byte 0x0202e858
	thumb_func_end CheckMovementInputNotOnBike

	thumb_func_start PlayerNotOnBikeNotMoving
PlayerNotOnBikeNotMoving: @ 8058CE8
	push {lr}
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl PlayerFaceDirection
	pop {r0}
	bx r0
	thumb_func_end PlayerNotOnBikeNotMoving

	thumb_func_start PlayerNotOnBikeTurningInPlace
PlayerNotOnBikeTurningInPlace: @ 8058CFC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl PlayerTurnInPlace
	pop {r0}
	bx r0
	thumb_func_end PlayerNotOnBikeTurningInPlace

	thumb_func_start sub_8058D0C
sub_8058D0C: @ 8058D0C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsrs r4, r1, 16
	adds r0, r5, 0
	bl CheckForPlayerAvatarCollision
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0
	beq _08058D44
	cmp r0, 0x6
	bne _08058D32
	adds r0, r5, 0
	bl PlayerJumpLedge
	b _08058DAE
_08058D32:
	subs r0, r1, 0x5
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bls _08058DAE
	adds r0, r5, 0
	bl PlayerNotOnBikeCollide
	b _08058DAE
_08058D44:
	ldr r6, _08058D58
	ldrb r1, [r6]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08058D5C
	adds r0, r5, 0
	bl sub_80593C4
	b _08058DAE
	.align 2, 0
_08058D58: .4byte 0x0202e858
_08058D5C:
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08058DA8
	movs r0, 0x2
	ands r4, r0
	cmp r4, 0
	beq _08058DA8
	movs r0, 0x86
	lsls r0, 4
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08058DA8
	ldr r2, _08058DA4
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1E]
	bl sub_80E5DEC
	lsls r0, 24
	cmp r0, 0
	bne _08058DA8
	adds r0, r5, 0
	bl sub_805940C
	ldrb r1, [r6]
	movs r0, 0x80
	orrs r0, r1
	strb r0, [r6]
	b _08058DAE
	.align 2, 0
_08058DA4: .4byte 0x030048a0
_08058DA8:
	adds r0, r5, 0
	bl PlayerGoSpeed0
_08058DAE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8058D0C

	thumb_func_start CheckForPlayerAvatarCollision
CheckForPlayerAvatarCollision: @ 8058DB4
	push {r4-r6,lr}
	sub sp, 0x8
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _08058E18
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08058E1C
	adds r4, r0
	ldrh r1, [r4, 0x10]
	add r0, sp, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x6
	strh r0, [r5]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	bl MoveCoords
	add r0, sp, 0x4
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	add r1, sp, 0x4
	movs r3, 0
	ldrsh r1, [r1, r3]
	movs r3, 0
	ldrsh r2, [r5, r3]
	str r0, [sp]
	adds r0, r4, 0
	adds r3, r6, 0
	bl CheckForFieldObjectCollision
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08058E18: .4byte 0x0202e858
_08058E1C: .4byte 0x030048a0
	thumb_func_end CheckForPlayerAvatarCollision

	thumb_func_start CheckForFieldObjectCollision
CheckForFieldObjectCollision: @ 8058E20
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	ldr r4, [sp, 0x24]
	lsls r1, 16
	lsls r2, 16
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r4, 24
	lsrs r4, 24
	mov r10, r4
	lsrs r7, r1, 16
	asrs r5, r1, 16
	lsrs r1, r2, 16
	mov r9, r1
	asrs r4, r2, 16
	adds r1, r5, 0
	adds r2, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r0, 24
	mov r1, sp
	strb r0, [r1]
	cmp r0, 0x3
	bne _08058E70
	adds r0, r5, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_8058EF0
	lsls r0, 24
	cmp r0, 0
	beq _08058E70
	movs r0, 0x5
	b _08058EDE
_08058E70:
	lsls r5, r7, 16
	asrs r0, r5, 16
	mov r8, r0
	mov r1, r9
	lsls r4, r1, 16
	asrs r7, r4, 16
	adds r1, r7, 0
	adds r2, r6, 0
	bl ShouldJumpLedge
	lsls r0, 24
	cmp r0, 0
	beq _08058E94
	movs r0, 0x2B
	bl sav12_xor_increment
	movs r0, 0x6
	b _08058EDE
_08058E94:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _08058EB0
	mov r0, r8
	adds r1, r7, 0
	adds r2, r6, 0
	bl sub_8058F6C
	lsls r0, 24
	cmp r0, 0
	beq _08058EB0
	movs r0, 0x7
	b _08058EDE
_08058EB0:
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, 0
	bne _08058EDA
	asrs r5, 16
	asrs r4, 16
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl CheckForRotatingGatePuzzleCollision
	cmp r0, 0
	beq _08058ECE
	movs r0, 0x8
	b _08058EDE
_08058ECE:
	adds r0, r5, 0
	adds r1, r4, 0
	mov r2, r10
	mov r3, sp
	bl check_acro_bike_metatile
_08058EDA:
	mov r0, sp
	ldrb r0, [r0]
_08058EDE:
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckForFieldObjectCollision

	thumb_func_start sub_8058EF0
sub_8058EF0: @ 8058EF0
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r0, _08058F3C
	ldrb r1, [r0]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08058F40
	lsls r5, r3, 16
	asrs r0, r5, 16
	lsls r4, 16
	asrs r1, r4, 16
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _08058F40
	lsrs r0, r5, 16
	lsrs r1, r4, 16
	movs r2, 0x3
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	bne _08058F40
	adds r0, r6, 0
	bl sub_805A20C
	movs r0, 0x1
	b _08058F42
	.align 2, 0
_08058F3C: .4byte 0x0202e858
_08058F40:
	movs r0, 0
_08058F42:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8058EF0

	thumb_func_start ShouldJumpLedge
ShouldJumpLedge: @ 8058F48
	push {lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl GetLedgeJumpDirection
	lsls r0, 24
	cmp r0, 0
	bne _08058F64
	movs r0, 0
	b _08058F66
_08058F64:
	movs r0, 0x1
_08058F66:
	pop {r1}
	bx r1
	thumb_func_end ShouldJumpLedge

	thumb_func_start sub_8058F6C
sub_8058F6C: @ 8058F6C
	push {r4-r7,lr}
	sub sp, 0x4
	mov r3, sp
	strh r0, [r3]
	mov r5, sp
	adds r5, 0x2
	strh r1, [r5]
	lsls r2, 24
	lsrs r7, r2, 24
	ldr r0, _08059004
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0805900C
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl GetFieldObjectIdByXY
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x10
	beq _0805900C
	ldr r0, _08059008
	lsls r1, r6, 3
	adds r1, r6
	lsls r1, 2
	adds r4, r1, r0
	ldrb r0, [r4, 0x5]
	cmp r0, 0x57
	bne _0805900C
	ldrh r1, [r4, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	strh r0, [r5]
	adds r0, r7, 0
	mov r1, sp
	adds r2, r5, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r7, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805900C
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056F08
	lsls r0, 24
	cmp r0, 0
	bne _0805900C
	adds r0, r6, 0
	adds r1, r7, 0
	bl task_add_bump_boulder
	movs r0, 0x1
	b _0805900E
	.align 2, 0
_08059004: .4byte 0x00000829
_08059008: .4byte 0x030048a0
_0805900C:
	movs r0, 0
_0805900E:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8058F6C

	thumb_func_start check_acro_bike_metatile
check_acro_bike_metatile: @ 8059018
	push {r4-r7,lr}
	adds r6, r3, 0
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
	ldr r7, _08059040
_08059024:
	lsls r0, r4, 2
	adds r0, r7
	ldr r1, [r0]
	adds r0, r5, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _08059048
	ldr r0, _08059044
	adds r0, r4, r0
	ldrb r0, [r0]
	strb r0, [r6]
	b _08059052
	.align 2, 0
_08059040: .4byte gUnknown_0830FBF8
_08059044: .4byte gUnknown_0830FC0C
_08059048:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x4
	bls _08059024
_08059052:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end check_acro_bike_metatile

	thumb_func_start SetPlayerAvatarTransitionFlags
SetPlayerAvatarTransitionFlags: @ 8059058
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	ldr r2, _08059070
	ldrb r1, [r2, 0x1]
	orrs r0, r1
	strb r0, [r2, 0x1]
	bl DoPlayerAvatarTransition
	pop {r0}
	bx r0
	.align 2, 0
_08059070: .4byte 0x0202e858
	thumb_func_end SetPlayerAvatarTransitionFlags

	thumb_func_start DoPlayerAvatarTransition
DoPlayerAvatarTransition: @ 8059074
	push {r4,r5,lr}
	ldr r0, _080590BC
	ldrb r4, [r0, 0x1]
	cmp r4, 0
	beq _080590B4
	movs r5, 0
_08059080:
	movs r0, 0x1
	ands r0, r4
	cmp r0, 0
	beq _080590A2
	ldr r0, _080590C0
	lsls r2, r5, 2
	adds r2, r0
	ldr r0, _080590BC
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080590C4
	adds r0, r1
	ldr r1, [r2]
	bl _call_via_r1
_080590A2:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	lsrs r4, 1
	cmp r5, 0x7
	bls _08059080
	ldr r1, _080590BC
	movs r0, 0
	strb r0, [r1, 0x1]
_080590B4:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080590BC: .4byte 0x0202e858
_080590C0: .4byte gUnknown_0830FC14
_080590C4: .4byte 0x030048a0
	thumb_func_end DoPlayerAvatarTransition

	thumb_func_start nullsub_49
nullsub_49: @ 80590C8
	bx lr
	thumb_func_end nullsub_49

	thumb_func_start PlayerAvatarTransition_Normal
PlayerAvatarTransition_Normal: @ 80590CC
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x1
	bl SetPlayerAvatarStateMask
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_Normal

	thumb_func_start PlayerAvatarTransition_MachBike
PlayerAvatarTransition_MachBike: @ 80590F8
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x1
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x2
	bl SetPlayerAvatarStateMask
	movs r0, 0
	movs r1, 0
	bl sub_80E5FCC
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_MachBike

	thumb_func_start PlayerAvatarTransition_AcroBike
PlayerAvatarTransition_AcroBike: @ 805912C
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x2
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x4
	bl SetPlayerAvatarStateMask
	movs r0, 0
	movs r1, 0
	bl sub_80E5FCC
	bl sub_80E6084
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_AcroBike

	thumb_func_start PlayerAvatarTransition_Surfing
PlayerAvatarTransition_Surfing: @ 8059164
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x3
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x8
	bl SetPlayerAvatarStateMask
	ldr r1, _080591B8
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, 0x4]
	ldr r0, _080591BC
	ldrb r0, [r0, 0x5]
	str r0, [r1, 0x8]
	movs r0, 0x8
	bl FieldEffectStart
	lsls r0, 24
	lsrs r0, 24
	strb r0, [r4, 0x1A]
	movs r1, 0x1
	bl sub_8127ED0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080591B8: .4byte 0x0202ff84
_080591BC: .4byte 0x0202e858
	thumb_func_end PlayerAvatarTransition_Surfing

	thumb_func_start PlayerAvatarTransition_Underwater
PlayerAvatarTransition_Underwater: @ 80591C0
	push {r4,lr}
	adds r4, r0, 0
	movs r0, 0x4
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	movs r0, 0x10
	bl SetPlayerAvatarStateMask
	ldrb r0, [r4, 0x4]
	bl sub_8128124
	strb r0, [r4, 0x1A]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerAvatarTransition_Underwater

	thumb_func_start sub_80591F4
sub_80591F4: @ 80591F4
	ldr r2, _08059200
	ldrb r1, [r2]
	movs r0, 0x20
	orrs r0, r1
	strb r0, [r2]
	bx lr
	.align 2, 0
_08059200: .4byte 0x0202e858
	thumb_func_end sub_80591F4

	thumb_func_start sub_8059204
sub_8059204: @ 8059204
	push {r4,lr}
	ldr r4, _08059230
	movs r0, 0
	strb r0, [r4, 0x3]
	bl PlayerIsAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _08059242
	bl PlayerCheckIfAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	bne _08059234
	bl player_is_anim_in_certain_ranges
	lsls r0, 24
	cmp r0, 0
	bne _08059242
	movs r0, 0x1
	b _08059240
	.align 2, 0
_08059230: .4byte 0x0202e858
_08059234:
	bl sub_80592A4
	lsls r0, 24
	cmp r0, 0
	bne _08059242
	movs r0, 0x2
_08059240:
	strb r0, [r4, 0x3]
_08059242:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8059204

	thumb_func_start player_is_anim_in_certain_ranges
player_is_anim_in_certain_ranges: @ 8059248
	push {lr}
	ldr r2, _08059294
	ldr r0, _08059298
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x1C]
	cmp r1, 0x3
	bls _0805928E
	adds r0, r1, 0
	subs r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bls _0805928E
	adds r0, r1, 0
	subs r0, 0x19
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xF
	bls _0805928E
	adds r0, r1, 0
	subs r0, 0x62
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xB
	bls _0805928E
	adds r0, r1, 0
	subs r0, 0x7A
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bhi _0805929C
_0805928E:
	movs r0, 0x1
	b _0805929E
	.align 2, 0
_08059294: .4byte 0x030048a0
_08059298: .4byte 0x0202e858
_0805929C:
	movs r0, 0
_0805929E:
	pop {r1}
	bx r1
	thumb_func_end player_is_anim_in_certain_ranges

	thumb_func_start sub_80592A4
sub_80592A4: @ 80592A4
	push {lr}
	bl player_is_anim_in_certain_ranges
	lsls r0, 24
	cmp r0, 0
	beq _080592C0
	ldr r0, _080592BC
	ldrb r0, [r0, 0x2]
	cmp r0, 0x1
	beq _080592C0
	movs r0, 0x1
	b _080592C2
	.align 2, 0
_080592BC: .4byte 0x0202e858
_080592C0:
	movs r0, 0
_080592C2:
	pop {r1}
	bx r1
	thumb_func_end sub_80592A4

	thumb_func_start PlayerIsAnimActive
PlayerIsAnimActive: @ 80592C8
	push {lr}
	ldr r0, _080592E4
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080592E8
	adds r0, r1
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080592E4: .4byte 0x0202e858
_080592E8: .4byte 0x030048a0
	thumb_func_end PlayerIsAnimActive

	thumb_func_start PlayerCheckIfAnimFinishedOrInactive
PlayerCheckIfAnimFinishedOrInactive: @ 80592EC
	push {lr}
	ldr r0, _08059308
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805930C
	adds r0, r1
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08059308: .4byte 0x0202e858
_0805930C: .4byte 0x030048a0
	thumb_func_end PlayerCheckIfAnimFinishedOrInactive

	thumb_func_start player_set_x22
player_set_x22: @ 8059310
	ldr r3, _08059324
	ldr r1, _08059328
	ldrb r2, [r1, 0x5]
	lsls r1, r2, 3
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	adds r1, 0x22
	strb r0, [r1]
	bx lr
	.align 2, 0
_08059324: .4byte 0x030048a0
_08059328: .4byte 0x0202e858
	thumb_func_end player_set_x22

	thumb_func_start player_get_x22
player_get_x22: @ 805932C
	ldr r2, _08059340
	ldr r0, _08059344
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	adds r0, 0x22
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08059340: .4byte 0x030048a0
_08059344: .4byte 0x0202e858
	thumb_func_end player_get_x22

	thumb_func_start sub_8059348
sub_8059348: @ 8059348
	push {lr}
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	ldr r0, _08059368
	ldrb r2, [r0, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805936C
	adds r0, r2
	bl FieldObjectForceSetSpecialAnim
	pop {r0}
	bx r0
	.align 2, 0
_08059368: .4byte 0x0202e858
_0805936C: .4byte 0x030048a0
	thumb_func_end sub_8059348

	thumb_func_start player_npc_set_state_and_x22_etc
player_npc_set_state_and_x22_etc: @ 8059370
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	bl PlayerIsAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _0805939E
	adds r0, r4, 0
	bl player_set_x22
	ldr r0, _080593A4
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080593A8
	adds r0, r1
	adds r1, r5, 0
	bl FieldObjectSetSpecialAnim
_0805939E:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080593A4: .4byte 0x0202e858
_080593A8: .4byte 0x030048a0
	thumb_func_end player_npc_set_state_and_x22_etc

	thumb_func_start PlayerGoSpeed0
PlayerGoSpeed0: @ 80593AC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetGoSpeed0AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end PlayerGoSpeed0

	thumb_func_start sub_80593C4
sub_80593C4: @ 80593C4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060744
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_80593C4

	thumb_func_start npc_use_some_d2s
npc_use_some_d2s: @ 80593DC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl d2s_08064034
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end npc_use_some_d2s

	thumb_func_start sub_80593F4
sub_80593F4: @ 80593F4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_806079C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_80593F4

	thumb_func_start sub_805940C
sub_805940C: @ 805940C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80607F4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_805940C

	thumb_func_start PlayerOnBikeCollide
PlayerOnBikeCollide: @ 8059424
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PlayCollisionSoundIfNotFacingWarp
	adds r0, r4, 0
	bl GetStepInPlaceDelay16AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerOnBikeCollide

	thumb_func_start PlayerNotOnBikeCollide
PlayerNotOnBikeCollide: @ 8059448
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl PlayCollisionSoundIfNotFacingWarp
	adds r0, r4, 0
	bl GetStepInPlaceDelay32AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerNotOnBikeCollide

	thumb_func_start PlayerFaceDirection
PlayerFaceDirection: @ 805946C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end PlayerFaceDirection

	thumb_func_start PlayerTurnInPlace
PlayerTurnInPlace: @ 8059484
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl GetStepInPlaceDelay8AnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end PlayerTurnInPlace

	thumb_func_start PlayerJumpLedge
PlayerJumpLedge: @ 805949C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0xA
	bl audio_play
	adds r0, r4, 0
	bl GetJumpLedgeAnimId
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x8
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end PlayerJumpLedge

	thumb_func_start sub_80594C0
sub_80594C0: @ 80594C0
	push {r4,lr}
	ldr r4, _080594FC
	ldrb r0, [r4, 0x3]
	cmp r0, 0x2
	beq _080594CE
	cmp r0, 0
	bne _080594F6
_080594CE:
	bl player_should_look_direction_be_enforced_upon_movement
	lsls r0, 24
	cmp r0, 0
	beq _080594F6
	ldr r2, _08059500
	ldrb r1, [r4, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	lsls r0, 24
	lsrs r0, 24
	bl sub_8059348
_080594F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080594FC: .4byte 0x0202e858
_08059500: .4byte 0x030048a0
	thumb_func_end sub_80594C0

	thumb_func_start sub_8059504
sub_8059504: @ 8059504
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_80609D8
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059504

	thumb_func_start sub_805951C
sub_805951C: @ 805951C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060A04
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_805951C

	thumb_func_start sub_8059534
sub_8059534: @ 8059534
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060A30
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059534

	thumb_func_start sub_805954C
sub_805954C: @ 805954C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x22
	bl audio_play
	adds r0, r4, 0
	bl sub_8060A5C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805954C

	thumb_func_start sub_8059570
sub_8059570: @ 8059570
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x22
	bl audio_play
	adds r0, r4, 0
	bl sub_8060A88
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8059570

	thumb_func_start sub_8059594
sub_8059594: @ 8059594
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x22
	bl audio_play
	adds r0, r4, 0
	bl sub_8060AB4
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x8
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8059594

	thumb_func_start sub_80595B8
sub_80595B8: @ 80595B8
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x22
	bl audio_play
	adds r0, r4, 0
	bl sub_8060878
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80595B8

	thumb_func_start sub_80595DC
sub_80595DC: @ 80595DC
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0x7
	bl audio_play
	adds r0, r4, 0
	bl sub_8060AE0
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80595DC

	thumb_func_start sub_8059600
sub_8059600: @ 8059600
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060B0C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059600

	thumb_func_start sub_8059618
sub_8059618: @ 8059618
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060B38
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059618

	thumb_func_start sub_8059630
sub_8059630: @ 8059630
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8060B64
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x2
	bl player_npc_set_state_and_x22_etc
	pop {r0}
	bx r0
	thumb_func_end sub_8059630

	thumb_func_start PlayCollisionSoundIfNotFacingWarp
PlayCollisionSoundIfNotFacingWarp: @ 8059648
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r2, _080596B8
	ldr r0, _080596BC
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1E]
	ldr r2, _080596C0
	subs r1, r4, 0x1
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080596B0
	cmp r4, 0x2
	bne _080596AA
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	movs r0, 0x2
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl is_tile_x69_2_warp_door
	lsls r0, 24
	cmp r0, 0
	bne _080596B0
_080596AA:
	movs r0, 0x7
	bl audio_play
_080596B0:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080596B8: .4byte 0x030048a0
_080596BC: .4byte 0x0202e858
_080596C0: .4byte gUnknown_0830FC34
	thumb_func_end PlayCollisionSoundIfNotFacingWarp

	thumb_func_start GetXYCoordsOneStepInFrontOfPlayer
GetXYCoordsOneStepInFrontOfPlayer: @ 80596C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r3, _08059700
	ldr r2, _08059704
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x10]
	strh r0, [r4]
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x12]
	strh r0, [r5]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	adds r2, r5, 0
	bl MoveCoords
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059700: .4byte 0x030048a0
_08059704: .4byte 0x0202e858
	thumb_func_end GetXYCoordsOneStepInFrontOfPlayer

	thumb_func_start PlayerGetDestCoords
PlayerGetDestCoords: @ 8059708
	push {r4,r5,lr}
	ldr r5, _08059730
	ldr r4, _08059734
	ldrb r3, [r4, 0x5]
	lsls r2, r3, 3
	adds r2, r3
	lsls r2, 2
	adds r2, r5
	ldrh r2, [r2, 0x10]
	strh r2, [r0]
	ldrb r2, [r4, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r0, r5
	ldrh r0, [r0, 0x12]
	strh r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059730: .4byte 0x030048a0
_08059734: .4byte 0x0202e858
	thumb_func_end PlayerGetDestCoords

	thumb_func_start player_get_direction_lower_nybble
player_get_direction_lower_nybble: @ 8059738
	ldr r2, _08059750
	ldr r0, _08059754
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bx lr
	.align 2, 0
_08059750: .4byte 0x030048a0
_08059754: .4byte 0x0202e858
	thumb_func_end player_get_direction_lower_nybble

	thumb_func_start player_get_direction_upper_nybble
player_get_direction_upper_nybble: @ 8059758
	ldr r2, _0805976C
	ldr r0, _08059770
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x18]
	lsrs r0, 4
	bx lr
	.align 2, 0
_0805976C: .4byte 0x030048a0
_08059770: .4byte 0x0202e858
	thumb_func_end player_get_direction_upper_nybble

	thumb_func_start PlayerGetZCoord
PlayerGetZCoord: @ 8059774
	ldr r2, _08059788
	ldr r0, _0805978C
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	bx lr
	.align 2, 0
_08059788: .4byte 0x030048a0
_0805978C: .4byte 0x0202e858
	thumb_func_end PlayerGetZCoord

	thumb_func_start unref_sub_8059790
unref_sub_8059790: @ 8059790
	push {lr}
	adds r3, r0, 0
	adds r2, r1, 0
	ldr r0, _080597B8
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _080597BC
	adds r0, r1
	lsls r3, 16
	asrs r3, 16
	lsls r2, 16
	asrs r2, 16
	adds r1, r3, 0
	bl sub_805C058
	pop {r0}
	bx r0
	.align 2, 0
_080597B8: .4byte 0x0202e858
_080597BC: .4byte 0x030048a0
	thumb_func_end unref_sub_8059790

	thumb_func_start TestPlayerAvatarFlags
TestPlayerAvatarFlags: @ 80597C0
	ldr r1, _080597CC
	ldrb r1, [r1]
	ands r1, r0
	adds r0, r1, 0
	bx lr
	.align 2, 0
_080597CC: .4byte 0x0202e858
	thumb_func_end TestPlayerAvatarFlags

	thumb_func_start sub_80597D0
sub_80597D0: @ 80597D0
	ldr r0, _080597D8
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_080597D8: .4byte 0x0202e858
	thumb_func_end sub_80597D0

	thumb_func_start GetPlayerAvatarObjectId
GetPlayerAvatarObjectId: @ 80597DC
	ldr r0, _080597E4
	ldrb r0, [r0, 0x4]
	bx lr
	.align 2, 0
_080597E4: .4byte 0x0202e858
	thumb_func_end GetPlayerAvatarObjectId

	thumb_func_start sub_80597E8
sub_80597E8: @ 80597E8
	push {lr}
	bl ForcedMovement_None
	pop {r0}
	bx r0
	thumb_func_end sub_80597E8

	thumb_func_start sub_80597F4
sub_80597F4: @ 80597F4
	push {r4,lr}
	ldr r0, _08059834
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059838
	adds r4, r0
	adds r0, r4, 0
	bl npc_clear_strange_bits
	ldrb r1, [r4, 0x18]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x6
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0805982C
	bl sub_80E6084
	movs r0, 0
	bl sub_80E6010
_0805982C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059834: .4byte 0x0202e858
_08059838: .4byte 0x030048a0
	thumb_func_end sub_80597F4

	thumb_func_start sub_805983C
sub_805983C: @ 805983C
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08059850
	lsrs r0, 23
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08059850: .4byte gUnknown_0830FC44
	thumb_func_end sub_805983C

	thumb_func_start GetPlayerAvatarGraphicsIdByStateIdAndGender
GetPlayerAvatarGraphicsIdByStateIdAndGender: @ 8059854
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08059868
	lsrs r0, 23
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08059868: .4byte gUnknown_0830FC54
	thumb_func_end GetPlayerAvatarGraphicsIdByStateIdAndGender

	thumb_func_start GetPlayerAvatarGraphicsIdByStateId
GetPlayerAvatarGraphicsIdByStateId: @ 805986C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08059884
	ldrb r1, [r1, 0x7]
	bl GetPlayerAvatarGraphicsIdByStateIdAndGender
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08059884: .4byte 0x0202e858
	thumb_func_end GetPlayerAvatarGraphicsIdByStateId

	thumb_func_start unref_sub_8059888
unref_sub_8059888: @ 8059888
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x70
	beq _080598AA
	cmp r0, 0x70
	bgt _080598A2
	cmp r0, 0x6D
	bgt _080598AE
	cmp r0, 0x69
	blt _080598AE
	b _080598AA
_080598A2:
	cmp r1, 0x8A
	beq _080598AA
	cmp r1, 0xC0
	bne _080598AE
_080598AA:
	movs r0, 0x1
	b _080598B0
_080598AE:
	movs r0, 0
_080598B0:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8059888

	thumb_func_start GetPlayerAvatarGenderByGraphicsId
GetPlayerAvatarGenderByGraphicsId: @ 80598B4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	adds r1, r0, 0
	cmp r0, 0x70
	beq _080598D6
	cmp r0, 0x70
	bgt _080598CE
	cmp r0, 0x5D
	bgt _080598DA
	cmp r0, 0x59
	blt _080598DA
	b _080598D6
_080598CE:
	cmp r1, 0x8A
	beq _080598D6
	cmp r1, 0xC0
	bne _080598DA
_080598D6:
	movs r0, 0x1
	b _080598DC
_080598DA:
	movs r0, 0
_080598DC:
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarGenderByGraphicsId

	thumb_func_start PartyHasMonWithSurf
PartyHasMonWithSurf: @ 80598E0
	push {r4,r5,lr}
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	bne _08059924
	movs r5, 0
	b _0805990A
_080598F2:
	adds r0, r4, 0
	movs r1, 0x39
	bl pokemon_has_move
	lsls r0, 24
	cmp r0, 0
	beq _08059904
	movs r0, 0x1
	b _08059926
_08059904:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0805990A:
	cmp r5, 0x5
	bhi _08059924
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0805992C
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	bne _080598F2
_08059924:
	movs r0, 0
_08059926:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805992C: .4byte 0x03004360
	thumb_func_end PartyHasMonWithSurf

	thumb_func_start IsPlayerSurfingNorth
IsPlayerSurfingNorth: @ 8059930
	push {lr}
	bl player_get_direction_upper_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805994E
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0805994E
	movs r0, 0x1
	b _08059950
_0805994E:
	movs r0, 0
_08059950:
	pop {r1}
	bx r1
	thumb_func_end IsPlayerSurfingNorth

	thumb_func_start IsPlayerFacingSurfableFishableWater
IsPlayerFacingSurfableFishableWater: @ 8059954
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r0, _080599CC
	ldrb r0, [r0, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _080599D0
	adds r4, r0
	ldrh r1, [r4, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x2
	strh r0, [r5]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	mov r1, sp
	adds r2, r5, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	ldrb r3, [r4, 0x18]
	lsls r3, 28
	lsrs r3, 28
	adds r0, r4, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080599D4
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _080599D4
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSurfableFishableWater
	lsls r0, 24
	cmp r0, 0
	beq _080599D4
	movs r0, 0x1
	b _080599D6
	.align 2, 0
_080599CC: .4byte 0x0202e858
_080599D0: .4byte 0x030048a0
_080599D4:
	movs r0, 0
_080599D6:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsPlayerFacingSurfableFishableWater

	thumb_func_start ClearPlayerAvatarInfo
ClearPlayerAvatarInfo: @ 80599E0
	push {lr}
	ldr r0, _080599F0
	movs r1, 0
	movs r2, 0x24
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080599F0: .4byte 0x0202e858
	thumb_func_end ClearPlayerAvatarInfo

	thumb_func_start SetPlayerAvatarStateMask
SetPlayerAvatarStateMask: @ 80599F4
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _08059A08
	ldrb r2, [r3]
	movs r1, 0xE0
	ands r1, r2
	orrs r0, r1
	strb r0, [r3]
	bx lr
	.align 2, 0
_08059A08: .4byte 0x0202e858
	thumb_func_end SetPlayerAvatarStateMask

	thumb_func_start GetPlayerAvatarStateTransitionByGraphicsId
GetPlayerAvatarStateTransitionByGraphicsId: @ 8059A0C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	ldr r3, _08059A34
	lsls r0, r1, 2
	adds r0, r1
	lsls r4, r0, 1
	adds r6, r3, 0x1
_08059A22:
	lsls r0, r2, 1
	adds r1, r0, r4
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r5
	bne _08059A38
	adds r0, r1, r6
	ldrb r0, [r0]
	b _08059A44
	.align 2, 0
_08059A34: .4byte gUnknown_0830FC64
_08059A38:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bls _08059A22
	movs r0, 0x1
_08059A44:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarStateTransitionByGraphicsId

	thumb_func_start GetPlayerAvatarGraphicsIdByCurrentState
GetPlayerAvatarGraphicsIdByCurrentState: @ 8059A4C
	push {r4-r6,lr}
	ldr r0, _08059A74
	ldrb r5, [r0]
	movs r2, 0
	ldr r3, _08059A78
	ldrb r1, [r0, 0x7]
	lsls r0, r1, 2
	adds r0, r1
	lsls r4, r0, 1
	adds r6, r3, 0x1
_08059A60:
	lsls r0, r2, 1
	adds r1, r0, r4
	adds r0, r1, r6
	ldrb r0, [r0]
	ands r0, r5
	cmp r0, 0
	beq _08059A7C
	adds r0, r1, r3
	ldrb r0, [r0]
	b _08059A88
	.align 2, 0
_08059A74: .4byte 0x0202e858
_08059A78: .4byte gUnknown_0830FC64
_08059A7C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x4
	bls _08059A60
	movs r0, 0
_08059A88:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetPlayerAvatarGraphicsIdByCurrentState

	thumb_func_start SetPlayerAvatarExtraStateTransition
SetPlayerAvatarExtraStateTransition: @ 8059A90
	push {r4,r5,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _08059ABC
	ldrb r1, [r5, 0x7]
	bl GetPlayerAvatarStateTransitionByGraphicsId
	lsls r0, 24
	lsrs r0, 24
	orrs r0, r4
	ldrb r1, [r5, 0x1]
	orrs r0, r1
	strb r0, [r5, 0x1]
	bl DoPlayerAvatarTransition
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059ABC: .4byte 0x0202e858
	thumb_func_end SetPlayerAvatarExtraStateTransition

	thumb_func_start InitPlayerAvatar
InitPlayerAvatar: @ 8059AC0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x18
	adds r4, r0, 0
	adds r5, r1, 0
	mov r9, r2
	mov r8, r3
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r1, sp
	movs r0, 0xFF
	strb r0, [r1]
	movs r0, 0
	mov r1, r8
	bl GetPlayerAvatarGraphicsIdByStateIdAndGender
	mov r1, sp
	movs r3, 0
	strb r0, [r1, 0x1]
	mov r0, sp
	lsls r4, 16
	asrs r4, 16
	subs r4, 0x7
	movs r6, 0
	strh r4, [r0, 0x4]
	lsls r5, 16
	asrs r5, 16
	subs r5, 0x7
	strh r5, [r0, 0x6]
	strb r6, [r0, 0x8]
	movs r0, 0xB
	strb r0, [r1, 0x9]
	mov r2, sp
	ldrb r1, [r2, 0xA]
	subs r0, 0x1B
	ands r0, r1
	strb r0, [r2, 0xA]
	mov r0, sp
	strb r6, [r0, 0xA]
	strh r3, [r0, 0xC]
	strh r3, [r0, 0xE]
	str r3, [sp, 0x10]
	strh r3, [r0, 0x14]
	bl SpawnSpecialFieldObject
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, r5, 3
	adds r4, r5
	lsls r4, 2
	ldr r0, _08059B80
	adds r4, r0
	ldrb r0, [r4, 0x2]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4, 0x2]
	bl sub_8126B54
	strb r0, [r4, 0x1B]
	adds r0, r4, 0
	mov r1, r9
	bl FieldObjectTurn
	bl ClearPlayerAvatarInfo
	ldr r0, _08059B84
	strb r6, [r0, 0x2]
	strb r6, [r0, 0x3]
	strb r5, [r0, 0x5]
	ldrb r1, [r4, 0x4]
	strb r1, [r0, 0x4]
	mov r1, r8
	strb r1, [r0, 0x7]
	movs r0, 0x21
	bl SetPlayerAvatarStateMask
	add sp, 0x18
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059B80: .4byte 0x030048a0
_08059B84: .4byte 0x0202e858
	thumb_func_end InitPlayerAvatar

	thumb_func_start sub_8059B88
sub_8059B88: @ 8059B88
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r6, _08059BE8
	ldr r5, _08059BEC
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r6
	movs r0, 0x1
	ands r4, r0
	lsls r3, r4, 5
	ldrb r2, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1, 0x1]
	movs r0, 0x8
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _08059BE0
	ldr r2, _08059BF0
	ldrb r1, [r5, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	ldrb r0, [r0, 0x1A]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	adds r1, 0x3E
	lsls r3, r4, 2
	ldrb r2, [r1]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_08059BE0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059BE8: .4byte 0x030048a0
_08059BEC: .4byte 0x0202e858
_08059BF0: .4byte 0x02020004
	thumb_func_end sub_8059B88

	thumb_func_start sub_8059BF4
sub_8059BF4: @ 8059BF4
	push {r4,r5,lr}
	ldr r5, _08059C30
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059C34
	adds r4, r0
	movs r0, 0x5
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _08059C38
	adds r0, r1
	movs r1, 0
	bl StartSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059C30: .4byte 0x0202e858
_08059C34: .4byte 0x030048a0
_08059C38: .4byte 0x02020004
	thumb_func_end sub_8059BF4

	thumb_func_start sub_8059C3C
sub_8059C3C: @ 8059C3C
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08059C88
	ldrb r0, [r6, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059C8C
	adds r4, r0
	movs r0, 0x6
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059C90
	adds r4, r0
	adds r0, r5, 0
	bl sub_805FDE8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059C88: .4byte 0x0202e858
_08059C8C: .4byte 0x030048a0
_08059C90: .4byte 0x02020004
	thumb_func_end sub_8059C3C

	thumb_func_start sub_8059C94
sub_8059C94: @ 8059C94
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08059CFC
	ldrb r0, [r6, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059D00
	adds r4, r0
	movs r0, 0x2
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059D04
	mov r8, r0
	add r4, r8
	adds r0, r5, 0
	bl sub_805FD98
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r8
	movs r1, 0x1
	bl SeekSpriteAnim
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059CFC: .4byte 0x0202e858
_08059D00: .4byte 0x030048a0
_08059D04: .4byte 0x02020004
	thumb_func_end sub_8059C94

	thumb_func_start sub_8059D08
sub_8059D08: @ 8059D08
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08059D54
	ldrb r0, [r6, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059D58
	adds r4, r0
	movs r0, 0x7
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _08059D5C
	adds r4, r0
	adds r0, r5, 0
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059D54: .4byte 0x0202e858
_08059D58: .4byte 0x030048a0
_08059D5C: .4byte 0x02020004
	thumb_func_end sub_8059D08

	thumb_func_start sub_8059D60
sub_8059D60: @ 8059D60
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	ldrb r0, [r5, 0x1E]
	mov r8, r0
	movs r1, 0
	mov r0, sp
	strh r1, [r0]
	movs r6, 0x1
	ldr r1, _08059DC4
	mov r9, r1
	mov r4, sp
	mov r7, sp
	adds r7, 0x2
_08059D82:
	movs r1, 0
	ldrsh r0, [r4, r1]
	lsls r0, 2
	add r0, r9
	ldr r1, [r0]
	mov r0, r8
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _08059DC8
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	cmp r6, r0
	bne _08059DC8
	ldrh r0, [r5, 0x10]
	strh r0, [r4]
	ldrh r0, [r5, 0x12]
	strh r0, [r7]
	adds r0, r6, 0
	mov r1, sp
	adds r2, r7, 0
	bl MoveCoords
	ldrb r0, [r5, 0x1B]
	movs r1, 0
	ldrsh r2, [r4, r1]
	movs r1, 0
	ldrsh r3, [r7, r1]
	adds r1, r6, 0
	bl sub_8126BC4
	b _08059DE2
	.align 2, 0
_08059DC4: .4byte gUnknown_0830FC78
_08059DC8:
	ldrh r1, [r4]
	adds r1, 0x1
	strh r1, [r4]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	asrs r1, 16
	cmp r1, 0x3
	ble _08059D82
	ldrb r0, [r5, 0x1B]
	bl objid_set_invisible
_08059DE2:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8059D60

	thumb_func_start task_add_bump_boulder
task_add_bump_boulder: @ 8059DF0
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _08059E24
	adds r0, r6, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08059E28
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0xA]
	strh r5, [r1, 0xC]
	bl _call_via_r6
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059E24: .4byte sub_8059E2C
_08059E28: .4byte 0x03004b20
	thumb_func_end task_add_bump_boulder

	thumb_func_start sub_8059E2C
sub_8059E2C: @ 8059E2C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r6, _08059E74
	ldr r2, _08059E78
	ldr r5, _08059E7C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08059E40:
	movs r0, 0x8
	ldrsh r3, [r4, r0]
	lsls r3, 2
	adds r3, r6
	ldr r0, _08059E80
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r5
	movs r2, 0xA
	ldrsh r0, [r4, r2]
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r5
	ldr r3, [r3]
	adds r0, r4, 0
	bl _call_via_r3
	lsls r0, 24
	cmp r0, 0
	bne _08059E40
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059E74: .4byte gUnknown_0830FC88
_08059E78: .4byte 0x03004b20
_08059E7C: .4byte 0x030048a0
_08059E80: .4byte 0x0202e858
	thumb_func_end sub_8059E2C

	thumb_func_start sub_8059E84
sub_8059E84: @ 8059E84
	push {r4,lr}
	adds r4, r0, 0
	bl script_env_2_enable
	ldr r1, _08059EA0
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08059EA0: .4byte 0x0202e858
	thumb_func_end sub_8059E84

	thumb_func_start sub_8059EA4
sub_8059EA4: @ 8059EA4
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _08059F2E
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	bne _08059F2E
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldrb r0, [r6, 0xC]
	bl GetStepInPlaceDelay16AnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldrb r0, [r6, 0xC]
	bl GetSimpleGoAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldr r2, _08059F38
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, 0x12
	ldrsh r0, [r4, r1]
	str r0, [r2, 0x4]
	ldrb r0, [r4, 0xB]
	lsrs r0, 4
	str r0, [r2, 0x8]
	ldr r3, _08059F3C
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r2, 0xC]
	movs r0, 0xA
	bl FieldEffectStart
	movs r0, 0xD6
	bl audio_play
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_08059F2E:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08059F38: .4byte 0x0202ff84
_08059F3C: .4byte 0x02020004
	thumb_func_end sub_8059EA4

	thumb_func_start sub_8059F40
sub_8059F40: @ 8059F40
	push {r4,r5,lr}
	adds r4, r1, 0
	adds r5, r2, 0
	adds r0, r4, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _08059F82
	adds r0, r5, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	cmp r0, 0
	beq _08059F82
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	ldr r1, _08059F8C
	movs r0, 0
	strb r0, [r1, 0x6]
	bl script_env_2_disable
	ldr r0, _08059F90
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_08059F82:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08059F8C: .4byte 0x0202e858
_08059F90: .4byte sub_8059E2C
	thumb_func_end sub_8059F40

	thumb_func_start sub_8059F94
sub_8059F94: @ 8059F94
	push {r4,lr}
	ldr r4, _08059FB0
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059FB0: .4byte sub_8059FB4
	thumb_func_end sub_8059F94

	thumb_func_start sub_8059FB4
sub_8059FB4: @ 8059FB4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _08059FF0
	ldr r2, _08059FF4
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_08059FC6:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _08059FF8
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _08059FFC
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _08059FC6
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059FF0: .4byte gUnknown_0830FC94
_08059FF4: .4byte 0x03004b20
_08059FF8: .4byte 0x0202e858
_08059FFC: .4byte 0x030048a0
	thumb_func_end sub_8059FB4

	thumb_func_start sub_805A000
sub_805A000: @ 805A000
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r4, r1, 0
	ldr r5, _0805A064
	movs r0, 0x1
	strb r0, [r5, 0x6]
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A05C
	movs r0, 0xA
	bl audio_play
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_806084C
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	ldrh r0, [r6, 0xA]
	adds r0, 0x1
	strh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x1
	ble _0805A05C
	movs r0, 0
	strb r0, [r5, 0x6]
	ldrb r0, [r5, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5, 0x1]
	ldr r0, _0805A068
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A05C:
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A064: .4byte 0x0202e858
_0805A068: .4byte sub_8059FB4
	thumb_func_end sub_805A000

	thumb_func_start sub_805A06C
sub_805A06C: @ 805A06C
	push {r4,lr}
	ldr r4, _0805A088
	adds r0, r4, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A088: .4byte sub_805A08C
	thumb_func_end sub_805A06C

	thumb_func_start sub_805A08C
sub_805A08C: @ 805A08C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805A0C8
	ldr r2, _0805A0CC
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805A09E:
	movs r0, 0x8
	ldrsh r2, [r4, r0]
	lsls r2, 2
	adds r2, r5
	ldr r0, _0805A0D0
	ldrb r0, [r0, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805A0D4
	adds r1, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _0805A09E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A0C8: .4byte gUnknown_0830FC98
_0805A0CC: .4byte 0x03004b20
_0805A0D0: .4byte 0x0202e858
_0805A0D4: .4byte 0x030048a0
	thumb_func_end sub_805A08C

	thumb_func_start sub_805A0D8
sub_805A0D8: @ 805A0D8
	push {lr}
	ldrh r2, [r0, 0x8]
	adds r2, 0x1
	strh r2, [r0, 0x8]
	ldrb r1, [r1, 0x18]
	lsrs r1, 4
	strh r1, [r0, 0xA]
	ldr r1, _0805A0FC
	movs r0, 0x1
	strb r0, [r1, 0x6]
	bl script_env_2_enable
	movs r0, 0x2D
	bl audio_play
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0805A0FC: .4byte 0x0202e858
	thumb_func_end sub_805A0D8

	thumb_func_start sub_805A100
sub_805A100: @ 805A100
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805A174
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A168
	ldrb r0, [r5, 0x18]
	lsrs r0, 4
	subs r0, 0x1
	add r0, sp
	ldrb r6, [r0]
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldrb r0, [r4, 0xA]
	cmp r6, r0
	bne _0805A146
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_0805A146:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r1, 0xC
	ldrsh r0, [r4, r1]
	cmp r0, 0x3
	ble _0805A168
	ldrb r0, [r4, 0xA]
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	cmp r6, r0
	bne _0805A168
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0805A168:
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A174: .4byte gUnknown_0830FCA8
	thumb_func_end sub_805A100

	thumb_func_start sub_805A178
sub_805A178: @ 805A178
	push {r4,r5,lr}
	sub sp, 0x8
	adds r5, r0, 0
	adds r4, r1, 0
	ldr r1, _0805A1B4
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A1A8
	movs r1, 0xC
	ldrsh r0, [r5, r1]
	add r0, sp
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0x1
	strh r0, [r5, 0x8]
_0805A1A8:
	movs r0, 0
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A1B4: .4byte gUnknown_0830FCAC
	thumb_func_end sub_805A178

	thumb_func_start sub_805A1B8
sub_805A1B8: @ 805A1B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A1FC
	ldrb r0, [r4, 0xA]
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetSimpleGoAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	bl script_env_2_disable
	ldr r1, _0805A204
	movs r0, 0
	strb r0, [r1, 0x6]
	ldr r0, _0805A208
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A1FC:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A204: .4byte 0x0202e858
_0805A208: .4byte sub_805A08C
	thumb_func_end sub_805A1B8

	thumb_func_start sub_805A20C
sub_805A20C: @ 805A20C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl script_env_2_enable
	bl sav1_reset_battle_music_maybe
	bl sub_8053F84
	ldr r2, _0805A258
	ldrb r1, [r2]
	movs r0, 0xF7
	ands r0, r1
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strb r0, [r2, 0x6]
	ldr r5, _0805A25C
	adds r0, r5, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805A260
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A258: .4byte 0x0202e858
_0805A25C: .4byte taskFF_0805D1D4
_0805A260: .4byte 0x03004b20
	thumb_func_end sub_805A20C

	thumb_func_start taskFF_0805D1D4
taskFF_0805D1D4: @ 805A264
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r0, _0805A2C0
	ldrb r1, [r0, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805A2C4
	adds r5, r0, r1
	adds r0, r5, 0
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0805A290
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A2B8
_0805A290:
	ldrb r0, [r5, 0x1A]
	movs r1, 0x2
	bl sub_8127ED0
	ldr r0, _0805A2C8
	lsls r4, r6, 2
	adds r4, r6
	lsls r4, 3
	adds r4, r0
	ldrb r0, [r4, 0x8]
	bl sub_80608D0
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl FieldObjectSetSpecialAnim
	ldr r0, _0805A2CC
	str r0, [r4]
_0805A2B8:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A2C0: .4byte 0x0202e858
_0805A2C4: .4byte 0x030048a0
_0805A2C8: .4byte 0x03004b20
_0805A2CC: .4byte sub_805A2D0
	thumb_func_end taskFF_0805D1D4

	thumb_func_start sub_805A2D0
sub_805A2D0: @ 805A2D0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r6, _0805A33C
	ldrb r1, [r6, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805A340
	adds r4, r0, r1
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
	lsls r0, 24
	cmp r0, 0
	beq _0805A336
	movs r0, 0
	bl GetPlayerAvatarGraphicsIdByStateId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	movs r0, 0
	strb r0, [r6, 0x6]
	bl script_env_2_disable
	ldrb r1, [r4, 0x1A]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805A344
	adds r0, r1
	bl DestroySprite
	adds r0, r5, 0
	bl DestroyTask
_0805A336:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A33C: .4byte 0x0202e858
_0805A340: .4byte 0x030048a0
_0805A344: .4byte 0x02020004
	thumb_func_end sub_805A2D0

	thumb_func_start StartFishing
StartFishing: @ 805A348
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0805A374
	adds r0, r5, 0
	movs r1, 0xFF
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805A378
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x26]
	bl _call_via_r5
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A374: .4byte sub_805A37C
_0805A378: .4byte 0x03004b20
	thumb_func_end StartFishing

	thumb_func_start sub_805A37C
sub_805A37C: @ 805A37C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805A3AC
	ldr r2, _0805A3B0
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r4, r1, r2
_0805A38E:
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	lsls r0, 2
	adds r0, r5
	ldr r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _0805A38E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A3AC: .4byte gUnknown_0830FCB4
_0805A3B0: .4byte 0x03004b20
	thumb_func_end sub_805A37C

	thumb_func_start sub_805A3B4
sub_805A3B4: @ 805A3B4
	push {r4,lr}
	adds r4, r0, 0
	bl script_env_2_enable
	ldr r1, _0805A3D0
	movs r0, 0x1
	strb r0, [r1, 0x6]
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A3D0: .4byte 0x0202e858
	thumb_func_end sub_805A3B4

	thumb_func_start fish1
fish1: @ 805A3D4
	push {r4-r6,lr}
	sub sp, 0x10
	adds r5, r0, 0
	ldr r1, _0805A45C
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r4, sp, 0x8
	ldr r1, _0805A460
	adds r0, r4, 0
	movs r2, 0x6
	bl memcpy
	movs r0, 0
	strh r0, [r5, 0x20]
	bl Random
	movs r2, 0x26
	ldrsh r1, [r5, r2]
	lsls r1, 1
	mov r2, sp
	adds r6, r2, r1
	lsls r0, 16
	lsrs r0, 16
	adds r4, r1
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl __modsi3
	ldrh r1, [r6]
	adds r1, r0
	strh r1, [r5, 0x22]
	ldr r3, _0805A464
	ldr r2, _0805A468
	ldrb r1, [r2, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrb r0, [r0, 0x5]
	strh r0, [r5, 0x24]
	ldrb r0, [r2, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r3
	adds r0, r4, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
	ldrb r0, [r4, 0x1]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x1]
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_8059C3C
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0
	add sp, 0x10
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805A45C: .4byte gUnknown_0830FCF4
_0805A460: .4byte gUnknown_0830FCFA
_0805A464: .4byte 0x030048a0
_0805A468: .4byte 0x0202e858
	thumb_func_end fish1

	thumb_func_start fish2
fish2: @ 805A46C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldrh r0, [r4, 0xA]
	adds r0, 0x1
	strh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x3B
	ble _0805A488
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
_0805A488:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end fish2

	thumb_func_start fish3
fish3: @ 805A490
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8071FFC
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	strh r1, [r4, 0xC]
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0xA
	bl __umodsi3
	adds r1, r0, 0
	adds r0, r1, 0x1
	strh r0, [r4, 0xE]
	movs r2, 0x20
	ldrsh r0, [r4, r2]
	cmp r0, 0
	bne _0805A4C4
	adds r0, r1, 0x4
	strh r0, [r4, 0xE]
_0805A4C4:
	movs r1, 0xE
	ldrsh r0, [r4, r1]
	cmp r0, 0x9
	ble _0805A4D0
	movs r0, 0xA
	strh r0, [r4, 0xE]
_0805A4D0:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end fish3

	thumb_func_start fish4
fish4: @ 805A4D8
	push {r4,lr}
	sub sp, 0x4
	adds r4, r0, 0
	ldr r1, _0805A514
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	bl sub_805A954
	ldrh r0, [r4, 0xA]
	adds r2, r0, 0x1
	strh r2, [r4, 0xA]
	ldr r0, _0805A518
	ldrh r0, [r0, 0x2E]
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0805A51C
	movs r0, 0xB
	strh r0, [r4, 0x8]
	movs r1, 0x20
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0805A50E
	movs r0, 0xC
	strh r0, [r4, 0x8]
_0805A50E:
	movs r0, 0x1
	b _0805A564
	.align 2, 0
_0805A514: .4byte gUnknown_0830FD00
_0805A518: .4byte 0x03001770
_0805A51C:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0x13
	ble _0805A562
	strh r1, [r4, 0xA]
	ldrh r2, [r4, 0xC]
	movs r3, 0xC
	ldrsh r1, [r4, r3]
	movs r3, 0xE
	ldrsh r0, [r4, r3]
	cmp r1, r0
	blt _0805A54E
	ldrh r0, [r4, 0x8]
	adds r1, r0, 0x1
	strh r1, [r4, 0x8]
	ldrh r2, [r4, 0x20]
	movs r3, 0x20
	ldrsh r0, [r4, r3]
	cmp r0, 0
	beq _0805A548
	adds r0, r1, 0x1
	strh r0, [r4, 0x8]
_0805A548:
	adds r0, r2, 0x1
	strh r0, [r4, 0x20]
	b _0805A562
_0805A54E:
	adds r1, r2, 0x4
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	movs r2, 0xF
	bl Print
	ldrh r0, [r4, 0xC]
	adds r0, 0x1
	strh r0, [r4, 0xC]
_0805A562:
	movs r0, 0
_0805A564:
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end fish4

	thumb_func_start party_menu_update_status_condition_object
party_menu_update_status_condition_object: @ 805A56C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	bl GetFishingWildMonListHeader
	lsls r0, 24
	cmp r0, 0
	beq _0805A590
	bl Random
	movs r1, 0x1
	ands r1, r0
	cmp r1, 0
	beq _0805A596
_0805A590:
	movs r0, 0xB
	strh r0, [r4, 0x8]
	b _0805A5BC
_0805A596:
	ldr r0, _0805A5C4
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A5C8
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FE08
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805A5BC:
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A5C4: .4byte 0x0202e858
_0805A5C8: .4byte 0x02020004
	thumb_func_end party_menu_update_status_condition_object

	thumb_func_start sub_805A5CC
sub_805A5CC: @ 805A5CC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldr r0, _0805A5F0
	movs r1, 0x4
	movs r2, 0x11
	bl Print
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A5F0: .4byte gUnknown_0842C5BB
	thumb_func_end sub_805A5CC

	thumb_func_start fish7
fish7: @ 805A5F4
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldr r1, _0805A628
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	bl sub_805A954
	ldrh r1, [r4, 0xA]
	adds r1, 0x1
	strh r1, [r4, 0xA]
	movs r2, 0x26
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	lsls r1, 16
	asrs r1, 16
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _0805A62C
	movs r0, 0xC
	b _0805A63C
	.align 2, 0
_0805A628: .4byte gUnknown_0830FD02
_0805A62C:
	ldr r0, _0805A648
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805A63E
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
_0805A63C:
	strh r0, [r4, 0x8]
_0805A63E:
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A648: .4byte 0x03001770
	thumb_func_end fish7

	thumb_func_start fish8
fish8: @ 805A64C
	push {r4,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r1, _0805A6B0
	mov r0, sp
	movs r2, 0xC
	bl memcpy
	bl sub_805A954
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0x20
	ldrsh r1, [r4, r0]
	movs r2, 0x22
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0805A6A2
	cmp r1, 0x1
	bgt _0805A6A6
	bl Random
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	bl __umodsi3
	movs r3, 0x20
	ldrsh r2, [r4, r3]
	lsls r2, 1
	movs r3, 0x26
	ldrsh r1, [r4, r3]
	lsls r1, 2
	adds r2, r1
	mov r3, sp
	adds r1, r3, r2
	movs r2, 0
	ldrsh r1, [r1, r2]
	lsls r0, 16
	asrs r0, 16
	cmp r1, r0
	ble _0805A6A6
_0805A6A2:
	movs r0, 0x3
	strh r0, [r4, 0x8]
_0805A6A6:
	movs r0, 0
	add sp, 0xC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A6B0: .4byte gUnknown_0830FD08
	thumb_func_end fish8

	thumb_func_start sub_805A6B4
sub_805A6B4: @ 805A6B4
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	ldr r0, _0805A6D8
	bl sub_8072044
	bl sub_8071FFC
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	movs r1, 0
	strh r0, [r4, 0x8]
	strh r1, [r4, 0xA]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805A6D8: .4byte gUnknown_0842C5C7
	thumb_func_end sub_805A6B4

	thumb_func_start sub_805A6DC
sub_805A6DC: @ 805A6DC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805A780
	bl sub_805A954
	movs r0, 0xA
	ldrsh r6, [r5, r0]
	cmp r6, 0
	bne _0805A780
	bl sub_8072080
	lsls r0, 24
	cmp r0, 0
	beq _0805A778
	ldr r7, _0805A76C
	ldrb r0, [r7, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r1, _0805A770
	mov r8, r1
	add r4, r8
	ldrh r1, [r5, 0x24]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	ldrb r1, [r7]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805A746
	ldrb r0, [r7, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x1A]
	movs r1, 0
	movs r2, 0
	bl sub_8127F28
_0805A746:
	ldr r2, _0805A774
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x24]
	ldrb r1, [r7, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x26]
	bl sub_8071EF4
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	strh r0, [r5, 0xA]
	b _0805A7A8
	.align 2, 0
_0805A76C: .4byte 0x0202e858
_0805A770: .4byte 0x030048a0
_0805A774: .4byte 0x02020004
_0805A778:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _0805A7A8
_0805A780:
	ldr r1, _0805A7B4
	movs r0, 0
	strb r0, [r1, 0x6]
	bl script_env_2_disable
	ldrh r0, [r5, 0x26]
	lsls r0, 24
	lsrs r0, 24
	bl sub_808541C
	movs r0, 0x1
	bl sub_80BE97C
	ldr r0, _0805A7B8
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A7A8:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805A7B4: .4byte 0x0202e858
_0805A7B8: .4byte sub_805A37C
	thumb_func_end sub_805A6DC

	thumb_func_start sub_805A7BC
sub_805A7BC: @ 805A7BC
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_805A954
	ldr r0, _0805A7FC
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A800
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FDF8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _0805A804
	bl sub_8072044
	movs r0, 0xD
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A7FC: .4byte 0x0202e858
_0805A800: .4byte 0x02020004
_0805A804: .4byte gUnknown_0842C5E2
	thumb_func_end sub_805A7BC

	thumb_func_start sub_805A808
sub_805A808: @ 805A808
	push {r4,r5,lr}
	adds r5, r0, 0
	bl sub_805A954
	ldr r0, _0805A84C
	ldrb r0, [r0, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A850
	adds r4, r0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	bl sub_805FDF8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldr r0, _0805A854
	bl sub_8072044
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805A84C: .4byte 0x0202e858
_0805A850: .4byte 0x02020004
_0805A854: .4byte gUnknown_0842C5F9
	thumb_func_end sub_805A808

	thumb_func_start fishD
fishD: @ 805A858
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805A954
	bl sub_8071FFC
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end fishD

	thumb_func_start sub_805A874
sub_805A874: @ 805A874
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	bl sub_805A954
	ldr r7, _0805A908
	ldr r5, _0805A90C
	ldrb r0, [r5, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r7
	adds r1, 0x3F
	ldrb r0, [r1]
	lsls r0, 27
	cmp r0, 0
	bge _0805A8FA
	ldrb r0, [r5, 0x5]
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	ldr r0, _0805A910
	mov r8, r0
	add r4, r8
	ldrh r1, [r6, 0x24]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_805B980
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl FieldObjectTurn
	ldrb r1, [r5]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805A8DA
	ldrb r0, [r5, 0x5]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	add r1, r8
	ldrb r0, [r1, 0x1A]
	movs r1, 0
	movs r2, 0
	bl sub_8127F28
_0805A8DA:
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	movs r2, 0
	strh r2, [r0, 0x24]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r7
	strh r2, [r0, 0x26]
	ldrh r0, [r6, 0x8]
	adds r0, 0x1
	strh r0, [r6, 0x8]
_0805A8FA:
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805A908: .4byte 0x02020004
_0805A90C: .4byte 0x0202e858
_0805A910: .4byte 0x030048a0
	thumb_func_end sub_805A874

	thumb_func_start fishF
fishF: @ 805A914
	push {lr}
	bl sub_8072080
	lsls r0, 24
	cmp r0, 0
	beq _0805A946
	ldr r1, _0805A94C
	movs r0, 0
	strb r0, [r1, 0x6]
	bl script_env_2_disable
	bl sub_806451C
	bl sub_8071EF4
	movs r0, 0
	bl sub_80BE97C
	ldr r0, _0805A950
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	bl DestroyTask
_0805A946:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0805A94C: .4byte 0x0202e858
_0805A950: .4byte sub_805A37C
	thumb_func_end fishF

	thumb_func_start sub_805A954
sub_805A954: @ 805A954
	push {r4-r7,lr}
	ldr r0, _0805AA40
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805AA44
	adds r4, r0, r1
	adds r0, r4, 0
	bl AnimateSprite
	movs r0, 0
	strh r0, [r4, 0x24]
	strh r0, [r4, 0x26]
	adds r0, r4, 0
	adds r0, 0x2B
	ldrb r5, [r0]
	movs r0, 0x2A
	adds r0, r4
	mov r12, r0
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	lsls r6, r5, 2
	adds r0, r6, r0
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r7, 0x1
	negs r7, r7
	cmp r0, r7
	beq _0805A9C6
	adds r3, r4, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	lsls r1, r2, 26
	lsrs r1, 26
	adds r1, 0x1
	movs r0, 0x3F
	ands r1, r0
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	mov r1, r12
	ldrb r0, [r1]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	adds r0, r6, r0
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, r7
	bne _0805A9CC
_0805A9C6:
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0805A9CC:
	adds r0, r4, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	ldr r1, [r4, 0x8]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r5, 2
	adds r0, r1
	ldrb r5, [r0]
	subs r0, r5, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bhi _0805A9FE
	movs r0, 0x8
	strh r0, [r4, 0x24]
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805A9FE
	ldr r0, _0805AA48
	strh r0, [r4, 0x24]
_0805A9FE:
	cmp r5, 0x5
	bne _0805AA06
	ldr r0, _0805AA48
	strh r0, [r4, 0x26]
_0805AA06:
	adds r0, r5, 0
	subs r0, 0xA
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0805AA16
	movs r0, 0x8
	strh r0, [r4, 0x26]
_0805AA16:
	ldr r3, _0805AA40
	ldrb r1, [r3]
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _0805AA3A
	ldr r2, _0805AA4C
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1A]
	movs r1, 0x26
	ldrsh r2, [r4, r1]
	movs r1, 0x1
	bl sub_8127F28
_0805AA3A:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AA40: .4byte 0x0202e858
_0805AA44: .4byte 0x02020004
_0805AA48: .4byte 0x0000fff8
_0805AA4C: .4byte 0x030048a0
	thumb_func_end sub_805A954

	thumb_func_start npc_clear_ids_and_state
npc_clear_ids_and_state: @ 805AA50
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	movs r2, 0x24
	bl memset
	movs r0, 0xFF
	strb r0, [r4, 0x8]
	movs r0, 0x1
	negs r0, r0
	strb r0, [r4, 0x9]
	strb r0, [r4, 0xA]
	strb r0, [r4, 0x1C]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end npc_clear_ids_and_state

	thumb_func_start npcs_clear_ids_and_state
npcs_clear_ids_and_state: @ 805AA70
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _0805AA94
_0805AA76:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r0, r5
	bl npc_clear_ids_and_state
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0805AA76
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805AA94: .4byte 0x030048a0
	thumb_func_end npcs_clear_ids_and_state

	thumb_func_start sub_805AA98
sub_805AA98: @ 805AA98
	push {lr}
	bl strange_npc_table_clear
	bl npcs_clear_ids_and_state
	bl ClearPlayerAvatarInfo
	bl sub_805AAB0
	pop {r0}
	bx r0
	thumb_func_end sub_805AA98

	thumb_func_start sub_805AAB0
sub_805AAB0: @ 805AAB0
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	ldr r0, _0805AB4C
	ldr r0, [r0, 0x54]
	mov r9, r0
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805AB50
	mov r10, r1
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r10
	ldrb r1, [r4, 0x1]
	movs r5, 0x4
	negs r5, r5
	adds r0, r5, 0
	ands r0, r1
	movs r1, 0x1
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnim
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r6, 0x4
	orrs r0, r6
	strb r0, [r4]
	mov r0, r9
	movs r1, 0
	movs r2, 0
	movs r3, 0x1F
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	add r4, r10
	ldrb r0, [r4, 0x1]
	ands r5, r0
	mov r0, r8
	orrs r5, r0
	strb r5, [r4, 0x1]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r0, r4, 0
	movs r1, 0x1
	bl StartSpriteAffineAnim
	adds r4, 0x3E
	ldrb r0, [r4]
	orrs r0, r6
	strb r0, [r4]
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AB4C: .4byte gFieldEffectObjectTemplatePointers
_0805AB50: .4byte 0x02020004
	thumb_func_end sub_805AAB0

	thumb_func_start sub_805AB54
sub_805AB54: @ 805AB54
	push {lr}
	movs r1, 0
	ldr r2, _0805AB60
	ldrb r0, [r2]
	b _0805AB78
	.align 2, 0
_0805AB60: .4byte 0x030048a0
_0805AB64:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bhi _0805AB7E
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
_0805AB78:
	lsls r0, 31
	cmp r0, 0
	bne _0805AB64
_0805AB7E:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805AB54

	thumb_func_start GetFieldObjectIdByLocalIdAndMap
GetFieldObjectIdByLocalIdAndMap: @ 805AB84
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	cmp r0, 0xFE
	bls _0805AB9C
	bl GetFieldObjectIdByLocalId
	b _0805ABA0
_0805AB9C:
	bl GetFieldObjectIdByLocalIdAndMapInternal
_0805ABA0:
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectIdByLocalIdAndMap

	thumb_func_start TryGetFieldObjectIdByLocalIdAndMap
TryGetFieldObjectIdByLocalIdAndMap: @ 805ABA8
	push {r4,lr}
	adds r4, r3, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	bl GetFieldObjectIdByLocalIdAndMap
	strb r0, [r4]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x10
	beq _0805ABCA
	movs r0, 0
	b _0805ABCC
_0805ABCA:
	movs r0, 0x1
_0805ABCC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TryGetFieldObjectIdByLocalIdAndMap

	thumb_func_start GetFieldObjectIdByXY
GetFieldObjectIdByXY: @ 805ABD4
	push {r4-r6,lr}
	movs r3, 0
	ldr r5, _0805AC14
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r1, 16
_0805ABE2:
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r5
	ldrb r0, [r2]
	lsls r0, 31
	cmp r0, 0
	beq _0805AC02
	movs r6, 0x10
	ldrsh r0, [r2, r6]
	cmp r0, r4
	bne _0805AC02
	movs r6, 0x12
	ldrsh r0, [r2, r6]
	cmp r0, r1
	beq _0805AC0C
_0805AC02:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _0805ABE2
_0805AC0C:
	adds r0, r3, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805AC14: .4byte 0x030048a0
	thumb_func_end GetFieldObjectIdByXY

	thumb_func_start GetFieldObjectIdByLocalIdAndMapInternal
GetFieldObjectIdByLocalIdAndMapInternal: @ 805AC18
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	ldr r6, _0805AC50
_0805AC2A:
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r3, r0, r6
	ldrb r0, [r3]
	lsls r0, 31
	cmp r0, 0
	beq _0805AC54
	ldrb r0, [r3, 0x8]
	cmp r0, r5
	bne _0805AC54
	ldrb r0, [r3, 0x9]
	cmp r0, r4
	bne _0805AC54
	ldrb r0, [r3, 0xA]
	cmp r0, r2
	bne _0805AC54
	adds r0, r1, 0
	b _0805AC60
	.align 2, 0
_0805AC50: .4byte 0x030048a0
_0805AC54:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xF
	bls _0805AC2A
	movs r0, 0x10
_0805AC60:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectIdByLocalIdAndMapInternal

	thumb_func_start GetFieldObjectIdByLocalId
GetFieldObjectIdByLocalId: @ 805AC68
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	movs r2, 0
	ldr r4, _0805AC8C
_0805AC72:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _0805AC90
	ldrb r0, [r1, 0x8]
	cmp r0, r3
	bne _0805AC90
	adds r0, r2, 0
	b _0805AC9C
	.align 2, 0
_0805AC8C: .4byte 0x030048a0
_0805AC90:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0805AC72
	movs r0, 0x10
_0805AC9C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectIdByLocalId

	thumb_func_start InitFieldObjectStateFromTemplate
InitFieldObjectStateFromTemplate: @ 805ACA4
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	lsls r2, 24
	lsrs r7, r2, 24
	ldrb r0, [r5]
	adds r1, r6, 0
	adds r2, r7, 0
	mov r3, sp
	bl GetAvailableFieldObjectSlot
	lsls r0, 24
	cmp r0, 0
	beq _0805ACCE
	movs r0, 0x10
	b _0805ADC2
_0805ACCE:
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805ADD0
	adds r4, r0, r1
	adds r0, r4, 0
	bl npc_clear_ids_and_state
	ldrh r3, [r5, 0x4]
	adds r3, 0x7
	lsls r3, 16
	lsrs r3, 16
	ldrh r2, [r5, 0x6]
	adds r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0x1]
	strb r0, [r4, 0x5]
	ldrb r0, [r5, 0x9]
	strb r0, [r4, 0x6]
	ldrb r0, [r5]
	strb r0, [r4, 0x8]
	strb r6, [r4, 0x9]
	strb r7, [r4, 0xA]
	strh r3, [r4, 0xC]
	strh r2, [r4, 0xE]
	strh r3, [r4, 0x10]
	strh r2, [r4, 0x12]
	strh r3, [r4, 0x14]
	strh r2, [r4, 0x16]
	ldrb r0, [r5, 0x8]
	movs r7, 0xF
	adds r1, r7, 0
	ands r1, r0
	ldrb r2, [r4, 0xB]
	movs r0, 0x10
	negs r0, r0
	mov r8, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0xB]
	ldrb r1, [r5, 0x8]
	lsls r1, 4
	ands r0, r7
	orrs r0, r1
	strb r0, [r4, 0xB]
	ldrb r1, [r5, 0xA]
	lsls r1, 28
	movs r0, 0xF
	mov r9, r0
	lsrs r1, 28
	ldrb r2, [r4, 0x19]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x19]
	ldrb r1, [r5, 0xA]
	lsrs r1, 4
	lsls r1, 4
	ands r0, r7
	orrs r0, r1
	strb r0, [r4, 0x19]
	ldrh r0, [r5, 0xC]
	strb r0, [r4, 0x7]
	ldrh r0, [r5, 0xE]
	strb r0, [r4, 0x1D]
	ldr r1, _0805ADD4
	ldrb r0, [r5, 0x9]
	adds r0, r1
	ldrb r1, [r0]
	adds r0, r4, 0
	adds r0, 0x20
	strb r1, [r0]
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetDirection
	adds r0, r4, 0
	bl FieldObjectHandleDynamicGraphicsId
	ldr r1, _0805ADD8
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0
	beq _0805ADBE
	ldrb r2, [r4, 0x19]
	adds r0, r7, 0
	ands r0, r2
	cmp r0, 0
	bne _0805ADA6
	lsls r0, r2, 28
	lsrs r0, 28
	adds r0, 0x1
	mov r1, r9
	ands r0, r1
	mov r1, r8
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x19]
_0805ADA6:
	ldrb r2, [r4, 0x19]
	movs r0, 0xF0
	ands r0, r2
	cmp r0, 0
	bne _0805ADBE
	lsrs r1, r2, 4
	adds r1, 0x1
	lsls r1, 4
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x19]
_0805ADBE:
	mov r0, sp
	ldrb r0, [r0]
_0805ADC2:
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805ADD0: .4byte 0x030048a0
_0805ADD4: .4byte gUnknown_0836DC09
_0805ADD8: .4byte gUnknown_0836DBBC
	thumb_func_end InitFieldObjectStateFromTemplate

	thumb_func_start sub_805ADDC
sub_805ADDC: @ 805ADDC
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r0, _0805ADF4
	ldr r0, [r0, 0x4]
	cmp r0, 0
	bne _0805AE10
	b _0805AE3E
	.align 2, 0
_0805ADF4: .4byte 0x0202e828
_0805ADF8:
	ldr r1, _0805AE0C
	adds r0, r7, r1
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	adds r0, r4, 0
	bl InitFieldObjectStateFromTemplate
	lsls r0, 24
	lsrs r0, 24
	b _0805AE40
	.align 2, 0
_0805AE0C: .4byte 0xfffff3e0
_0805AE10:
	ldrb r6, [r0]
	movs r5, 0
	cmp r5, r6
	bcs _0805AE3E
	ldr r7, _0805AE4C
_0805AE1A:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	adds r4, r0, r7
	ldrb r0, [r4]
	cmp r0, r8
	bne _0805AE34
	ldrh r0, [r4, 0x14]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0805ADF8
_0805AE34:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _0805AE1A
_0805AE3E:
	movs r0, 0x10
_0805AE40:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805AE4C: .4byte 0x02026354
	thumb_func_end sub_805ADDC

	thumb_func_start GetAvailableFieldObjectSlot
GetAvailableFieldObjectSlot: @ 805AE50
	push {r4-r7,lr}
	mov r12, r3
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	movs r2, 0
	ldr r1, _0805AEAC
	ldrb r0, [r1]
	lsls r0, 31
	adds r7, r1, 0
	cmp r0, 0
	beq _0805AEA4
	adds r3, r1, 0
_0805AE70:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r3
	ldrb r0, [r1, 0x8]
	cmp r0, r6
	bne _0805AE8A
	ldrb r0, [r1, 0x9]
	cmp r0, r5
	bne _0805AE8A
	ldrb r0, [r1, 0xA]
	cmp r0, r4
	beq _0805AEA8
_0805AE8A:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bhi _0805AEA8
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0805AE70
_0805AEA4:
	cmp r2, 0xF
	bls _0805AEB0
_0805AEA8:
	movs r0, 0x1
	b _0805AEE4
	.align 2, 0
_0805AEAC: .4byte 0x030048a0
_0805AEB0:
	mov r0, r12
	strb r2, [r0]
	ldr r1, _0805AEEC
_0805AEB6:
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r0, [r3]
	lsls r0, 31
	cmp r0, 0
	beq _0805AED8
	ldrb r0, [r3, 0x8]
	cmp r0, r6
	bne _0805AED8
	ldrb r0, [r3, 0x9]
	cmp r0, r5
	bne _0805AED8
	ldrb r0, [r3, 0xA]
	cmp r0, r4
	beq _0805AEA8
_0805AED8:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xF
	bls _0805AEB6
	movs r0, 0
_0805AEE4:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805AEEC: .4byte 0x030048a0
	thumb_func_end GetAvailableFieldObjectSlot

	thumb_func_start RemoveFieldObject
RemoveFieldObject: @ 805AEF0
	push {lr}
	ldrb r2, [r0]
	movs r1, 0x2
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	bl RemoveFieldObjectInternal
	pop {r0}
	bx r0
	thumb_func_end RemoveFieldObject

	thumb_func_start RemoveFieldObjectByLocalIdAndMap
RemoveFieldObjectByLocalIdAndMap: @ 805AF04
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805AF42
	mov r0, sp
	ldrb r0, [r0]
	bl GetFieldObjectFlagIdByFieldObjectId
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805AF48
	adds r0, r1
	bl RemoveFieldObject
_0805AF42:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0805AF48: .4byte 0x030048a0
	thumb_func_end RemoveFieldObjectByLocalIdAndMap

	thumb_func_start RemoveFieldObjectInternal
RemoveFieldObjectInternal: @ 805AF4C
	push {r4,lr}
	sub sp, 0x8
	adds r4, r0, 0
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrh r2, [r0, 0x6]
	ldr r1, _0805AF90
	ldr r0, [sp, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [sp, 0x4]
	ldr r2, _0805AF94
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0xC
	adds r0, r1
	mov r1, sp
	str r1, [r0]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	bl DestroySprite
	add sp, 0x8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AF90: .4byte 0xffff0000
_0805AF94: .4byte 0x02020004
	thumb_func_end RemoveFieldObjectInternal

	thumb_func_start npc_hide_all_but_player
npc_hide_all_but_player: @ 805AF98
	push {r4,lr}
	movs r4, 0
_0805AF9C:
	ldr r0, _0805AFC4
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	beq _0805AFB2
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _0805AFC8
	adds r0, r1
	bl RemoveFieldObject
_0805AFB2:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0805AF9C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AFC4: .4byte 0x0202e858
_0805AFC8: .4byte 0x030048a0
	thumb_func_end npc_hide_all_but_player

	thumb_func_start sub_805AFCC
sub_805AFCC: @ 805AFCC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	ldr r3, [sp, 0x20]
	ldr r4, [sp, 0x24]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r3, 16
	mov r9, r3
	lsls r4, 16
	lsrs r4, 16
	mov r10, r4
	bl InitFieldObjectStateFromTemplate
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x10
	bne _0805B006
	movs r0, 0x10
	b _0805B154
_0805B006:
	mov r0, r8
	lsls r4, r0, 3
	adds r0, r4, r0
	lsls r0, 2
	ldr r1, _0805B030
	adds r5, r0, r1
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r6, r0, 0
	ldrb r1, [r6, 0xC]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _0805B034
	ldrh r0, [r6, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__no_record
	b _0805B042
	.align 2, 0
_0805B030: .4byte 0x030048a0
_0805B034:
	cmp r0, 0xA
	bne _0805B042
	ldrh r0, [r6, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805B042:
	ldrb r0, [r5, 0x6]
	cmp r0, 0x4C
	bne _0805B050
	ldrb r0, [r5, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5, 0x1]
_0805B050:
	ldr r1, _0805B084
	adds r0, r1, 0
	strh r0, [r7, 0x2]
	adds r0, r7, 0
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x40
	bne _0805B08C
	ldr r0, _0805B088
	mov r2, r8
	adds r1, r4, r2
	lsls r1, 2
	adds r1, r0
	ldrb r2, [r1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	strb r0, [r1]
	movs r0, 0x10
	b _0805B154
	.align 2, 0
_0805B084: .4byte 0x0000ffff
_0805B088: .4byte 0x030048a0
_0805B08C:
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _0805B164
	adds r4, r0, r1
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	ldrh r2, [r5, 0x10]
	adds r0, r2
	lsls r0, 16
	asrs r0, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r2, [r5, 0x12]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_8060388
	ldrh r0, [r6, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r4, 0
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r6, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r2, r4, 0
	adds r2, 0x29
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x8
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r1, 0x10
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrb r1, [r6, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	mov r0, r8
	strh r0, [r4, 0x2E]
	strb r7, [r5, 0x4]
	ldrb r1, [r6, 0xC]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 4
	ldrb r2, [r5, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _0805B13E
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805B13E:
	ldrb r0, [r5, 0xB]
	lsrs r0, 4
	adds r1, r4, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80634D0
	mov r0, r8
_0805B154:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805B164: .4byte 0x02020004
	thumb_func_end sub_805AFCC

	thumb_func_start SpawnFieldObject
SpawnFieldObject: @ 805B168
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, 0x2C
	mov r9, r0
	adds r6, r1, 0
	mov r8, r2
	adds r4, r3, 0
	ldr r5, [sp, 0x48]
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0
	str r0, [sp, 0x20]
	mov r1, r9
	ldrb r0, [r1, 0x1]
	bl GetFieldObjectGraphicsInfo
	adds r7, r0, 0
	add r2, sp, 0x20
	mov r0, r9
	add r1, sp, 0x8
	bl MakeObjectTemplateFromFieldObjectTemplate
	ldrh r3, [r7, 0x6]
	ldr r2, _0805B1E0
	add r1, sp, 0x24
	ldr r0, [r1, 0x4]
	ands r0, r2
	orrs r0, r3
	str r0, [r1, 0x4]
	str r1, [sp, 0x14]
	lsls r4, 16
	asrs r4, 16
	str r4, [sp]
	lsls r5, 16
	asrs r5, 16
	str r5, [sp, 0x4]
	mov r0, r9
	add r1, sp, 0x8
	adds r2, r6, 0
	mov r3, r8
	bl sub_805AFCC
	lsls r0, 24
	lsrs r2, r0, 24
	adds r5, r2, 0
	cmp r2, 0x10
	bne _0805B1E4
	movs r0, 0x10
	b _0805B21A
	.align 2, 0
_0805B1E0: .4byte 0xffff0000
_0805B1E4:
	ldr r4, _0805B228
	ldr r1, _0805B22C
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	adds r3, r0, r1
	ldrb r1, [r3, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r4, 0
	adds r1, 0xC
	adds r0, r1
	ldr r1, [r7, 0x1C]
	str r1, [r0]
	ldr r2, [sp, 0x20]
	cmp r2, 0
	beq _0805B218
	ldrb r1, [r3, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	adds r1, r2, 0
	bl SetSubspriteTables
_0805B218:
	adds r0, r5, 0
_0805B21A:
	add sp, 0x2C
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805B228: .4byte 0x02020004
_0805B22C: .4byte 0x030048a0
	thumb_func_end SpawnFieldObject

	thumb_func_start SpawnSpecialFieldObject
SpawnSpecialFieldObject: @ 805B230
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	mov r4, sp
	adds r4, 0x6
	add r0, sp, 0x4
	adds r1, r4, 0
	bl GetFieldObjectMovingCameraOffset
	ldr r0, _0805B268
	ldrb r1, [r0, 0x5]
	ldrb r2, [r0, 0x4]
	add r0, sp, 0x4
	movs r6, 0
	ldrsh r3, [r0, r6]
	movs r6, 0
	ldrsh r0, [r4, r6]
	str r0, [sp]
	adds r0, r5, 0
	bl SpawnFieldObject
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805B268: .4byte 0x02025734
	thumb_func_end SpawnSpecialFieldObject

	thumb_func_start SpawnSpecialFieldObjectParametrized
SpawnSpecialFieldObjectParametrized: @ 805B26C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x18
	ldr r4, [sp, 0x2C]
	ldr r5, [sp, 0x30]
	mov r8, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r3, 16
	ldr r5, _0805B2D0
	adds r3, r5
	lsrs r3, 16
	lsls r4, 16
	adds r4, r5
	lsrs r4, 16
	mov r5, sp
	movs r6, 0
	strb r2, [r5]
	mov r2, sp
	strb r0, [r2, 0x1]
	mov r0, sp
	strb r6, [r0, 0x2]
	movs r5, 0
	strh r3, [r0, 0x4]
	strh r4, [r0, 0x6]
	mov r2, r8
	strb r2, [r0, 0x8]
	strb r1, [r0, 0x9]
	mov r2, sp
	ldrb r1, [r2, 0xA]
	movs r0, 0x10
	negs r0, r0
	ands r0, r1
	strb r0, [r2, 0xA]
	mov r0, sp
	strb r5, [r0, 0xA]
	strh r6, [r0, 0xC]
	strh r6, [r0, 0xE]
	bl SpawnSpecialFieldObject
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x18
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805B2D0: .4byte 0xfff90000
	thumb_func_end SpawnSpecialFieldObjectParametrized

	thumb_func_start show_sprite
show_sprite: @ 805B2D4
	push {r4-r7,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	adds r1, r7, 0
	adds r2, r6, 0
	bl GetFieldObjectTemplateByLocalIdAndMap
	adds r5, r0, 0
	cmp r5, 0
	beq _0805B31A
	mov r4, sp
	adds r4, 0x6
	add r0, sp, 0x4
	adds r1, r4, 0
	bl GetFieldObjectMovingCameraOffset
	add r0, sp, 0x4
	movs r1, 0
	ldrsh r3, [r0, r1]
	movs r1, 0
	ldrsh r0, [r4, r1]
	str r0, [sp]
	adds r0, r5, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl SpawnFieldObject
	lsls r0, 24
	lsrs r0, 24
	b _0805B31C
_0805B31A:
	movs r0, 0x10
_0805B31C:
	add sp, 0x8
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end show_sprite

	thumb_func_start MakeObjectTemplateFromFieldObjectGraphicsInfo
MakeObjectTemplateFromFieldObjectGraphicsInfo: @ 805B324
	push {r4-r6,lr}
	adds r5, r1, 0
	adds r4, r2, 0
	adds r6, r3, 0
	lsls r0, 24
	lsrs r0, 24
	bl GetFieldObjectGraphicsInfo
	ldrh r1, [r0]
	strh r1, [r4]
	ldrh r1, [r0, 0x2]
	strh r1, [r4, 0x2]
	ldr r1, [r0, 0x10]
	str r1, [r4, 0x4]
	ldr r1, [r0, 0x18]
	str r1, [r4, 0x8]
	ldr r1, [r0, 0x1C]
	str r1, [r4, 0xC]
	ldr r1, [r0, 0x20]
	str r1, [r4, 0x10]
	str r5, [r4, 0x14]
	ldr r0, [r0, 0x14]
	str r0, [r6]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end MakeObjectTemplateFromFieldObjectGraphicsInfo

	thumb_func_start MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex
MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex: @ 805B358
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	ldr r4, _0805B374
	lsrs r1, 14
	adds r1, r4
	ldr r1, [r1]
	bl MakeObjectTemplateFromFieldObjectGraphicsInfo
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805B374: .4byte gUnknown_0836DA88
	thumb_func_end MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex

	thumb_func_start MakeObjectTemplateFromFieldObjectTemplate
MakeObjectTemplateFromFieldObjectTemplate: @ 805B378
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldrb r0, [r4, 0x1]
	ldrb r1, [r4, 0x9]
	adds r2, r5, 0
	bl MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end MakeObjectTemplateFromFieldObjectTemplate

	thumb_func_start AddPseudoFieldObject
AddPseudoFieldObject: @ 805B390
	push {r4-r6,lr}
	sub sp, 0x1C
	ldr r4, [sp, 0x2C]
	lsls r0, 16
	lsrs r0, 16
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 16
	lsrs r5, r3, 16
	lsls r4, 24
	lsrs r4, 24
	add r3, sp, 0x18
	mov r2, sp
	bl MakeObjectTemplateFromFieldObjectGraphicsInfo
	mov r0, sp
	ldrh r1, [r0, 0x2]
	ldr r0, _0805B408
	cmp r1, r0
	beq _0805B3C0
	mov r0, sp
	ldrh r0, [r0, 0x2]
	bl sub_805BDF8
_0805B3C0:
	lsls r1, r6, 16
	asrs r1, 16
	lsls r2, r5, 16
	asrs r2, 16
	mov r0, sp
	adds r3, r4, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x40
	beq _0805B3FC
	ldr r1, [sp, 0x18]
	cmp r1, 0
	beq _0805B3FC
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r0, _0805B40C
	adds r4, r0
	adds r0, r4, 0
	bl SetSubspriteTables
	adds r4, 0x42
	ldrb r1, [r4]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
_0805B3FC:
	adds r0, r5, 0
	add sp, 0x1C
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805B408: .4byte 0x0000ffff
_0805B40C: .4byte 0x02020004
	thumb_func_end AddPseudoFieldObject

	thumb_func_start sub_805B410
sub_805B410: @ 805B410
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	adds r5, r0, 0
	ldr r0, [sp, 0x44]
	ldr r4, [sp, 0x48]
	lsls r5, 24
	lsrs r5, 24
	lsls r1, 24
	lsrs r1, 24
	mov r10, r1
	add r1, sp, 0x18
	mov r8, r1
	strh r2, [r1]
	mov r6, sp
	adds r6, 0x1A
	strh r3, [r6]
	lsls r0, 24
	lsrs r7, r0, 24
	mov r9, r7
	lsls r4, 24
	lsrs r4, 24
	str r4, [sp, 0x20]
	adds r0, r5, 0
	bl GetFieldObjectGraphicsInfo
	adds r4, r0, 0
	ldr r1, _0805B550
	add r3, sp, 0x1C
	adds r0, r5, 0
	mov r2, sp
	bl MakeObjectTemplateFromFieldObjectGraphicsInfo
	mov r1, sp
	ldr r2, _0805B554
	adds r0, r2, 0
	strh r0, [r1, 0x2]
	mov r1, r8
	movs r2, 0
	ldrsh r0, [r1, r2]
	adds r0, 0x7
	strh r0, [r1]
	movs r1, 0
	ldrsh r0, [r6, r1]
	adds r0, 0x7
	strh r0, [r6]
	mov r0, r8
	adds r1, r6, 0
	movs r2, 0x8
	movs r3, 0x10
	bl sub_8060470
	mov r2, r8
	movs r0, 0
	ldrsh r1, [r2, r0]
	movs r0, 0
	ldrsh r2, [r6, r0]
	mov r0, sp
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x40
	beq _0805B53C
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	ldr r1, _0805B558
	adds r5, r0, r1
	ldrh r0, [r4, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r5, 0
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r4, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, 0x1
	strb r0, [r1]
	movs r0, 0
	ldrsb r0, [r1, r0]
	ldrh r1, [r5, 0x22]
	adds r0, r1
	strh r0, [r5, 0x22]
	ldrb r1, [r4, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r3, [r5, 0x5]
	movs r2, 0xF
	adds r0, r2, 0
	ands r0, r3
	orrs r0, r1
	strb r0, [r5, 0x5]
	adds r3, r5, 0
	adds r3, 0x3E
	ldrb r0, [r3]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r3]
	mov r0, r10
	strh r0, [r5, 0x2E]
	strh r7, [r5, 0x30]
	ldrb r1, [r4, 0xC]
	ands r2, r1
	cmp r2, 0xA
	bne _0805B4FC
	ldrh r0, [r4, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805B4FC:
	ldr r1, [sp, 0x1C]
	cmp r1, 0
	beq _0805B518
	adds r0, r5, 0
	bl SetSubspriteTables
	adds r2, r5, 0
	adds r2, 0x42
	ldrb r0, [r2]
	movs r1, 0x3F
	ands r1, r0
	movs r0, 0x80
	orrs r1, r0
	strb r1, [r2]
_0805B518:
	adds r0, r5, 0
	mov r1, r9
	bl InitObjectPriorityByZCoord
	mov r0, r9
	adds r1, r5, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
	ldr r0, [sp, 0x20]
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
_0805B53C:
	adds r0, r6, 0
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805B550: .4byte sub_8064970
_0805B554: .4byte 0x0000ffff
_0805B558: .4byte 0x02020004
	thumb_func_end sub_805B410

	thumb_func_start sub_805B55C
sub_805B55C: @ 805B55C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r1, 16
	str r1, [sp, 0x4]
	ldr r0, _0805B628
	ldr r5, [r0, 0x4]
	cmp r5, 0
	beq _0805B618
	ldr r4, _0805B62C
	ldrh r0, [r4]
	subs r1, r0, 0x2
	lsls r1, 16
	lsrs r1, 16
	adds r0, 0x11
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x8]
	ldrh r2, [r4, 0x2]
	adds r0, r2, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0xC]
	ldrb r6, [r5]
	movs r5, 0
	cmp r5, r6
	bcs _0805B618
	lsls r0, r2, 16
	asrs r0, 16
	mov r10, r0
	adds r7, r4, 0
	lsls r0, r1, 16
	asrs r0, 16
	mov r9, r0
	lsls r3, 16
	mov r8, r3
_0805B5B2:
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	ldr r1, _0805B630
	adds r4, r0, r1
	ldrh r0, [r4, 0x4]
	adds r0, 0x7
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r4, 0x6]
	adds r0, 0x7
	lsls r0, 16
	asrs r1, r0, 16
	cmp r10, r1
	bgt _0805B60E
	ldr r3, [sp, 0xC]
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, r1
	blt _0805B60E
	lsls r0, r2, 16
	asrs r1, r0, 16
	cmp r9, r1
	bgt _0805B60E
	ldr r2, [sp, 0x8]
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, r1
	blt _0805B60E
	ldrh r0, [r4, 0x14]
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	bne _0805B60E
	ldrb r1, [r7, 0x5]
	ldrb r2, [r7, 0x4]
	ldr r3, [sp, 0x4]
	lsls r0, r3, 16
	asrs r0, 16
	str r0, [sp]
	adds r0, r4, 0
	mov r4, r8
	asrs r3, r4, 16
	bl SpawnFieldObject
_0805B60E:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, r6
	bcc _0805B5B2
_0805B618:
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B628: .4byte 0x0202e828
_0805B62C: .4byte 0x02025734
_0805B630: .4byte 0x02026354
	thumb_func_end sub_805B55C

	thumb_func_start RemoveFieldObjectsOutsideView
RemoveFieldObjectsOutsideView: @ 805B634
	push {r4-r6,lr}
	movs r3, 0
	ldr r6, _0805B688
_0805B63A:
	movs r2, 0
	movs r4, 0
	adds r5, r3, 0x1
_0805B640:
	lsls r0, r2, 2
	adds r1, r0, r6
	ldrb r0, [r1]
	cmp r0, 0
	beq _0805B652
	ldrb r1, [r1, 0x2]
	cmp r3, r1
	bne _0805B652
	movs r4, 0x1
_0805B652:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3
	bls _0805B640
	cmp r4, 0
	bne _0805B67A
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	ldr r1, _0805B68C
	adds r2, r0, r1
	ldr r0, [r2]
	ldr r1, _0805B690
	ands r0, r1
	cmp r0, 0x1
	bne _0805B67A
	adds r0, r2, 0
	bl RemoveFieldObjectIfOutsideView
_0805B67A:
	lsls r0, r5, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _0805B63A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B688: .4byte 0x02029818
_0805B68C: .4byte 0x030048a0
_0805B690: .4byte 0x00010001
	thumb_func_end RemoveFieldObjectsOutsideView

	thumb_func_start RemoveFieldObjectIfOutsideView
RemoveFieldObjectIfOutsideView: @ 805B694
	push {r4-r7,lr}
	adds r3, r0, 0
	ldr r2, _0805B70C
	ldrh r0, [r2]
	subs r1, r0, 0x2
	lsls r1, 16
	adds r0, 0x11
	lsls r0, 16
	lsrs r5, r0, 16
	ldrh r4, [r2, 0x2]
	adds r0, r4, 0
	adds r0, 0x10
	lsls r0, 16
	lsrs r6, r0, 16
	movs r0, 0x10
	ldrsh r2, [r3, r0]
	lsrs r7, r1, 16
	asrs r1, 16
	cmp r2, r1
	blt _0805B6D8
	lsls r0, r5, 16
	asrs r0, 16
	cmp r2, r0
	bgt _0805B6D8
	movs r0, 0x12
	ldrsh r1, [r3, r0]
	lsls r0, r4, 16
	asrs r0, 16
	cmp r1, r0
	blt _0805B6D8
	lsls r0, r6, 16
	asrs r0, 16
	cmp r1, r0
	ble _0805B706
_0805B6D8:
	movs r0, 0xC
	ldrsh r1, [r3, r0]
	lsls r0, r7, 16
	asrs r0, 16
	cmp r1, r0
	blt _0805B700
	lsls r0, r5, 16
	asrs r0, 16
	cmp r1, r0
	bgt _0805B700
	movs r0, 0xE
	ldrsh r1, [r3, r0]
	lsls r0, r4, 16
	asrs r0, 16
	cmp r1, r0
	blt _0805B700
	lsls r0, r6, 16
	asrs r0, 16
	cmp r1, r0
	ble _0805B706
_0805B700:
	adds r0, r3, 0
	bl RemoveFieldObject
_0805B706:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B70C: .4byte 0x02025734
	thumb_func_end RemoveFieldObjectIfOutsideView

	thumb_func_start sub_805B710
sub_805B710: @ 805B710
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	bl ClearPlayerAvatarInfo
	movs r6, 0
	ldr r7, _0805B758
	lsls r4, 16
	lsls r5, 16
_0805B72A:
	lsls r0, r6, 3
	adds r0, r6
	lsls r0, 2
	adds r0, r7
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0805B744
	adds r0, r6, 0
	asrs r1, r4, 16
	asrs r2, r5, 16
	bl sub_805B75C
_0805B744:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0xF
	bls _0805B72A
	bl sub_805AAB0
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B758: .4byte 0x030048a0
	thumb_func_end sub_805B710

	thumb_func_start sub_805B75C
sub_805B75C: @ 805B75C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x24
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 16
	lsrs r2, 16
	mov r10, r2
	movs r7, 0
	ldr r2, _0805B900
_0805B77E:
	lsls r0, r7, 2
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, 0
	beq _0805B790
	ldrb r1, [r1, 0x2]
	cmp r8, r1
	bne _0805B790
	b _0805B8EE
_0805B790:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x3
	bls _0805B77E
	mov r1, r8
	lsls r0, r1, 3
	add r0, r8
	lsls r0, 2
	ldr r1, _0805B904
	adds r6, r0, r1
	movs r0, 0
	str r0, [sp, 0x20]
	ldrb r0, [r6, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r5, r0, 0
	ldrh r2, [r5, 0x6]
	ldr r1, _0805B908
	add r4, sp, 0x18
	ldr r0, [r4, 0x4]
	ands r0, r1
	orrs r0, r2
	str r0, [r4, 0x4]
	ldrb r0, [r6, 0x5]
	ldrb r1, [r6, 0x6]
	add r3, sp, 0x20
	mov r2, sp
	bl MakeObjectTemplateFromFieldObjectGraphicsInfoWithCallbackIndex
	str r4, [sp, 0xC]
	mov r0, sp
	ldr r2, _0805B90C
	adds r4, r2, 0
	strh r4, [r0, 0x2]
	ldrb r1, [r5, 0xC]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	bne _0805B7EA
	ldrh r0, [r5, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__no_record
_0805B7EA:
	ldrb r0, [r5, 0xC]
	lsls r1, r0, 28
	lsrs r0, r1, 28
	cmp r0, 0x9
	bls _0805B7FC
	ldrh r0, [r5, 0x2]
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805B7FC:
	mov r0, sp
	strh r4, [r0, 0x2]
	movs r1, 0
	movs r2, 0
	movs r3, 0
	bl CreateSprite
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x40
	beq _0805B8EE
	lsls r0, r7, 4
	adds r0, r7
	lsls r0, 2
	ldr r1, _0805B910
	adds r4, r0, r1
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	ldrh r2, [r6, 0x10]
	adds r0, r2
	lsls r0, 16
	asrs r0, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r1, 16
	ldrh r2, [r6, 0x12]
	adds r1, r2
	lsls r1, 16
	asrs r1, 16
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_8060388
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r4, 0
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r2, r4, 0
	adds r2, 0x29
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x8
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r1, 0x10
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldr r0, [r5, 0x1C]
	str r0, [r4, 0xC]
	ldrb r0, [r6, 0x6]
	cmp r0, 0xB
	bne _0805B88A
	mov r0, r8
	adds r1, r7, 0
	bl SetPlayerAvatarFieldObjectIdAndObjectId
	bl sub_8126B54
	strb r0, [r6, 0x1B]
_0805B88A:
	ldr r1, [sp, 0x20]
	cmp r1, 0
	beq _0805B896
	adds r0, r4, 0
	bl SetSubspriteTables
_0805B896:
	ldrb r1, [r5, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	adds r2, r4, 0
	adds r2, 0x3E
	ldrb r0, [r2]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r2]
	mov r0, r8
	strh r0, [r4, 0x2E]
	strb r7, [r6, 0x4]
	ldrb r0, [r6, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _0805B8DC
	ldrb r0, [r6, 0x6]
	cmp r0, 0xB
	beq _0805B8DC
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
_0805B8DC:
	adds r0, r6, 0
	bl sub_805B914
	ldrb r0, [r6, 0xB]
	lsrs r0, 4
	adds r1, r4, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
_0805B8EE:
	add sp, 0x24
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B900: .4byte 0x02029818
_0805B904: .4byte 0x030048a0
_0805B908: .4byte 0xffff0000
_0805B90C: .4byte 0x0000ffff
_0805B910: .4byte 0x02020004
	thumb_func_end sub_805B75C

	thumb_func_start sub_805B914
sub_805B914: @ 805B914
	push {lr}
	ldrb r2, [r0]
	movs r3, 0x3
	negs r3, r3
	adds r1, r3, 0
	ands r1, r2
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	ldrb r2, [r0, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	ands r1, r3
	movs r2, 0x5
	negs r2, r2
	ands r1, r2
	subs r2, 0x4
	ands r1, r2
	subs r2, 0x8
	ands r1, r2
	subs r2, 0x10
	ands r1, r2
	strb r1, [r0, 0x2]
	bl FieldObjectClearAnim
	pop {r0}
	bx r0
	thumb_func_end sub_805B914

	thumb_func_start SetPlayerAvatarFieldObjectIdAndObjectId
SetPlayerAvatarFieldObjectIdAndObjectId: @ 805B94C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r5, _0805B978
	strb r0, [r5, 0x5]
	strb r1, [r5, 0x4]
	ldr r1, _0805B97C
	lsls r4, r0, 3
	adds r4, r0
	lsls r4, 2
	adds r4, r1
	ldrb r0, [r4, 0x5]
	bl GetPlayerAvatarGenderByGraphicsId
	strb r0, [r5, 0x7]
	ldrb r0, [r4, 0x5]
	movs r1, 0x20
	bl SetPlayerAvatarExtraStateTransition
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B978: .4byte 0x0202e858
_0805B97C: .4byte 0x030048a0
	thumb_func_end SetPlayerAvatarFieldObjectIdAndObjectId

	thumb_func_start sub_805B980
sub_805B980: @ 805B980
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	mov r0, r8
	bl GetFieldObjectGraphicsInfo
	adds r5, r0, 0
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805BA7C
	adds r4, r0, r1
	ldrb r1, [r5, 0xC]
	movs r7, 0xF
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0
	bne _0805B9B8
	ldrh r0, [r5, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl pal_patch_for_npc
_0805B9B8:
	ldrb r1, [r5, 0xC]
	adds r0, r7, 0
	ands r0, r1
	cmp r0, 0xA
	bne _0805B9CC
	ldrh r0, [r5, 0x2]
	lsls r1, 28
	lsrs r1, 28
	bl npc_load_two_palettes__and_record
_0805B9CC:
	ldr r0, [r5, 0x10]
	ldrb r2, [r0, 0x1]
	lsrs r2, 6
	lsls r2, 6
	ldrb r3, [r4, 0x1]
	movs r1, 0x3F
	adds r0, r1, 0
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, 0x1]
	ldr r0, [r5, 0x10]
	ldrb r0, [r0, 0x3]
	lsrs r0, 6
	lsls r0, 6
	ldrb r2, [r4, 0x3]
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, 0x3]
	ldr r0, [r5, 0x1C]
	str r0, [r4, 0xC]
	ldr r0, [r5, 0x18]
	str r0, [r4, 0x8]
	ldr r0, [r5, 0x14]
	str r0, [r4, 0x18]
	ldrb r1, [r5, 0xC]
	lsls r1, 28
	lsrs r1, 24
	ldrb r2, [r4, 0x5]
	adds r0, r7, 0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x5]
	ldrb r1, [r5, 0xC]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 4
	ldrb r2, [r6, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, 0x1]
	mov r0, r8
	strb r0, [r6, 0x5]
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	adds r2, r4, 0
	adds r2, 0x20
	adds r3, r4, 0
	adds r3, 0x22
	bl sub_80603CC
	ldrh r0, [r5, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r4, 0
	adds r1, 0x28
	strb r0, [r1]
	ldrh r0, [r5, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r2, r4, 0
	adds r2, 0x29
	strb r0, [r2]
	ldrh r0, [r4, 0x20]
	adds r0, 0x8
	strh r0, [r4, 0x20]
	ldrh r1, [r4, 0x22]
	adds r1, 0x10
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	strh r0, [r4, 0x22]
	ldrb r0, [r6, 0x1]
	lsrs r0, 7
	cmp r0, 0
	beq _0805BA72
	bl CameraObjectReset1
_0805BA72:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BA7C: .4byte 0x02020004
	thumb_func_end sub_805B980

	thumb_func_start unref_sub_805BA80
unref_sub_805BA80: @ 805BA80
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805BAB4
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805BABC
	adds r0, r1
	adds r1, r4, 0
	bl sub_805B980
_0805BAB4:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BABC: .4byte 0x030048a0
	thumb_func_end unref_sub_805BA80

	thumb_func_start FieldObjectTurn
FieldObjectTurn: @ 805BAC0
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r1, 24
	bl FieldObjectSetDirection
	ldrb r0, [r6, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _0805BB06
	ldrb r0, [r6, 0x4]
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	ldr r5, _0805BB0C
	adds r4, r5
	ldrb r0, [r6, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	movs r1, 0
	bl SeekSpriteAnim
_0805BB06:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BB0C: .4byte 0x02020004
	thumb_func_end FieldObjectTurn

	thumb_func_start FieldObjectTurnByLocalIdAndMap
FieldObjectTurnByLocalIdAndMap: @ 805BB10
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805BB44
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805BB4C
	adds r0, r1
	adds r1, r4, 0
	bl FieldObjectTurn
_0805BB44:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BB4C: .4byte 0x030048a0
	thumb_func_end FieldObjectTurnByLocalIdAndMap

	thumb_func_start unref_sub_805BB50
unref_sub_805BB50: @ 805BB50
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0x5]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805BB6C
	adds r0, r2
	bl FieldObjectTurn
	pop {r0}
	bx r0
	.align 2, 0
_0805BB6C: .4byte 0x030048a0
	thumb_func_end unref_sub_805BB50

	thumb_func_start get_berry_tree_graphics
get_berry_tree_graphics: @ 805BB70
	push {r4-r7,lr}
	adds r5, r0, 0
	adds r7, r1, 0
	ldrb r0, [r5, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r5, 0x1]
	adds r4, r7, 0
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0x1D]
	bl GetStageByBerryTreeId
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	beq _0805BBFC
	ldrb r1, [r5, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0x1D]
	bl GetBerryTypeByBerryTreeId
	subs r0, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r4, 0x2B
	bls _0805BBC4
	movs r4, 0
_0805BBC4:
	ldr r0, _0805BC04
	lsls r4, 2
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r6
	ldrb r1, [r0]
	adds r0, r5, 0
	bl sub_805B980
	ldr r0, _0805BC08
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r7, 0xC]
	ldr r0, _0805BC0C
	adds r4, r0
	ldr r0, [r4]
	adds r0, r6
	ldrb r1, [r0]
	lsls r1, 4
	ldrb r2, [r7, 0x5]
	movs r0, 0xF
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, 0x5]
	adds r0, r7, 0
	adds r1, r6, 0
	bl StartSpriteAnim
_0805BBFC:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BC04: .4byte gBerryTreeGraphicsIdTablePointers
_0805BC08: .4byte gBerryTreePicTablePointers
_0805BC0C: .4byte gBerryTreePaletteSlotTablePointers
	thumb_func_end get_berry_tree_graphics

	thumb_func_start GetFieldObjectGraphicsInfo
GetFieldObjectGraphicsInfo: @ 805BC10
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xEF
	bls _0805BC28
	adds r0, r1, 0
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl VarGetFieldObjectGraphicsId
	adds r1, r0, 0
_0805BC28:
	cmp r1, 0xD9
	bls _0805BC2E
	movs r1, 0x5
_0805BC2E:
	ldr r0, _0805BC3C
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	pop {r1}
	bx r1
	.align 2, 0
_0805BC3C: .4byte gMapObjectGraphicsInfoPointers
	thumb_func_end GetFieldObjectGraphicsInfo

	thumb_func_start FieldObjectHandleDynamicGraphicsId
FieldObjectHandleDynamicGraphicsId: @ 805BC40
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x5]
	cmp r0, 0xEF
	bls _0805BC56
	adds r0, 0x10
	lsls r0, 24
	lsrs r0, 24
	bl VarGetFieldObjectGraphicsId
	strb r0, [r4, 0x5]
_0805BC56:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectHandleDynamicGraphicsId

	thumb_func_start npc_by_local_id_and_map_set_field_1_bit_x20
npc_by_local_id_and_map_set_field_1_bit_x20: @ 805BC5C
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805BC9E
	ldr r2, _0805BCA8
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r0, 0x1
	adds r2, r4, 0
	ands r2, r0
	lsls r2, 5
	ldrb r3, [r1, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, 0x1]
_0805BC9E:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BCA8: .4byte 0x030048a0
	thumb_func_end npc_by_local_id_and_map_set_field_1_bit_x20

	thumb_func_start FieldObjectGetLocalIdAndMap
FieldObjectGetLocalIdAndMap: @ 805BCAC
	push {r4,lr}
	ldrb r4, [r0, 0x8]
	strb r4, [r1]
	ldrb r1, [r0, 0x9]
	strb r1, [r2]
	ldrb r0, [r0, 0xA]
	strb r0, [r3]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectGetLocalIdAndMap

	thumb_func_start sub_805BCC0
sub_805BCC0: @ 805BCC0
	push {lr}
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl GetFieldObjectIdByXY
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0x10
	beq _0805BCE8
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805BCEC
	adds r0, r1
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0805BCE8:
	pop {r0}
	bx r0
	.align 2, 0
_0805BCEC: .4byte 0x030048a0
	thumb_func_end sub_805BCC0

	thumb_func_start sub_805BCF0
sub_805BCF0: @ 805BCF0
	push {r4,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r4, r3, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805BD36
	mov r0, sp
	ldrb r0, [r0]
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	ldr r0, _0805BD40
	adds r2, r0
	ldrb r1, [r2, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805BD44
	adds r0, r1
	ldrb r1, [r2, 0x3]
	movs r3, 0x4
	orrs r1, r3
	strb r1, [r2, 0x3]
	adds r0, 0x43
	strb r4, [r0]
_0805BD36:
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BD40: .4byte 0x030048a0
_0805BD44: .4byte 0x02020004
	thumb_func_end sub_805BCF0

	thumb_func_start sub_805BD48
sub_805BD48: @ 805BD48
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805BD84
	mov r0, sp
	ldrb r0, [r0]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805BD8C
	adds r1, r0
	ldrb r2, [r1, 0x3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	strb r0, [r1, 0x3]
	ldrb r0, [r1]
	movs r2, 0x4
	orrs r0, r2
	strb r0, [r1]
_0805BD84:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0805BD8C: .4byte 0x030048a0
	thumb_func_end sub_805BD48

	thumb_func_start sub_805BD90
sub_805BD90: @ 805BD90
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, [sp, 0x10]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r5, r3, 16
	lsls r4, 16
	lsrs r4, 16
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805BDD4
	ldr r2, _0805BDDC
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805BDE0
	adds r0, r1
	strh r5, [r0, 0x24]
	strh r4, [r0, 0x26]
_0805BDD4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805BDDC: .4byte 0x030048a0
_0805BDE0: .4byte 0x02020004
	thumb_func_end sub_805BD90

	thumb_func_start gpu_pal_allocator_reset__manage_upper_four
gpu_pal_allocator_reset__manage_upper_four: @ 805BDE4
	push {lr}
	bl FreeAllSpritePalettes
	ldr r1, _0805BDF4
	movs r0, 0xC
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805BDF4: .4byte 0x030028f8
	thumb_func_end gpu_pal_allocator_reset__manage_upper_four

	thumb_func_start sub_805BDF8
sub_805BDF8: @ 805BDF8
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	bl FindFieldObjectPaletteIndexByTag
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _0805BE1C
	cmp r1, r0
	beq _0805BE16
	lsls r0, r1, 3
	ldr r1, _0805BE20
	adds r0, r1
	bl sub_805BE58
_0805BE16:
	pop {r0}
	bx r0
	.align 2, 0
_0805BE1C: .4byte 0x000011ff
_0805BE20: .4byte gUnknown_0837377C
	thumb_func_end sub_805BDF8

	thumb_func_start unref_sub_805BE24
unref_sub_805BE24: @ 805BE24
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r4, 0
	ldrh r0, [r5]
	ldr r1, _0805BE54
	cmp r0, r1
	beq _0805BE4E
	adds r6, r1, 0
_0805BE34:
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	bl sub_805BDF8
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 1
	adds r0, r5
	ldrh r0, [r0]
	cmp r0, r6
	bne _0805BE34
_0805BE4E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BE54: .4byte 0x000011ff
	thumb_func_end unref_sub_805BE24

	thumb_func_start sub_805BE58
sub_805BE58: @ 805BE58
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x4]
	bl IndexOfSpritePaletteTag
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	bne _0805BE76
	adds r0, r4, 0
	bl LoadSpritePalette
	lsls r0, 24
	lsrs r0, 24
	b _0805BE78
_0805BE76:
	movs r0, 0xFF
_0805BE78:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805BE58

	thumb_func_start pal_patch_for_npc
pal_patch_for_npc: @ 805BE80
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	bl FindFieldObjectPaletteIndexByTag
	lsls r0, 24
	ldr r1, _0805BEB4
	lsrs r0, 21
	adds r0, r1
	ldr r0, [r0]
	lsls r4, 20
	movs r1, 0x80
	lsls r1, 17
	adds r4, r1
	lsrs r4, 16
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BEB4: .4byte gUnknown_0837377C
	thumb_func_end pal_patch_for_npc

	thumb_func_start pal_patch_for_npc_range
pal_patch_for_npc_range: @ 805BEB8
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	cmp r4, r6
	bcs _0805BEDC
_0805BEC8:
	ldrh r0, [r5]
	adds r1, r4, 0
	bl pal_patch_for_npc
	adds r5, 0x2
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r6
	bcc _0805BEC8
_0805BEDC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end pal_patch_for_npc_range

	thumb_func_start FindFieldObjectPaletteIndexByTag
FindFieldObjectPaletteIndexByTag: @ 805BEE4
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r5, r0, 16
	movs r2, 0
	ldr r0, _0805BF0C
	ldrh r1, [r0, 0x4]
	ldr r3, _0805BF10
	adds r4, r0, 0
	cmp r1, r3
	beq _0805BF24
	adds r6, r4, 0
	adds r1, r3, 0
_0805BEFC:
	lsls r0, r2, 3
	adds r0, r6
	ldrh r0, [r0, 0x4]
	cmp r0, r5
	bne _0805BF14
	adds r0, r2, 0
	b _0805BF26
	.align 2, 0
_0805BF0C: .4byte gUnknown_0837377C
_0805BF10: .4byte 0x000011ff
_0805BF14:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r0, r2, 3
	adds r0, r4
	ldrh r0, [r0, 0x4]
	cmp r0, r1
	bne _0805BEFC
_0805BF24:
	movs r0, 0xFF
_0805BF26:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end FindFieldObjectPaletteIndexByTag

	thumb_func_start npc_load_two_palettes__no_record
npc_load_two_palettes__no_record: @ 805BF2C
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl pal_patch_for_npc
	movs r3, 0
	ldr r1, _0805BF74
	ldrh r0, [r1]
	ldr r2, _0805BF78
	cmp r0, r2
	beq _0805BF94
	ldr r0, _0805BF7C
	adds r5, r0
	adds r6, r2, 0
_0805BF50:
	lsls r2, r3, 3
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r4
	bne _0805BF84
	adds r1, 0x4
	adds r1, r2, r1
	ldr r0, _0805BF80
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldrb r1, [r5]
	bl pal_patch_for_npc
	b _0805BF94
	.align 2, 0
_0805BF74: .4byte gUnknown_08373874
_0805BF78: .4byte 0x000011ff
_0805BF7C: .4byte gUnknown_0830FD14
_0805BF80: .4byte 0x030005a4
_0805BF84:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r6
	bne _0805BF50
_0805BF94:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end npc_load_two_palettes__no_record

	thumb_func_start npc_load_two_palettes__and_record
npc_load_two_palettes__and_record: @ 805BF9C
	push {r4-r6,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	ldr r0, _0805BFE8
	strh r4, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	bl pal_patch_for_npc
	movs r3, 0
	ldr r1, _0805BFEC
	ldrh r0, [r1]
	ldr r2, _0805BFF0
	cmp r0, r2
	beq _0805C00C
	ldr r0, _0805BFF4
	adds r5, r0
	adds r6, r2, 0
_0805BFC4:
	lsls r2, r3, 3
	adds r0, r2, r1
	ldrh r0, [r0]
	cmp r0, r4
	bne _0805BFFC
	adds r1, 0x4
	adds r1, r2, r1
	ldr r0, _0805BFF8
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 1
	adds r0, r1
	ldrh r0, [r0]
	ldrb r1, [r5]
	bl pal_patch_for_npc
	b _0805C00C
	.align 2, 0
_0805BFE8: .4byte 0x030005a6
_0805BFEC: .4byte gUnknown_083738E4
_0805BFF0: .4byte 0x000011ff
_0805BFF4: .4byte gUnknown_0830FD14
_0805BFF8: .4byte 0x030005a4
_0805BFFC:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r1
	ldrh r0, [r0]
	cmp r0, r6
	bne _0805BFC4
_0805C00C:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end npc_load_two_palettes__and_record

	thumb_func_start unref_sub_805C014
unref_sub_805C014: @ 805C014
	push {r4,lr}
	ldrh r3, [r0, 0x10]
	strh r3, [r0, 0x14]
	ldrh r4, [r0, 0x12]
	strh r4, [r0, 0x16]
	lsls r1, 16
	asrs r1, 16
	adds r1, r3
	strh r1, [r0, 0x10]
	lsls r2, 16
	asrs r2, 16
	adds r2, r4
	strh r2, [r0, 0x12]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end unref_sub_805C014

	thumb_func_start npc_coords_shift
npc_coords_shift: @ 805C034
	ldrh r3, [r0, 0x10]
	strh r3, [r0, 0x14]
	ldrh r3, [r0, 0x12]
	strh r3, [r0, 0x16]
	strh r1, [r0, 0x10]
	strh r2, [r0, 0x12]
	bx lr
	thumb_func_end npc_coords_shift

	thumb_func_start npc_coords_set
npc_coords_set: @ 805C044
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 16
	lsrs r2, 16
	strh r1, [r0, 0x14]
	strh r2, [r0, 0x16]
	strh r1, [r0, 0x10]
	strh r2, [r0, 0x12]
	bx lr
	thumb_func_end npc_coords_set

	thumb_func_start sub_805C058
sub_805C058: @ 805C058
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	ldrb r1, [r6, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805C0F4
	adds r7, r0, r1
	ldrb r0, [r6, 0x5]
	bl GetFieldObjectGraphicsInfo
	mov r8, r0
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl npc_coords_set
	movs r1, 0x10
	ldrsh r0, [r6, r1]
	movs r2, 0x12
	ldrsh r1, [r6, r2]
	adds r2, r7, 0
	adds r2, 0x20
	adds r3, r7, 0
	adds r3, 0x22
	bl sub_80603CC
	mov r1, r8
	ldrh r0, [r1, 0x8]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r1, r7, 0
	adds r1, 0x28
	strb r0, [r1]
	mov r2, r8
	ldrh r0, [r2, 0xA]
	lsls r0, 16
	asrs r0, 17
	negs r0, r0
	adds r2, r7, 0
	adds r2, 0x29
	strb r0, [r2]
	ldrh r0, [r7, 0x20]
	adds r0, 0x8
	strh r0, [r7, 0x20]
	ldrh r1, [r7, 0x22]
	adds r1, 0x10
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	strh r0, [r7, 0x22]
	adds r0, r6, 0
	bl sub_805B914
	ldrb r0, [r6, 0x1]
	lsrs r0, 7
	cmp r0, 0
	beq _0805C0EA
	bl CameraObjectReset1
_0805C0EA:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C0F4: .4byte 0x02020004
	thumb_func_end sub_805C058

	thumb_func_start sub_805C0F8
sub_805C0F8: @ 805C0F8
	push {r4,r5,lr}
	sub sp, 0x4
	ldr r4, [sp, 0x10]
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 16
	lsrs r5, r3, 16
	lsls r4, 16
	lsrs r4, 16
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805C140
	lsls r1, r5, 16
	lsls r2, r4, 16
	mov r0, sp
	ldrb r3, [r0]
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	ldr r3, _0805C148
	adds r0, r3
	movs r3, 0xE0
	lsls r3, 11
	adds r1, r3
	asrs r1, 16
	adds r2, r3
	asrs r2, 16
	bl sub_805C058
_0805C140:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C148: .4byte 0x030048a0
	thumb_func_end sub_805C0F8

	thumb_func_start npc_coords_shift_still
npc_coords_shift_still: @ 805C14C
	push {lr}
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	movs r3, 0x12
	ldrsh r2, [r0, r3]
	bl npc_coords_shift
	pop {r0}
	bx r0
	thumb_func_end npc_coords_shift_still

	thumb_func_start UpdateFieldObjectCoordsForCameraUpdate
UpdateFieldObjectCoordsForCameraUpdate: @ 805C160
	push {r4,r5,lr}
	ldr r2, _0805C1C0
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0805C1B8
	movs r3, 0
	ldr r5, _0805C1C4
	movs r0, 0x4
	ldrsh r4, [r2, r0]
	movs r0, 0x8
	ldrsh r1, [r2, r0]
_0805C17A:
	lsls r0, r3, 3
	adds r0, r3
	lsls r0, 2
	adds r2, r0, r5
	ldrb r0, [r2]
	lsls r0, 31
	cmp r0, 0
	beq _0805C1AE
	ldrh r0, [r2, 0xC]
	subs r0, r4
	strh r0, [r2, 0xC]
	ldrh r0, [r2, 0xE]
	subs r0, r1
	strh r0, [r2, 0xE]
	ldrh r0, [r2, 0x10]
	subs r0, r4
	strh r0, [r2, 0x10]
	ldrh r0, [r2, 0x12]
	subs r0, r1
	strh r0, [r2, 0x12]
	ldrh r0, [r2, 0x14]
	subs r0, r4
	strh r0, [r2, 0x14]
	ldrh r0, [r2, 0x16]
	subs r0, r1
	strh r0, [r2, 0x16]
_0805C1AE:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xF
	bls _0805C17A
_0805C1B8:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C1C0: .4byte 0x0202e844
_0805C1C4: .4byte 0x030048a0
	thumb_func_end UpdateFieldObjectCoordsForCameraUpdate

	thumb_func_start GetFieldObjectIdByXYZ
GetFieldObjectIdByXYZ: @ 805C1C8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 16
	lsrs r7, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 24
	lsrs r5, r2, 24
	movs r4, 0
	ldr r0, _0805C214
	mov r8, r0
_0805C1E0:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	mov r2, r8
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _0805C218
	movs r2, 0x10
	ldrsh r0, [r1, r2]
	cmp r0, r7
	bne _0805C218
	movs r2, 0x12
	ldrsh r0, [r1, r2]
	cmp r0, r6
	bne _0805C218
	adds r0, r1, 0
	adds r1, r5, 0
	bl FieldObjectDoesZCoordMatch
	lsls r0, 24
	cmp r0, 0
	beq _0805C218
	adds r0, r4, 0
	b _0805C224
	.align 2, 0
_0805C214: .4byte 0x030048a0
_0805C218:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0805C1E0
	movs r0, 0x10
_0805C224:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectIdByXYZ

	thumb_func_start FieldObjectDoesZCoordMatch
FieldObjectDoesZCoordMatch: @ 805C230
	push {lr}
	lsls r1, 24
	lsrs r1, 24
	ldrb r2, [r0, 0xB]
	movs r0, 0xF
	ands r0, r2
	cmp r0, 0
	beq _0805C250
	cmp r1, 0
	beq _0805C250
	lsls r0, r2, 28
	lsrs r0, 28
	cmp r0, r1
	beq _0805C250
	movs r0, 0
	b _0805C252
_0805C250:
	movs r0, 0x1
_0805C252:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectDoesZCoordMatch

	thumb_func_start UpdateFieldObjectsForCameraUpdate
UpdateFieldObjectsForCameraUpdate: @ 805C258
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	bl UpdateFieldObjectCoordsForCameraUpdate
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805B55C
	bl RemoveFieldObjectsOutsideView
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end UpdateFieldObjectsForCameraUpdate

	thumb_func_start AddCameraObject
AddCameraObject: @ 805C284
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0805C2C0
	movs r1, 0
	movs r2, 0
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805C2C4
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x3E
	adds r2, r1
	mov r12, r2
	ldrb r2, [r2]
	movs r3, 0x4
	orrs r2, r3
	mov r3, r12
	strb r2, [r3]
	strh r4, [r1, 0x2E]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805C2C0: .4byte gUnknown_0830FD24
_0805C2C4: .4byte 0x02020004
	thumb_func_end AddCameraObject

	thumb_func_start ObjectCB_CameraObject
ObjectCB_CameraObject: @ 805C2C8
	push {r4,r5,lr}
	sub sp, 0xC
	mov r2, sp
	ldr r1, _0805C2EC
	ldm r1!, {r3-r5}
	stm r2!, {r3-r5}
	movs r2, 0x30
	ldrsh r1, [r0, r2]
	lsls r1, 2
	add r1, sp
	ldr r1, [r1]
	bl _call_via_r1
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C2EC: .4byte gUnknown_0830FD3C
	thumb_func_end ObjectCB_CameraObject

	thumb_func_start CameraObject_0
CameraObject_0: @ 805C2F0
	push {lr}
	ldr r3, _0805C328
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r1, [r1, 0x20]
	strh r1, [r0, 0x20]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	adds r3, r0, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r3]
	movs r1, 0x1
	strh r1, [r0, 0x30]
	bl CameraObject_1
	pop {r0}
	bx r0
	.align 2, 0
_0805C328: .4byte 0x02020004
	thumb_func_end CameraObject_0

	thumb_func_start CameraObject_1
CameraObject_1: @ 805C32C
	push {r4,r5,lr}
	ldr r3, _0805C360
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r3, [r1, 0x22]
	ldrh r2, [r0, 0x20]
	ldrh r4, [r1, 0x20]
	movs r5, 0x20
	ldrsh r1, [r1, r5]
	subs r1, r2
	strh r1, [r0, 0x32]
	ldrh r2, [r0, 0x22]
	lsls r1, r3, 16
	asrs r1, 16
	subs r1, r2
	strh r1, [r0, 0x34]
	strh r4, [r0, 0x20]
	strh r3, [r0, 0x22]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C360: .4byte 0x02020004
	thumb_func_end CameraObject_1

	thumb_func_start CameraObject_2
CameraObject_2: @ 805C364
	push {r4,lr}
	ldr r4, _0805C390
	movs r1, 0x2E
	ldrsh r2, [r0, r1]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x20]
	movs r3, 0
	strh r1, [r0, 0x20]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r4
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	strh r3, [r0, 0x32]
	strh r3, [r0, 0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C390: .4byte 0x02020004
	thumb_func_end CameraObject_2

	thumb_func_start FindCameraObject
FindCameraObject: @ 805C394
	push {r4,r5,lr}
	movs r3, 0
	ldr r4, _0805C3C0
	adds r5, r4, 0
	adds r5, 0x1C
_0805C39E:
	lsls r0, r3, 4
	adds r0, r3
	lsls r1, r0, 2
	adds r2, r1, r4
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _0805C3C8
	adds r0, r1, r5
	ldr r1, [r0]
	ldr r0, _0805C3C4
	cmp r1, r0
	bne _0805C3C8
	adds r0, r2, 0
	b _0805C3D4
	.align 2, 0
_0805C3C0: .4byte 0x02020004
_0805C3C4: .4byte ObjectCB_CameraObject
_0805C3C8:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3F
	bls _0805C39E
	movs r0, 0
_0805C3D4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FindCameraObject

	thumb_func_start CameraObjectReset1
CameraObjectReset1: @ 805C3DC
	push {lr}
	bl FindCameraObject
	adds r2, r0, 0
	cmp r2, 0
	beq _0805C3F4
	movs r0, 0
	strh r0, [r2, 0x30]
	ldr r1, [r2, 0x1C]
	adds r0, r2, 0
	bl _call_via_r1
_0805C3F4:
	pop {r0}
	bx r0
	thumb_func_end CameraObjectReset1

	thumb_func_start CameraObjectSetFollowedObjectId
CameraObjectSetFollowedObjectId: @ 805C3F8
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl FindCameraObject
	cmp r0, 0
	beq _0805C40C
	strh r4, [r0, 0x2E]
	bl CameraObjectReset1
_0805C40C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end CameraObjectSetFollowedObjectId

	thumb_func_start CameraObjectGetFollowedObjectId
CameraObjectGetFollowedObjectId: @ 805C414
	push {lr}
	bl FindCameraObject
	cmp r0, 0
	beq _0805C426
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	b _0805C428
_0805C426:
	movs r0, 0x40
_0805C428:
	pop {r1}
	bx r1
	thumb_func_end CameraObjectGetFollowedObjectId

	thumb_func_start CameraObjectReset2
CameraObjectReset2: @ 805C42C
	push {lr}
	bl FindCameraObject
	movs r1, 0x2
	strh r1, [r0, 0x30]
	pop {r0}
	bx r0
	thumb_func_end CameraObjectReset2

	thumb_func_start unref_sub_805C43C
unref_sub_805C43C: @ 805C43C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r12, r0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	movs r5, 0
	ldr r1, _0805C484
_0805C456:
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r4, r0, r1
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0805C488
	adds r0, r4, 0
	mov r1, r12
	movs r2, 0x44
	bl memcpy
	mov r0, r8
	strh r0, [r4, 0x20]
	strh r6, [r4, 0x22]
	adds r0, r4, 0
	adds r0, 0x43
	strb r7, [r0]
	b _0805C492
	.align 2, 0
_0805C484: .4byte 0x02020004
_0805C488:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x3F
	bls _0805C456
_0805C492:
	adds r0, r5, 0
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end unref_sub_805C43C

	thumb_func_start obj_unfreeze
obj_unfreeze: @ 805C4A0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	mov r12, r0
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	movs r5, 0x3F
	ldr r3, _0805C4F4
	movs r2, 0x1
	negs r2, r2
_0805C4BE:
	lsls r0, r5, 16
	asrs r1, r0, 16
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r3
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	bne _0805C4F8
	adds r0, r4, 0
	mov r1, r12
	movs r2, 0x44
	bl memcpy
	mov r0, r8
	strh r0, [r4, 0x20]
	strh r6, [r4, 0x22]
	adds r0, r4, 0
	adds r0, 0x43
	strb r7, [r0]
	lsls r0, r5, 24
	lsrs r0, 24
	b _0805C506
	.align 2, 0
_0805C4F4: .4byte 0x02020004
_0805C4F8:
	subs r0, r1, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	asrs r0, 16
	cmp r0, r2
	bgt _0805C4BE
	movs r0, 0x40
_0805C506:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end obj_unfreeze

	thumb_func_start FieldObjectSetDirection
FieldObjectSetDirection: @ 805C510
	push {r4,lr}
	adds r3, r0, 0
	lsls r1, 24
	lsrs r2, r1, 24
	adds r4, r2, 0
	ldrb r0, [r3, 0x18]
	lsls r0, 28
	lsrs r0, 28
	adds r1, r3, 0
	adds r1, 0x20
	strb r0, [r1]
	ldrb r0, [r3, 0x1]
	lsls r0, 30
	cmp r0, 0
	blt _0805C540
	movs r0, 0xF
	adds r1, r2, 0
	ands r1, r0
	ldrb r2, [r3, 0x18]
	movs r0, 0x10
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x18]
_0805C540:
	lsls r2, r4, 4
	ldrb r1, [r3, 0x18]
	movs r0, 0xF
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, 0x18]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectSetDirection

	thumb_func_start GetFieldObjectScriptPointerByLocalIdAndMap
GetFieldObjectScriptPointerByLocalIdAndMap: @ 805C554
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	bl GetFieldObjectTemplateByLocalIdAndMap
	ldr r0, [r0, 0x10]
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectScriptPointerByLocalIdAndMap

	thumb_func_start GetFieldObjectScriptPointerByFieldObjectId
GetFieldObjectScriptPointerByFieldObjectId: @ 805C56C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805C58C
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r0, [r2, 0x8]
	ldrb r1, [r2, 0x9]
	ldrb r2, [r2, 0xA]
	bl GetFieldObjectScriptPointerByLocalIdAndMap
	pop {r1}
	bx r1
	.align 2, 0
_0805C58C: .4byte 0x030048a0
	thumb_func_end GetFieldObjectScriptPointerByFieldObjectId

	thumb_func_start GetFieldObjectFlagIdByLocalIdAndMap
GetFieldObjectFlagIdByLocalIdAndMap: @ 805C590
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	bl GetFieldObjectTemplateByLocalIdAndMap
	ldrh r0, [r0, 0x14]
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectFlagIdByLocalIdAndMap

	thumb_func_start GetFieldObjectFlagIdByFieldObjectId
GetFieldObjectFlagIdByFieldObjectId: @ 805C5A8
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805C5CC
	lsls r2, r0, 3
	adds r2, r0
	lsls r2, 2
	adds r2, r1
	ldrb r0, [r2, 0x8]
	ldrb r1, [r2, 0x9]
	ldrb r2, [r2, 0xA]
	bl GetFieldObjectFlagIdByLocalIdAndMap
	lsls r0, 16
	lsrs r0, 16
	pop {r1}
	bx r1
	.align 2, 0
_0805C5CC: .4byte 0x030048a0
	thumb_func_end GetFieldObjectFlagIdByFieldObjectId

	thumb_func_start unref_sub_805C5D0
unref_sub_805C5D0: @ 805C5D0
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805C604
	ldr r2, _0805C600
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x7]
	b _0805C606
	.align 2, 0
_0805C600: .4byte 0x030048a0
_0805C604:
	movs r0, 0xFF
_0805C606:
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end unref_sub_805C5D0

	thumb_func_start unref_sub_805C60C
unref_sub_805C60C: @ 805C60C
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805C620
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x7]
	bx lr
	.align 2, 0
_0805C620: .4byte 0x030048a0
	thumb_func_end unref_sub_805C60C

	thumb_func_start unref_sub_805C624
unref_sub_805C624: @ 805C624
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805C658
	ldr r2, _0805C654
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1D]
	b _0805C65A
	.align 2, 0
_0805C654: .4byte 0x030048a0
_0805C658:
	movs r0, 0xFF
_0805C65A:
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end unref_sub_805C624

	thumb_func_start FieldObjectGetBerryTreeId
FieldObjectGetBerryTreeId: @ 805C660
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0805C674
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrb r0, [r1, 0x1D]
	bx lr
	.align 2, 0
_0805C674: .4byte 0x030048a0
	thumb_func_end FieldObjectGetBerryTreeId

	thumb_func_start GetFieldObjectTemplateByLocalIdAndMap
GetFieldObjectTemplateByLocalIdAndMap: @ 805C678
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0805C6A4
	movs r0, 0x5
	ldrsb r0, [r1, r0]
	cmp r0, r3
	bne _0805C6AC
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	cmp r0, r2
	bne _0805C6AC
	movs r0, 0xC2
	lsls r0, 4
	adds r1, r0
	ldr r0, _0805C6A8
	ldr r0, [r0, 0x4]
	b _0805C6B8
	.align 2, 0
_0805C6A4: .4byte 0x02025734
_0805C6A8: .4byte 0x0202e828
_0805C6AC:
	adds r0, r2, 0
	adds r1, r3, 0
	bl get_mapheader_by_bank_and_number
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0x4]
_0805C6B8:
	ldrb r2, [r0]
	adds r0, r4, 0
	bl FindFieldObjectTemplateInArrayByLocalId
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectTemplateByLocalIdAndMap

	thumb_func_start FindFieldObjectTemplateInArrayByLocalId
FindFieldObjectTemplateInArrayByLocalId: @ 805C6C8
	push {r4,r5,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r2, 24
	lsrs r2, 24
	movs r1, 0
	cmp r1, r2
	bcs _0805C6F6
_0805C6DA:
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r3, r0, r5
	ldrb r0, [r3]
	cmp r0, r4
	bne _0805C6EC
	adds r0, r3, 0
	b _0805C6F8
_0805C6EC:
	adds r0, r1, 0x1
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, r2
	bcc _0805C6DA
_0805C6F6:
	movs r0, 0
_0805C6F8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FindFieldObjectTemplateInArrayByLocalId

	thumb_func_start sub_805C700
sub_805C700: @ 805C700
	push {r4,r5,lr}
	adds r2, r0, 0
	ldrb r1, [r2, 0x9]
	ldr r4, _0805C720
	movs r0, 0x5
	ldrsb r0, [r4, r0]
	adds r5, r4, 0
	cmp r1, r0
	bne _0805C74A
	ldrb r1, [r2, 0xA]
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	cmp r1, r0
	beq _0805C72E
	b _0805C74A
	.align 2, 0
_0805C720: .4byte 0x02025734
_0805C724:
	movs r1, 0xC2
	lsls r1, 4
	adds r0, r5, r1
	adds r0, r2, r0
	b _0805C74C
_0805C72E:
	movs r3, 0
	ldrb r0, [r2, 0x8]
	movs r2, 0xC2
	lsls r2, 4
	adds r1, r4, r2
	movs r2, 0
_0805C73A:
	ldrb r4, [r1]
	cmp r0, r4
	beq _0805C724
	adds r1, 0x18
	adds r2, 0x18
	adds r3, 0x1
	cmp r3, 0x3F
	ble _0805C73A
_0805C74A:
	movs r0, 0
_0805C74C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805C700

	thumb_func_start sub_805C754
sub_805C754: @ 805C754
	push {r4,lr}
	adds r4, r0, 0
	bl sub_805C700
	adds r1, r0, 0
	cmp r1, 0
	beq _0805C76E
	ldrh r0, [r4, 0x10]
	subs r0, 0x7
	strh r0, [r1, 0x4]
	ldrh r0, [r4, 0x12]
	subs r0, 0x7
	strh r0, [r1, 0x6]
_0805C76E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805C754

	thumb_func_start sub_805C774
sub_805C774: @ 805C774
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_805C700
	cmp r0, 0
	beq _0805C784
	strb r4, [r0, 0x9]
_0805C784:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805C774

	thumb_func_start sub_805C78C
sub_805C78C: @ 805C78C
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0805C7BA
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805C7C0
	adds r0, r1
	bl sub_805C754
_0805C7BA:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_0805C7C0: .4byte 0x030048a0
	thumb_func_end sub_805C78C

	thumb_func_start sub_805C7C4
sub_805C7C4: @ 805C7C4
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl gpu_pal_allocator_reset__manage_upper_four
	ldr r1, _0805C7F4
	ldr r2, _0805C7F8
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0805C7FC
	strb r4, [r0]
	ldr r1, _0805C800
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r0, [r0]
	movs r1, 0
	movs r2, 0xA
	bl pal_patch_for_npc_range
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C7F4: .4byte 0x030005a6
_0805C7F8: .4byte 0x000011ff
_0805C7FC: .4byte 0x030005a4
_0805C800: .4byte gUnknown_0837399C
	thumb_func_end sub_805C7C4

	thumb_func_start npc_paltag_by_palslot
npc_paltag_by_palslot: @ 805C804
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x9
	bhi _0805C840
	ldr r1, _0805C820
	ldr r0, _0805C824
	ldrb r0, [r0]
	lsls r0, 2
	adds r0, r1
	ldr r1, [r0]
	lsls r0, r2, 1
	b _0805C834
	.align 2, 0
_0805C820: .4byte gUnknown_0837399C
_0805C824: .4byte 0x030005a4
_0805C828:
	adds r1, r4, 0x4
	adds r1, r2, r1
	ldr r0, _0805C83C
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, 1
_0805C834:
	adds r0, r1
	ldrh r0, [r0]
	b _0805C872
	.align 2, 0
_0805C83C: .4byte 0x030005a4
_0805C840:
	movs r3, 0
	ldr r0, _0805C878
	ldrh r1, [r0]
	ldr r2, _0805C87C
	adds r4, r0, 0
	cmp r1, r2
	beq _0805C870
	adds r6, r4, 0
	ldr r0, _0805C880
	ldrh r1, [r0]
	adds r5, r2, 0
_0805C856:
	lsls r2, r3, 3
	adds r0, r2, r6
	ldrh r0, [r0]
	cmp r0, r1
	beq _0805C828
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r0, r3, 3
	adds r0, r4
	ldrh r0, [r0]
	cmp r0, r5
	bne _0805C856
_0805C870:
	ldr r0, _0805C87C
_0805C872:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805C878: .4byte gUnknown_083738E4
_0805C87C: .4byte 0x000011ff
_0805C880: .4byte 0x030005a6
	thumb_func_end npc_paltag_by_palslot

	thumb_func_start sub_805C884
sub_805C884: @ 805C884
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805C8A0
	adds r0, r2
	ldr r2, _0805C8A4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805C8A0: .4byte 0x030048a0
_0805C8A4: .4byte sub_805C8A8
	thumb_func_end sub_805C884

	thumb_func_start sub_805C8A8
sub_805C8A8: @ 805C8A8
	movs r0, 0
	bx lr
	thumb_func_end sub_805C8A8

	thumb_func_start sub_805C8AC
sub_805C8AC: @ 805C8AC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805C8C8
	adds r0, r2
	ldr r2, _0805C8CC
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805C8C8: .4byte 0x030048a0
_0805C8CC: .4byte sub_805C8D0
	thumb_func_end sub_805C8AC

	thumb_func_start sub_805C8D0
sub_805C8D0: @ 805C8D0
	push {r4,lr}
	ldr r3, _0805C8EC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805C8EC: .4byte gUnknown_08375224
	thumb_func_end sub_805C8D0

	thumb_func_start sub_805C8F0
sub_805C8F0: @ 805C8F0
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805C8F0

	thumb_func_start sub_805C904
sub_805C904: @ 805C904
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805C904

	thumb_func_start sub_805C930
sub_805C930: @ 805C930
	push {r4-r6,lr}
	adds r6, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805C964
	ldr r5, _0805C960
	bl Random
	movs r4, 0x3
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r5
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r6, 0
	bl sub_8064820
	strh r4, [r6, 0x30]
	movs r0, 0x1
	b _0805C966
	.align 2, 0
_0805C960: .4byte gUnknown_0837520C
_0805C964:
	movs r0, 0
_0805C966:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805C930

	thumb_func_start sub_805C96C
sub_805C96C: @ 805C96C
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805C980
	movs r0, 0
	b _0805C986
_0805C980:
	movs r0, 0x4
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0805C986:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805C96C

	thumb_func_start sub_805C98C
sub_805C98C: @ 805C98C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _0805C9D4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x5
	strh r0, [r6, 0x30]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_805FF20
	lsls r0, 24
	cmp r0, 0
	beq _0805C9CA
	movs r0, 0x1
	strh r0, [r6, 0x30]
_0805C9CA:
	movs r0, 0x1
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805C9D4: .4byte gUnknown_08375240
	thumb_func_end sub_805C98C

	thumb_func_start sub_805C9D8
sub_805C9D8: @ 805C9D8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x6
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805C9D8

	thumb_func_start sub_805CA08
sub_805CA08: @ 805CA08
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805CA26
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805CA26:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805CA08

	thumb_func_start FieldObjectIsTrainerAndCloseToPlayer
FieldObjectIsTrainerAndCloseToPlayer: @ 805CA30
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	movs r0, 0x80
	bl TestPlayerAvatarFlags
	lsls r0, 24
	cmp r0, 0
	beq _0805CA9C
	ldrb r0, [r5, 0x7]
	cmp r0, 0x1
	beq _0805CA4C
	cmp r0, 0x3
	bne _0805CA9C
_0805CA4C:
	mov r7, sp
	adds r7, 0x2
	mov r0, sp
	adds r1, r7, 0
	bl PlayerGetDestCoords
	ldrh r2, [r5, 0x10]
	ldrh r4, [r5, 0x12]
	ldrb r1, [r5, 0x1D]
	subs r3, r2, r1
	subs r0, r4, r1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r2, r1, r2
	lsls r2, 16
	lsrs r2, 16
	adds r1, r4
	lsls r1, 16
	lsrs r6, r1, 16
	mov r0, sp
	lsls r3, 16
	asrs r3, 16
	movs r1, 0
	ldrsh r4, [r0, r1]
	cmp r3, r4
	bgt _0805CA9C
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, r4
	blt _0805CA9C
	lsls r0, r5, 16
	asrs r0, 16
	movs r2, 0
	ldrsh r1, [r7, r2]
	cmp r0, r1
	bgt _0805CA9C
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, r1
	bge _0805CAA0
_0805CA9C:
	movs r0, 0
	b _0805CAA2
_0805CAA0:
	movs r0, 0x1
_0805CAA2:
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectIsTrainerAndCloseToPlayer

	thumb_func_start sub_805CAAC
sub_805CAAC: @ 805CAAC
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 16
	lsls r3, 16
	cmp r2, r3
	ble _0805CACA
	movs r2, 0x4
	lsls r0, r4, 16
	cmp r0, 0
	bge _0805CAD4
	movs r2, 0x3
	b _0805CAD4
_0805CACA:
	movs r2, 0x1
	lsls r0, 16
	cmp r0, 0
	bge _0805CAD4
	movs r2, 0x2
_0805CAD4:
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805CAAC

	thumb_func_start sub_805CADC
sub_805CADC: @ 805CADC
	push {lr}
	movs r0, 0x1
	lsls r1, 16
	cmp r1, 0
	bge _0805CAE8
	movs r0, 0x2
_0805CAE8:
	pop {r1}
	bx r1
	thumb_func_end sub_805CADC

	thumb_func_start sub_805CAEC
sub_805CAEC: @ 805CAEC
	push {lr}
	movs r1, 0x4
	lsls r0, 16
	cmp r0, 0
	bge _0805CAF8
	movs r1, 0x3
_0805CAF8:
	adds r0, r1, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805CAEC

	thumb_func_start sub_805CB00
sub_805CB00: @ 805CB00
	push {r4-r7,lr}
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r7, r3, 16
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805CB3C
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0805CB56
	b _0805CB54
_0805CB3C:
	cmp r0, 0x4
	bne _0805CB56
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CADC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805CB56
_0805CB54:
	movs r0, 0x2
_0805CB56:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CB00

	thumb_func_start sub_805CB5C
sub_805CB5C: @ 805CB5C
	push {r4-r7,lr}
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r7, r3, 16
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805CB98
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805CBB2
	b _0805CBB0
_0805CB98:
	cmp r0, 0x3
	bne _0805CBB2
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CADC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805CBB2
_0805CBB0:
	movs r0, 0x2
_0805CBB2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CB5C

	thumb_func_start sub_805CBB8
sub_805CBB8: @ 805CBB8
	push {r4-r7,lr}
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r7, r3, 16
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805CBF4
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0805CC0E
	b _0805CC0C
_0805CBF4:
	cmp r0, 0x4
	bne _0805CC0E
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CADC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805CC0E
_0805CC0C:
	movs r0, 0x1
_0805CC0E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CBB8

	thumb_func_start sub_805CC14
sub_805CC14: @ 805CC14
	push {r4-r7,lr}
	lsls r0, 16
	asrs r4, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r7, r3, 16
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805CC50
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CAEC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805CC6A
	b _0805CC68
_0805CC50:
	cmp r0, 0x3
	bne _0805CC6A
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	adds r3, r7, 0
	bl sub_805CADC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805CC6A
_0805CC68:
	movs r0, 0x1
_0805CC6A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CC14

	thumb_func_start sub_805CC70
sub_805CC70: @ 805CC70
	push {r4-r7,lr}
	lsls r0, 16
	asrs r7, r0, 16
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r5, r2, 16
	lsls r3, 16
	asrs r4, r3, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bne _0805CCA6
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CADC
	lsls r0, 24
	lsrs r0, 24
_0805CCA6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CC70

	thumb_func_start sub_805CCAC
sub_805CCAC: @ 805CCAC
	push {r4-r7,lr}
	lsls r0, 16
	asrs r7, r0, 16
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r5, r2, 16
	lsls r3, 16
	asrs r4, r3, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x3
	bne _0805CCE2
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CADC
	lsls r0, 24
	lsrs r0, 24
_0805CCE2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CCAC

	thumb_func_start sub_805CCE8
sub_805CCE8: @ 805CCE8
	push {r4-r7,lr}
	lsls r0, 16
	asrs r7, r0, 16
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r5, r2, 16
	lsls r3, 16
	asrs r4, r3, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805CD1E
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CAEC
	lsls r0, 24
	lsrs r0, 24
_0805CD1E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CCE8

	thumb_func_start sub_805CD24
sub_805CD24: @ 805CD24
	push {r4-r7,lr}
	lsls r0, 16
	asrs r7, r0, 16
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r5, r2, 16
	lsls r3, 16
	asrs r4, r3, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CAAC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0805CD5A
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	adds r3, r4, 0
	bl sub_805CAEC
	lsls r0, 24
	lsrs r0, 24
_0805CD5A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805CD24

	thumb_func_start sub_805CD60
sub_805CD60: @ 805CD60
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	lsls r1, 24
	lsrs r6, r1, 24
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	bne _0805CD78
	movs r0, 0
	b _0805CDDC
_0805CD78:
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	mov r2, sp
	mov r0, sp
	ldrh r0, [r0]
	ldrh r1, [r4, 0x10]
	subs r0, r1
	strh r0, [r2]
	ldrh r0, [r5]
	ldrh r1, [r4, 0x12]
	subs r0, r1
	strh r0, [r5]
	mov r0, sp
	ldrh r3, [r5]
	ldrh r2, [r0]
	movs r1, 0
	ldrsh r0, [r0, r1]
	cmp r0, 0
	bge _0805CDAC
	negs r0, r0
	lsls r0, 16
	lsrs r2, r0, 16
_0805CDAC:
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0
	bge _0805CDBA
	negs r0, r0
	lsls r0, 16
	lsrs r3, r0, 16
_0805CDBA:
	ldr r0, _0805CDE4
	lsls r4, r6, 2
	adds r4, r0
	mov r0, sp
	movs r6, 0
	ldrsh r0, [r0, r6]
	movs r6, 0
	ldrsh r1, [r5, r6]
	lsls r2, 16
	asrs r2, 16
	lsls r3, 16
	asrs r3, 16
	ldr r4, [r4]
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
_0805CDDC:
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805CDE4: .4byte gUnknown_08375244
	thumb_func_end sub_805CD60

	thumb_func_start sub_805CDE8
sub_805CDE8: @ 805CDE8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805CE04
	adds r0, r2
	ldr r2, _0805CE08
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805CE04: .4byte 0x030048a0
_0805CE08: .4byte sub_805CE0C
	thumb_func_end sub_805CDE8

	thumb_func_start sub_805CE0C
sub_805CE0C: @ 805CE0C
	push {r4,lr}
	ldr r3, _0805CE28
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805CE28: .4byte gUnknown_08375270
	thumb_func_end sub_805CE0C

	thumb_func_start sub_805CE2C
sub_805CE2C: @ 805CE2C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805CE2C

	thumb_func_start sub_805CE40
sub_805CE40: @ 805CE40
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805CE40

	thumb_func_start sub_805CE6C
sub_805CE6C: @ 805CE6C
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805CEA2
	ldr r4, _0805CEAC
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805CEA2:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805CEAC: .4byte gUnknown_0837520C
	thumb_func_end sub_805CE6C

	thumb_func_start sub_805CEB0
sub_805CEB0: @ 805CEB0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805CECE
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805CED6
_0805CECE:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805CED8
_0805CED6:
	movs r0, 0
_0805CED8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805CEB0

	thumb_func_start sub_805CEE0
sub_805CEE0: @ 805CEE0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805CF24
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805CF10
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805CF10:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805CF24: .4byte gUnknown_08375240
	thumb_func_end sub_805CEE0

	thumb_func_start sub_805CF28
sub_805CF28: @ 805CF28
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805CF44
	adds r0, r2
	ldr r2, _0805CF48
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805CF44: .4byte 0x030048a0
_0805CF48: .4byte sub_805CF4C
	thumb_func_end sub_805CF28

	thumb_func_start sub_805CF4C
sub_805CF4C: @ 805CF4C
	push {r4,lr}
	ldr r3, _0805CF68
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805CF68: .4byte gUnknown_08375284
	thumb_func_end sub_805CF4C

	thumb_func_start sub_805CF6C
sub_805CF6C: @ 805CF6C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805CF6C

	thumb_func_start sub_805CF80
sub_805CF80: @ 805CF80
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805CF80

	thumb_func_start sub_805CFAC
sub_805CFAC: @ 805CFAC
	push {r4-r6,lr}
	adds r6, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805CFE0
	ldr r5, _0805CFDC
	bl Random
	movs r4, 0x3
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r5
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r6, 0
	bl sub_8064820
	strh r4, [r6, 0x30]
	movs r0, 0x1
	b _0805CFE2
	.align 2, 0
_0805CFDC: .4byte gUnknown_0837520C
_0805CFE0:
	movs r0, 0
_0805CFE2:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805CFAC

	thumb_func_start sub_805CFE8
sub_805CFE8: @ 805CFE8
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805CFFC
	movs r0, 0
	b _0805D002
_0805CFFC:
	movs r0, 0x4
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0805D002:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805CFE8

	thumb_func_start sub_805D008
sub_805D008: @ 805D008
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _0805D050
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	bl Random
	movs r7, 0x1
	adds r1, r7, 0
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x5
	strh r0, [r6, 0x30]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_805FF20
	lsls r0, 24
	cmp r0, 0
	beq _0805D046
	strh r7, [r6, 0x30]
_0805D046:
	movs r0, 0x1
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D050: .4byte gUnknown_083752A0
	thumb_func_end sub_805D008

	thumb_func_start sub_805D054
sub_805D054: @ 805D054
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x6
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D054

	thumb_func_start sub_805D084
sub_805D084: @ 805D084
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D0A2
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805D0A2:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D084

	thumb_func_start sub_805D0AC
sub_805D0AC: @ 805D0AC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805D0C8
	adds r0, r2
	ldr r2, _0805D0CC
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805D0C8: .4byte 0x030048a0
_0805D0CC: .4byte sub_805D0D0
	thumb_func_end sub_805D0AC

	thumb_func_start sub_805D0D0
sub_805D0D0: @ 805D0D0
	push {r4,lr}
	ldr r3, _0805D0EC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D0EC: .4byte gUnknown_083752A4
	thumb_func_end sub_805D0D0

	thumb_func_start sub_805D0F0
sub_805D0F0: @ 805D0F0
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D0F0

	thumb_func_start sub_805D104
sub_805D104: @ 805D104
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D104

	thumb_func_start sub_805D130
sub_805D130: @ 805D130
	push {r4-r6,lr}
	adds r6, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D164
	ldr r5, _0805D160
	bl Random
	movs r4, 0x3
	adds r1, r4, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r5
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r6, 0
	bl sub_8064820
	strh r4, [r6, 0x30]
	movs r0, 0x1
	b _0805D166
	.align 2, 0
_0805D160: .4byte gUnknown_0837520C
_0805D164:
	movs r0, 0
_0805D166:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805D130

	thumb_func_start sub_805D16C
sub_805D16C: @ 805D16C
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805D180
	movs r0, 0
	b _0805D186
_0805D180:
	movs r0, 0x4
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0805D186:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D16C

	thumb_func_start sub_805D18C
sub_805D18C: @ 805D18C
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _0805D1D4
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	bl Random
	movs r7, 0x1
	adds r1, r7, 0
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r4, [r0]
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x5
	strh r0, [r6, 0x30]
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_805FF20
	lsls r0, 24
	cmp r0, 0
	beq _0805D1CA
	strh r7, [r6, 0x30]
_0805D1CA:
	movs r0, 0x1
	add sp, 0x4
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D1D4: .4byte gUnknown_083752C0
	thumb_func_end sub_805D18C

	thumb_func_start sub_805D1D8
sub_805D1D8: @ 805D1D8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x6
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D1D8

	thumb_func_start sub_805D208
sub_805D208: @ 805D208
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D226
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805D226:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D208

	thumb_func_start sub_805D230
sub_805D230: @ 805D230
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805D24C
	adds r0, r2
	ldr r2, _0805D250
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805D24C: .4byte 0x030048a0
_0805D250: .4byte sub_805D254
	thumb_func_end sub_805D230

	thumb_func_start sub_805D254
sub_805D254: @ 805D254
	push {r4,lr}
	ldr r3, _0805D270
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D270: .4byte gUnknown_083752C4
	thumb_func_end sub_805D254

	thumb_func_start sub_805D274
sub_805D274: @ 805D274
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D274

	thumb_func_start sub_805D2A0
sub_805D2A0: @ 805D2A0
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	bne _0805D2B2
	movs r0, 0
	b _0805D2B8
_0805D2B2:
	movs r0, 0x2
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0805D2B8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D2A0

	thumb_func_start sub_805D2C0
sub_805D2C0: @ 805D2C0
	ldrb r2, [r0]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0
	bx lr
	thumb_func_end sub_805D2C0

	thumb_func_start FieldObjectCB_BerryTree
FieldObjectCB_BerryTree: @ 805D2D0
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r0, 0x2E
	ldrsh r1, [r4, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805D30C
	adds r5, r0, r1
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _0805D2FC
	adds r0, r5, 0
	adds r1, r4, 0
	bl get_berry_tree_graphics
	ldrh r1, [r4, 0x3C]
	movs r0, 0x1
	orrs r0, r1
	strh r0, [r4, 0x3C]
_0805D2FC:
	ldr r2, _0805D310
	adds r0, r5, 0
	adds r1, r4, 0
	bl meta_step
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D30C: .4byte 0x030048a0
_0805D310: .4byte sub_805D314
	thumb_func_end FieldObjectCB_BerryTree

	thumb_func_start sub_805D314
sub_805D314: @ 805D314
	push {r4,lr}
	ldr r3, _0805D330
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D330: .4byte gUnknown_083752D0
	thumb_func_end sub_805D314

	thumb_func_start do_berry_tree_growth_sparkle_1
do_berry_tree_growth_sparkle_1: @ 805D334
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r6, r5, 0
	adds r6, 0x3E
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	ldrb r0, [r4, 0x1D]
	bl GetStageByBerryTreeId
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0
	bne _0805D3A4
	ldrh r1, [r5, 0x3C]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	bne _0805D39A
	subs r6, 0x14
	ldrb r0, [r6]
	cmp r0, 0x4
	bne _0805D39A
	ldr r1, _0805D3A0
	movs r2, 0x10
	ldrsh r0, [r4, r2]
	str r0, [r1]
	movs r2, 0x12
	ldrsh r0, [r4, r2]
	str r0, [r1, 0x4]
	adds r0, r5, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r1, 0x8]
	ldrb r0, [r5, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r1, 0xC]
	movs r0, 0x17
	bl FieldEffectStart
	strb r7, [r6]
_0805D39A:
	movs r0, 0
	b _0805D3E6
	.align 2, 0
_0805D3A0: .4byte 0x0202ff84
_0805D3A4:
	ldrb r1, [r4, 0x1]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x1]
	ldrb r1, [r6]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	subs r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	adds r0, 0x2A
	ldrb r0, [r0]
	cmp r0, r7
	bne _0805D3E0
	adds r0, r4, 0
	adds r1, r5, 0
	bl get_berry_tree_graphics
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x39
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	b _0805D3E6
_0805D3E0:
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
_0805D3E6:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end do_berry_tree_growth_sparkle_1

	thumb_func_start sub_805D3EC
sub_805D3EC: @ 805D3EC
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	bne _0805D3FE
	movs r0, 0
	b _0805D404
_0805D3FE:
	movs r0, 0
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0805D404:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D3EC

	thumb_func_start do_berry_tree_growth_sparkle_2
do_berry_tree_growth_sparkle_2: @ 805D40C
	push {r4,lr}
	ldrb r2, [r0]
	movs r3, 0x2
	orrs r2, r3
	strb r2, [r0]
	movs r3, 0
	movs r2, 0x3
	strh r2, [r1, 0x30]
	strh r3, [r1, 0x32]
	ldrh r3, [r1, 0x3C]
	movs r2, 0x2
	orrs r2, r3
	strh r2, [r1, 0x3C]
	ldr r3, _0805D454
	movs r4, 0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r2, 0x12
	ldrsh r0, [r0, r2]
	str r0, [r3, 0x4]
	adds r0, r1, 0
	adds r0, 0x43
	ldrb r0, [r0]
	subs r0, 0x1
	str r0, [r3, 0x8]
	ldrb r0, [r1, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0x17
	bl FieldEffectStart
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D454: .4byte 0x0202ff84
	thumb_func_end do_berry_tree_growth_sparkle_2

	thumb_func_start sub_805D458
sub_805D458: @ 805D458
	push {r4,lr}
	adds r3, r0, 0
	adds r4, r1, 0
	ldrh r1, [r4, 0x32]
	adds r1, 0x1
	strh r1, [r4, 0x32]
	movs r0, 0x2
	ands r1, r0
	lsls r1, 16
	lsrs r1, 17
	lsls r1, 5
	ldrb r2, [r3, 0x1]
	subs r0, 0x23
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, 0x1]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	bgt _0805D490
	movs r0, 0
	b _0805D4A2
_0805D490:
	adds r0, r3, 0
	adds r1, r4, 0
	bl get_berry_tree_graphics
	movs r0, 0x4
	strh r0, [r4, 0x30]
	movs r0, 0
	strh r0, [r4, 0x32]
	movs r0, 0x1
_0805D4A2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D458

	thumb_func_start sub_805D4A8
sub_805D4A8: @ 805D4A8
	push {r4,lr}
	adds r4, r1, 0
	ldrh r2, [r4, 0x32]
	adds r2, 0x1
	strh r2, [r4, 0x32]
	movs r1, 0x2
	ands r2, r1
	lsls r2, 16
	lsrs r2, 17
	lsls r2, 5
	ldrb r3, [r0, 0x1]
	subs r1, 0x23
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x1]
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r1, 0x32
	ldrsh r0, [r4, r1]
	cmp r0, 0x40
	bgt _0805D4DE
	movs r0, 0
	b _0805D4EC
_0805D4DE:
	movs r0, 0
	strh r0, [r4, 0x30]
	ldrh r1, [r4, 0x3C]
	subs r0, 0x3
	ands r0, r1
	strh r0, [r4, 0x3C]
	movs r0, 0x1
_0805D4EC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D4A8

	thumb_func_start sub_805D4F4
sub_805D4F4: @ 805D4F4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805D510
	adds r0, r2
	ldr r2, _0805D514
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805D510: .4byte 0x030048a0
_0805D514: .4byte sub_805D518
	thumb_func_end sub_805D4F4

	thumb_func_start sub_805D518
sub_805D518: @ 805D518
	push {r4,lr}
	ldr r3, _0805D534
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D534: .4byte gUnknown_083752E4
	thumb_func_end sub_805D518

	thumb_func_start sub_805D538
sub_805D538: @ 805D538
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D538

	thumb_func_start sub_805D54C
sub_805D54C: @ 805D54C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D54C

	thumb_func_start sub_805D578
sub_805D578: @ 805D578
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D5AE
	ldr r4, _0805D5B8
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805D5AE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D5B8: .4byte gUnknown_0837520C
	thumb_func_end sub_805D578

	thumb_func_start sub_805D5BC
sub_805D5BC: @ 805D5BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805D5DA
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805D5E2
_0805D5DA:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805D5E4
_0805D5E2:
	movs r0, 0
_0805D5E4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D5BC

	thumb_func_start sub_805D5EC
sub_805D5EC: @ 805D5EC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805D630
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805D61C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805D61C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D630: .4byte gUnknown_083752A0
	thumb_func_end sub_805D5EC

	thumb_func_start sub_805D634
sub_805D634: @ 805D634
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805D650
	adds r0, r2
	ldr r2, _0805D654
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805D650: .4byte 0x030048a0
_0805D654: .4byte sub_805D658
	thumb_func_end sub_805D634

	thumb_func_start sub_805D658
sub_805D658: @ 805D658
	push {r4,lr}
	ldr r3, _0805D674
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D674: .4byte gUnknown_083752F8
	thumb_func_end sub_805D658

	thumb_func_start sub_805D678
sub_805D678: @ 805D678
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D678

	thumb_func_start sub_805D68C
sub_805D68C: @ 805D68C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D68C

	thumb_func_start sub_805D6B8
sub_805D6B8: @ 805D6B8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D6EE
	ldr r4, _0805D6F8
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805D6EE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D6F8: .4byte gUnknown_0837520C
	thumb_func_end sub_805D6B8

	thumb_func_start sub_805D6FC
sub_805D6FC: @ 805D6FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805D71A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805D722
_0805D71A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805D724
_0805D722:
	movs r0, 0
_0805D724:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D6FC

	thumb_func_start sub_805D72C
sub_805D72C: @ 805D72C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805D770
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805D75C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805D75C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D770: .4byte gUnknown_083752C0
	thumb_func_end sub_805D72C

	thumb_func_start sub_805D774
sub_805D774: @ 805D774
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805D790
	adds r0, r2
	ldr r2, _0805D794
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805D790: .4byte 0x030048a0
_0805D794: .4byte sub_805D798
	thumb_func_end sub_805D774

	thumb_func_start sub_805D798
sub_805D798: @ 805D798
	push {r4,lr}
	ldr r3, _0805D7B4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D7B4: .4byte gUnknown_0837530C
	thumb_func_end sub_805D798

	thumb_func_start sub_805D7B8
sub_805D7B8: @ 805D7B8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D7B8

	thumb_func_start sub_805D7CC
sub_805D7CC: @ 805D7CC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D7CC

	thumb_func_start sub_805D7F8
sub_805D7F8: @ 805D7F8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D82E
	ldr r4, _0805D838
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805D82E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D838: .4byte gUnknown_0837521C
	thumb_func_end sub_805D7F8

	thumb_func_start sub_805D83C
sub_805D83C: @ 805D83C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805D85A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805D862
_0805D85A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805D864
_0805D862:
	movs r0, 0
_0805D864:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D83C

	thumb_func_start sub_805D86C
sub_805D86C: @ 805D86C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805D8B0
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x3
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805D89C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805D89C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D8B0: .4byte gUnknown_08375320
	thumb_func_end sub_805D86C

	thumb_func_start sub_805D8B4
sub_805D8B4: @ 805D8B4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805D8D0
	adds r0, r2
	ldr r2, _0805D8D4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805D8D0: .4byte 0x030048a0
_0805D8D4: .4byte sub_805D8D8
	thumb_func_end sub_805D8B4

	thumb_func_start sub_805D8D8
sub_805D8D8: @ 805D8D8
	push {r4,lr}
	ldr r3, _0805D8F4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805D8F4: .4byte gUnknown_08375324
	thumb_func_end sub_805D8D8

	thumb_func_start sub_805D8F8
sub_805D8F8: @ 805D8F8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805D8F8

	thumb_func_start sub_805D90C
sub_805D90C: @ 805D90C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D90C

	thumb_func_start sub_805D938
sub_805D938: @ 805D938
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805D96E
	ldr r4, _0805D978
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805D96E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805D978: .4byte gUnknown_0837521C
	thumb_func_end sub_805D938

	thumb_func_start sub_805D97C
sub_805D97C: @ 805D97C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805D99A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805D9A2
_0805D99A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805D9A4
_0805D9A2:
	movs r0, 0
_0805D9A4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805D97C

	thumb_func_start sub_805D9AC
sub_805D9AC: @ 805D9AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805D9F0
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805D9DC
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805D9DC:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805D9F0: .4byte gUnknown_08375338
	thumb_func_end sub_805D9AC

	thumb_func_start sub_805D9F4
sub_805D9F4: @ 805D9F4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805DA10
	adds r0, r2
	ldr r2, _0805DA14
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805DA10: .4byte 0x030048a0
_0805DA14: .4byte sub_805DA18
	thumb_func_end sub_805D9F4

	thumb_func_start sub_805DA18
sub_805DA18: @ 805DA18
	push {r4,lr}
	ldr r3, _0805DA34
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805DA34: .4byte gUnknown_0837533C
	thumb_func_end sub_805DA18

	thumb_func_start sub_805DA38
sub_805DA38: @ 805DA38
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805DA38

	thumb_func_start sub_805DA4C
sub_805DA4C: @ 805DA4C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DA4C

	thumb_func_start sub_805DA78
sub_805DA78: @ 805DA78
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805DAAE
	ldr r4, _0805DAB8
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805DAAE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805DAB8: .4byte gUnknown_0837521C
	thumb_func_end sub_805DA78

	thumb_func_start sub_805DABC
sub_805DABC: @ 805DABC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805DADA
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805DAE2
_0805DADA:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805DAE4
_0805DAE2:
	movs r0, 0
_0805DAE4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DABC

	thumb_func_start sub_805DAEC
sub_805DAEC: @ 805DAEC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805DB30
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x5
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805DB1C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805DB1C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805DB30: .4byte gUnknown_08375350
	thumb_func_end sub_805DAEC

	thumb_func_start sub_805DB34
sub_805DB34: @ 805DB34
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805DB50
	adds r0, r2
	ldr r2, _0805DB54
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805DB50: .4byte 0x030048a0
_0805DB54: .4byte sub_805DB58
	thumb_func_end sub_805DB34

	thumb_func_start sub_805DB58
sub_805DB58: @ 805DB58
	push {r4,lr}
	ldr r3, _0805DB74
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805DB74: .4byte gUnknown_08375354
	thumb_func_end sub_805DB58

	thumb_func_start sub_805DB78
sub_805DB78: @ 805DB78
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805DB78

	thumb_func_start sub_805DB8C
sub_805DB8C: @ 805DB8C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DB8C

	thumb_func_start sub_805DBB8
sub_805DBB8: @ 805DBB8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805DBEE
	ldr r4, _0805DBF8
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805DBEE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805DBF8: .4byte gUnknown_0837521C
	thumb_func_end sub_805DBB8

	thumb_func_start sub_805DBFC
sub_805DBFC: @ 805DBFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805DC1A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805DC22
_0805DC1A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805DC24
_0805DC22:
	movs r0, 0
_0805DC24:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DBFC

	thumb_func_start sub_805DC2C
sub_805DC2C: @ 805DC2C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805DC70
	mov r0, sp
	movs r2, 0x2
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x6
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805DC5C
	bl Random
	movs r1, 0x1
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805DC5C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805DC70: .4byte gUnknown_08375368
	thumb_func_end sub_805DC2C

	thumb_func_start sub_805DC74
sub_805DC74: @ 805DC74
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805DC90
	adds r0, r2
	ldr r2, _0805DC94
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805DC90: .4byte 0x030048a0
_0805DC94: .4byte sub_805DC98
	thumb_func_end sub_805DC74

	thumb_func_start sub_805DC98
sub_805DC98: @ 805DC98
	push {r4,lr}
	ldr r3, _0805DCB4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805DCB4: .4byte gUnknown_0837536C
	thumb_func_end sub_805DC98

	thumb_func_start sub_805DCB8
sub_805DCB8: @ 805DCB8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805DCB8

	thumb_func_start sub_805DCCC
sub_805DCCC: @ 805DCCC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DCCC

	thumb_func_start sub_805DCF8
sub_805DCF8: @ 805DCF8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805DD2E
	ldr r4, _0805DD38
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805DD2E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805DD38: .4byte gUnknown_0837521C
	thumb_func_end sub_805DCF8

	thumb_func_start sub_805DD3C
sub_805DD3C: @ 805DD3C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805DD5A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805DD62
_0805DD5A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805DD64
_0805DD62:
	movs r0, 0
_0805DD64:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DD3C

	thumb_func_start sub_805DD6C
sub_805DD6C: @ 805DD6C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805DDB0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x7
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805DD9C
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805DD9C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805DDB0: .4byte gUnknown_08375380
	thumb_func_end sub_805DD6C

	thumb_func_start sub_805DDB4
sub_805DDB4: @ 805DDB4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805DDD0
	adds r0, r2
	ldr r2, _0805DDD4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805DDD0: .4byte 0x030048a0
_0805DDD4: .4byte sub_805DDD8
	thumb_func_end sub_805DDB4

	thumb_func_start sub_805DDD8
sub_805DDD8: @ 805DDD8
	push {r4,lr}
	ldr r3, _0805DDF4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805DDF4: .4byte gUnknown_08375384
	thumb_func_end sub_805DDD8

	thumb_func_start sub_805DDF8
sub_805DDF8: @ 805DDF8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805DDF8

	thumb_func_start sub_805DE0C
sub_805DE0C: @ 805DE0C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DE0C

	thumb_func_start sub_805DE38
sub_805DE38: @ 805DE38
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805DE6E
	ldr r4, _0805DE78
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805DE6E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805DE78: .4byte gUnknown_0837521C
	thumb_func_end sub_805DE38

	thumb_func_start sub_805DE7C
sub_805DE7C: @ 805DE7C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805DE9A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805DEA2
_0805DE9A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805DEA4
_0805DEA2:
	movs r0, 0
_0805DEA4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DE7C

	thumb_func_start sub_805DEAC
sub_805DEAC: @ 805DEAC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805DEF0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x8
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805DEDC
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805DEDC:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805DEF0: .4byte gUnknown_08375398
	thumb_func_end sub_805DEAC

	thumb_func_start sub_805DEF4
sub_805DEF4: @ 805DEF4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805DF10
	adds r0, r2
	ldr r2, _0805DF14
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805DF10: .4byte 0x030048a0
_0805DF14: .4byte sub_805DF18
	thumb_func_end sub_805DEF4

	thumb_func_start sub_805DF18
sub_805DF18: @ 805DF18
	push {r4,lr}
	ldr r3, _0805DF34
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805DF34: .4byte gUnknown_0837539C
	thumb_func_end sub_805DF18

	thumb_func_start sub_805DF38
sub_805DF38: @ 805DF38
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805DF38

	thumb_func_start sub_805DF4C
sub_805DF4C: @ 805DF4C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DF4C

	thumb_func_start sub_805DF78
sub_805DF78: @ 805DF78
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805DFAE
	ldr r4, _0805DFB8
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805DFAE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805DFB8: .4byte gUnknown_0837521C
	thumb_func_end sub_805DF78

	thumb_func_start sub_805DFBC
sub_805DFBC: @ 805DFBC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805DFDA
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805DFE2
_0805DFDA:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805DFE4
_0805DFE2:
	movs r0, 0
_0805DFE4:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805DFBC

	thumb_func_start sub_805DFEC
sub_805DFEC: @ 805DFEC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E030
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0x9
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805E01C
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805E01C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E030: .4byte gUnknown_083753B0
	thumb_func_end sub_805DFEC

	thumb_func_start sub_805E034
sub_805E034: @ 805E034
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E050
	adds r0, r2
	ldr r2, _0805E054
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E050: .4byte 0x030048a0
_0805E054: .4byte sub_805E058
	thumb_func_end sub_805E034

	thumb_func_start sub_805E058
sub_805E058: @ 805E058
	push {r4,lr}
	ldr r3, _0805E074
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E074: .4byte gUnknown_083753B4
	thumb_func_end sub_805E058

	thumb_func_start sub_805E078
sub_805E078: @ 805E078
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805E078

	thumb_func_start sub_805E08C
sub_805E08C: @ 805E08C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E08C

	thumb_func_start sub_805E0B8
sub_805E0B8: @ 805E0B8
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E0EE
	ldr r4, _0805E0F8
	bl Random
	movs r5, 0x3
	adds r1, r5, 0
	ands r1, r0
	lsls r1, 1
	adds r1, r4
	movs r0, 0
	ldrsh r1, [r1, r0]
	adds r0, r7, 0
	bl sub_8064820
	ldrb r1, [r6]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r6]
	strh r5, [r7, 0x30]
_0805E0EE:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805E0F8: .4byte gUnknown_0837521C
	thumb_func_end sub_805E0B8

	thumb_func_start sub_805E0FC
sub_805E0FC: @ 805E0FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805E11A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805E122
_0805E11A:
	movs r0, 0x4
	strh r0, [r5, 0x30]
	movs r0, 0x1
	b _0805E124
_0805E122:
	movs r0, 0
_0805E124:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E0FC

	thumb_func_start sub_805E12C
sub_805E12C: @ 805E12C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E170
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r0, r4, 0
	movs r1, 0xA
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805E15C
	bl Random
	movs r1, 0x3
	ands r1, r0
	mov r2, sp
	adds r0, r2, r1
	ldrb r1, [r0]
_0805E15C:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x30]
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E170: .4byte gUnknown_083753C8
	thumb_func_end sub_805E12C

	thumb_func_start sub_805E174
sub_805E174: @ 805E174
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E190
	adds r0, r2
	ldr r2, _0805E194
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E190: .4byte 0x030048a0
_0805E194: .4byte sub_805E198
	thumb_func_end sub_805E174

	thumb_func_start sub_805E198
sub_805E198: @ 805E198
	push {r4,lr}
	ldr r3, _0805E1B4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E1B4: .4byte gUnknown_083753CC
	thumb_func_end sub_805E198

	thumb_func_start sub_805E1B8
sub_805E1B8: @ 805E1B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E1B8

	thumb_func_start sub_805E1E4
sub_805E1E4: @ 805E1E4
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E1FE
	adds r0, r4, 0
	movs r1, 0x30
	bl sub_8064820
	movs r0, 0x2
	strh r0, [r4, 0x30]
_0805E1FE:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805E1E4

	thumb_func_start sub_805E208
sub_805E208: @ 805E208
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805E226
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805E22A
_0805E226:
	movs r0, 0x3
	strh r0, [r5, 0x30]
_0805E22A:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E208

	thumb_func_start sub_805E234
sub_805E234: @ 805E234
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E274
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	movs r1, 0
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805E260
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
_0805E260:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0
	strh r0, [r5, 0x30]
	movs r0, 0x1
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E274: .4byte gUnknown_083753DC
	thumb_func_end sub_805E234

	thumb_func_start sub_805E278
sub_805E278: @ 805E278
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E294
	adds r0, r2
	ldr r2, _0805E298
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E294: .4byte 0x030048a0
_0805E298: .4byte sub_805E29C
	thumb_func_end sub_805E278

	thumb_func_start sub_805E29C
sub_805E29C: @ 805E29C
	push {r4,lr}
	ldr r3, _0805E2B8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E2B8: .4byte gUnknown_083753E4
	thumb_func_end sub_805E29C

	thumb_func_start sub_805E2BC
sub_805E2BC: @ 805E2BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E2BC

	thumb_func_start sub_805E2E8
sub_805E2E8: @ 805E2E8
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E302
	adds r0, r4, 0
	movs r1, 0x30
	bl sub_8064820
	movs r0, 0x2
	strh r0, [r4, 0x30]
_0805E302:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805E2E8

	thumb_func_start sub_805E30C
sub_805E30C: @ 805E30C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	bne _0805E32A
	adds r0, r4, 0
	bl FieldObjectIsTrainerAndCloseToPlayer
	lsls r0, 24
	cmp r0, 0
	beq _0805E32E
_0805E32A:
	movs r0, 0x3
	strh r0, [r5, 0x30]
_0805E32E:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E30C

	thumb_func_start sub_805E338
sub_805E338: @ 805E338
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E378
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	adds r0, r4, 0
	movs r1, 0
	bl sub_805CD60
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0
	bne _0805E364
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	add r0, sp
	ldrb r1, [r0]
_0805E364:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0
	strh r0, [r5, 0x30]
	movs r0, 0x1
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E378: .4byte gUnknown_083753F4
	thumb_func_end sub_805E338

	thumb_func_start sub_805E37C
sub_805E37C: @ 805E37C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E398
	adds r0, r2
	ldr r2, _0805E39C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E398: .4byte 0x030048a0
_0805E39C: .4byte sub_805E3A0
	thumb_func_end sub_805E37C

	thumb_func_start sub_805E3A0
sub_805E3A0: @ 805E3A0
	push {r4,lr}
	ldr r3, _0805E3BC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E3BC: .4byte gUnknown_083753FC
	thumb_func_end sub_805E3A0

	thumb_func_start sub_805E3C0
sub_805E3C0: @ 805E3C0
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805E3C0

	thumb_func_start sub_805E3D4
sub_805E3D4: @ 805E3D4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _0805E408
	ldrb r1, [r4, 0x6]
	adds r1, r0
	ldrb r1, [r1]
	adds r0, r4, 0
	adds r0, 0x21
	ldrb r0, [r0]
	cmp r0, 0
	beq _0805E3F6
	adds r0, r1, 0
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r1, r0, 24
_0805E3F6:
	adds r0, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E408: .4byte gUnknown_0836DC09
	thumb_func_end sub_805E3D4

	thumb_func_start sub_805E40C
sub_805E40C: @ 805E40C
	push {r4-r7,lr}
	adds r4, r0, 0
	adds r7, r1, 0
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0
	beq _0805E43C
	ldr r1, [r4, 0xC]
	ldr r0, [r4, 0x10]
	cmp r1, r0
	bne _0805E43C
	movs r0, 0
	strb r0, [r2]
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetOppositeDirection
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetDirection
_0805E43C:
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl sub_805FF20
	lsls r0, 24
	lsrs r5, r0, 24
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r5, 0x1
	bne _0805E492
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetOppositeDirection
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl sub_805FF20
	lsls r0, 24
	lsrs r5, r0, 24
_0805E492:
	cmp r5, 0
	beq _0805E4A4
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay16AnimId
	lsls r0, 24
	lsrs r6, r0, 24
_0805E4A4:
	adds r0, r4, 0
	adds r1, r7, 0
	adds r2, r6, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x3
	strh r0, [r7, 0x30]
	movs r0, 0x1
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_805E40C

	thumb_func_start sub_805E4C4
sub_805E4C4: @ 805E4C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E4E2
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805E4E2:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E4C4

	thumb_func_start sub_805E4EC
sub_805E4EC: @ 805E4EC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_reset
	movs r0, 0x1
	strh r0, [r4, 0x30]
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805E4EC

	thumb_func_start MoveFieldObjectInNextDirectionInSequence
MoveFieldObjectInNextDirectionInSequence: @ 805E500
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	mov r8, r1
	adds r7, r2, 0
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x3
	bne _0805E522
	ldr r1, [r4, 0xC]
	ldr r0, [r4, 0x10]
	cmp r1, r0
	bne _0805E522
	movs r0, 0
	strb r0, [r2]
_0805E522:
	adds r5, r4, 0
	adds r5, 0x21
	ldrb r0, [r5]
	adds r0, r7, r0
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl sub_805FF20
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0805E57C
	ldrb r0, [r5]
	adds r0, 0x1
	strb r0, [r5]
	ldrb r0, [r5]
	adds r0, r7, r0
	ldrb r1, [r0]
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetGoSpeed0AnimId
	lsls r0, 24
	lsrs r6, r0, 24
	ldrb r1, [r4, 0x18]
	lsrs r1, 4
	adds r0, r4, 0
	bl sub_805FF20
	lsls r0, 24
	lsrs r0, 24
_0805E57C:
	cmp r0, 0
	beq _0805E58E
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay16AnimId
	lsls r0, 24
	lsrs r6, r0, 24
_0805E58E:
	adds r0, r4, 0
	mov r1, r8
	adds r2, r6, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	mov r1, r8
	strh r0, [r1, 0x30]
	movs r0, 0x1
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end MoveFieldObjectInNextDirectionInSequence

	thumb_func_start sub_805E5B4
sub_805E5B4: @ 805E5B4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805E5D2
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805E5D2:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805E5B4

	thumb_func_start sub_805E5DC
sub_805E5DC: @ 805E5DC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E5F8
	adds r0, r2
	ldr r2, _0805E5FC
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E5F8: .4byte 0x030048a0
_0805E5FC: .4byte sub_805E600
	thumb_func_end sub_805E5DC

	thumb_func_start sub_805E600
sub_805E600: @ 805E600
	push {r4,lr}
	ldr r3, _0805E61C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E61C: .4byte gUnknown_0837540C
	thumb_func_end sub_805E600

	thumb_func_start sub_805E620
sub_805E620: @ 805E620
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E664
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805E64C
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E64C
	movs r0, 0x3
	strb r0, [r2]
_0805E64C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E664: .4byte gUnknown_08375418
	thumb_func_end sub_805E620

	thumb_func_start sub_805E668
sub_805E668: @ 805E668
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E684
	adds r0, r2
	ldr r2, _0805E688
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E684: .4byte 0x030048a0
_0805E688: .4byte sub_805E68C
	thumb_func_end sub_805E668

	thumb_func_start sub_805E68C
sub_805E68C: @ 805E68C
	push {r4,lr}
	ldr r3, _0805E6A8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E6A8: .4byte gUnknown_0837541C
	thumb_func_end sub_805E68C

	thumb_func_start sub_805E6AC
sub_805E6AC: @ 805E6AC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E6F0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805E6D8
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E6D8
	movs r0, 0x2
	strb r0, [r2]
_0805E6D8:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E6F0: .4byte gUnknown_08375428
	thumb_func_end sub_805E6AC

	thumb_func_start sub_805E6F4
sub_805E6F4: @ 805E6F4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E710
	adds r0, r2
	ldr r2, _0805E714
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E710: .4byte 0x030048a0
_0805E714: .4byte sub_805E718
	thumb_func_end sub_805E6F4

	thumb_func_start sub_805E718
sub_805E718: @ 805E718
	push {r4,lr}
	ldr r3, _0805E734
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E734: .4byte gUnknown_0837542C
	thumb_func_end sub_805E718

	thumb_func_start sub_805E738
sub_805E738: @ 805E738
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E77C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805E764
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E764
	movs r0, 0x2
	strb r0, [r2]
_0805E764:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E77C: .4byte gUnknown_08375438
	thumb_func_end sub_805E738

	thumb_func_start sub_805E780
sub_805E780: @ 805E780
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E79C
	adds r0, r2
	ldr r2, _0805E7A0
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E79C: .4byte 0x030048a0
_0805E7A0: .4byte sub_805E7A4
	thumb_func_end sub_805E780

	thumb_func_start sub_805E7A4
sub_805E7A4: @ 805E7A4
	push {r4,lr}
	ldr r3, _0805E7C0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E7C0: .4byte gUnknown_0837543C
	thumb_func_end sub_805E7A4

	thumb_func_start sub_805E7C4
sub_805E7C4: @ 805E7C4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E808
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805E7F0
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E7F0
	movs r0, 0x3
	strb r0, [r2]
_0805E7F0:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E808: .4byte gUnknown_08375448
	thumb_func_end sub_805E7C4

	thumb_func_start sub_805E80C
sub_805E80C: @ 805E80C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E828
	adds r0, r2
	ldr r2, _0805E82C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E828: .4byte 0x030048a0
_0805E82C: .4byte sub_805E830
	thumb_func_end sub_805E80C

	thumb_func_start sub_805E830
sub_805E830: @ 805E830
	push {r4,lr}
	ldr r3, _0805E84C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E84C: .4byte gUnknown_0837544C
	thumb_func_end sub_805E830

	thumb_func_start sub_805E850
sub_805E850: @ 805E850
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E894
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805E87C
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E87C
	movs r0, 0x3
	strb r0, [r2]
_0805E87C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E894: .4byte gUnknown_08375458
	thumb_func_end sub_805E850

	thumb_func_start sub_805E898
sub_805E898: @ 805E898
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E8B4
	adds r0, r2
	ldr r2, _0805E8B8
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E8B4: .4byte 0x030048a0
_0805E8B8: .4byte sub_805E8BC
	thumb_func_end sub_805E898

	thumb_func_start sub_805E8BC
sub_805E8BC: @ 805E8BC
	push {r4,lr}
	ldr r3, _0805E8D8
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E8D8: .4byte gUnknown_0837545C
	thumb_func_end sub_805E8BC

	thumb_func_start sub_805E8DC
sub_805E8DC: @ 805E8DC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E920
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805E908
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E908
	movs r0, 0x2
	strb r0, [r2]
_0805E908:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E920: .4byte gUnknown_08375468
	thumb_func_end sub_805E8DC

	thumb_func_start sub_805E924
sub_805E924: @ 805E924
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E940
	adds r0, r2
	ldr r2, _0805E944
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E940: .4byte 0x030048a0
_0805E944: .4byte sub_805E948
	thumb_func_end sub_805E924

	thumb_func_start sub_805E948
sub_805E948: @ 805E948
	push {r4,lr}
	ldr r3, _0805E964
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E964: .4byte gUnknown_0837546C
	thumb_func_end sub_805E948

	thumb_func_start sub_805E968
sub_805E968: @ 805E968
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805E9AC
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805E994
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805E994
	movs r0, 0x2
	strb r0, [r2]
_0805E994:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805E9AC: .4byte gUnknown_08375240
	thumb_func_end sub_805E968

	thumb_func_start sub_805E9B0
sub_805E9B0: @ 805E9B0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805E9CC
	adds r0, r2
	ldr r2, _0805E9D0
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805E9CC: .4byte 0x030048a0
_0805E9D0: .4byte sub_805E9D4
	thumb_func_end sub_805E9B0

	thumb_func_start sub_805E9D4
sub_805E9D4: @ 805E9D4
	push {r4,lr}
	ldr r3, _0805E9F0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805E9F0: .4byte gUnknown_08375478
	thumb_func_end sub_805E9D4

	thumb_func_start sub_805E9F4
sub_805E9F4: @ 805E9F4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EA38
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EA20
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EA20
	movs r0, 0x3
	strb r0, [r2]
_0805EA20:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EA38: .4byte gUnknown_08375484
	thumb_func_end sub_805E9F4

	thumb_func_start sub_805EA3C
sub_805EA3C: @ 805EA3C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EA58
	adds r0, r2
	ldr r2, _0805EA5C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EA58: .4byte 0x030048a0
_0805EA5C: .4byte sub_805EA60
	thumb_func_end sub_805EA3C

	thumb_func_start sub_805EA60
sub_805EA60: @ 805EA60
	push {r4,lr}
	ldr r3, _0805EA7C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EA7C: .4byte gUnknown_08375488
	thumb_func_end sub_805EA60

	thumb_func_start sub_805EA80
sub_805EA80: @ 805EA80
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EAC4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EAAC
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EAAC
	movs r0, 0x3
	strb r0, [r2]
_0805EAAC:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EAC4: .4byte gUnknown_08375494
	thumb_func_end sub_805EA80

	thumb_func_start sub_805EAC8
sub_805EAC8: @ 805EAC8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EAE4
	adds r0, r2
	ldr r2, _0805EAE8
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EAE4: .4byte 0x030048a0
_0805EAE8: .4byte sub_805EAEC
	thumb_func_end sub_805EAC8

	thumb_func_start sub_805EAEC
sub_805EAEC: @ 805EAEC
	push {r4,lr}
	ldr r3, _0805EB08
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EB08: .4byte gUnknown_08375498
	thumb_func_end sub_805EAEC

	thumb_func_start sub_805EB0C
sub_805EB0C: @ 805EB0C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EB50
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805EB38
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EB38
	movs r0, 0x2
	strb r0, [r2]
_0805EB38:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EB50: .4byte gUnknown_083754A4
	thumb_func_end sub_805EB0C

	thumb_func_start sub_805EB54
sub_805EB54: @ 805EB54
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EB70
	adds r0, r2
	ldr r2, _0805EB74
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EB70: .4byte 0x030048a0
_0805EB74: .4byte sub_805EB78
	thumb_func_end sub_805EB54

	thumb_func_start sub_805EB78
sub_805EB78: @ 805EB78
	push {r4,lr}
	ldr r3, _0805EB94
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EB94: .4byte gUnknown_083754A8
	thumb_func_end sub_805EB78

	thumb_func_start sub_805EB98
sub_805EB98: @ 805EB98
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EBDC
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805EBC4
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EBC4
	movs r0, 0x2
	strb r0, [r2]
_0805EBC4:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EBDC: .4byte gUnknown_083754B4
	thumb_func_end sub_805EB98

	thumb_func_start sub_805EBE0
sub_805EBE0: @ 805EBE0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EBFC
	adds r0, r2
	ldr r2, _0805EC00
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EBFC: .4byte 0x030048a0
_0805EC00: .4byte sub_805EC04
	thumb_func_end sub_805EBE0

	thumb_func_start sub_805EC04
sub_805EC04: @ 805EC04
	push {r4,lr}
	ldr r3, _0805EC20
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EC20: .4byte gUnknown_083754B8
	thumb_func_end sub_805EC04

	thumb_func_start sub_805EC24
sub_805EC24: @ 805EC24
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EC68
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EC50
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EC50
	movs r0, 0x3
	strb r0, [r2]
_0805EC50:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EC68: .4byte gUnknown_083754C4
	thumb_func_end sub_805EC24

	thumb_func_start sub_805EC6C
sub_805EC6C: @ 805EC6C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EC88
	adds r0, r2
	ldr r2, _0805EC8C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EC88: .4byte 0x030048a0
_0805EC8C: .4byte sub_805EC90
	thumb_func_end sub_805EC6C

	thumb_func_start sub_805EC90
sub_805EC90: @ 805EC90
	push {r4,lr}
	ldr r3, _0805ECAC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805ECAC: .4byte gUnknown_083754C8
	thumb_func_end sub_805EC90

	thumb_func_start sub_805ECB0
sub_805ECB0: @ 805ECB0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805ECF4
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805ECDC
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805ECDC
	movs r0, 0x3
	strb r0, [r2]
_0805ECDC:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805ECF4: .4byte gUnknown_083754D4
	thumb_func_end sub_805ECB0

	thumb_func_start sub_805ECF8
sub_805ECF8: @ 805ECF8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805ED14
	adds r0, r2
	ldr r2, _0805ED18
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805ED14: .4byte 0x030048a0
_0805ED18: .4byte sub_805ED1C
	thumb_func_end sub_805ECF8

	thumb_func_start sub_805ED1C
sub_805ED1C: @ 805ED1C
	push {r4,lr}
	ldr r3, _0805ED38
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805ED38: .4byte gUnknown_083754D8
	thumb_func_end sub_805ED1C

	thumb_func_start sub_805ED3C
sub_805ED3C: @ 805ED3C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805ED80
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805ED68
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805ED68
	movs r0, 0x2
	strb r0, [r2]
_0805ED68:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805ED80: .4byte gUnknown_083754E4
	thumb_func_end sub_805ED3C

	thumb_func_start sub_805ED84
sub_805ED84: @ 805ED84
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EDA0
	adds r0, r2
	ldr r2, _0805EDA4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EDA0: .4byte 0x030048a0
_0805EDA4: .4byte sub_805EDA8
	thumb_func_end sub_805ED84

	thumb_func_start sub_805EDA8
sub_805EDA8: @ 805EDA8
	push {r4,lr}
	ldr r3, _0805EDC4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EDC4: .4byte gUnknown_083754E8
	thumb_func_end sub_805EDA8

	thumb_func_start sub_805EDC8
sub_805EDC8: @ 805EDC8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EE0C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x1
	bne _0805EDF4
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EDF4
	movs r0, 0x2
	strb r0, [r2]
_0805EDF4:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EE0C: .4byte gUnknown_083754F4
	thumb_func_end sub_805EDC8

	thumb_func_start sub_805EE10
sub_805EE10: @ 805EE10
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EE2C
	adds r0, r2
	ldr r2, _0805EE30
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EE2C: .4byte 0x030048a0
_0805EE30: .4byte sub_805EE34
	thumb_func_end sub_805EE10

	thumb_func_start sub_805EE34
sub_805EE34: @ 805EE34
	push {r4,lr}
	ldr r3, _0805EE50
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EE50: .4byte gUnknown_083754F8
	thumb_func_end sub_805EE34

	thumb_func_start sub_805EE54
sub_805EE54: @ 805EE54
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EE98
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EE80
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EE80
	movs r0, 0x3
	strb r0, [r2]
_0805EE80:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EE98: .4byte gUnknown_08375504
	thumb_func_end sub_805EE54

	thumb_func_start sub_805EE9C
sub_805EE9C: @ 805EE9C
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EEB8
	adds r0, r2
	ldr r2, _0805EEBC
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EEB8: .4byte 0x030048a0
_0805EEBC: .4byte sub_805EEC0
	thumb_func_end sub_805EE9C

	thumb_func_start sub_805EEC0
sub_805EEC0: @ 805EEC0
	push {r4,lr}
	ldr r3, _0805EEDC
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EEDC: .4byte gUnknown_08375508
	thumb_func_end sub_805EEC0

	thumb_func_start sub_805EEE0
sub_805EEE0: @ 805EEE0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EF24
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EF0C
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EF0C
	movs r0, 0x3
	strb r0, [r2]
_0805EF0C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EF24: .4byte gUnknown_08375514
	thumb_func_end sub_805EEE0

	thumb_func_start sub_805EF28
sub_805EF28: @ 805EF28
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EF44
	adds r0, r2
	ldr r2, _0805EF48
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EF44: .4byte 0x030048a0
_0805EF48: .4byte sub_805EF4C
	thumb_func_end sub_805EF28

	thumb_func_start sub_805EF4C
sub_805EF4C: @ 805EF4C
	push {r4,lr}
	ldr r3, _0805EF68
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EF68: .4byte gUnknown_08375518
	thumb_func_end sub_805EF4C

	thumb_func_start sub_805EF6C
sub_805EF6C: @ 805EF6C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805EFB0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805EF98
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805EF98
	movs r0, 0x3
	strb r0, [r2]
_0805EF98:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805EFB0: .4byte gUnknown_08375524
	thumb_func_end sub_805EF6C

	thumb_func_start sub_805EFB4
sub_805EFB4: @ 805EFB4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805EFD0
	adds r0, r2
	ldr r2, _0805EFD4
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805EFD0: .4byte 0x030048a0
_0805EFD4: .4byte sub_805EFD8
	thumb_func_end sub_805EFB4

	thumb_func_start sub_805EFD8
sub_805EFD8: @ 805EFD8
	push {r4,lr}
	ldr r3, _0805EFF4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805EFF4: .4byte gUnknown_08375528
	thumb_func_end sub_805EFD8

	thumb_func_start sub_805EFF8
sub_805EFF8: @ 805EFF8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F03C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F024
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F024
	movs r0, 0x3
	strb r0, [r2]
_0805F024:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F03C: .4byte gUnknown_08375534
	thumb_func_end sub_805EFF8

	thumb_func_start sub_805F040
sub_805F040: @ 805F040
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F05C
	adds r0, r2
	ldr r2, _0805F060
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F05C: .4byte 0x030048a0
_0805F060: .4byte sub_805F064
	thumb_func_end sub_805F040

	thumb_func_start sub_805F064
sub_805F064: @ 805F064
	push {r4,lr}
	ldr r3, _0805F080
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F080: .4byte gUnknown_08375538
	thumb_func_end sub_805F064

	thumb_func_start sub_805F084
sub_805F084: @ 805F084
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F0C8
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F0B0
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F0B0
	movs r0, 0x3
	strb r0, [r2]
_0805F0B0:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F0C8: .4byte gUnknown_08375544
	thumb_func_end sub_805F084

	thumb_func_start sub_805F0CC
sub_805F0CC: @ 805F0CC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F0E8
	adds r0, r2
	ldr r2, _0805F0EC
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F0E8: .4byte 0x030048a0
_0805F0EC: .4byte sub_805F0F0
	thumb_func_end sub_805F0CC

	thumb_func_start sub_805F0F0
sub_805F0F0: @ 805F0F0
	push {r4,lr}
	ldr r3, _0805F10C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F10C: .4byte gUnknown_08375548
	thumb_func_end sub_805F0F0

	thumb_func_start sub_805F110
sub_805F110: @ 805F110
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F154
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F13C
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F13C
	movs r0, 0x3
	strb r0, [r2]
_0805F13C:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F154: .4byte gUnknown_08375554
	thumb_func_end sub_805F110

	thumb_func_start sub_805F158
sub_805F158: @ 805F158
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F174
	adds r0, r2
	ldr r2, _0805F178
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F174: .4byte 0x030048a0
_0805F178: .4byte sub_805F17C
	thumb_func_end sub_805F158

	thumb_func_start sub_805F17C
sub_805F17C: @ 805F17C
	push {r4,lr}
	ldr r3, _0805F198
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F198: .4byte gUnknown_08375558
	thumb_func_end sub_805F17C

	thumb_func_start sub_805F19C
sub_805F19C: @ 805F19C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F1E0
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F1C8
	movs r0, 0xE
	ldrsh r1, [r4, r0]
	movs r3, 0x12
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F1C8
	movs r0, 0x3
	strb r0, [r2]
_0805F1C8:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F1E0: .4byte gUnknown_08375564
	thumb_func_end sub_805F19C

	thumb_func_start sub_805F1E4
sub_805F1E4: @ 805F1E4
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F200
	adds r0, r2
	ldr r2, _0805F204
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F200: .4byte 0x030048a0
_0805F204: .4byte sub_805F208
	thumb_func_end sub_805F1E4

	thumb_func_start sub_805F208
sub_805F208: @ 805F208
	push {r4,lr}
	ldr r3, _0805F224
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F224: .4byte gUnknown_08375568
	thumb_func_end sub_805F208

	thumb_func_start sub_805F228
sub_805F228: @ 805F228
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F26C
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F254
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F254
	movs r0, 0x3
	strb r0, [r2]
_0805F254:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F26C: .4byte gUnknown_08375574
	thumb_func_end sub_805F228

	thumb_func_start sub_805F270
sub_805F270: @ 805F270
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F28C
	adds r0, r2
	ldr r2, _0805F290
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F28C: .4byte 0x030048a0
_0805F290: .4byte sub_805F294
	thumb_func_end sub_805F270

	thumb_func_start sub_805F294
sub_805F294: @ 805F294
	push {r4,lr}
	ldr r3, _0805F2B0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F2B0: .4byte gUnknown_08375578
	thumb_func_end sub_805F294

	thumb_func_start sub_805F2B4
sub_805F2B4: @ 805F2B4
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _0805F2F8
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	adds r2, r4, 0
	adds r2, 0x21
	ldrb r0, [r2]
	cmp r0, 0x2
	bne _0805F2E0
	movs r0, 0xC
	ldrsh r1, [r4, r0]
	movs r3, 0x10
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0805F2E0
	movs r0, 0x3
	strb r0, [r2]
_0805F2E0:
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl MoveFieldObjectInNextDirectionInSequence
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F2F8: .4byte gUnknown_08375584
	thumb_func_end sub_805F2B4

	thumb_func_start sub_805F2FC
sub_805F2FC: @ 805F2FC
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F318
	adds r0, r2
	ldr r2, _0805F31C
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F318: .4byte 0x030048a0
_0805F31C: .4byte sub_805F320
	thumb_func_end sub_805F2FC

	thumb_func_start sub_805F320
sub_805F320: @ 805F320
	push {r4,lr}
	ldr r3, _0805F33C
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F33C: .4byte gUnknown_08375588
	thumb_func_end sub_805F320

	thumb_func_start mss_npc_reset_oampriv3_1_unk2_unk3
mss_npc_reset_oampriv3_1_unk2_unk3: @ 805F340
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	adds r4, 0x21
	ldrb r0, [r4]
	cmp r0, 0
	bne _0805F358
	bl player_get_direction_lower_nybble
	strb r0, [r4]
_0805F358:
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end mss_npc_reset_oampriv3_1_unk2_unk3

	thumb_func_start sub_805F364
sub_805F364: @ 805F364
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	ldr r2, _0805F388
	ldr r3, _0805F38C
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1C]
	cmp r0, 0xFF
	beq _0805F384
	ldrb r0, [r3, 0x3]
	cmp r0, 0x2
	bne _0805F390
_0805F384:
	movs r0, 0
	b _0805F3B8
	.align 2, 0
_0805F388: .4byte 0x030048a0
_0805F38C: .4byte 0x0202e858
_0805F390:
	ldr r5, _0805F3C0
	bl player_get_x22
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 22
	adds r4, r5
	bl player_get_direction_upper_nybble
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r4, [r4]
	adds r0, r6, 0
	adds r1, r7, 0
	movs r3, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
_0805F3B8:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F3C0: .4byte gUnknown_08375594
	thumb_func_end sub_805F364

	thumb_func_start sub_805F3C4
sub_805F3C4: @ 805F3C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805F3E2
	ldrb r0, [r4]
	movs r1, 0x3
	negs r1, r1
	ands r1, r0
	strb r1, [r4]
	movs r0, 0x1
	strh r0, [r5, 0x30]
_0805F3E2:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805F3C4

	thumb_func_start sub_805F3EC
sub_805F3EC: @ 805F3EC
	movs r0, 0
	bx lr
	thumb_func_end sub_805F3EC

	thumb_func_start sub_805F3F0
sub_805F3F0: @ 805F3F0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0805F434
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	bl state_to_direction
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F434: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F3F0

	thumb_func_start sub_805F438
sub_805F438: @ 805F438
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F4EC
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl GetGoSpeed0AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F4BE
	mov r1, r8
	cmp r1, 0
	beq _0805F4D2
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F4D2
_0805F4BE:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F4D2:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F4EC: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F438

	thumb_func_start sub_805F4F0
sub_805F4F0: @ 805F4F0
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F5A4
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_8060744
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F576
	mov r1, r8
	cmp r1, 0
	beq _0805F58A
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F58A
_0805F576:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F58A:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F5A4: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F4F0

	thumb_func_start sub_805F5A8
sub_805F5A8: @ 805F5A8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F65C
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_806079C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F62E
	mov r1, r8
	cmp r1, 0
	beq _0805F642
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F642
_0805F62E:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F642:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F65C: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F5A8

	thumb_func_start sub_805F660
sub_805F660: @ 805F660
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F714
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_80607C8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F6E6
	mov r1, r8
	cmp r1, 0
	beq _0805F6FA
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F6FA
_0805F6E6:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F6FA:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F714: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F660

	thumb_func_start cph_IM_DIFFERENT
cph_IM_DIFFERENT: @ 805F718
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r1, _0805F75C
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	bl state_to_direction
	bl sub_806084C
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r5, 0x30]
	movs r0, 0x1
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805F75C: .4byte gUnknown_0836DC09
	thumb_func_end cph_IM_DIFFERENT

	thumb_func_start sub_805F760
sub_805F760: @ 805F760
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F814
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	mov r5, sp
	adds r5, 0x2
	adds r0, r4, 0
	adds r1, r6, 0
	mov r2, sp
	adds r3, r5, 0
	bl FieldObjectMoveDestCoords
	adds r0, r6, 0
	bl sub_80608A4
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F7E6
	mov r1, r8
	cmp r1, 0
	beq _0805F7FA
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F7FA
_0805F7E6:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F7FA:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F814: .4byte gUnknown_0836DC09
	thumb_func_end sub_805F760

	thumb_func_start oac_hopping
oac_hopping: @ 805F818
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r4, r0, 0
	adds r7, r1, 0
	mov r8, r3
	lsls r2, 24
	lsrs r6, r2, 24
	ldr r1, _0805F8DC
	ldrb r0, [r4, 0x6]
	adds r0, r1
	ldrb r0, [r0]
	adds r1, r4, 0
	adds r1, 0x21
	ldrb r1, [r1]
	adds r2, r6, 0
	bl state_to_direction
	adds r6, r0, 0
	ldrh r1, [r4, 0x10]
	add r0, sp, 0x4
	strh r1, [r0]
	ldrh r0, [r4, 0x12]
	mov r5, sp
	adds r5, 0x6
	strh r0, [r5]
	movs r0, 0x2
	str r0, [sp]
	adds r0, r6, 0
	add r1, sp, 0x4
	adds r2, r5, 0
	movs r3, 0x2
	bl sub_8060320
	adds r0, r6, 0
	bl GetJumpLedgeAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
	add r0, sp, 0x4
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	adds r0, r4, 0
	adds r3, r6, 0
	bl npc_block_way
	lsls r0, 24
	cmp r0, 0
	bne _0805F8AC
	mov r1, r8
	cmp r1, 0
	beq _0805F8C0
	add r0, sp, 0x4
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl _call_via_r8
	lsls r0, 24
	cmp r0, 0
	bne _0805F8C0
_0805F8AC:
	adds r0, r6, 0
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r7, 0
	bl FieldObjectSetRegularAnim
_0805F8C0:
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
	movs r0, 0x2
	strh r0, [r7, 0x30]
	movs r0, 0x1
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F8DC: .4byte gUnknown_0836DC09
	thumb_func_end oac_hopping

	thumb_func_start sub_805F8E0
sub_805F8E0: @ 805F8E0
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805F8FC
	adds r0, r2
	ldr r2, _0805F900
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805F8FC: .4byte 0x030048a0
_0805F900: .4byte sub_805F904
	thumb_func_end sub_805F8E0

	thumb_func_start sub_805F904
sub_805F904: @ 805F904
	push {r4,lr}
	ldr r3, _0805F920
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805F920: .4byte gUnknown_083755C0
	thumb_func_end sub_805F904

	thumb_func_start mss_08062EA4
mss_08062EA4: @ 805F924
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	ldr r2, _0805F948
	ldr r3, _0805F94C
	ldrb r1, [r3, 0x5]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x1C]
	cmp r0, 0xFF
	beq _0805F944
	ldrb r0, [r3, 0x3]
	cmp r0, 0x2
	bne _0805F950
_0805F944:
	movs r0, 0
	b _0805F978
	.align 2, 0
_0805F948: .4byte 0x030048a0
_0805F94C: .4byte 0x0202e858
_0805F950:
	ldr r5, _0805F980
	bl player_get_x22
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 22
	adds r4, r5
	bl player_get_direction_upper_nybble
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0805F984
	ldr r4, [r4]
	adds r0, r6, 0
	adds r1, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
_0805F978:
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805F980: .4byte gUnknown_08375594
_0805F984: .4byte sub_8056E14
	thumb_func_end mss_08062EA4

	thumb_func_start FieldObjectCB_TreeDisguise
FieldObjectCB_TreeDisguise: @ 805F988
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805F9EC
	adds r4, r1, r0
	adds r6, r4, 0
	adds r6, 0x21
	ldrb r0, [r6]
	cmp r0, 0
	beq _0805F9B0
	cmp r0, 0x1
	bne _0805F9D0
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805F9D0
_0805F9B0:
	ldr r1, _0805F9F0
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x1C
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	movs r0, 0x1
	strb r0, [r6]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
_0805F9D0:
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805F9EC
	adds r0, r1
	ldr r2, _0805F9F4
	adds r1, r5, 0
	bl meta_step
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805F9EC: .4byte 0x030048a0
_0805F9F0: .4byte 0x0202ff84
_0805F9F4: .4byte sub_805F9F8
	thumb_func_end FieldObjectCB_TreeDisguise

	thumb_func_start sub_805F9F8
sub_805F9F8: @ 805F9F8
	push {lr}
	bl npc_reset
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805F9F8

	thumb_func_start FieldObjectCB_MountainDisguise
FieldObjectCB_MountainDisguise: @ 805FA04
	push {r4-r6,lr}
	adds r5, r0, 0
	movs r1, 0x2E
	ldrsh r0, [r5, r1]
	lsls r1, r0, 3
	adds r1, r0
	lsls r1, 2
	ldr r0, _0805FA68
	adds r4, r1, r0
	adds r6, r4, 0
	adds r6, 0x21
	ldrb r0, [r6]
	cmp r0, 0
	beq _0805FA2C
	cmp r0, 0x1
	bne _0805FA4C
	movs r1, 0x3C
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0805FA4C
_0805FA2C:
	ldr r1, _0805FA6C
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	adds r0, r4, 0
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x1D
	bl FieldEffectStart
	strb r0, [r4, 0x1A]
	movs r0, 0x1
	strb r0, [r6]
	ldrh r0, [r5, 0x3C]
	adds r0, 0x1
	strh r0, [r5, 0x3C]
_0805FA4C:
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0805FA68
	adds r0, r1
	ldr r2, _0805FA70
	adds r1, r5, 0
	bl meta_step
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FA68: .4byte 0x030048a0
_0805FA6C: .4byte 0x0202ff84
_0805FA70: .4byte sub_805F9F8
	thumb_func_end FieldObjectCB_MountainDisguise

	thumb_func_start FieldObjectCB_Hidden1
FieldObjectCB_Hidden1: @ 805FA74
	push {r4,lr}
	adds r3, r0, 0
	movs r1, 0x3C
	ldrsh r0, [r3, r1]
	ldr r4, _0805FAD0
	cmp r0, 0
	bne _0805FAB4
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldrb r1, [r0, 0x3]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0, 0x3]
	adds r2, r3, 0
	adds r2, 0x42
	ldrb r1, [r2]
	movs r0, 0x3F
	ands r0, r1
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r3, 0x5]
	movs r1, 0xC
	orrs r0, r1
	strb r0, [r3, 0x5]
	ldrh r0, [r3, 0x3C]
	adds r0, 0x1
	strh r0, [r3, 0x3C]
_0805FAB4:
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	ldr r2, _0805FAD4
	adds r1, r3, 0
	bl meta_step
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FAD0: .4byte 0x030048a0
_0805FAD4: .4byte sub_805FAD8
	thumb_func_end FieldObjectCB_Hidden1

	thumb_func_start sub_805FAD8
sub_805FAD8: @ 805FAD8
	push {r4,lr}
	ldr r3, _0805FAF4
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FAF4: .4byte gUnknown_083755CC
	thumb_func_end sub_805FAD8

	thumb_func_start sub_805FAF8
sub_805FAF8: @ 805FAF8
	push {lr}
	bl npc_reset
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_805FAF8

	thumb_func_start sub_805FB04
sub_805FB04: @ 805FB04
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	beq _0805FB16
	movs r0, 0
	strh r0, [r4, 0x30]
_0805FB16:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805FB04

	thumb_func_start sub_805FB20
sub_805FB20: @ 805FB20
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FB3C
	adds r0, r2
	ldr r2, _0805FB40
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FB3C: .4byte 0x030048a0
_0805FB40: .4byte sub_805FB44
	thumb_func_end sub_805FB20

	thumb_func_start sub_805FB44
sub_805FB44: @ 805FB44
	push {r4,lr}
	ldr r3, _0805FB60
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FB60: .4byte gUnknown_083755D0
	thumb_func_end sub_805FB44

	thumb_func_start sub_805FB64
sub_805FB64: @ 805FB64
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay16AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805FB64

	thumb_func_start sub_805FB90
sub_805FB90: @ 805FB90
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FBAC
	adds r0, r2
	ldr r2, _0805FBB0
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FBAC: .4byte 0x030048a0
_0805FBB0: .4byte sub_805FBB4
	thumb_func_end sub_805FB90

	thumb_func_start sub_805FBB4
sub_805FBB4: @ 805FBB4
	push {r4,lr}
	ldr r3, _0805FBD0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FBD0: .4byte gUnknown_083755D8
	thumb_func_end sub_805FBB4

	thumb_func_start sub_805FBD4
sub_805FBD4: @ 805FBD4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay8AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805FBD4

	thumb_func_start sub_805FC00
sub_805FC00: @ 805FC00
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FC1C
	adds r0, r2
	ldr r2, _0805FC20
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FC1C: .4byte 0x030048a0
_0805FC20: .4byte sub_805FC24
	thumb_func_end sub_805FC00

	thumb_func_start sub_805FC24
sub_805FC24: @ 805FC24
	push {r4,lr}
	ldr r3, _0805FC40
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FC40: .4byte gUnknown_083755E0
	thumb_func_end sub_805FC24

	thumb_func_start sub_805FC44
sub_805FC44: @ 805FC44
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetStepInPlaceDelay4AnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805FC44

	thumb_func_start sub_805FC70
sub_805FC70: @ 805FC70
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2E
	ldrsh r2, [r1, r0]
	lsls r0, r2, 3
	adds r0, r2
	lsls r0, 2
	ldr r2, _0805FC8C
	adds r0, r2
	ldr r2, _0805FC90
	bl meta_step
	pop {r0}
	bx r0
	.align 2, 0
_0805FC8C: .4byte 0x030048a0
_0805FC90: .4byte sub_805FC94
	thumb_func_end sub_805FC70

	thumb_func_start sub_805FC94
sub_805FC94: @ 805FC94
	push {r4,lr}
	ldr r3, _0805FCB0
	movs r4, 0x30
	ldrsh r2, [r1, r4]
	lsls r2, 2
	adds r2, r3
	ldr r2, [r2]
	bl _call_via_r2
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0805FCB0: .4byte gUnknown_083755E8
	thumb_func_end sub_805FC94

	thumb_func_start sub_805FCB4
sub_805FCB4: @ 805FCB4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl npc_reset
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl GetFaceDirectionAnimId
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetRegularAnim
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1
	strh r0, [r5, 0x30]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_805FCB4

	thumb_func_start sub_805FCE8
sub_805FCE8: @ 805FCE8
	push {r4,lr}
	adds r4, r1, 0
	bl FieldObjectExecRegularAnim
	lsls r0, 24
	cmp r0, 0
	bne _0805FCFA
	movs r0, 0
	b _0805FD00
_0805FCFA:
	movs r0, 0x2
	strh r0, [r4, 0x30]
	movs r0, 0x1
_0805FD00:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_805FCE8

	thumb_func_start sub_805FD08
sub_805FD08: @ 805FD08
	ldrb r2, [r0]
	movs r1, 0x3
	negs r1, r1
	ands r1, r2
	strb r1, [r0]
	movs r0, 0
	bx lr
	thumb_func_end sub_805FD08

	thumb_func_start npc_reset
npc_reset: @ 805FD18
	ldrb r3, [r0]
	movs r2, 0x3
	negs r2, r2
	ands r2, r3
	movs r3, 0x41
	negs r3, r3
	ands r2, r3
	movs r3, 0x7F
	ands r2, r3
	strb r2, [r0]
	movs r2, 0xFF
	strb r2, [r0, 0x1C]
	movs r0, 0
	strh r0, [r1, 0x30]
	bx lr
	thumb_func_end npc_reset

	thumb_func_start FieldObjectDirectionToImageAnimId
FieldObjectDirectionToImageAnimId: @ 805FD38
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FD44
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FD44: .4byte gUnknown_083755F4
	thumb_func_end FieldObjectDirectionToImageAnimId

	thumb_func_start get_go_image_anim_num
get_go_image_anim_num: @ 805FD48
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FD54
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FD54: .4byte gUnknown_083755FD
	thumb_func_end get_go_image_anim_num

	thumb_func_start get_go_fast_image_anim_num
get_go_fast_image_anim_num: @ 805FD58
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FD64
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FD64: .4byte gUnknown_08375606
	thumb_func_end get_go_fast_image_anim_num

	thumb_func_start get_go_faster_image_anim_num
get_go_faster_image_anim_num: @ 805FD68
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FD74
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FD74: .4byte gUnknown_0837560F
	thumb_func_end get_go_faster_image_anim_num

	thumb_func_start sub_805FD78
sub_805FD78: @ 805FD78
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FD84
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FD84: .4byte gUnknown_08375618
	thumb_func_end sub_805FD78

	thumb_func_start sub_805FD88
sub_805FD88: @ 805FD88
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FD94
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FD94: .4byte gUnknown_08375621
	thumb_func_end sub_805FD88

	thumb_func_start sub_805FD98
sub_805FD98: @ 805FD98
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FDA4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FDA4: .4byte gUnknown_0837562A
	thumb_func_end sub_805FD98

	thumb_func_start unref_sub_805FDA8
unref_sub_805FDA8: @ 805FDA8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FDB4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FDB4: .4byte gUnknown_08375633
	thumb_func_end unref_sub_805FDA8

	thumb_func_start sub_805FDB8
sub_805FDB8: @ 805FDB8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FDC4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FDC4: .4byte gUnknown_0837563C
	thumb_func_end sub_805FDB8

	thumb_func_start sub_805FDC8
sub_805FDC8: @ 805FDC8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FDD4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FDD4: .4byte gUnknown_08375645
	thumb_func_end sub_805FDC8

	thumb_func_start sub_805FDD8
sub_805FDD8: @ 805FDD8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FDE4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FDE4: .4byte gUnknown_0837564E
	thumb_func_end sub_805FDD8

	thumb_func_start sub_805FDE8
sub_805FDE8: @ 805FDE8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FDF4
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FDF4: .4byte gUnknown_08375657
	thumb_func_end sub_805FDE8

	thumb_func_start sub_805FDF8
sub_805FDF8: @ 805FDF8
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FE04
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FE04: .4byte gUnknown_08375660
	thumb_func_end sub_805FDF8

	thumb_func_start sub_805FE08
sub_805FE08: @ 805FE08
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FE14
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FE14: .4byte gUnknown_08375669
	thumb_func_end sub_805FE08

	thumb_func_start get_run_image_anim_num
get_run_image_anim_num: @ 805FE18
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FE24
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FE24: .4byte gUnknown_08375672
	thumb_func_end get_run_image_anim_num

	thumb_func_start sub_805FE28
sub_805FE28: @ 805FE28
	push {r4,lr}
	adds r3, r1, 0
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r0, 0x1]
	lsls r0, 27
	lsrs r4, r0, 31
	cmp r4, 0
	bne _0805FE5E
	adds r0, r3, 0
	adds r0, 0x2A
	strb r2, [r0]
	adds r0, 0x1
	ldrb r2, [r0]
	adds r1, r0, 0
	cmp r2, 0x1
	bne _0805FE50
	movs r0, 0x2
	strb r0, [r1]
	b _0805FE56
_0805FE50:
	cmp r2, 0x3
	bne _0805FE56
	strb r4, [r1]
_0805FE56:
	ldrb r1, [r1]
	adds r0, r3, 0
	bl SeekSpriteAnim
_0805FE5E:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_805FE28

	thumb_func_start sub_805FE64
sub_805FE64: @ 805FE64
	push {lr}
	lsls r2, 24
	lsrs r2, 24
	ldrb r0, [r0, 0x1]
	lsls r0, 27
	cmp r0, 0
	blt _0805FE8C
	adds r0, r1, 0
	adds r0, 0x2A
	strb r2, [r0]
	movs r2, 0x3
	adds r0, 0x1
	ldrb r0, [r0]
	cmp r0, 0x1
	bhi _0805FE84
	movs r2, 0x1
_0805FE84:
	adds r0, r1, 0
	adds r1, r2, 0
	bl SeekSpriteAnim
_0805FE8C:
	pop {r0}
	bx r0
	thumb_func_end sub_805FE64

	thumb_func_start sub_805FE90
sub_805FE90: @ 805FE90
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r3, 16
	lsrs r3, 16
	lsls r0, 16
	asrs r0, 16
	lsls r2, 16
	asrs r2, 16
	cmp r0, r2
	ble _0805FEAA
	movs r0, 0x3
	b _0805FEC0
_0805FEAA:
	cmp r0, r2
	bge _0805FEB2
	movs r0, 0x4
	b _0805FEC0
_0805FEB2:
	lsls r1, 16
	lsls r0, r3, 16
	cmp r1, r0
	bgt _0805FEBE
	movs r0, 0x1
	b _0805FEC0
_0805FEBE:
	movs r0, 0x2
_0805FEC0:
	pop {r1}
	bx r1
	thumb_func_end sub_805FE90

	thumb_func_start npc_set_running_behaviour_etc
npc_set_running_behaviour_etc: @ 805FEC4
	push {r4,lr}
	mov r12, r0
	lsls r1, 24
	lsrs r1, 24
	movs r3, 0
	strb r1, [r0, 0x6]
	adds r0, 0x21
	strb r3, [r0]
	adds r0, 0x1
	strb r3, [r0]
	ldr r4, _0805FF08
	mov r0, r12
	ldrb r2, [r0, 0x4]
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r2, r4, 0
	adds r2, 0x1C
	adds r0, r2
	ldr r2, _0805FF0C
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	str r1, [r0]
	mov r0, r12
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	strh r3, [r0, 0x30]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FF08: .4byte 0x02020004
_0805FF0C: .4byte gUnknown_0836DA88
	thumb_func_end npc_set_running_behaviour_etc

	thumb_func_start npc_running_behaviour_by_direction
npc_running_behaviour_by_direction: @ 805FF10
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _0805FF1C
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_0805FF1C: .4byte gUnknown_0837567B
	thumb_func_end npc_running_behaviour_by_direction

	thumb_func_start sub_805FF20
sub_805FF20: @ 805FF20
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	lsls r5, r1, 24
	lsrs r5, 24
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	adds r3, r5, 0
	bl npc_block_way
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_805FF20

	thumb_func_start npc_block_way
npc_block_way: @ 805FF60
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r6, r0, 0
	lsls r1, 16
	lsls r2, 16
	lsls r3, 24
	lsrs r7, r3, 24
	mov r8, r7
	lsrs r0, r1, 16
	mov r9, r0
	asrs r5, r1, 16
	lsrs r0, r2, 16
	mov r10, r0
	asrs r4, r2, 16
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl IsCoordOutsideFieldObjectMovementRect
	lsls r0, 24
	cmp r0, 0
	beq _0805FF96
	movs r0, 0x1
	b _08060016
_0805FF96:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridIsImpassableAt
	lsls r0, 24
	cmp r0, 0
	bne _0805FFD8
	adds r0, r5, 0
	adds r1, r4, 0
	bl GetMapBorderIdAt
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _0805FFD8
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	adds r3, r7, 0
	bl IsMetatileDirectionallyImpassable
	lsls r0, 24
	cmp r0, 0
	bne _0805FFD8
	ldrb r0, [r6, 0x1]
	lsrs r0, 7
	cmp r0, 0
	beq _0805FFDC
	mov r0, r8
	bl CanCameraMoveInDirection
	cmp r0, 0
	bne _0805FFDC
_0805FFD8:
	movs r0, 0x2
	b _08060016
_0805FFDC:
	ldrb r0, [r6, 0xB]
	lsls r0, 28
	lsrs r0, 28
	mov r2, r9
	lsls r1, r2, 16
	asrs r5, r1, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r4, r1, 16
	adds r1, r5, 0
	adds r2, r4, 0
	bl IsZCoordMismatchAt
	lsls r0, 24
	cmp r0, 0
	beq _08060000
	movs r0, 0x3
	b _08060016
_08060000:
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl CheckForCollisionBetweenFieldObjects
	lsls r0, 24
	cmp r0, 0
	bne _08060014
	movs r0, 0
	b _08060016
_08060014:
	movs r0, 0x4
_08060016:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end npc_block_way

	thumb_func_start sub_8060024
sub_8060024: @ 8060024
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	adds r7, r0, 0
	lsls r1, 16
	lsls r2, 16
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	lsrs r0, r1, 16
	mov r9, r0
	asrs r6, r1, 16
	lsrs r0, r2, 16
	mov r10, r0
	asrs r5, r2, 16
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl IsCoordOutsideFieldObjectMovementRect
	lsls r0, 24
	lsrs r0, 24
	negs r1, r0
	orrs r1, r0
	lsrs r4, r1, 31
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridIsImpassableAt
	lsls r0, 24
	cmp r0, 0
	bne _0806009C
	adds r0, r6, 0
	adds r1, r5, 0
	bl GetMapBorderIdAt
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _0806009C
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	mov r3, r8
	bl IsMetatileDirectionallyImpassable
	lsls r0, 24
	cmp r0, 0
	bne _0806009C
	ldrb r0, [r7, 0x1]
	lsrs r0, 7
	cmp r0, 0
	beq _080600A0
	mov r0, r8
	bl CanCameraMoveInDirection
	cmp r0, 0
	bne _080600A0
_0806009C:
	movs r0, 0x2
	orrs r4, r0
_080600A0:
	ldrb r0, [r7, 0xB]
	lsls r0, 28
	lsrs r0, 28
	mov r2, r9
	lsls r1, r2, 16
	asrs r6, r1, 16
	mov r2, r10
	lsls r1, r2, 16
	asrs r5, r1, 16
	adds r1, r6, 0
	adds r2, r5, 0
	bl IsZCoordMismatchAt
	lsls r0, 24
	cmp r0, 0
	beq _080600C8
	movs r0, 0x4
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_080600C8:
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl CheckForCollisionBetweenFieldObjects
	lsls r0, 24
	cmp r0, 0
	beq _080600E0
	movs r0, 0x8
	orrs r4, r0
	lsls r0, r4, 24
	lsrs r4, r0, 24
_080600E0:
	adds r0, r4, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8060024

	thumb_func_start IsCoordOutsideFieldObjectMovementRect
IsCoordOutsideFieldObjectMovementRect: @ 80600F0
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r3, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	ldrb r1, [r4, 0x19]
	movs r0, 0xF
	ands r0, r1
	cmp r0, 0
	beq _08060128
	lsls r1, 28
	lsrs r2, r1, 28
	ldrh r0, [r4, 0xC]
	subs r2, r0, r2
	lsrs r1, 28
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r2, 16
	lsls r0, r3, 16
	asrs r3, r0, 16
	cmp r2, r0
	bgt _08060154
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r3
	blt _08060154
_08060128:
	ldrb r1, [r4, 0x19]
	movs r0, 0xF0
	ands r0, r1
	cmp r0, 0
	beq _08060158
	lsls r1, 24
	lsrs r2, r1, 28
	ldrh r0, [r4, 0xE]
	subs r2, r0, r2
	lsrs r1, 28
	adds r0, r1
	lsls r0, 16
	lsrs r1, r0, 16
	lsls r2, 16
	lsls r0, r5, 16
	asrs r3, r0, 16
	cmp r2, r0
	bgt _08060154
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r3
	bge _08060158
_08060154:
	movs r0, 0x1
	b _0806015A
_08060158:
	movs r0, 0
_0806015A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end IsCoordOutsideFieldObjectMovementRect

	thumb_func_start IsMetatileDirectionallyImpassable
IsMetatileDirectionallyImpassable: @ 8060160
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r7, r2, 16
	lsls r3, 24
	ldr r1, _080601A8
	lsrs r3, 22
	subs r5, r3, 0x4
	adds r1, r5, r1
	ldrb r0, [r0, 0x1E]
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	bne _080601A2
	ldr r4, _080601AC
	adds r4, r5, r4
	lsls r0, r6, 16
	asrs r0, 16
	lsls r1, r7, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	ldr r1, [r4]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _080601B0
_080601A2:
	movs r0, 0x1
	b _080601B2
	.align 2, 0
_080601A8: .4byte gUnknown_08375684
_080601AC: .4byte gUnknown_08375694
_080601B0:
	movs r0, 0
_080601B2:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end IsMetatileDirectionallyImpassable

	thumb_func_start CheckForCollisionBetweenFieldObjects
CheckForCollisionBetweenFieldObjects: @ 80601B8
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r7, r1, 16
	movs r4, 0
	lsls r2, 16
	asrs r5, r2, 16
_080601C6:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	ldr r1, _0806021C
	adds r2, r0, r1
	ldrb r0, [r2]
	lsls r0, 31
	cmp r0, 0
	beq _08060220
	cmp r2, r6
	beq _08060220
	movs r0, 0x10
	ldrsh r1, [r2, r0]
	lsls r0, r7, 16
	asrs r3, r0, 16
	cmp r1, r3
	bne _080601F0
	movs r1, 0x12
	ldrsh r0, [r2, r1]
	cmp r0, r5
	beq _08060200
_080601F0:
	movs r1, 0x14
	ldrsh r0, [r2, r1]
	cmp r0, r3
	bne _08060220
	movs r1, 0x16
	ldrsh r0, [r2, r1]
	cmp r0, r5
	bne _08060220
_08060200:
	ldrb r0, [r6, 0xB]
	lsls r0, 28
	lsrs r0, 28
	ldrb r1, [r2, 0xB]
	lsls r1, 28
	lsrs r1, 28
	bl AreZCoordsCompatible
	lsls r0, 24
	cmp r0, 0
	beq _08060220
	movs r0, 0x1
	b _0806022C
	.align 2, 0
_0806021C: .4byte 0x030048a0
_08060220:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _080601C6
	movs r0, 0
_0806022C:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end CheckForCollisionBetweenFieldObjects

	thumb_func_start sub_8060234
sub_8060234: @ 8060234
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _08060280
	ldr r3, _08060278
	ldr r2, _0806027C
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r1, [r0, 0x3C]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _08060280
	movs r0, 0x1
	b _08060282
	.align 2, 0
_08060278: .4byte 0x02020004
_0806027C: .4byte 0x030048a0
_08060280:
	movs r0, 0
_08060282:
	add sp, 0x4
	pop {r1}
	bx r1
	thumb_func_end sub_8060234

	thumb_func_start sub_8060288
sub_8060288: @ 8060288
	push {lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080602C6
	ldr r3, _080602CC
	ldr r2, _080602D0
	mov r0, sp
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x3C]
	movs r0, 0x4
	orrs r0, r2
	strh r0, [r1, 0x3C]
_080602C6:
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080602CC: .4byte 0x02020004
_080602D0: .4byte 0x030048a0
	thumb_func_end sub_8060288

	thumb_func_start MoveCoords
MoveCoords: @ 80602D4
	push {r4,lr}
	lsls r0, 24
	ldr r3, _080602F4
	lsrs r0, 22
	adds r0, r3
	ldrh r3, [r0]
	ldrh r4, [r1]
	adds r3, r4
	strh r3, [r1]
	ldrh r0, [r0, 0x2]
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080602F4: .4byte gUnknown_083756A4
	thumb_func_end MoveCoords

	thumb_func_start unref_sub_80602F8
unref_sub_80602F8: @ 80602F8
	push {r4,lr}
	lsls r0, 24
	ldr r3, _0806031C
	lsrs r0, 22
	adds r0, r3
	ldrh r3, [r0]
	lsls r3, 4
	ldrh r4, [r1]
	adds r3, r4
	strh r3, [r1]
	ldrh r0, [r0, 0x2]
	lsls r0, 4
	ldrh r1, [r2]
	adds r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806031C: .4byte gUnknown_083756A4
	thumb_func_end unref_sub_80602F8

	thumb_func_start sub_8060320
sub_8060320: @ 8060320
	push {r4-r7,lr}
	adds r4, r1, 0
	ldr r1, [sp, 0x14]
	lsls r0, 24
	lsls r3, 16
	lsrs r3, 16
	adds r7, r3, 0
	lsls r1, 16
	lsrs r6, r1, 16
	mov r12, r6
	ldr r1, _08060384
	lsrs r0, 22
	adds r5, r0, r1
	movs r0, 0
	ldrsh r1, [r5, r0]
	cmp r1, 0
	ble _0806034C
	lsls r0, r3, 16
	asrs r0, 16
	ldrh r3, [r4]
	adds r0, r3
	strh r0, [r4]
_0806034C:
	cmp r1, 0
	bge _0806035A
	ldrh r1, [r4]
	lsls r0, r7, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r4]
_0806035A:
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	cmp r1, 0
	ble _0806036C
	lsls r0, r6, 16
	asrs r0, 16
	ldrh r3, [r2]
	adds r0, r3
	strh r0, [r2]
_0806036C:
	cmp r1, 0
	bge _0806037C
	ldrh r1, [r2]
	mov r3, r12
	lsls r0, r3, 16
	asrs r0, 16
	subs r1, r0
	strh r1, [r2]
_0806037C:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060384: .4byte gUnknown_083756A4
	thumb_func_end sub_8060320

	thumb_func_start sub_8060388
sub_8060388: @ 8060388
	push {r4,r5,lr}
	ldr r5, _080603C0
	ldrh r4, [r5]
	lsls r0, 16
	asrs r0, 16
	subs r0, r4
	lsls r0, 4
	strh r0, [r2]
	ldrh r0, [r5, 0x2]
	lsls r1, 16
	asrs r1, 16
	subs r1, r0
	lsls r1, 4
	strh r1, [r3]
	ldr r1, _080603C4
	ldrh r0, [r2]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r2]
	ldr r1, _080603C8
	ldrh r0, [r3]
	ldrh r1, [r1]
	subs r0, r1
	strh r0, [r3]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080603C0: .4byte 0x02025734
_080603C4: .4byte 0x0300489c
_080603C8: .4byte 0x03004898
	thumb_func_end sub_8060388

	thumb_func_start sub_80603CC
sub_80603CC: @ 80603CC
	push {r4-r7,lr}
	adds r7, r2, 0
	mov r12, r3
	lsls r0, 16
	lsrs r5, r0, 16
	lsls r1, 16
	lsrs r6, r1, 16
	ldr r0, _0806045C
	ldrh r0, [r0]
	negs r0, r0
	ldr r1, _08060460
	ldr r2, [r1, 0x10]
	subs r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldr r0, _08060464
	ldrh r0, [r0]
	negs r0, r0
	ldr r1, [r1, 0x14]
	subs r0, r1
	lsls r0, 16
	lsrs r4, r0, 16
	cmp r2, 0
	ble _08060406
	lsls r0, r3, 16
	movs r3, 0x80
	lsls r3, 13
	adds r0, r3
	lsrs r3, r0, 16
_08060406:
	cmp r2, 0
	bge _08060412
	lsls r0, r3, 16
	ldr r2, _08060468
	adds r0, r2
	lsrs r3, r0, 16
_08060412:
	cmp r1, 0
	ble _08060420
	lsls r0, r4, 16
	movs r2, 0x80
	lsls r2, 13
	adds r0, r2
	lsrs r4, r0, 16
_08060420:
	cmp r1, 0
	bge _0806042C
	lsls r0, r4, 16
	ldr r1, _08060468
	adds r0, r1
	lsrs r4, r0, 16
_0806042C:
	ldr r2, _0806046C
	ldrh r1, [r2]
	lsls r0, r5, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	lsls r1, r3, 16
	asrs r1, 16
	adds r1, r0
	strh r1, [r7]
	ldrh r1, [r2, 0x2]
	lsls r0, r6, 16
	asrs r0, 16
	subs r0, r1
	lsls r0, 4
	lsls r1, r4, 16
	asrs r1, 16
	adds r1, r0
	mov r2, r12
	strh r1, [r2]
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806045C: .4byte 0x0300489c
_08060460: .4byte 0x03004880
_08060464: .4byte 0x03004898
_08060468: .4byte 0xfff00000
_0806046C: .4byte 0x02025734
	thumb_func_end sub_80603CC

	thumb_func_start sub_8060470
sub_8060470: @ 8060470
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r6, r0, 0
	mov r8, r1
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 16
	lsrs r5, 16
	movs r1, 0
	ldrsh r0, [r6, r1]
	mov r2, r8
	movs r3, 0
	ldrsh r1, [r2, r3]
	adds r2, r6, 0
	mov r3, r8
	bl sub_80603CC
	lsls r4, 16
	asrs r4, 16
	ldrh r0, [r6]
	adds r4, r0
	strh r4, [r6]
	lsls r5, 16
	asrs r5, 16
	mov r1, r8
	ldrh r1, [r1]
	adds r5, r1
	mov r2, r8
	strh r5, [r2]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8060470

	thumb_func_start GetFieldObjectMovingCameraOffset
GetFieldObjectMovingCameraOffset: @ 80604BC
	push {lr}
	adds r2, r0, 0
	movs r0, 0
	strh r0, [r2]
	strh r0, [r1]
	ldr r3, _080604F8
	ldr r0, [r3, 0x10]
	cmp r0, 0
	ble _080604D2
	movs r0, 0x1
	strh r0, [r2]
_080604D2:
	ldr r0, [r3, 0x10]
	cmp r0, 0
	bge _080604DE
	ldrh r0, [r2]
	subs r0, 0x1
	strh r0, [r2]
_080604DE:
	ldr r2, [r3, 0x14]
	cmp r2, 0
	ble _080604EA
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
_080604EA:
	cmp r2, 0
	bge _080604F4
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
_080604F4:
	pop {r0}
	bx r0
	.align 2, 0
_080604F8: .4byte 0x03004880
	thumb_func_end GetFieldObjectMovingCameraOffset

	thumb_func_start FieldObjectMoveDestCoords
FieldObjectMoveDestCoords: @ 80604FC
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	ldrh r4, [r0, 0x10]
	strh r4, [r2]
	ldrh r0, [r0, 0x12]
	strh r0, [r3]
	adds r0, r1, 0
	adds r1, r2, 0
	adds r2, r3, 0
	bl MoveCoords
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectMoveDestCoords

	thumb_func_start FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive: @ 806051C
	push {lr}
	ldrb r1, [r0]
	movs r0, 0x42
	ands r0, r1
	cmp r0, 0
	bne _0806052C
	movs r0, 0
	b _0806052E
_0806052C:
	movs r0, 0x1
_0806052E:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive

	thumb_func_start FieldObjectIsSpecialAnimActive
FieldObjectIsSpecialAnimActive: @ 8060534
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	bge _0806054A
	ldrb r0, [r1, 0x1C]
	cmp r0, 0xFF
	beq _0806054A
	movs r0, 0x1
	b _0806054C
_0806054A:
	movs r0, 0
_0806054C:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectIsSpecialAnimActive

	thumb_func_start FieldObjectSetSpecialAnim
FieldObjectSetSpecialAnim: @ 8060550
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	bl FieldObjectIsSpecialAnimOrDirectionSequenceAnimActive
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0
	bne _08060590
	adds r0, r4, 0
	bl npc_sync_anim_pause_bits
	strb r5, [r4, 0x1C]
	ldrb r0, [r4]
	movs r1, 0x40
	orrs r0, r1
	movs r1, 0x7F
	ands r0, r1
	strb r0, [r4]
	ldr r2, _0806058C
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	strh r6, [r0, 0x32]
	movs r0, 0
	b _08060592
	.align 2, 0
_0806058C: .4byte 0x02020004
_08060590:
	movs r0, 0x1
_08060592:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectSetSpecialAnim

	thumb_func_start FieldObjectForceSetSpecialAnim
FieldObjectForceSetSpecialAnim: @ 8060598
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r4, r1, 24
	lsrs r4, 24
	bl FieldObjectClearAnimIfSpecialAnimActive
	adds r0, r5, 0
	adds r1, r4, 0
	bl FieldObjectSetSpecialAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectForceSetSpecialAnim

	thumb_func_start FieldObjectClearAnimIfSpecialAnimActive
FieldObjectClearAnimIfSpecialAnimActive: @ 80605B4
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	bge _080605C6
	adds r0, r1, 0
	bl FieldObjectClearAnim
_080605C6:
	pop {r0}
	bx r0
	thumb_func_end FieldObjectClearAnimIfSpecialAnimActive

	thumb_func_start FieldObjectClearAnim
FieldObjectClearAnim: @ 80605CC
	movs r1, 0xFF
	strb r1, [r0, 0x1C]
	ldrb r2, [r0]
	movs r1, 0x41
	negs r1, r1
	ands r1, r2
	movs r2, 0x7F
	ands r1, r2
	strb r1, [r0]
	ldr r3, _080605FC
	ldrb r2, [r0, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	movs r2, 0
	strh r2, [r1, 0x30]
	ldrb r1, [r0, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	strh r2, [r0, 0x32]
	bx lr
	.align 2, 0
_080605FC: .4byte 0x02020004
	thumb_func_end FieldObjectClearAnim

	thumb_func_start FieldObjectCheckIfSpecialAnimFinishedOrInactive
FieldObjectCheckIfSpecialAnimFinishedOrInactive: @ 8060600
	push {lr}
	ldrb r1, [r0]
	lsls r0, r1, 25
	cmp r0, 0
	blt _0806060E
	movs r0, 0x10
	b _08060610
_0806060E:
	lsrs r0, r1, 7
_08060610:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectCheckIfSpecialAnimFinishedOrInactive

	thumb_func_start FieldObjectClearAnimIfSpecialAnimFinished
FieldObjectClearAnimIfSpecialAnimFinished: @ 8060614
	push {r4,r5,lr}
	adds r5, r0, 0
	bl FieldObjectCheckIfSpecialAnimFinishedOrInactive
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	beq _0806062E
	cmp r4, 0x10
	beq _0806062E
	adds r0, r5, 0
	bl FieldObjectClearAnimIfSpecialAnimActive
_0806062E:
	adds r0, r4, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectClearAnimIfSpecialAnimFinished

	thumb_func_start FieldObjectGetSpecialAnim
FieldObjectGetSpecialAnim: @ 8060638
	push {lr}
	adds r1, r0, 0
	ldrb r0, [r1]
	lsls r0, 25
	cmp r0, 0
	blt _08060648
	movs r0, 0xFF
	b _0806064A
_08060648:
	ldrb r0, [r1, 0x1C]
_0806064A:
	pop {r1}
	bx r1
	thumb_func_end FieldObjectGetSpecialAnim

	thumb_func_start meta_step
meta_step: @ 8060650
	push {r4-r6,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r6, r2, 0
	bl DoGroundEffects_OnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80634A0
	adds r0, r4, 0
	bl FieldObjectIsSpecialAnimActive
	lsls r0, 24
	cmp r0, 0
	beq _0806067A
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectExecSpecialAnim
	b _08060690
_0806067A:
	ldrb r0, [r4, 0x1]
	lsls r0, 31
	cmp r0, 0
	bne _08060690
_08060682:
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r6
	lsls r0, 24
	cmp r0, 0
	bne _08060682
_08060690:
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoGroundEffects_OnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl DoGroundEffects_OnFinishStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_obj_transfer_image_anim_pause_flag
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80634D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectUpdateSubpriority
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end meta_step

	thumb_func_start GetFaceDirectionAnimId
GetFaceDirectionAnimId: @ 80606C0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080606E8
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080606D8
	movs r4, 0
_080606D8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080606E8: .4byte gUnknown_083756C8
	thumb_func_end GetFaceDirectionAnimId

	thumb_func_start GetSimpleGoAnimId
GetSimpleGoAnimId: @ 80606EC
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060714
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060704
	movs r4, 0
_08060704:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060714: .4byte gUnknown_083756CD
	thumb_func_end GetSimpleGoAnimId

	thumb_func_start GetGoSpeed0AnimId
GetGoSpeed0AnimId: @ 8060718
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060740
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060730
	movs r4, 0
_08060730:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060740: .4byte gUnknown_083756D2
	thumb_func_end GetGoSpeed0AnimId

	thumb_func_start sub_8060744
sub_8060744: @ 8060744
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806076C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _0806075C
	movs r4, 0
_0806075C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806076C: .4byte gUnknown_083756D7
	thumb_func_end sub_8060744

	thumb_func_start d2s_08064034
d2s_08064034: @ 8060770
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060798
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060788
	movs r4, 0
_08060788:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060798: .4byte gUnknown_083756DC
	thumb_func_end d2s_08064034

	thumb_func_start sub_806079C
sub_806079C: @ 806079C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080607C4
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080607B4
	movs r4, 0
_080607B4:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080607C4: .4byte gUnknown_083756E1
	thumb_func_end sub_806079C

	thumb_func_start sub_80607C8
sub_80607C8: @ 80607C8
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080607F0
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080607E0
	movs r4, 0
_080607E0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080607F0: .4byte gUnknown_083756E6
	thumb_func_end sub_80607C8

	thumb_func_start sub_80607F4
sub_80607F4: @ 80607F4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806081C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _0806080C
	movs r4, 0
_0806080C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806081C: .4byte gUnknown_083756EB
	thumb_func_end sub_80607F4

	thumb_func_start GetJumpLedgeAnimId
GetJumpLedgeAnimId: @ 8060820
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060848
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060838
	movs r4, 0
_08060838:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060848: .4byte gUnknown_083756F0
	thumb_func_end GetJumpLedgeAnimId

	thumb_func_start sub_806084C
sub_806084C: @ 806084C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060874
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060864
	movs r4, 0
_08060864:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060874: .4byte gUnknown_083756F5
	thumb_func_end sub_806084C

	thumb_func_start sub_8060878
sub_8060878: @ 8060878
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080608A0
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060890
	movs r4, 0
_08060890:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080608A0: .4byte gUnknown_083756FA
	thumb_func_end sub_8060878

	thumb_func_start sub_80608A4
sub_80608A4: @ 80608A4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080608CC
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080608BC
	movs r4, 0
_080608BC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080608CC: .4byte gUnknown_083756FF
	thumb_func_end sub_80608A4

	thumb_func_start sub_80608D0
sub_80608D0: @ 80608D0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080608F8
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080608E8
	movs r4, 0
_080608E8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080608F8: .4byte gUnknown_08375704
	thumb_func_end sub_80608D0

	thumb_func_start GetStepInPlaceDelay32AnimId
GetStepInPlaceDelay32AnimId: @ 80608FC
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060924
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060914
	movs r4, 0
_08060914:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060924: .4byte gUnknown_08375709
	thumb_func_end GetStepInPlaceDelay32AnimId

	thumb_func_start GetStepInPlaceDelay16AnimId
GetStepInPlaceDelay16AnimId: @ 8060928
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060950
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060940
	movs r4, 0
_08060940:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060950: .4byte gUnknown_0837570E
	thumb_func_end GetStepInPlaceDelay16AnimId

	thumb_func_start GetStepInPlaceDelay8AnimId
GetStepInPlaceDelay8AnimId: @ 8060954
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806097C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _0806096C
	movs r4, 0
_0806096C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806097C: .4byte gUnknown_08375713
	thumb_func_end GetStepInPlaceDelay8AnimId

	thumb_func_start GetStepInPlaceDelay4AnimId
GetStepInPlaceDelay4AnimId: @ 8060980
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _080609A8
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060998
	movs r4, 0
_08060998:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080609A8: .4byte gUnknown_08375718
	thumb_func_end GetStepInPlaceDelay4AnimId

	thumb_func_start FieldObjectFaceOppositeDirection
FieldObjectFaceOppositeDirection: @ 80609AC
	push {r4,lr}
	adds r4, r0, 0
	lsls r0, r1, 24
	lsrs r0, 24
	bl GetOppositeDirection
	lsls r0, 24
	lsrs r0, 24
	bl GetFaceDirectionAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetSpecialAnim
	lsls r0, 24
	lsrs r0, 24
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectFaceOppositeDirection

	thumb_func_start sub_80609D8
sub_80609D8: @ 80609D8
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060A00
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _080609F0
	movs r4, 0
_080609F0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060A00: .4byte gUnknown_0837571D
	thumb_func_end sub_80609D8

	thumb_func_start sub_8060A04
sub_8060A04: @ 8060A04
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060A2C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060A1C
	movs r4, 0
_08060A1C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060A2C: .4byte gUnknown_08375722
	thumb_func_end sub_8060A04

	thumb_func_start sub_8060A30
sub_8060A30: @ 8060A30
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060A58
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060A48
	movs r4, 0
_08060A48:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060A58: .4byte gUnknown_08375727
	thumb_func_end sub_8060A30

	thumb_func_start sub_8060A5C
sub_8060A5C: @ 8060A5C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060A84
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060A74
	movs r4, 0
_08060A74:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060A84: .4byte gUnknown_0837572C
	thumb_func_end sub_8060A5C

	thumb_func_start sub_8060A88
sub_8060A88: @ 8060A88
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060AB0
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060AA0
	movs r4, 0
_08060AA0:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060AB0: .4byte gUnknown_08375731
	thumb_func_end sub_8060A88

	thumb_func_start sub_8060AB4
sub_8060AB4: @ 8060AB4
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060ADC
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060ACC
	movs r4, 0
_08060ACC:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060ADC: .4byte gUnknown_08375736
	thumb_func_end sub_8060AB4

	thumb_func_start sub_8060AE0
sub_8060AE0: @ 8060AE0
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060B08
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060AF8
	movs r4, 0
_08060AF8:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060B08: .4byte gUnknown_0837573B
	thumb_func_end sub_8060AE0

	thumb_func_start sub_8060B0C
sub_8060B0C: @ 8060B0C
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060B34
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060B24
	movs r4, 0
_08060B24:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060B34: .4byte gUnknown_08375740
	thumb_func_end sub_8060B0C

	thumb_func_start sub_8060B38
sub_8060B38: @ 8060B38
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060B60
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060B50
	movs r4, 0
_08060B50:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060B60: .4byte gUnknown_08375745
	thumb_func_end sub_8060B38

	thumb_func_start sub_8060B64
sub_8060B64: @ 8060B64
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060B8C
	mov r0, sp
	movs r2, 0x5
	bl memcpy
	cmp r4, 0x4
	bls _08060B7C
	movs r4, 0
_08060B7C:
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060B8C: .4byte gUnknown_0837574A
	thumb_func_end sub_8060B64

	thumb_func_start GetOppositeDirection
GetOppositeDirection: @ 8060B90
	push {r4,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _08060BB4
	mov r0, sp
	movs r2, 0x8
	bl memcpy
	subs r1, r4, 0x1
	lsls r0, r1, 24
	lsrs r0, 24
	cmp r0, 0x7
	bhi _08060BB8
	mov r2, sp
	adds r0, r2, r1
	ldrb r0, [r0]
	b _08060BBA
	.align 2, 0
_08060BB4: .4byte gUnknown_0837574F
_08060BB8:
	adds r0, r4, 0
_08060BBA:
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetOppositeDirection

	thumb_func_start zffu_offset_calc
zffu_offset_calc: @ 8060BC4
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08060BD8
	lsrs r0, 22
	subs r0, 0x5
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08060BD8: .4byte gUnknown_08375757
	thumb_func_end zffu_offset_calc

	thumb_func_start state_to_direction
state_to_direction: @ 8060BDC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r1, 0
	beq _08060BFC
	cmp r2, 0
	beq _08060BFC
	cmp r1, 0x4
	bhi _08060BFC
	cmp r2, 0x4
	bls _08060C00
_08060BFC:
	movs r0, 0
	b _08060C12
_08060C00:
	adds r1, r2, 0
	bl zffu_offset_calc
	ldr r2, _08060C18
	lsls r1, r4, 2
	subs r1, 0x5
	adds r0, r1
	adds r0, r2
	ldrb r0, [r0]
_08060C12:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08060C18: .4byte gUnknown_08375767
	thumb_func_end state_to_direction

	thumb_func_start FieldObjectExecSpecialAnim
FieldObjectExecSpecialAnim: @ 8060C1C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, _08060C50
	ldrb r0, [r4, 0x1C]
	lsls r0, 2
	adds r0, r2
	movs r3, 0x32
	ldrsh r2, [r1, r3]
	ldr r0, [r0]
	lsls r2, 2
	adds r2, r0
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	beq _08060C48
	ldrb r0, [r4]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
_08060C48:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08060C50: .4byte gUnknown_08375778
	thumb_func_end FieldObjectExecSpecialAnim

	thumb_func_start FieldObjectExecRegularAnim
FieldObjectExecRegularAnim: @ 8060C54
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, _08060C80
	ldrb r0, [r4, 0x1C]
	lsls r0, 2
	adds r0, r1
	movs r2, 0x32
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	lsls r1, 2
	adds r1, r0
	ldr r2, [r1]
	adds r0, r4, 0
	adds r1, r5, 0
	bl _call_via_r2
	lsls r0, 24
	cmp r0, 0
	bne _08060C84
	movs r0, 0
	b _08060C8E
	.align 2, 0
_08060C80: .4byte gUnknown_08375778
_08060C84:
	movs r0, 0xFF
	strb r0, [r4, 0x1C]
	movs r0, 0
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08060C8E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectExecRegularAnim

	thumb_func_start FieldObjectSetRegularAnim
FieldObjectSetRegularAnim: @ 8060C94
	movs r3, 0
	strb r2, [r0, 0x1C]
	strh r3, [r1, 0x32]
	bx lr
	thumb_func_end FieldObjectSetRegularAnim

	thumb_func_start an_look_any
an_look_any: @ 8060C9C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r1, r2, 24
	lsrs r1, 24
	bl FieldObjectSetDirection
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE64
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end an_look_any

	thumb_func_start sub_8060CE0
sub_8060CE0: @ 8060CE0
	push {lr}
	movs r2, 0x1
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8060CE0

	thumb_func_start sub_8060CF0
sub_8060CF0: @ 8060CF0
	push {lr}
	movs r2, 0x2
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8060CF0

	thumb_func_start sub_8060D00
sub_8060D00: @ 8060D00
	push {lr}
	movs r2, 0x3
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8060D00

	thumb_func_start sub_8060D10
sub_8060D10: @ 8060D10
	push {lr}
	movs r2, 0x4
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8060D10

	thumb_func_start sub_8060D20
sub_8060D20: @ 8060D20
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	mov r9, r1
	adds r4, r2, 0
	adds r6, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	ldrh r1, [r0, 0x10]
	mov r0, sp
	strh r1, [r0]
	mov r1, r8
	ldrh r0, [r1, 0x12]
	mov r5, sp
	adds r5, 0x2
	strh r0, [r5]
	mov r0, r8
	adds r1, r4, 0
	bl FieldObjectSetDirection
	adds r0, r4, 0
	mov r1, sp
	adds r2, r5, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r5, r0]
	mov r0, r8
	bl npc_coords_shift
	mov r0, r9
	adds r1, r4, 0
	adds r2, r6, 0
	bl oamt_npc_ministep_reset
	mov r2, r9
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	mov r1, r8
	ldrb r0, [r1]
	movs r1, 0x4
	orrs r0, r1
	mov r2, r8
	strb r0, [r2]
	movs r0, 0x1
	mov r1, r9
	strh r0, [r1, 0x32]
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8060D20

	thumb_func_start do_go_anim
do_go_anim: @ 8060DA4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x14
	adds r5, r0, 0
	mov r8, r1
	adds r4, r3, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r4, 24
	lsrs r4, 24
	mov r1, sp
	ldr r0, _08060DFC
	ldm r0!, {r3,r6,r7}
	stm r1!, {r3,r6,r7}
	ldm r0!, {r3,r6}
	stm r1!, {r3,r6}
	adds r0, r5, 0
	mov r1, r8
	adds r3, r4, 0
	bl sub_8060D20
	lsls r4, 2
	mov r7, sp
	adds r1, r7, r4
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	ldr r1, [r1]
	bl _call_via_r1
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	mov r1, r8
	bl sub_805FE28
	add sp, 0x14
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08060DFC: .4byte gUnknown_083759C0
	thumb_func_end do_go_anim

	thumb_func_start do_run_anim
do_run_anim: @ 8060E00
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0x1
	bl sub_8060D20
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_run_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end do_run_anim

	thumb_func_start npc_obj_ministep_stop_on_arrival
npc_obj_ministep_stop_on_arrival: @ 8060E30
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl obj_npc_ministep
	lsls r0, 24
	cmp r0, 0
	bne _08060E46
	movs r0, 0
	b _08060E62
_08060E46:
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_08060E62:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end npc_obj_ministep_stop_on_arrival

	thumb_func_start sub_8060E68
sub_8060E68: @ 8060E68
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	adds r6, r0, 0
	mov r8, r1
	lsls r5, r2, 24
	lsrs r5, 24
	ldrh r1, [r6, 0x10]
	mov r0, sp
	strh r1, [r0]
	ldrh r0, [r6, 0x12]
	mov r4, sp
	adds r4, 0x2
	strh r0, [r4]
	adds r0, r6, 0
	adds r1, r5, 0
	bl FieldObjectSetDirection
	adds r0, r5, 0
	mov r1, sp
	adds r2, r4, 0
	bl MoveCoords
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	movs r0, 0
	ldrsh r2, [r4, r0]
	adds r0, r6, 0
	bl npc_coords_shift
	mov r0, r8
	adds r1, r5, 0
	bl sub_806467C
	mov r2, r8
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r6]
	movs r0, 0x1
	mov r1, r8
	strh r0, [r1, 0x32]
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8060E68

	thumb_func_start sub_8060ED8
sub_8060ED8: @ 8060ED8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	bl sub_8060E68
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8060ED8

	thumb_func_start an_walk_any_2
an_walk_any_2: @ 8060F04
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r5, 0
	bl sub_806468C
	lsls r0, 24
	cmp r0, 0
	bne _08060F1A
	movs r0, 0
	b _08060F36
_08060F1A:
	adds r0, r4, 0
	bl npc_coords_shift_still
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
	adds r2, r5, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_08060F36:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end an_walk_any_2

	thumb_func_start sub_8060F3C
sub_8060F3C: @ 8060F3C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8060ED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8060F5C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060F3C

	thumb_func_start sub_8060F5C
sub_8060F5C: @ 8060F5C
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08060F6E
	movs r0, 0
	b _08060F74
_08060F6E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08060F74:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060F5C

	thumb_func_start sub_8060F7C
sub_8060F7C: @ 8060F7C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl sub_8060ED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8060F9C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060F7C

	thumb_func_start sub_8060F9C
sub_8060F9C: @ 8060F9C
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08060FAE
	movs r0, 0
	b _08060FB4
_08060FAE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08060FB4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060F9C

	thumb_func_start sub_8060FBC
sub_8060FBC: @ 8060FBC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl sub_8060ED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8060FDC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060FBC

	thumb_func_start sub_8060FDC
sub_8060FDC: @ 8060FDC
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08060FEE
	movs r0, 0
	b _08060FF4
_08060FEE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08060FF4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8060FDC

	thumb_func_start sub_8060FFC
sub_8060FFC: @ 8060FFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl sub_8060ED8
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806101C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8060FFC

	thumb_func_start sub_806101C
sub_806101C: @ 806101C
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _0806102E
	movs r0, 0
	b _08061034
_0806102E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061034:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806101C

	thumb_func_start sub_806103C
sub_806103C: @ 806103C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806105C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806103C

	thumb_func_start sub_806105C
sub_806105C: @ 806105C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806106E
	movs r0, 0
	b _08061074
_0806106E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061074:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806105C

	thumb_func_start sub_806107C
sub_806107C: @ 806107C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806109C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806107C

	thumb_func_start sub_806109C
sub_806109C: @ 806109C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080610AE
	movs r0, 0
	b _080610B4
_080610AE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080610B4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806109C

	thumb_func_start sub_80610BC
sub_80610BC: @ 80610BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80610DC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80610BC

	thumb_func_start sub_80610DC
sub_80610DC: @ 80610DC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080610EE
	movs r0, 0
	b _080610F4
_080610EE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080610F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80610DC

	thumb_func_start sub_80610FC
sub_80610FC: @ 80610FC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806111C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80610FC

	thumb_func_start sub_806111C
sub_806111C: @ 806111C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806112E
	movs r0, 0
	b _08061134
_0806112E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061134:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806111C

	thumb_func_start sub_806113C
sub_806113C: @ 806113C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x10
	adds r7, r0, 0
	mov r10, r1
	adds r4, r2, 0
	mov r8, r3
	ldr r0, [sp, 0x30]
	lsls r4, 24
	lsrs r4, 24
	mov r1, r8
	lsls r1, 24
	lsrs r1, 24
	mov r8, r1
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, _080611F4
	add r0, sp, 0x4
	movs r2, 0x6
	bl memcpy
	add r5, sp, 0xC
	movs r0, 0
	strh r0, [r5]
	mov r6, sp
	adds r6, 0xE
	strh r0, [r6]
	adds r0, r7, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	mov r1, r8
	lsls r0, r1, 1
	add r0, sp
	adds r0, 0x4
	movs r1, 0
	ldrsh r3, [r0, r1]
	str r3, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_8060320
	ldrh r1, [r5]
	ldrh r0, [r7, 0x10]
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r6]
	ldrh r0, [r7, 0x12]
	adds r2, r0
	lsls r2, 16
	asrs r2, 16
	adds r0, r7, 0
	bl npc_coords_shift
	mov r0, r10
	adds r1, r4, 0
	mov r2, r8
	mov r3, r9
	bl sub_80646E4
	movs r0, 0x1
	mov r1, r10
	strh r0, [r1, 0x32]
	movs r0, 0x2C
	add r10, r0
	mov r0, r10
	ldrb r1, [r0]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	mov r1, r10
	strb r0, [r1]
	ldrb r0, [r7]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r7]
	add sp, 0x10
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080611F4: .4byte gUnknown_08375A34
	thumb_func_end sub_806113C

	thumb_func_start maybe_shadow_1
maybe_shadow_1: @ 80611F8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, [sp, 0x10]
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r4, 0
	bl sub_806113C
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	adds r0, r4, 0
	bl DoShadowFieldEffect
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end maybe_shadow_1

	thumb_func_start sub_806123C
sub_806123C: @ 806123C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x10
	adds r6, r0, 0
	adds r7, r1, 0
	adds r4, r2, 0
	ldr r1, _080612C8
	add r0, sp, 0x4
	movs r2, 0x6
	bl memcpy
	adds r0, r7, 0
	bl _call_via_r4
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	cmp r0, 0x1
	bne _080612CC
	movs r1, 0x36
	ldrsh r0, [r7, r1]
	lsls r0, 1
	add r0, sp
	adds r0, 0x4
	movs r2, 0
	ldrsh r0, [r0, r2]
	cmp r0, 0
	beq _080612CC
	add r4, sp, 0xC
	movs r0, 0
	strh r0, [r4]
	mov r5, sp
	adds r5, 0xE
	strh r0, [r5]
	ldrb r0, [r6, 0x18]
	lsrs r0, 4
	movs r2, 0x36
	ldrsh r1, [r7, r2]
	lsls r1, 1
	add r1, sp
	adds r1, 0x4
	movs r2, 0
	ldrsh r3, [r1, r2]
	str r3, [sp]
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8060320
	ldrh r1, [r4]
	ldrh r0, [r6, 0x10]
	adds r1, r0
	lsls r1, 16
	asrs r1, 16
	ldrh r2, [r5]
	ldrh r0, [r6, 0x12]
	adds r2, r0
	lsls r2, 16
	asrs r2, 16
	adds r0, r6, 0
	bl npc_coords_shift
	ldrb r0, [r6]
	movs r1, 0x4
	orrs r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r6]
	b _080612F0
	.align 2, 0
_080612C8: .4byte gUnknown_08375A3A
_080612CC:
	mov r1, r8
	cmp r1, 0xFF
	bne _080612F0
	adds r0, r6, 0
	bl npc_coords_shift_still
	ldrb r0, [r6]
	movs r1, 0x8
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r6]
	adds r2, r7, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
_080612F0:
	mov r0, r8
	add sp, 0x10
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806123C

	thumb_func_start sub_8061300
sub_8061300: @ 8061300
	push {lr}
	ldr r2, _08061310
	bl sub_806123C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08061310: .4byte sub_8064704
	thumb_func_end sub_8061300

	thumb_func_start sub_8061314
sub_8061314: @ 8061314
	push {lr}
	ldr r2, _08061324
	bl sub_806123C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08061324: .4byte sub_806478C
	thumb_func_end sub_8061314

	thumb_func_start sub_8061328
sub_8061328: @ 8061328
	push {lr}
	bl sub_8061300
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _0806133A
	movs r0, 0
	b _0806133C
_0806133A:
	movs r0, 0x1
_0806133C:
	pop {r1}
	bx r1
	thumb_func_end sub_8061328

	thumb_func_start sub_8061340
sub_8061340: @ 8061340
	push {lr}
	bl sub_8061314
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08061352
	movs r0, 0
	b _08061354
_08061352:
	movs r0, 0x1
_08061354:
	pop {r1}
	bx r1
	thumb_func_end sub_8061340

	thumb_func_start sub_8061358
sub_8061358: @ 8061358
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061300
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08061372
	cmp r0, 0xFF
	bne _0806139E
	movs r0, 0x1
	b _080613A0
_08061372:
	ldrb r0, [r4, 0x18]
	lsrs r0, 4
	bl GetOppositeDirection
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectSetDirection
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl get_go_image_anim_num
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE64
_0806139E:
	movs r0, 0
_080613A0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061358

	thumb_func_start sub_80613A8
sub_80613A8: @ 80613A8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80613D4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80613A8

	thumb_func_start sub_80613D4
sub_80613D4: @ 80613D4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080613E8
	movs r0, 0
	b _080613F8
_080613E8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080613F8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80613D4

	thumb_func_start sub_8061400
sub_8061400: @ 8061400
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806142C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061400

	thumb_func_start sub_806142C
sub_806142C: @ 806142C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08061440
	movs r0, 0
	b _08061450
_08061440:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08061450:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806142C

	thumb_func_start sub_8061458
sub_8061458: @ 8061458
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061484
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061458

	thumb_func_start sub_8061484
sub_8061484: @ 8061484
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08061498
	movs r0, 0
	b _080614A8
_08061498:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080614A8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061484

	thumb_func_start sub_80614B0
sub_80614B0: @ 80614B0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x2
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80614DC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80614B0

	thumb_func_start sub_80614DC
sub_80614DC: @ 80614DC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080614F0
	movs r0, 0
	b _08061500
_080614F0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08061500:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80614DC

	thumb_func_start sub_8061508
sub_8061508: @ 8061508
	movs r2, 0x1
	strh r2, [r0, 0x32]
	strh r1, [r0, 0x34]
	bx lr
	thumb_func_end sub_8061508

	thumb_func_start sub_8061510
sub_8061510: @ 8061510
	push {lr}
	ldrh r0, [r1, 0x34]
	subs r0, 0x1
	strh r0, [r1, 0x34]
	lsls r0, 16
	cmp r0, 0
	beq _08061522
	movs r0, 0
	b _08061528
_08061522:
	movs r0, 0x2
	strh r0, [r1, 0x32]
	movs r0, 0x1
_08061528:
	pop {r1}
	bx r1
	thumb_func_end sub_8061510

	thumb_func_start sub_806152C
sub_806152C: @ 806152C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806152C

	thumb_func_start sub_806154C
sub_806154C: @ 806154C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x2
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806154C

	thumb_func_start sub_806156C
sub_806156C: @ 806156C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x4
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806156C

	thumb_func_start sub_806158C
sub_806158C: @ 806158C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x8
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806158C

	thumb_func_start sub_80615AC
sub_80615AC: @ 80615AC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x10
	bl sub_8061508
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061510
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80615AC

	thumb_func_start sub_80615CC
sub_80615CC: @ 80615CC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80615EC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80615CC

	thumb_func_start sub_80615EC
sub_80615EC: @ 80615EC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080615FE
	movs r0, 0
	b _08061604
_080615FE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061604:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80615EC

	thumb_func_start sub_806160C
sub_806160C: @ 806160C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806162C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806160C

	thumb_func_start sub_806162C
sub_806162C: @ 806162C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806163E
	movs r0, 0
	b _08061644
_0806163E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061644:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806162C

	thumb_func_start sub_806164C
sub_806164C: @ 806164C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806166C
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806164C

	thumb_func_start sub_806166C
sub_806166C: @ 806166C
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806167E
	movs r0, 0
	b _08061684
_0806167E:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061684:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806166C

	thumb_func_start sub_806168C
sub_806168C: @ 806168C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80616AC
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806168C

	thumb_func_start sub_80616AC
sub_80616AC: @ 80616AC
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080616BE
	movs r0, 0
	b _080616C4
_080616BE:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080616C4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80616AC

	thumb_func_start sub_80616CC
sub_80616CC: @ 80616CC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	mov r8, r0
	adds r6, r1, 0
	adds r1, r2, 0
	adds r4, r3, 0
	ldr r5, [sp, 0x14]
	lsls r1, 24
	lsrs r1, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 16
	lsrs r5, 16
	bl FieldObjectSetDirection
	mov r0, r8
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_805FE28
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r6, 0x32]
	strh r5, [r6, 0x34]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80616CC

	thumb_func_start sub_8061714
sub_8061714: @ 8061714
	push {lr}
	ldrh r0, [r1, 0x34]
	subs r0, 0x1
	strh r0, [r1, 0x34]
	lsls r0, 16
	cmp r0, 0
	beq _08061726
	movs r0, 0
	b _08061738
_08061726:
	movs r0, 0x2
	strh r0, [r1, 0x32]
	adds r2, r1, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
_08061738:
	pop {r1}
	bx r1
	thumb_func_end sub_8061714

	thumb_func_start sub_806173C
sub_806173C: @ 806173C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrh r1, [r4, 0x34]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08061766
	adds r3, r4, 0
	adds r3, 0x2C
	ldrb r2, [r3]
	lsls r1, r2, 26
	lsrs r1, 26
	adds r1, 0x1
	movs r0, 0x3F
	ands r1, r0
	movs r0, 0x40
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_08061766:
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806173C

	thumb_func_start sub_8061778
sub_8061778: @ 8061778
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806173C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061778

	thumb_func_start sub_80617B0
sub_80617B0: @ 80617B0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806173C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80617B0

	thumb_func_start sub_80617E8
sub_80617E8: @ 80617E8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806173C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80617E8

	thumb_func_start sub_8061820
sub_8061820: @ 8061820
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x20
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806173C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061820

	thumb_func_start sub_8061858
sub_8061858: @ 8061858
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061858

	thumb_func_start sub_8061890
sub_8061890: @ 8061890
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061890

	thumb_func_start sub_80618C8
sub_80618C8: @ 80618C8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80618C8

	thumb_func_start sub_8061900
sub_8061900: @ 8061900
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x10
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061900

	thumb_func_start sub_8061938
sub_8061938: @ 8061938
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061938

	thumb_func_start sub_8061970
sub_8061970: @ 8061970
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061970

	thumb_func_start sub_80619A8
sub_80619A8: @ 80619A8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80619A8

	thumb_func_start sub_80619E0
sub_80619E0: @ 80619E0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_fast_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80619E0

	thumb_func_start sub_8061A18
sub_8061A18: @ 8061A18
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061A18

	thumb_func_start sub_8061A50
sub_8061A50: @ 8061A50
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061A50

	thumb_func_start sub_8061A88
sub_8061A88: @ 8061A88
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061A88

	thumb_func_start sub_8061AC0
sub_8061AC0: @ 8061AC0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl get_go_faster_image_anim_num
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x4
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061AC0

	thumb_func_start sub_8061AF8
sub_8061AF8: @ 8061AF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061B18
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061AF8

	thumb_func_start sub_8061B18
sub_8061B18: @ 8061B18
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061B2A
	movs r0, 0
	b _08061B30
_08061B2A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061B30:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B18

	thumb_func_start sub_8061B38
sub_8061B38: @ 8061B38
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061B58
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B38

	thumb_func_start sub_8061B58
sub_8061B58: @ 8061B58
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061B6A
	movs r0, 0
	b _08061B70
_08061B6A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061B70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B58

	thumb_func_start sub_8061B78
sub_8061B78: @ 8061B78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061B98
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B78

	thumb_func_start sub_8061B98
sub_8061B98: @ 8061B98
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061BAA
	movs r0, 0
	b _08061BB0
_08061BAA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061BB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061B98

	thumb_func_start sub_8061BB8
sub_8061BB8: @ 8061BB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x2
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061BD8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061BB8

	thumb_func_start sub_8061BD8
sub_8061BD8: @ 8061BD8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061BEA
	movs r0, 0
	b _08061BF0
_08061BEA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061BF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061BD8

	thumb_func_start sub_8061BF8
sub_8061BF8: @ 8061BF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061C18
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061BF8

	thumb_func_start sub_8061C18
sub_8061C18: @ 8061C18
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061C2A
	movs r0, 0
	b _08061C30
_08061C2A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061C30:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C18

	thumb_func_start sub_8061C38
sub_8061C38: @ 8061C38
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061C58
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C38

	thumb_func_start sub_8061C58
sub_8061C58: @ 8061C58
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061C6A
	movs r0, 0
	b _08061C70
_08061C6A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061C70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C58

	thumb_func_start sub_8061C78
sub_8061C78: @ 8061C78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061C98
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C78

	thumb_func_start sub_8061C98
sub_8061C98: @ 8061C98
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061CAA
	movs r0, 0
	b _08061CB0
_08061CAA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061CB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061C98

	thumb_func_start sub_8061CB8
sub_8061CB8: @ 8061CB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x3
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061CD8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061CB8

	thumb_func_start sub_8061CD8
sub_8061CD8: @ 8061CD8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061CEA
	movs r0, 0
	b _08061CF0
_08061CEA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061CF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061CD8

	thumb_func_start sub_8061CF8
sub_8061CF8: @ 8061CF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061D18
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061CF8

	thumb_func_start sub_8061D18
sub_8061D18: @ 8061D18
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061D2A
	movs r0, 0
	b _08061D30
_08061D2A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061D30:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D18

	thumb_func_start sub_8061D38
sub_8061D38: @ 8061D38
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061D58
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D38

	thumb_func_start sub_8061D58
sub_8061D58: @ 8061D58
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061D6A
	movs r0, 0
	b _08061D70
_08061D6A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061D70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D58

	thumb_func_start sub_8061D78
sub_8061D78: @ 8061D78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061D98
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D78

	thumb_func_start sub_8061D98
sub_8061D98: @ 8061D98
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061DAA
	movs r0, 0
	b _08061DB0
_08061DAA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061DB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061D98

	thumb_func_start sub_8061DB8
sub_8061DB8: @ 8061DB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x4
	bl do_go_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061DD8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061DB8

	thumb_func_start sub_8061DD8
sub_8061DD8: @ 8061DD8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061DEA
	movs r0, 0
	b _08061DF0
_08061DEA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061DF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061DD8

	thumb_func_start do_run_south_anim
do_run_south_anim: @ 8061DF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061E18
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_south_anim

	thumb_func_start sub_8061E18
sub_8061E18: @ 8061E18
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061E2A
	movs r0, 0
	b _08061E30
_08061E2A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061E30:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061E18

	thumb_func_start do_run_north_anim
do_run_north_anim: @ 8061E38
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061E58
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_north_anim

	thumb_func_start sub_8061E58
sub_8061E58: @ 8061E58
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061E6A
	movs r0, 0
	b _08061E70
_08061E6A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061E70:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061E58

	thumb_func_start do_run_west_anim
do_run_west_anim: @ 8061E78
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061E98
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_west_anim

	thumb_func_start sub_8061E98
sub_8061E98: @ 8061E98
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061EAA
	movs r0, 0
	b _08061EB0
_08061EAA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061EB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061E98

	thumb_func_start do_run_east_anim
do_run_east_anim: @ 8061EB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl do_run_anim
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061ED8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end do_run_east_anim

	thumb_func_start sub_8061ED8
sub_8061ED8: @ 8061ED8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08061EEA
	movs r0, 0
	b _08061EF0
_08061EEA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061EF0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061ED8

	thumb_func_start npc_set_direction_and_anim__an_proceed
npc_set_direction_and_anim__an_proceed: @ 8061EF8
	push {r4-r6,lr}
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	adds r1, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	movs r2, 0
	bl obj_anim_image_set_and_seek
	adds r0, r6, 0
	adds r1, r4, 0
	bl FieldObjectSetDirection
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end npc_set_direction_and_anim__an_proceed

	thumb_func_start sub_8061F24
sub_8061F24: @ 8061F24
	push {lr}
	ldrb r2, [r0, 0x18]
	lsrs r2, 4
	adds r3, r1, 0
	adds r3, 0x2A
	ldrb r3, [r3]
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8061F24

	thumb_func_start sub_8061F3C
sub_8061F3C: @ 8061F3C
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064864
	lsls r0, 24
	cmp r0, 0
	bne _08061F50
	movs r0, 0
	b _08061F56
_08061F50:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08061F56:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8061F3C

	thumb_func_start sub_8061F5C
sub_8061F5C: @ 8061F5C
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	movs r1, 0
	str r1, [sp]
	adds r1, r5, 0
	adds r2, r4, 0
	movs r3, 0x1
	bl sub_806113C
	adds r0, r4, 0
	bl sub_805FD88
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnim
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8061F5C

	thumb_func_start sub_8061F90
sub_8061F90: @ 8061F90
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	bl sub_8061F5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061FB0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061F90

	thumb_func_start sub_8061FB0
sub_8061FB0: @ 8061FB0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061340
	lsls r0, 24
	cmp r0, 0
	bne _08061FC4
	movs r0, 0
	b _08061FD2
_08061FC4:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_08061FD2:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061FB0

	thumb_func_start sub_8061FD8
sub_8061FD8: @ 8061FD8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	bl sub_8061F5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061FF8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061FD8

	thumb_func_start sub_8061FF8
sub_8061FF8: @ 8061FF8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061340
	lsls r0, 24
	cmp r0, 0
	bne _0806200C
	movs r0, 0
	b _0806201A
_0806200C:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_0806201A:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8061FF8

	thumb_func_start sub_8062020
sub_8062020: @ 8062020
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	bl sub_8061F5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062040
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062020

	thumb_func_start sub_8062040
sub_8062040: @ 8062040
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061340
	lsls r0, 24
	cmp r0, 0
	bne _08062054
	movs r0, 0
	b _08062062
_08062054:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_08062062:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062040

	thumb_func_start sub_8062068
sub_8062068: @ 8062068
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	bl sub_8061F5C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062088
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062068

	thumb_func_start sub_8062088
sub_8062088: @ 8062088
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061340
	lsls r0, 24
	cmp r0, 0
	bne _0806209C
	movs r0, 0
	b _080620AA
_0806209C:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	ldrb r1, [r4]
	subs r0, 0x23
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
_080620AA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062088

	thumb_func_start sub_80620B0
sub_80620B0: @ 80620B0
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _080620FA
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	ldr r4, _08062108
	mov r2, sp
	ldrb r2, [r2]
	lsls r3, r2, 3
	adds r3, r2
	lsls r3, 2
	adds r3, r4
	movs r4, 0x10
	ldrsh r2, [r3, r4]
	movs r4, 0x12
	ldrsh r3, [r3, r4]
	bl sub_805FE90
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl an_look_any
_080620FA:
	movs r0, 0x1
	strh r0, [r6, 0x32]
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08062108: .4byte 0x030048a0
	thumb_func_end sub_80620B0

	thumb_func_start sub_806210C
sub_806210C: @ 806210C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	mov r3, sp
	bl TryGetFieldObjectIdByLocalIdAndMap
	lsls r0, 24
	cmp r0, 0
	bne _0806215E
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	ldr r4, _0806216C
	mov r2, sp
	ldrb r2, [r2]
	lsls r3, r2, 3
	adds r3, r2
	lsls r3, 2
	adds r3, r4
	movs r4, 0x10
	ldrsh r2, [r3, r4]
	movs r4, 0x12
	ldrsh r3, [r3, r4]
	bl sub_805FE90
	lsls r0, 24
	lsrs r0, 24
	bl GetOppositeDirection
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl an_look_any
_0806215E:
	movs r0, 0x1
	strh r0, [r6, 0x32]
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806216C: .4byte 0x030048a0
	thumb_func_end sub_806210C

	thumb_func_start sub_8062170
sub_8062170: @ 8062170
	ldrb r2, [r0, 0x1]
	movs r3, 0x2
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062170

	thumb_func_start sub_8062180
sub_8062180: @ 8062180
	ldrb r3, [r0, 0x1]
	movs r2, 0x3
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062180

	thumb_func_start sub_8062190
sub_8062190: @ 8062190
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80621BC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062190

	thumb_func_start sub_80621BC
sub_80621BC: @ 80621BC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080621D0
	movs r0, 0
	b _080621E0
_080621D0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080621E0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80621BC

	thumb_func_start sub_80621E8
sub_80621E8: @ 80621E8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062214
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80621E8

	thumb_func_start sub_8062214
sub_8062214: @ 8062214
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062228
	movs r0, 0
	b _08062238
_08062228:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062238:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062214

	thumb_func_start sub_8062240
sub_8062240: @ 8062240
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806226C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062240

	thumb_func_start sub_806226C
sub_806226C: @ 806226C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062280
	movs r0, 0
	b _08062290
_08062280:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062290:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806226C

	thumb_func_start sub_8062298
sub_8062298: @ 8062298
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x1
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80622C4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062298

	thumb_func_start sub_80622C4
sub_80622C4: @ 80622C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080622D8
	movs r0, 0
	b _080622E8
_080622D8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080622E8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80622C4

	thumb_func_start sub_80622F0
sub_80622F0: @ 80622F0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806231C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80622F0

	thumb_func_start sub_806231C
sub_806231C: @ 806231C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062330
	movs r0, 0
	b _08062340
_08062330:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062340:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806231C

	thumb_func_start sub_8062348
sub_8062348: @ 8062348
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062374
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062348

	thumb_func_start sub_8062374
sub_8062374: @ 8062374
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062388
	movs r0, 0
	b _08062398
_08062388:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062398:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062374

	thumb_func_start sub_80623A0
sub_80623A0: @ 80623A0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80623CC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80623A0

	thumb_func_start sub_80623CC
sub_80623CC: @ 80623CC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _080623E0
	movs r0, 0
	b _080623F0
_080623E0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080623F0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80623CC

	thumb_func_start sub_80623F8
sub_80623F8: @ 80623F8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062424
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80623F8

	thumb_func_start sub_8062424
sub_8062424: @ 8062424
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062438
	movs r0, 0
	b _08062448
_08062438:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062448:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062424

	thumb_func_start sub_8062450
sub_8062450: @ 8062450
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806247C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062450

	thumb_func_start sub_806247C
sub_806247C: @ 806247C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061358
	lsls r0, 24
	cmp r0, 0
	bne _08062490
	movs r0, 0
	b _080624A0
_08062490:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080624A0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806247C

	thumb_func_start sub_80624A8
sub_80624A8: @ 80624A8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80624D4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80624A8

	thumb_func_start sub_80624D4
sub_80624D4: @ 80624D4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061358
	lsls r0, 24
	cmp r0, 0
	bne _080624E8
	movs r0, 0
	b _080624F8
_080624E8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080624F8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80624D4

	thumb_func_start sub_8062500
sub_8062500: @ 8062500
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806252C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062500

	thumb_func_start sub_806252C
sub_806252C: @ 806252C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061358
	lsls r0, 24
	cmp r0, 0
	bne _08062540
	movs r0, 0
	b _08062550
_08062540:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062550:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806252C

	thumb_func_start sub_8062558
sub_8062558: @ 8062558
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl maybe_shadow_1
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062584
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062558

	thumb_func_start sub_8062584
sub_8062584: @ 8062584
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061358
	lsls r0, 24
	cmp r0, 0
	bne _08062598
	movs r0, 0
	b _080625A8
_08062598:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080625A8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062584

	thumb_func_start sub_80625B0
sub_80625B0: @ 80625B0
	push {lr}
	ldr r3, _080625C4
	ldrb r2, [r0, 0x6]
	adds r2, r3
	ldrb r2, [r2]
	bl an_look_any
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080625C4: .4byte gUnknown_0836DC09
	thumb_func_end sub_80625B0

	thumb_func_start sub_80625C8
sub_80625C8: @ 80625C8
	push {lr}
	movs r2, 0x1
	movs r3, 0x14
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80625C8

	thumb_func_start sub_80625D8
sub_80625D8: @ 80625D8
	ldrb r3, [r0, 0x3]
	movs r2, 0x3
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80625D8

	thumb_func_start sub_80625E8
sub_80625E8: @ 80625E8
	ldrb r2, [r0, 0x3]
	movs r3, 0x2
	orrs r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80625E8

	thumb_func_start sub_80625F8
sub_80625F8: @ 80625F8
	ldrb r2, [r0, 0x1]
	movs r3, 0x10
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_80625F8

	thumb_func_start sub_8062608
sub_8062608: @ 8062608
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldrb r1, [r0, 0xC]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 4
	ldrb r2, [r4, 0x1]
	movs r0, 0x11
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x1
	strh r0, [r5, 0x32]
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062608

	thumb_func_start sub_8062634
sub_8062634: @ 8062634
	ldrb r2, [r0, 0x1]
	movs r3, 0x20
	orrs r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062634

	thumb_func_start sub_8062644
sub_8062644: @ 8062644
	ldrb r3, [r0, 0x1]
	movs r2, 0x21
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x1]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_8062644

	thumb_func_start do_exclamation_mark_bubble_1
do_exclamation_mark_bubble_1: @ 8062654
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _08062674
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062674: .4byte 0x0202ff84
	thumb_func_end do_exclamation_mark_bubble_1

	thumb_func_start do_exclamation_mark_bubble_2
do_exclamation_mark_bubble_2: @ 8062678
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _08062698
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x21
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08062698: .4byte 0x0202ff84
	thumb_func_end do_exclamation_mark_bubble_2

	thumb_func_start do_heart_bubble
do_heart_bubble: @ 806269C
	push {r4,lr}
	adds r4, r1, 0
	ldr r1, _080626BC
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	movs r0, 0x2E
	bl FieldEffectStart
	movs r0, 0x1
	strh r0, [r4, 0x32]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080626BC: .4byte 0x0202ff84
	thumb_func_end do_heart_bubble

	thumb_func_start sub_80626C0
sub_80626C0: @ 80626C0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x6]
	cmp r0, 0x3F
	bne _080626D6
	adds r0, r4, 0
	bl sub_8084794
	movs r0, 0
	b _080626FE
_080626D6:
	subs r0, 0x39
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _080626F8
	adds r0, r4, 0
	bl sub_812869C
	movs r0, 0x1
	strh r0, [r5, 0x32]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062704
	lsls r0, 24
	lsrs r0, 24
	b _080626FE
_080626F8:
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_080626FE:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80626C0

	thumb_func_start sub_8062704
sub_8062704: @ 8062704
	push {r4,lr}
	adds r4, r1, 0
	bl sub_81286C4
	lsls r0, 24
	cmp r0, 0
	bne _08062716
	movs r0, 0
	b _0806271C
_08062716:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_0806271C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062704

	thumb_func_start sub_8062724
sub_8062724: @ 8062724
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl obj_anim_image_set_and_seek
	movs r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062724

	thumb_func_start sub_8062740
sub_8062740: @ 8062740
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064864
	lsls r0, 24
	cmp r0, 0
	beq _0806275C
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_8064820
	movs r0, 0x2
	strh r0, [r4, 0x32]
_0806275C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062740

	thumb_func_start sub_8062764
sub_8062764: @ 8062764
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	beq _08062796
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x3
	strh r0, [r5, 0x32]
_08062796:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062764

	thumb_func_start sub_80627A0
sub_80627A0: @ 80627A0
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	movs r1, 0x1
	movs r2, 0
	bl obj_anim_image_set_and_seek
	movs r0, 0x1
	strh r0, [r4, 0x32]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80627A0

	thumb_func_start sub_80627BC
sub_80627BC: @ 80627BC
	push {r4,lr}
	adds r4, r1, 0
	adds r0, r4, 0
	bl sub_8064864
	lsls r0, 24
	cmp r0, 0
	beq _080627D8
	adds r0, r4, 0
	movs r1, 0x20
	bl sub_8064820
	movs r0, 0x2
	strh r0, [r4, 0x32]
_080627D8:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80627BC

	thumb_func_start sub_80627E0
sub_80627E0: @ 80627E0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r2, [r4, 0x1]
	lsls r1, r2, 26
	lsrs r1, 31
	movs r0, 0x1
	eors r1, r0
	lsls r1, 5
	subs r0, 0x22
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r5, 0
	bl sub_8064824
	lsls r0, 24
	cmp r0, 0
	beq _08062812
	ldrb r0, [r4, 0x1]
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x1]
	movs r0, 0x3
	strh r0, [r5, 0x32]
_08062812:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80627E0

	thumb_func_start sub_806281C
sub_806281C: @ 806281C
	ldrb r2, [r0, 0x3]
	movs r3, 0x4
	orrs r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_806281C

	thumb_func_start sub_806282C
sub_806282C: @ 806282C
	ldrb r3, [r0, 0x3]
	movs r2, 0x5
	negs r2, r2
	ands r2, r3
	strb r2, [r0, 0x3]
	movs r0, 0x1
	strh r0, [r1, 0x32]
	bx lr
	thumb_func_end sub_806282C

	thumb_func_start sub_806283C
sub_806283C: @ 806283C
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r4, 0x1]
	movs r1, 0x3
	orrs r0, r1
	strb r0, [r4, 0x1]
	adds r0, r4, 0
	bl InitSpriteAffineAnim
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	adds r4, 0x42
	ldrb r1, [r4]
	movs r0, 0x3F
	ands r0, r1
	strb r0, [r4]
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806283C

	thumb_func_start sub_806286C
sub_806286C: @ 806286C
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r4, 0x3]
	lsls r0, 26
	lsrs r0, 27
	bl FreeOamMatrix
	ldrb r0, [r4, 0x1]
	movs r1, 0x4
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x1]
	lsrs r1, 6
	ldrb r2, [r4, 0x3]
	lsrs r2, 6
	movs r3, 0
	adds r0, r4, 0
	bl CalcCenterToCornerVec
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806286C

	thumb_func_start sub_806289C
sub_806289C: @ 806289C
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r2, 0x1
	bl sub_8060ED8
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0
	bl StartSpriteAffineAnimIfDifferent
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80628D0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806289C

	thumb_func_start sub_80628D0
sub_80628D0: @ 80628D0
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _080628E2
	movs r0, 0
	b _080628F4
_080628E2:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080628F4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80628D0

	thumb_func_start sub_80628FC
sub_80628FC: @ 80628FC
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	movs r2, 0x1
	bl sub_8060ED8
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, 0
	movs r1, 0x1
	bl ChangeSpriteAffineAnimIfDifferent
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8062930
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80628FC

	thumb_func_start sub_8062930
sub_8062930: @ 8062930
	push {r4,lr}
	adds r4, r1, 0
	bl an_walk_any_2
	lsls r0, 24
	cmp r0, 0
	bne _08062942
	movs r0, 0
	b _08062954
_08062942:
	adds r2, r4, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08062954:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8062930

	thumb_func_start sub_806295C
sub_806295C: @ 806295C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r4, r2, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl FieldObjectSetDirection
	adds r0, r5, 0
	bl npc_coords_shift_still
	adds r0, r4, 0
	bl sub_805FDD8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_805FE64
	adds r2, r6, 0
	adds r2, 0x2C
	ldrb r0, [r2]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, 0x1
	strh r0, [r6, 0x32]
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806295C

	thumb_func_start sub_806299C
sub_806299C: @ 806299C
	push {lr}
	movs r2, 0x1
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_806299C

	thumb_func_start sub_80629AC
sub_80629AC: @ 80629AC
	push {lr}
	movs r2, 0x2
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80629AC

	thumb_func_start sub_80629BC
sub_80629BC: @ 80629BC
	push {lr}
	movs r2, 0x3
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80629BC

	thumb_func_start sub_80629CC
sub_80629CC: @ 80629CC
	push {lr}
	movs r2, 0x4
	bl sub_806295C
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80629CC

	thumb_func_start sub_80629DC
sub_80629DC: @ 80629DC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80629DC

	thumb_func_start sub_8062A00
sub_8062A00: @ 8062A00
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A00

	thumb_func_start sub_8062A24
sub_8062A24: @ 8062A24
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A24

	thumb_func_start sub_8062A48
sub_8062A48: @ 8062A48
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FD98
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A48

	thumb_func_start sub_8062A6C
sub_8062A6C: @ 8062A6C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A6C

	thumb_func_start sub_8062A90
sub_8062A90: @ 8062A90
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062A90

	thumb_func_start sub_8062AB4
sub_8062AB4: @ 8062AB4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062AB4

	thumb_func_start sub_8062AD8
sub_8062AD8: @ 8062AD8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FDB8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062AD8

	thumb_func_start sub_8062AFC
sub_8062AFC: @ 8062AFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062AFC

	thumb_func_start sub_8062B20
sub_8062B20: @ 8062B20
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062B20

	thumb_func_start sub_8062B44
sub_8062B44: @ 8062B44
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062B44

	thumb_func_start sub_8062B68
sub_8062B68: @ 8062B68
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FDC8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl npc_set_direction_and_anim__an_proceed
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062B68

	thumb_func_start sub_8062B8C
sub_8062B8C: @ 8062B8C
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	adds r5, r1, 0
	adds r4, r2, 0
	ldr r0, [sp, 0x14]
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp]
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_806113C
	adds r0, r4, 0
	bl sub_805FD98
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl StartSpriteAnimIfDifferent
	adds r0, r6, 0
	bl DoShadowFieldEffect
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8062B8C

	thumb_func_start sub_8062BD0
sub_8062BD0: @ 8062BD0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062BFC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062BD0

	thumb_func_start sub_8062BFC
sub_8062BFC: @ 8062BFC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062C10
	movs r0, 0
	b _08062C20
_08062C10:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062C20:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062BFC

	thumb_func_start sub_8062C28
sub_8062C28: @ 8062C28
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062C54
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062C28

	thumb_func_start sub_8062C54
sub_8062C54: @ 8062C54
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062C68
	movs r0, 0
	b _08062C78
_08062C68:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062C78:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062C54

	thumb_func_start sub_8062C80
sub_8062C80: @ 8062C80
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062CAC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062C80

	thumb_func_start sub_8062CAC
sub_8062CAC: @ 8062CAC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062CC0
	movs r0, 0
	b _08062CD0
_08062CC0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062CD0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062CAC

	thumb_func_start sub_8062CD8
sub_8062CD8: @ 8062CD8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062D04
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062CD8

	thumb_func_start sub_8062D04
sub_8062D04: @ 8062D04
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062D18
	movs r0, 0
	b _08062D28
_08062D18:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062D28:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D04

	thumb_func_start sub_8062D30
sub_8062D30: @ 8062D30
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062D5C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D30

	thumb_func_start sub_8062D5C
sub_8062D5C: @ 8062D5C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062D70
	movs r0, 0
	b _08062D80
_08062D70:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062D80:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D5C

	thumb_func_start sub_8062D88
sub_8062D88: @ 8062D88
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062DB4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062D88

	thumb_func_start sub_8062DB4
sub_8062DB4: @ 8062DB4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062DC8
	movs r0, 0
	b _08062DD8
_08062DC8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062DD8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062DB4

	thumb_func_start sub_8062DE0
sub_8062DE0: @ 8062DE0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062E0C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062DE0

	thumb_func_start sub_8062E0C
sub_8062E0C: @ 8062E0C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062E20
	movs r0, 0
	b _08062E30
_08062E20:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062E30:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E0C

	thumb_func_start sub_8062E38
sub_8062E38: @ 8062E38
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062E64
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E38

	thumb_func_start sub_8062E64
sub_8062E64: @ 8062E64
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062E78
	movs r0, 0
	b _08062E88
_08062E78:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062E88:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E64

	thumb_func_start sub_8062E90
sub_8062E90: @ 8062E90
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x1
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062EBC
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062E90

	thumb_func_start sub_8062EBC
sub_8062EBC: @ 8062EBC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062ED0
	movs r0, 0
	b _08062EE0
_08062ED0:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062EE0:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062EBC

	thumb_func_start sub_8062EE8
sub_8062EE8: @ 8062EE8
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x2
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062F14
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062EE8

	thumb_func_start sub_8062F14
sub_8062F14: @ 8062F14
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062F28
	movs r0, 0
	b _08062F38
_08062F28:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062F38:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F14

	thumb_func_start sub_8062F40
sub_8062F40: @ 8062F40
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x3
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062F6C
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F40

	thumb_func_start sub_8062F6C
sub_8062F6C: @ 8062F6C
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062F80
	movs r0, 0
	b _08062F90
_08062F80:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062F90:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F6C

	thumb_func_start sub_8062F98
sub_8062F98: @ 8062F98
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	movs r2, 0x4
	movs r3, 0x2
	bl sub_8062B8C
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8062FC4
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062F98

	thumb_func_start sub_8062FC4
sub_8062FC4: @ 8062FC4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_8061328
	lsls r0, 24
	cmp r0, 0
	bne _08062FD8
	movs r0, 0
	b _08062FE8
_08062FD8:
	ldrb r0, [r4, 0x2]
	movs r1, 0x41
	negs r1, r1
	ands r1, r0
	strb r1, [r4, 0x2]
	movs r0, 0x2
	strh r0, [r5, 0x32]
	movs r0, 0x1
_08062FE8:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062FC4

	thumb_func_start sub_8062FF0
sub_8062FF0: @ 8062FF0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x1
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8062FF0

	thumb_func_start sub_8063028
sub_8063028: @ 8063028
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x2
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x2
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063028

	thumb_func_start sub_8063060
sub_8063060: @ 8063060
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x3
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x3
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063060

	thumb_func_start sub_8063098
sub_8063098: @ 8063098
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	movs r0, 0x4
	bl sub_805FDD8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	movs r0, 0x8
	str r0, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x4
	bl sub_80616CC
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8061714
	lsls r0, 24
	lsrs r0, 24
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063098

	thumb_func_start sub_80630D0
sub_80630D0: @ 80630D0
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8060D20
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805FD98
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80630D0

	thumb_func_start sub_8063108
sub_8063108: @ 8063108
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063128
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063108

	thumb_func_start sub_8063128
sub_8063128: @ 8063128
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806313A
	movs r0, 0
	b _08063140
_0806313A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063140:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063128

	thumb_func_start sub_8063148
sub_8063148: @ 8063148
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063168
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063148

	thumb_func_start sub_8063168
sub_8063168: @ 8063168
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806317A
	movs r0, 0
	b _08063180
_0806317A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063180:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063168

	thumb_func_start sub_8063188
sub_8063188: @ 8063188
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80631A8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063188

	thumb_func_start sub_80631A8
sub_80631A8: @ 80631A8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080631BA
	movs r0, 0
	b _080631C0
_080631BA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080631C0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80631A8

	thumb_func_start sub_80631C8
sub_80631C8: @ 80631C8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_80630D0
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80631E8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80631C8

	thumb_func_start sub_80631E8
sub_80631E8: @ 80631E8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080631FA
	movs r0, 0
	b _08063200
_080631FA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063200:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80631E8

	thumb_func_start sub_8063208
sub_8063208: @ 8063208
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8060D20
	ldrb r0, [r4, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805FDD8
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_805FE28
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8063208

	thumb_func_start sub_8063238
sub_8063238: @ 8063238
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063258
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063238

	thumb_func_start sub_8063258
sub_8063258: @ 8063258
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806326A
	movs r0, 0
	b _08063270
_0806326A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063270:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063258

	thumb_func_start sub_8063278
sub_8063278: @ 8063278
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063298
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063278

	thumb_func_start sub_8063298
sub_8063298: @ 8063298
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080632AA
	movs r0, 0
	b _080632B0
_080632AA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080632B0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063298

	thumb_func_start sub_80632B8
sub_80632B8: @ 80632B8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80632D8
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80632B8

	thumb_func_start sub_80632D8
sub_80632D8: @ 80632D8
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080632EA
	movs r0, 0
	b _080632F0
_080632EA:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080632F0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80632D8

	thumb_func_start sub_80632F8
sub_80632F8: @ 80632F8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8063208
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063318
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80632F8

	thumb_func_start sub_8063318
sub_8063318: @ 8063318
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _0806332A
	movs r0, 0
	b _08063330
_0806332A:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063330:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063318

	thumb_func_start sub_8063338
sub_8063338: @ 8063338
	push {r4,r5,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_8060D20
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	bl sub_805FDB8
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	adds r0, r4, 0
	movs r1, 0
	bl SeekSpriteAnim
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8063338

	thumb_func_start sub_8063370
sub_8063370: @ 8063370
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x1
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063390
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063370

	thumb_func_start sub_8063390
sub_8063390: @ 8063390
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080633A2
	movs r0, 0
	b _080633A8
_080633A2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080633A8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063390

	thumb_func_start sub_80633B0
sub_80633B0: @ 80633B0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x2
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_80633D0
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80633B0

	thumb_func_start sub_80633D0
sub_80633D0: @ 80633D0
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _080633E2
	movs r0, 0
	b _080633E8
_080633E2:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_080633E8:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80633D0

	thumb_func_start sub_80633F0
sub_80633F0: @ 80633F0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063410
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80633F0

	thumb_func_start sub_8063410
sub_8063410: @ 8063410
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08063422
	movs r0, 0
	b _08063428
_08063422:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063428:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063410

	thumb_func_start sub_8063430
sub_8063430: @ 8063430
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	movs r2, 0x4
	movs r3, 0x1
	bl sub_8063338
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8063450
	lsls r0, 24
	lsrs r0, 24
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8063430

	thumb_func_start sub_8063450
sub_8063450: @ 8063450
	push {r4,lr}
	adds r4, r1, 0
	bl npc_obj_ministep_stop_on_arrival
	lsls r0, 24
	cmp r0, 0
	bne _08063462
	movs r0, 0
	b _08063468
_08063462:
	movs r0, 0x2
	strh r0, [r4, 0x32]
	movs r0, 0x1
_08063468:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8063450

	thumb_func_start sub_8063470
sub_8063470: @ 8063470
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8063470

	thumb_func_start sub_8063474
sub_8063474: @ 8063474
	adds r1, 0x2C
	ldrb r0, [r1]
	movs r2, 0x40
	orrs r0, r2
	strb r0, [r1]
	movs r0, 0x1
	bx lr
	thumb_func_end sub_8063474

	thumb_func_start npc_obj_transfer_image_anim_pause_flag
npc_obj_transfer_image_anim_pause_flag: @ 8063484
	push {lr}
	ldrb r0, [r0, 0x1]
	lsls r0, 29
	cmp r0, 0
	bge _0806349A
	adds r0, r1, 0
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
_0806349A:
	pop {r0}
	bx r0
	thumb_func_end npc_obj_transfer_image_anim_pause_flag

	thumb_func_start sub_80634A0
sub_80634A0: @ 80634A0
	push {r4,lr}
	adds r4, r0, 0
	ldrb r3, [r4, 0x1]
	lsls r0, r3, 28
	cmp r0, 0
	bge _080634C8
	adds r2, r1, 0
	adds r2, 0x2C
	ldrb r1, [r2]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r3
	movs r1, 0x9
	negs r1, r1
	ands r0, r1
	strb r0, [r4, 0x1]
_080634C8:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80634A0

	thumb_func_start sub_80634D0
sub_80634D0: @ 80634D0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl sub_80634E8
	adds r0, r4, 0
	adds r1, r5, 0
	bl npc_update_obj_anim_flag
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_80634D0

	thumb_func_start sub_80634E8
sub_80634E8: @ 80634E8
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r1, [r5, 0x1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	adds r6, r0, 0
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806354C
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r2, _08063544
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	ldr r2, _08063548
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	b _08063574
	.align 2, 0
_08063544: .4byte 0x030024d0
_08063548: .4byte 0x030027e0
_0806354C:
	ldrh r1, [r4, 0x24]
	ldrh r0, [r4, 0x20]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x28
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
	lsls r0, 16
	lsrs r3, r0, 16
	ldrh r1, [r4, 0x26]
	ldrh r0, [r4, 0x22]
	adds r1, r0
	adds r0, r4, 0
	adds r0, 0x29
	ldrb r0, [r0]
	lsls r0, 24
	asrs r0, 24
	adds r0, r1
_08063574:
	lsls r0, 16
	lsrs r2, r0, 16
	ldrh r0, [r6, 0x8]
	adds r0, r3
	lsls r0, 16
	lsrs r1, r0, 16
	ldrh r0, [r6, 0xA]
	adds r0, r2
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r0, r3, 16
	asrs r0, 16
	cmp r0, 0xFF
	bgt _0806359C
	lsls r0, r1, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080635A4
_0806359C:
	ldrb r0, [r5, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x1]
_080635A4:
	lsls r0, r2, 16
	asrs r0, 16
	cmp r0, 0xAF
	bgt _080635B8
	lsls r0, r4, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _080635C0
_080635B8:
	ldrb r0, [r5, 0x1]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r5, 0x1]
_080635C0:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_80634E8

	thumb_func_start npc_update_obj_anim_flag
npc_update_obj_anim_flag: @ 80635C8
	push {lr}
	adds r2, r1, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r3, 0x5
	negs r3, r3
	ands r3, r1
	strb r3, [r2]
	ldrb r1, [r0, 0x1]
	movs r0, 0x60
	ands r0, r1
	cmp r0, 0
	beq _080635EA
	movs r1, 0x4
	adds r0, r3, 0
	orrs r0, r1
	strb r0, [r2]
_080635EA:
	pop {r0}
	bx r0
	thumb_func_end npc_update_obj_anim_flag

	thumb_func_start GetAllGroundEffectFlags_OnSpawn
GetAllGroundEffectFlags_OnSpawn: @ 80635F0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectUpdateMetatileBehaviors
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Reflection
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_TallGrassOnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_LongGrassOnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_SandHeap
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShallowFlowingWater
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShortGrass
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_HotSprings
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetAllGroundEffectFlags_OnSpawn

	thumb_func_start GetAllGroundEffectFlags_OnBeginStep
GetAllGroundEffectFlags_OnBeginStep: @ 8063638
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectUpdateMetatileBehaviors
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Reflection
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_TallGrassOnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_LongGrassOnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Tracks
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_SandHeap
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShallowFlowingWater
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Puddle
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShortGrass
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_HotSprings
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetAllGroundEffectFlags_OnBeginStep

	thumb_func_start GetAllGroundEffectFlags_OnFinishStep
GetAllGroundEffectFlags_OnFinishStep: @ 8063690
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	bl FieldObjectUpdateMetatileBehaviors
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShallowFlowingWater
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_SandHeap
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Puddle
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Ripple
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_ShortGrass
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_HotSprings
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_Seaweed
	adds r0, r4, 0
	adds r1, r5, 0
	bl GetGroundEffectFlags_JumpLanding
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetAllGroundEffectFlags_OnFinishStep

	thumb_func_start FieldObjectUpdateMetatileBehaviors
FieldObjectUpdateMetatileBehaviors: @ 80636E0
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	strb r0, [r4, 0x1F]
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	strb r0, [r4, 0x1E]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectUpdateMetatileBehaviors

	thumb_func_start GetGroundEffectFlags_Reflection
GetGroundEffectFlags_Reflection: @ 8063708
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r0, _0806374C
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, 0x4]
	adds r0, r4, 0
	bl FieldObjectCheckForReflectiveSurface
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	beq _08063750
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 30
	cmp r0, 0
	blt _0806375A
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4, 0x2]
	subs r0, r2, 0x1
	lsls r0, 2
	add r0, sp
	ldr r1, [r5]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r5]
	b _0806375A
	.align 2, 0
_0806374C: .4byte gUnknown_08376008
_08063750:
	ldrb r1, [r4, 0x2]
	movs r0, 0x3
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_0806375A:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Reflection

	thumb_func_start GetGroundEffectFlags_TallGrassOnSpawn
GetGroundEffectFlags_TallGrassOnSpawn: @ 8063764
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsTallGrass
	lsls r0, 24
	cmp r0, 0
	beq _0806377C
	ldr r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	str r0, [r4]
_0806377C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_TallGrassOnSpawn

	thumb_func_start GetGroundEffectFlags_TallGrassOnBeginStep
GetGroundEffectFlags_TallGrassOnBeginStep: @ 8063784
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsTallGrass
	lsls r0, 24
	cmp r0, 0
	beq _0806379C
	ldr r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	str r0, [r4]
_0806379C:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_TallGrassOnBeginStep

	thumb_func_start GetGroundEffectFlags_LongGrassOnSpawn
GetGroundEffectFlags_LongGrassOnSpawn: @ 80637A4
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _080637BC
	ldr r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	str r0, [r4]
_080637BC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_LongGrassOnSpawn

	thumb_func_start GetGroundEffectFlags_LongGrassOnBeginStep
GetGroundEffectFlags_LongGrassOnBeginStep: @ 80637C4
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _080637DC
	ldr r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	str r0, [r4]
_080637DC:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_LongGrassOnBeginStep

	thumb_func_start GetGroundEffectFlags_Tracks
GetGroundEffectFlags_Tracks: @ 80637E4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsDeepSand
	lsls r0, 24
	cmp r0, 0
	beq _080637FE
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 1
	b _0806381A
_080637FE:
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsSandOrDeepSand
	lsls r0, 24
	cmp r0, 0
	bne _08063816
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsUnusedFootprintMetatile
	lsls r0, 24
	cmp r0, 0
	beq _0806381E
_08063816:
	ldr r0, [r5]
	movs r1, 0x80
_0806381A:
	orrs r0, r1
	str r0, [r5]
_0806381E:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Tracks

	thumb_func_start GetGroundEffectFlags_SandHeap
GetGroundEffectFlags_SandHeap: @ 8063824
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsDeepSand
	lsls r0, 24
	cmp r0, 0
	beq _08063862
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsDeepSand
	lsls r0, 24
	cmp r0, 0
	beq _08063862
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 27
	cmp r0, 0
	blt _0806386C
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	movs r1, 0x10
	orrs r0, r1
	strb r0, [r4, 0x2]
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 4
	orrs r0, r1
	str r0, [r5]
	b _0806386C
_08063862:
	ldrb r1, [r4, 0x2]
	movs r0, 0x11
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_0806386C:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_SandHeap

	thumb_func_start GetGroundEffectFlags_ShallowFlowingWater
GetGroundEffectFlags_ShallowFlowingWater: @ 8063874
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsShallowFlowingWater
	lsls r0, 24
	cmp r0, 0
	beq _08063892
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsShallowFlowingWater
	lsls r0, 24
	cmp r0, 0
	bne _080638AA
_08063892:
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, 24
	cmp r0, 0
	beq _080638C8
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, 24
	cmp r0, 0
	beq _080638C8
_080638AA:
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 28
	cmp r0, 0
	blt _080638D2
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4, 0x2]
	ldr r0, [r5]
	movs r1, 0x40
	orrs r0, r1
	str r0, [r5]
	b _080638D2
_080638C8:
	ldrb r1, [r4, 0x2]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_080638D2:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_ShallowFlowingWater

	thumb_func_start GetGroundEffectFlags_Puddle
GetGroundEffectFlags_Puddle: @ 80638D8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsPuddle
	lsls r0, 24
	cmp r0, 0
	beq _08063900
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsPuddle
	lsls r0, 24
	cmp r0, 0
	beq _08063900
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 3
	orrs r0, r1
	str r0, [r5]
_08063900:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Puddle

	thumb_func_start GetGroundEffectFlags_Ripple
GetGroundEffectFlags_Ripple: @ 8063908
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_HasRipples
	lsls r0, 24
	cmp r0, 0
	beq _08063922
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 2
	orrs r0, r1
	str r0, [r4]
_08063922:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Ripple

	thumb_func_start GetGroundEffectFlags_ShortGrass
GetGroundEffectFlags_ShortGrass: @ 8063928
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsShortGrass
	lsls r0, 24
	cmp r0, 0
	beq _08063966
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsShortGrass
	lsls r0, 24
	cmp r0, 0
	beq _08063966
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 29
	cmp r0, 0
	blt _08063970
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4, 0x2]
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 10
	orrs r0, r1
	str r0, [r5]
	b _08063970
_08063966:
	ldrb r1, [r4, 0x2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_08063970:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_ShortGrass

	thumb_func_start GetGroundEffectFlags_HotSprings
GetGroundEffectFlags_HotSprings: @ 8063978
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x1E]
	bl MetatileBehavior_IsHotSprings
	lsls r0, 24
	cmp r0, 0
	beq _080639B6
	ldrb r0, [r4, 0x1F]
	bl MetatileBehavior_IsHotSprings
	lsls r0, 24
	cmp r0, 0
	beq _080639B6
	ldrb r1, [r4, 0x2]
	lsls r0, r1, 26
	cmp r0, 0
	blt _080639C0
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4, 0x2]
	ldr r0, [r5]
	movs r1, 0x80
	lsls r1, 11
	orrs r0, r1
	str r0, [r5]
	b _080639C0
_080639B6:
	ldrb r1, [r4, 0x2]
	movs r0, 0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r4, 0x2]
_080639C0:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_HotSprings

	thumb_func_start GetGroundEffectFlags_Seaweed
GetGroundEffectFlags_Seaweed: @ 80639C8
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x1E]
	bl MetatileBehavior_IsSeaweed
	lsls r0, 24
	cmp r0, 0
	beq _080639E2
	ldr r0, [r4]
	movs r1, 0x80
	lsls r1, 12
	orrs r0, r1
	str r0, [r4]
_080639E2:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_Seaweed

	thumb_func_start GetGroundEffectFlags_JumpLanding
GetGroundEffectFlags_JumpLanding: @ 80639E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r6, r1, 0
	ldr r0, [r7]
	ldr r1, _08063A24
	ands r0, r1
	cmp r0, 0x20
	bne _08063A3A
	movs r5, 0
	ldr r0, _08063A28
	mov r8, r0
_08063A02:
	lsls r4, r5, 2
	mov r0, r8
	adds r1, r4, r0
	ldrb r0, [r7, 0x1E]
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	cmp r0, 0
	beq _08063A30
	ldr r0, _08063A2C
	adds r0, r4, r0
	ldr r1, [r6]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r6]
	b _08063A3A
	.align 2, 0
_08063A24: .4byte 0x02000020
_08063A28: .4byte gUnknown_08376010
_08063A2C: .4byte gUnknown_08376028
_08063A30:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r5, 0x5
	bls _08063A02
_08063A3A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end GetGroundEffectFlags_JumpLanding

	thumb_func_start FieldObjectCheckForReflectiveSurface
FieldObjectCheckForReflectiveSurface: @ 8063A44
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	adds r5, r0, 0
	ldrb r0, [r5, 0x5]
	bl GetFieldObjectGraphicsInfo
	movs r2, 0x8
	ldrsh r1, [r0, r2]
	adds r1, 0x8
	lsls r1, 12
	lsrs r1, 16
	str r1, [sp]
	movs r1, 0xA
	ldrsh r0, [r0, r1]
	adds r0, 0x8
	lsls r0, 12
	movs r4, 0
	lsrs r2, r0, 16
	str r2, [sp, 0x4]
	asrs r0, 16
	cmp r4, r0
	blt _08063A7A
	b _08063B80
_08063A7A:
	movs r0, 0x1
	mov r10, r0
_08063A7E:
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	add r1, r10
	lsls r4, 16
	asrs r6, r4, 16
	adds r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	mov r9, r4
	cmp r0, 0
	bne _08063B82
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	movs r2, 0x16
	ldrsh r1, [r5, r2]
	add r1, r10
	adds r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08063B82
	movs r2, 0x1
	ldr r1, [sp]
	lsls r0, r1, 16
	asrs r1, r0, 16
	mov r8, r0
	cmp r2, r1
	bge _08063B6E
	movs r0, 0x80
	lsls r0, 9
	asrs r7, r0, 16
_08063AD8:
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	lsls r1, r2, 16
	asrs r4, r1, 16
	adds r0, r4
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	adds r1, r7
	adds r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08063B82
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	subs r0, r4
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	adds r1, r7
	adds r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08063B82
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	adds r0, r4
	movs r2, 0x16
	ldrsh r1, [r5, r2]
	adds r1, r7
	adds r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08063B82
	movs r1, 0x14
	ldrsh r0, [r5, r1]
	subs r0, r4
	movs r2, 0x16
	ldrsh r1, [r5, r2]
	adds r1, r7
	adds r1, r6
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl GetReflectionTypeByMetatileBehavior
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	bne _08063B82
	adds r0, r4, 0x1
	lsls r0, 16
	lsrs r2, r0, 16
	cmp r0, r8
	blt _08063AD8
_08063B6E:
	movs r1, 0x80
	lsls r1, 9
	add r1, r9
	lsrs r4, r1, 16
	ldr r2, [sp, 0x4]
	lsls r0, r2, 16
	cmp r1, r0
	bge _08063B80
	b _08063A7E
_08063B80:
	movs r0, 0
_08063B82:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end FieldObjectCheckForReflectiveSurface

	thumb_func_start GetReflectionTypeByMetatileBehavior
GetReflectionTypeByMetatileBehavior: @ 8063B94
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsIce
	lsls r0, 24
	cmp r0, 0
	beq _08063BAA
	movs r0, 0x1
	b _08063BBC
_08063BAA:
	adds r0, r4, 0
	bl MetatileBehavior_IsReflective
	lsls r0, 24
	cmp r0, 0
	bne _08063BBA
	movs r0, 0
	b _08063BBC
_08063BBA:
	movs r0, 0x2
_08063BBC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetReflectionTypeByMetatileBehavior

	thumb_func_start GetLedgeJumpDirection
GetLedgeJumpDirection: @ 8063BC4
	push {r4,lr}
	lsls r0, 16
	lsrs r3, r0, 16
	lsls r1, 16
	lsrs r1, 16
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r4, 0
	beq _08063C0A
	cmp r4, 0x4
	bls _08063BE0
	subs r0, r4, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
_08063BE0:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r3, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08063C10
	lsls r1, r4, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08063C14
_08063C0A:
	movs r0, 0
	b _08063C1A
	.align 2, 0
_08063C10: .4byte gUnknown_08376040
_08063C14:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r0, 24
_08063C1A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetLedgeJumpDirection

	thumb_func_start FieldObjectSetSpriteOamTableForLongGrass
FieldObjectSetSpriteOamTableForLongGrass: @ 8063C20
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r4, r1, 0
	ldrb r0, [r5]
	lsls r0, 27
	cmp r0, 0
	blt _08063C74
	ldrb r0, [r5, 0x1E]
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _08063C74
	ldrb r0, [r5, 0x1F]
	bl MetatileBehavior_IsLongGrass
	lsls r0, 24
	cmp r0, 0
	beq _08063C74
	adds r4, 0x42
	ldrb r1, [r4]
	movs r6, 0x40
	negs r6, r6
	adds r0, r6, 0
	ands r0, r1
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r5, 0xB]
	lsrs r0, 4
	bl ZCoordToPriority
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08063C74
	ldrb r0, [r4]
	adds r1, r6, 0
	ands r1, r0
	movs r0, 0x5
	orrs r1, r0
	strb r1, [r4]
_08063C74:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectSetSpriteOamTableForLongGrass

	thumb_func_start IsZCoordMismatchAt
IsZCoordMismatchAt: @ 8063C7C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 16
	lsrs r1, r2, 16
	cmp r4, 0
	beq _08063CAA
	lsls r0, 16
	asrs r0, 16
	lsls r1, 16
	asrs r1, 16
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _08063CAA
	cmp r0, 0xF
	beq _08063CAA
	cmp r0, r4
	bne _08063CAE
_08063CAA:
	movs r0, 0
	b _08063CB0
_08063CAE:
	movs r0, 0x1
_08063CB0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end IsZCoordMismatchAt

	thumb_func_start FieldObjectUpdateZCoordAndPriority
FieldObjectUpdateZCoordAndPriority: @ 8063CB8
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x3]
	lsls r0, 29
	cmp r0, 0
	blt _08063D06
	adds r0, r4, 0
	bl FieldObjectUpdateZCoord
	ldr r1, _08063D0C
	ldrb r2, [r4, 0xB]
	lsls r2, 24
	lsrs r0, r2, 28
	adds r0, r1
	ldrb r0, [r0]
	adds r4, r5, 0
	adds r4, 0x42
	movs r1, 0x3F
	ands r1, r0
	ldrb r3, [r4]
	movs r0, 0x40
	negs r0, r0
	ands r0, r3
	orrs r0, r1
	strb r0, [r4]
	ldr r0, _08063D10
	lsrs r2, 28
	adds r2, r0
	movs r0, 0x3
	ldrb r1, [r2]
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r5, 0x5]
	movs r0, 0xD
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x5]
_08063D06:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063D0C: .4byte gUnknown_08376070
_08063D10: .4byte gUnknown_08376060
	thumb_func_end FieldObjectUpdateZCoordAndPriority

	thumb_func_start InitObjectPriorityByZCoord
InitObjectPriorityByZCoord: @ 8063D14
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _08063D58
	adds r2, r1, r2
	ldrb r2, [r2]
	movs r3, 0x42
	adds r3, r0
	mov r12, r3
	movs r3, 0x3F
	ands r3, r2
	mov r2, r12
	ldrb r4, [r2]
	movs r2, 0x40
	negs r2, r2
	ands r2, r4
	orrs r2, r3
	mov r3, r12
	strb r2, [r3]
	ldr r2, _08063D5C
	adds r1, r2
	movs r3, 0x3
	ldrb r2, [r1]
	ands r2, r3
	lsls r2, 2
	ldrb r3, [r0, 0x5]
	movs r1, 0xD
	negs r1, r1
	ands r1, r3
	orrs r1, r2
	strb r1, [r0, 0x5]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08063D58: .4byte gUnknown_08376070
_08063D5C: .4byte gUnknown_08376060
	thumb_func_end InitObjectPriorityByZCoord

	thumb_func_start ZCoordToPriority
ZCoordToPriority: @ 8063D60
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08063D6C
	adds r0, r1
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08063D6C: .4byte gUnknown_08376060
	thumb_func_end ZCoordToPriority

	thumb_func_start FieldObjectUpdateZCoord
FieldObjectUpdateZCoord: @ 8063D70
	push {r4,r5,lr}
	adds r4, r0, 0
	movs r1, 0x10
	ldrsh r0, [r4, r1]
	movs r2, 0x12
	ldrsh r1, [r4, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r5, r0, 24
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	movs r2, 0x16
	ldrsh r1, [r4, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r5, 0xF
	beq _08063DBE
	cmp r0, 0xF
	beq _08063DBE
	movs r3, 0xF
	adds r0, r5, 0
	ands r0, r3
	ldrb r1, [r4, 0xB]
	movs r2, 0x10
	negs r2, r2
	ands r2, r1
	orrs r2, r0
	strb r2, [r4, 0xB]
	cmp r5, 0
	beq _08063DBE
	cmp r5, 0xF
	beq _08063DBE
	lsls r0, r5, 4
	ands r2, r3
	orrs r2, r0
	strb r2, [r4, 0xB]
_08063DBE:
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end FieldObjectUpdateZCoord

	thumb_func_start SetObjectSubpriorityByZCoord
SetObjectSubpriorityByZCoord: @ 8063DC4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r2, 24
	lsrs r2, 24
	adds r3, r1, 0
	adds r3, 0x29
	movs r5, 0
	ldrsb r5, [r3, r5]
	ldrh r4, [r1, 0x22]
	ldr r3, _08063E04
	subs r4, r5
	ldrh r3, [r3]
	adds r4, r3
	adds r4, 0x8
	movs r3, 0xFF
	ands r4, r3
	lsrs r4, 4
	movs r3, 0x10
	subs r3, r4
	lsls r3, 17
	ldr r4, _08063E08
	adds r0, r4
	lsrs r3, 16
	ldrb r0, [r0]
	adds r3, r0
	adds r2, r3
	adds r1, 0x43
	strb r2, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063E04: .4byte 0x030027e0
_08063E08: .4byte gUnknown_08376050
	thumb_func_end SetObjectSubpriorityByZCoord

	thumb_func_start FieldObjectUpdateSubpriority
FieldObjectUpdateSubpriority: @ 8063E0C
	push {lr}
	adds r2, r0, 0
	ldrb r0, [r2, 0x3]
	lsls r0, 29
	cmp r0, 0
	blt _08063E22
	ldrb r0, [r2, 0xB]
	lsrs r0, 4
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
_08063E22:
	pop {r0}
	bx r0
	thumb_func_end FieldObjectUpdateSubpriority

	thumb_func_start AreZCoordsCompatible
AreZCoordsCompatible: @ 8063E28
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	cmp r0, 0
	beq _08063E3E
	cmp r1, 0
	beq _08063E3E
	cmp r0, r1
	bne _08063E42
_08063E3E:
	movs r0, 0x1
	b _08063E44
_08063E42:
	movs r0, 0
_08063E44:
	pop {r1}
	bx r1
	thumb_func_end AreZCoordsCompatible

	thumb_func_start GroundEffect_SpawnOnTallGrass
GroundEffect_SpawnOnTallGrass: @ 8063E48
	push {lr}
	ldr r3, _08063E8C
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x4]
	ldrb r1, [r0, 0xB]
	lsrs r1, 4
	str r1, [r3, 0x8]
	movs r1, 0x2
	str r1, [r3, 0xC]
	ldrb r1, [r0, 0x8]
	lsls r1, 8
	ldrb r2, [r0, 0x9]
	orrs r1, r2
	str r1, [r3, 0x10]
	ldrb r0, [r0, 0xA]
	str r0, [r3, 0x14]
	ldr r1, _08063E90
	ldrb r0, [r1, 0x5]
	lsls r0, 8
	ldrb r1, [r1, 0x4]
	orrs r0, r1
	str r0, [r3, 0x18]
	movs r0, 0x1
	str r0, [r3, 0x1C]
	movs r0, 0x4
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08063E8C: .4byte 0x0202ff84
_08063E90: .4byte 0x02025734
	thumb_func_end GroundEffect_SpawnOnTallGrass

	thumb_func_start sub_8063E94
sub_8063E94: @ 8063E94
	push {lr}
	ldr r3, _08063ED8
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x4]
	ldrb r1, [r0, 0xB]
	lsrs r1, 4
	str r1, [r3, 0x8]
	movs r1, 0x2
	str r1, [r3, 0xC]
	ldrb r1, [r0, 0x8]
	lsls r1, 8
	ldrb r2, [r0, 0x9]
	orrs r1, r2
	str r1, [r3, 0x10]
	ldrb r0, [r0, 0xA]
	str r0, [r3, 0x14]
	ldr r1, _08063EDC
	ldrb r0, [r1, 0x5]
	lsls r0, 8
	ldrb r1, [r1, 0x4]
	orrs r0, r1
	str r0, [r3, 0x18]
	movs r0, 0
	str r0, [r3, 0x1C]
	movs r0, 0x4
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08063ED8: .4byte 0x0202ff84
_08063EDC: .4byte 0x02025734
	thumb_func_end sub_8063E94

	thumb_func_start sub_8063EE0
sub_8063EE0: @ 8063EE0
	push {lr}
	ldr r3, _08063F24
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x4]
	ldrb r1, [r0, 0xB]
	lsrs r1, 4
	str r1, [r3, 0x8]
	movs r1, 0x2
	str r1, [r3, 0xC]
	ldrb r1, [r0, 0x8]
	lsls r1, 8
	ldrb r2, [r0, 0x9]
	orrs r1, r2
	str r1, [r3, 0x10]
	ldrb r0, [r0, 0xA]
	str r0, [r3, 0x14]
	ldr r1, _08063F28
	ldrb r0, [r1, 0x5]
	lsls r0, 8
	ldrb r1, [r1, 0x4]
	orrs r0, r1
	str r0, [r3, 0x18]
	movs r0, 0x1
	str r0, [r3, 0x1C]
	movs r0, 0x11
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08063F24: .4byte 0x0202ff84
_08063F28: .4byte 0x02025734
	thumb_func_end sub_8063EE0

	thumb_func_start sub_8063F2C
sub_8063F2C: @ 8063F2C
	push {lr}
	ldr r3, _08063F70
	movs r2, 0x10
	ldrsh r1, [r0, r2]
	str r1, [r3]
	movs r2, 0x12
	ldrsh r1, [r0, r2]
	str r1, [r3, 0x4]
	ldrb r1, [r0, 0xB]
	lsrs r1, 4
	str r1, [r3, 0x8]
	movs r1, 0x2
	str r1, [r3, 0xC]
	ldrb r1, [r0, 0x8]
	lsls r1, 8
	ldrb r2, [r0, 0x9]
	orrs r1, r2
	str r1, [r3, 0x10]
	ldrb r0, [r0, 0xA]
	str r0, [r3, 0x14]
	ldr r1, _08063F74
	ldrb r0, [r1, 0x5]
	lsls r0, 8
	ldrb r1, [r1, 0x4]
	orrs r0, r1
	str r0, [r3, 0x18]
	movs r0, 0
	str r0, [r3, 0x1C]
	movs r0, 0x11
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08063F70: .4byte 0x0202ff84
_08063F74: .4byte 0x02025734
	thumb_func_end sub_8063F2C

	thumb_func_start GroundEffect_WaterReflection
GroundEffect_WaterReflection: @ 8063F78
	push {lr}
	movs r2, 0
	bl SetUpReflection
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_WaterReflection

	thumb_func_start GroundEffect_IceReflection
GroundEffect_IceReflection: @ 8063F84
	push {lr}
	movs r2, 0x1
	bl SetUpReflection
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_IceReflection

	thumb_func_start GroundEffect_FlowingWater
GroundEffect_FlowingWater: @ 8063F90
	push {lr}
	adds r1, r0, 0
	movs r0, 0x22
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_FlowingWater

	thumb_func_start sub_8063FA0
sub_8063FA0: @ 8063FA0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldr r1, _08063FC8
	ldrb r0, [r0, 0xD]
	lsls r0, 2
	adds r0, r1
	ldr r3, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0
	bl _call_via_r3
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063FC8: .4byte gUnknown_08376080
	thumb_func_end sub_8063FA0

	thumb_func_start sub_8063FCC
sub_8063FCC: @ 8063FCC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldr r1, _08063FF4
	ldrb r0, [r0, 0xD]
	lsls r0, 2
	adds r0, r1
	ldr r3, [r0]
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x1
	bl _call_via_r3
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08063FF4: .4byte gUnknown_08376080
	thumb_func_end sub_8063FCC

	thumb_func_start nullsub_50
nullsub_50: @ 8063FF8
	bx lr
	thumb_func_end nullsub_50

	thumb_func_start DoTracksGroundEffect_Footprints
DoTracksGroundEffect_Footprints: @ 8063FFC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	lsls r4, r2, 24
	lsrs r4, 24
	ldr r1, _08064044
	mov r0, sp
	movs r2, 0x4
	bl memcpy
	ldr r1, _08064048
	movs r2, 0x14
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r2, 0x16
	ldrsh r0, [r5, r2]
	str r0, [r1, 0x4]
	movs r0, 0x95
	str r0, [r1, 0x8]
	movs r0, 0x2
	str r0, [r1, 0xC]
	ldrb r0, [r5, 0x18]
	lsls r0, 28
	lsrs r0, 28
	str r0, [r1, 0x10]
	lsls r4, 1
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	bl FieldEffectStart
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064044: .4byte gUnknown_0837608C
_08064048: .4byte 0x0202ff84
	thumb_func_end DoTracksGroundEffect_Footprints

	thumb_func_start DoTracksGroundEffect_BikeTireTracks
DoTracksGroundEffect_BikeTireTracks: @ 806404C
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, [r4, 0x10]
	ldr r0, [r4, 0x14]
	cmp r1, r0
	beq _0806408E
	ldr r2, _08064094
	movs r1, 0x14
	ldrsh r0, [r4, r1]
	str r0, [r2]
	movs r1, 0x16
	ldrsh r0, [r4, r1]
	str r0, [r2, 0x4]
	movs r0, 0x95
	str r0, [r2, 0x8]
	movs r0, 0x2
	str r0, [r2, 0xC]
	ldr r3, _08064098
	ldrb r1, [r4, 0x18]
	lsls r1, 28
	lsrs r1, 28
	adds r0, r4, 0
	adds r0, 0x20
	ldrb r0, [r0]
	lsls r0, 2
	subs r0, 0x5
	adds r1, r0
	adds r1, r3
	ldrb r0, [r1]
	str r0, [r2, 0x10]
	movs r0, 0x23
	bl FieldEffectStart
_0806408E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064094: .4byte 0x0202ff84
_08064098: .4byte gUnknown_08376090
	thumb_func_end DoTracksGroundEffect_BikeTireTracks

	thumb_func_start GroundEffect_Ripple
GroundEffect_Ripple: @ 806409C
	push {lr}
	bl DoRippleFieldEffect
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_Ripple

	thumb_func_start GroundEffect_StepOnPuddle
GroundEffect_StepOnPuddle: @ 80640A8
	push {lr}
	adds r1, r0, 0
	movs r0, 0xF
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_StepOnPuddle

	thumb_func_start GroundEffect_SandHeap
GroundEffect_SandHeap: @ 80640B8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x27
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_SandHeap

	thumb_func_start GroundEffect_JumpOnTallGrass
GroundEffect_JumpOnTallGrass: @ 80640C8
	push {r4-r7,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r6, r1, 0
	ldr r1, _0806411C
	movs r2, 0x10
	ldrsh r0, [r5, r2]
	str r0, [r1]
	movs r4, 0x12
	ldrsh r0, [r5, r4]
	str r0, [r1, 0x4]
	ldrb r0, [r5, 0xB]
	lsrs r0, 4
	str r0, [r1, 0x8]
	movs r0, 0x2
	str r0, [r1, 0xC]
	movs r0, 0xC
	bl FieldEffectStart
	ldrb r0, [r5, 0x8]
	ldrb r1, [r5, 0x9]
	ldrb r2, [r5, 0xA]
	movs r7, 0x10
	ldrsh r3, [r5, r7]
	movs r7, 0x12
	ldrsh r4, [r5, r7]
	str r4, [sp]
	bl sub_8126FF0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x40
	bne _08064112
	adds r0, r5, 0
	adds r1, r6, 0
	bl GroundEffect_SpawnOnTallGrass
_08064112:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806411C: .4byte 0x0202ff84
	thumb_func_end GroundEffect_JumpOnTallGrass

	thumb_func_start GroundEffect_JumpOnLongGrass
GroundEffect_JumpOnLongGrass: @ 8064120
	push {lr}
	ldr r2, _08064144
	movs r3, 0x10
	ldrsh r1, [r0, r3]
	str r1, [r2]
	movs r3, 0x12
	ldrsh r1, [r0, r3]
	str r1, [r2, 0x4]
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	str r0, [r2, 0x8]
	movs r0, 0x2
	str r0, [r2, 0xC]
	movs r0, 0x12
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08064144: .4byte 0x0202ff84
	thumb_func_end GroundEffect_JumpOnLongGrass

	thumb_func_start GroundEffect_JumpOnShallowWater
GroundEffect_JumpOnShallowWater: @ 8064148
	push {r4,lr}
	ldr r3, _08064174
	movs r4, 0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r4, 0x12
	ldrsh r2, [r0, r4]
	str r2, [r3, 0x4]
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	str r0, [r3, 0x8]
	ldrb r0, [r1, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0x10
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064174: .4byte 0x0202ff84
	thumb_func_end GroundEffect_JumpOnShallowWater

	thumb_func_start GroundEffect_JumpOnWater
GroundEffect_JumpOnWater: @ 8064178
	push {r4,lr}
	ldr r3, _080641A4
	movs r4, 0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r4, 0x12
	ldrsh r2, [r0, r4]
	str r2, [r3, 0x4]
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	str r0, [r3, 0x8]
	ldrb r0, [r1, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0xE
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080641A4: .4byte 0x0202ff84
	thumb_func_end GroundEffect_JumpOnWater

	thumb_func_start GroundEffect_JumpLandingDust
GroundEffect_JumpLandingDust: @ 80641A8
	push {r4,lr}
	ldr r3, _080641D4
	movs r4, 0x10
	ldrsh r2, [r0, r4]
	str r2, [r3]
	movs r4, 0x12
	ldrsh r2, [r0, r4]
	str r2, [r3, 0x4]
	ldrb r0, [r0, 0xB]
	lsrs r0, 4
	str r0, [r3, 0x8]
	ldrb r0, [r1, 0x5]
	lsls r0, 28
	lsrs r0, 30
	str r0, [r3, 0xC]
	movs r0, 0xA
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080641D4: .4byte 0x0202ff84
	thumb_func_end GroundEffect_JumpLandingDust

	thumb_func_start GroundEffect_ShortGrass
GroundEffect_ShortGrass: @ 80641D8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x29
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_ShortGrass

	thumb_func_start GroundEffect_HotSprings
GroundEffect_HotSprings: @ 80641E8
	push {lr}
	adds r1, r0, 0
	movs r0, 0x2A
	bl oe_exec_and_other_stuff
	pop {r0}
	bx r0
	thumb_func_end GroundEffect_HotSprings

	thumb_func_start GroundEffect_Seaweed
GroundEffect_Seaweed: @ 80641F8
	push {lr}
	ldr r2, _08064214
	movs r3, 0x10
	ldrsh r1, [r0, r3]
	str r1, [r2]
	movs r1, 0x12
	ldrsh r0, [r0, r1]
	str r0, [r2, 0x4]
	movs r0, 0x35
	bl FieldEffectStart
	pop {r0}
	bx r0
	.align 2, 0
_08064214: .4byte 0x0202ff84
	thumb_func_end GroundEffect_Seaweed

	thumb_func_start sub_8064218
sub_8064218: @ 8064218
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r6, r1, 0
	adds r5, r2, 0
	movs r4, 0
	ldr r0, _08064258
	mov r8, r0
_0806422A:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _08064240
	lsls r0, r4, 2
	add r0, r8
	ldr r2, [r0]
	adds r0, r7, 0
	adds r1, r6, 0
	bl _call_via_r2
_08064240:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	lsrs r5, 1
	cmp r4, 0x13
	bls _0806422A
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064258: .4byte gUnknown_083760A0
	thumb_func_end sub_8064218

	thumb_func_start filters_out_some_ground_effects
filters_out_some_ground_effects: @ 806425C
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	ldrb r0, [r2]
	lsls r0, 27
	cmp r0, 0
	bge _0806428A
	ldrb r1, [r2, 0x2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	adds r1, 0x8
	ands r0, r1
	subs r1, 0x18
	ands r0, r1
	strb r0, [r2, 0x2]
	ldr r0, [r3]
	ldr r1, _08064290
	ands r0, r1
	str r0, [r3]
_0806428A:
	pop {r0}
	bx r0
	.align 2, 0
_08064290: .4byte 0xfff9f7bd
	thumb_func_end filters_out_some_ground_effects

	thumb_func_start FilterOutStepOnPuddleGroundEffectIfJumping
FilterOutStepOnPuddleGroundEffectIfJumping: @ 8064294
	push {lr}
	adds r2, r1, 0
	ldrb r0, [r0]
	lsls r0, 26
	cmp r0, 0
	bge _080642A8
	ldr r0, [r2]
	ldr r1, _080642AC
	ands r0, r1
	str r0, [r2]
_080642A8:
	pop {r0}
	bx r0
	.align 2, 0
_080642AC: .4byte 0xfffffbff
	thumb_func_end FilterOutStepOnPuddleGroundEffectIfJumping

	thumb_func_start DoGroundEffects_OnSpawn
DoGroundEffects_OnSpawn: @ 80642B0
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	lsls r0, 29
	cmp r0, 0
	bge _080642F4
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	bl FieldObjectUpdateZCoordAndPriority
	adds r0, r4, 0
	mov r1, sp
	bl GetAllGroundEffectFlags_OnSpawn
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetSpriteOamTableForLongGrass
	ldr r2, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064218
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r4]
_080642F4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end DoGroundEffects_OnSpawn

	thumb_func_start DoGroundEffects_OnBeginStep
DoGroundEffects_OnBeginStep: @ 80642FC
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	lsls r0, 29
	cmp r0, 0
	bge _08064348
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	bl FieldObjectUpdateZCoordAndPriority
	adds r0, r4, 0
	mov r1, sp
	bl GetAllGroundEffectFlags_OnBeginStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetSpriteOamTableForLongGrass
	adds r0, r4, 0
	mov r1, sp
	bl filters_out_some_ground_effects
	ldr r2, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064218
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	movs r1, 0x11
	negs r1, r1
	ands r0, r1
	strb r0, [r4]
_08064348:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end DoGroundEffects_OnBeginStep

	thumb_func_start DoGroundEffects_OnFinishStep
DoGroundEffects_OnFinishStep: @ 8064350
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r1, 0
	ldrb r0, [r4]
	lsls r0, 28
	cmp r0, 0
	bge _0806439C
	movs r0, 0
	str r0, [sp]
	adds r0, r4, 0
	bl FieldObjectUpdateZCoordAndPriority
	adds r0, r4, 0
	mov r1, sp
	bl GetAllGroundEffectFlags_OnFinishStep
	adds r0, r4, 0
	adds r1, r5, 0
	bl FieldObjectSetSpriteOamTableForLongGrass
	adds r0, r4, 0
	mov r1, sp
	bl FilterOutStepOnPuddleGroundEffectIfJumping
	ldr r2, [sp]
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8064218
	ldrb r1, [r4]
	movs r0, 0x9
	negs r0, r0
	ands r0, r1
	movs r1, 0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r4]
_0806439C:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end DoGroundEffects_OnFinishStep

	thumb_func_start sub_80643A4
sub_80643A4: @ 80643A4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r1, [r5]
	movs r0, 0xA0
	lsls r0, 1
	ands r0, r1
	cmp r0, 0
	bne _0806442C
	ldrb r0, [r5, 0x1]
	movs r4, 0x1
	orrs r0, r4
	strb r0, [r5, 0x1]
	ldr r3, _08064428
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	lsls r1, 25
	lsrs r1, 31
	lsls r1, 7
	ldrb r2, [r5, 0x2]
	movs r0, 0x7F
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x2]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	lsrs r1, 7
	ands r1, r4
	ldrb r2, [r5, 0x3]
	movs r0, 0x2
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, 0x3]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x40
	orrs r1, r2
	strb r1, [r0]
	ldrb r1, [r5, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	adds r0, 0x2C
	ldrb r1, [r0]
	movs r2, 0x80
	orrs r1, r2
	strb r1, [r0]
	movs r0, 0
	b _0806442E
	.align 2, 0
_08064428: .4byte 0x02020004
_0806442C:
	movs r0, 0x1
_0806442E:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80643A4

	thumb_func_start player_bitmagic
player_bitmagic: @ 8064434
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08064468
_0806443A:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08064458
	ldr r0, _0806446C
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	beq _08064458
	adds r0, r1, 0
	bl sub_80643A4
_08064458:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0806443A
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064468: .4byte 0x030048a0
_0806446C: .4byte 0x0202e858
	thumb_func_end player_bitmagic

	thumb_func_start sub_8064470
sub_8064470: @ 8064470
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r6, _080644AC
_0806447A:
	cmp r4, r5
	beq _0806449C
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r6
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _0806449C
	ldr r0, _080644B0
	ldrb r0, [r0, 0x5]
	cmp r4, r0
	beq _0806449C
	adds r0, r1, 0
	bl sub_80643A4
_0806449C:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _0806447A
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_080644AC: .4byte 0x030048a0
_080644B0: .4byte 0x0202e858
	thumb_func_end sub_8064470

	thumb_func_start npc_sync_anim_pause_bits
npc_sync_anim_pause_bits: @ 80644B4
	push {r4,r5,lr}
	adds r5, r0, 0
	ldrh r2, [r5]
	ldr r1, _08064514
	adds r0, r1, 0
	ands r0, r2
	cmp r0, r1
	bne _0806450C
	ldrb r1, [r5, 0x1]
	movs r0, 0x2
	negs r0, r0
	ands r0, r1
	strb r0, [r5, 0x1]
	ldr r4, _08064518
	ldrb r0, [r5, 0x4]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	ldrb r2, [r5, 0x2]
	adds r1, 0x2C
	lsrs r2, 7
	lsls r2, 6
	ldrb r3, [r1]
	movs r0, 0x41
	negs r0, r0
	ands r0, r3
	orrs r0, r2
	strb r0, [r1]
	ldrb r0, [r5, 0x4]
	lsls r2, r0, 4
	adds r2, r0
	lsls r2, 2
	adds r2, r4
	ldrb r1, [r5, 0x3]
	lsls r1, 31
	lsrs r1, 31
	adds r2, 0x2C
	lsls r1, 7
	ldrb r3, [r2]
	movs r0, 0x7F
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_0806450C:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064514: .4byte 0x00000101
_08064518: .4byte 0x02020004
	thumb_func_end npc_sync_anim_pause_bits

	thumb_func_start sub_806451C
sub_806451C: @ 806451C
	push {r4,r5,lr}
	movs r4, 0
	ldr r5, _08064548
_08064522:
	lsls r0, r4, 3
	adds r0, r4
	lsls r0, 2
	adds r1, r0, r5
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08064538
	adds r0, r1, 0
	bl npc_sync_anim_pause_bits
_08064538:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0xF
	bls _08064522
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064548: .4byte 0x030048a0
	thumb_func_end sub_806451C

	thumb_func_start little_step
little_step: @ 806454C
	lsls r1, 24
	ldr r2, _08064568
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_08064568: .4byte gUnknown_083756A4
	thumb_func_end little_step

	thumb_func_start sub_806456C
sub_806456C: @ 806456C
	lsls r1, 24
	ldr r2, _0806458C
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	lsls r2, 1
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	lsls r1, 1
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_0806458C: .4byte gUnknown_083756A4
	thumb_func_end sub_806456C

	thumb_func_start sub_8064590
sub_8064590: @ 8064590
	lsls r1, 24
	ldr r2, _080645B4
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	lsls r3, r2, 1
	adds r2, r3
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	lsls r2, r1, 1
	adds r1, r2
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080645B4: .4byte gUnknown_083756A4
	thumb_func_end sub_8064590

	thumb_func_start sub_80645B8
sub_80645B8: @ 80645B8
	lsls r1, 24
	ldr r2, _080645D8
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	lsls r2, 2
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	lsls r1, 2
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080645D8: .4byte gUnknown_083756A4
	thumb_func_end sub_80645B8

	thumb_func_start sub_80645DC
sub_80645DC: @ 80645DC
	lsls r1, 24
	ldr r2, _080645FC
	lsrs r1, 22
	adds r1, r2
	ldrh r2, [r1]
	lsls r2, 3
	ldrh r3, [r0, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x2]
	lsls r1, 3
	ldrh r2, [r0, 0x22]
	adds r1, r2
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_080645FC: .4byte gUnknown_083756A4
	thumb_func_end sub_80645DC

	thumb_func_start oamt_npc_ministep_reset
oamt_npc_ministep_reset: @ 8064600
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	movs r3, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r3, [r0, 0x38]
	bx lr
	thumb_func_end oamt_npc_ministep_reset

	thumb_func_start obj_npc_ministep
obj_npc_ministep: @ 8064614
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r5, _0806466C
	movs r0, 0x36
	ldrsh r2, [r4, r0]
	lsls r0, r2, 1
	adds r0, r5
	movs r3, 0x38
	ldrsh r1, [r4, r3]
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _08064674
	ldr r1, _08064670
	lsls r0, r2, 2
	adds r0, r1
	movs r1, 0x38
	ldrsh r2, [r4, r1]
	ldr r0, [r0]
	lsls r2, 2
	adds r2, r0
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, [r2]
	adds r0, r4, 0
	bl _call_via_r2
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	lsls r1, 1
	adds r1, r5
	lsls r0, 16
	asrs r0, 16
	movs r3, 0
	ldrsh r1, [r1, r3]
	cmp r0, r1
	blt _08064674
	movs r0, 0x1
	b _08064676
	.align 2, 0
_0806466C: .4byte gUnknown_08376194
_08064670: .4byte gUnknown_08376180
_08064674:
	movs r0, 0
_08064676:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end obj_npc_ministep

	thumb_func_start sub_806467C
sub_806467C: @ 806467C
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r2, [r0, 0x38]
	bx lr
	thumb_func_end sub_806467C

	thumb_func_start sub_806468C
sub_806468C: @ 806468C
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x36]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080646AC
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl little_step
	ldrh r0, [r4, 0x38]
	adds r0, 0x1
	strh r0, [r4, 0x38]
_080646AC:
	ldrh r0, [r4, 0x36]
	adds r0, 0x1
	strh r0, [r4, 0x36]
	movs r1, 0x38
	ldrsh r0, [r4, r1]
	cmp r0, 0xF
	bgt _080646BE
	movs r0, 0
	b _080646C0
_080646BE:
	movs r0, 0x1
_080646C0:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_806468C

	thumb_func_start sub_80646C8
sub_80646C8: @ 80646C8
	lsls r1, 24
	ldr r2, _080646E0
	lsrs r1, 22
	adds r1, r2
	lsls r0, 16
	asrs r0, 16
	ldr r1, [r1]
	adds r1, r0
	movs r0, 0
	ldrsb r0, [r1, r0]
	bx lr
	.align 2, 0
_080646E0: .4byte gUnknown_083761D0
	thumb_func_end sub_80646C8

	thumb_func_start sub_80646E4
sub_80646E4: @ 80646E4
	push {r4,lr}
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	movs r4, 0
	strh r1, [r0, 0x34]
	strh r2, [r0, 0x36]
	strh r3, [r0, 0x38]
	strh r4, [r0, 0x3A]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_80646E4

	thumb_func_start sub_8064704
sub_8064704: @ 8064704
	push {r4-r6,lr}
	sub sp, 0xC
	adds r4, r0, 0
	ldr r1, _08064784
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r5, sp, 0x8
	ldr r1, _08064788
	adds r0, r5, 0
	movs r2, 0x3
	bl memcpy
	movs r6, 0
	movs r1, 0x36
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _08064736
	ldrh r1, [r4, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl little_step
_08064736:
	movs r2, 0x3A
	ldrsh r0, [r4, r2]
	movs r2, 0x36
	ldrsh r1, [r4, r2]
	adds r1, r5, r1
	ldrb r1, [r1]
	asrs r0, r1
	ldrh r1, [r4, 0x38]
	lsls r1, 24
	lsrs r1, 24
	bl sub_80646C8
	strh r0, [r4, 0x26]
	ldrh r1, [r4, 0x3A]
	adds r1, 0x1
	strh r1, [r4, 0x3A]
	movs r2, 0x36
	ldrsh r0, [r4, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	lsls r0, 16
	asrs r2, r0, 16
	lsls r1, 16
	asrs r1, 16
	asrs r0, 17
	cmp r1, r0
	bne _08064770
	movs r6, 0x1
_08064770:
	cmp r1, r2
	blt _0806477A
	movs r0, 0
	strh r0, [r4, 0x26]
	movs r6, 0xFF
_0806477A:
	adds r0, r6, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08064784: .4byte gUnknown_083761DC
_08064788: .4byte gUnknown_083761E2
	thumb_func_end sub_8064704

	thumb_func_start sub_806478C
sub_806478C: @ 806478C
	push {r4-r6,lr}
	sub sp, 0xC
	adds r5, r0, 0
	ldr r1, _08064818
	mov r0, sp
	movs r2, 0x6
	bl memcpy
	add r4, sp, 0x8
	ldr r1, _0806481C
	adds r0, r4, 0
	movs r2, 0x3
	bl memcpy
	movs r6, 0
	movs r1, 0x36
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _080647C8
	ldrh r1, [r5, 0x3A]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080647C8
	ldrh r1, [r5, 0x34]
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl little_step
_080647C8:
	movs r2, 0x3A
	ldrsh r0, [r5, r2]
	movs r2, 0x36
	ldrsh r1, [r5, r2]
	adds r1, r4, r1
	ldrb r1, [r1]
	asrs r0, r1
	ldrh r1, [r5, 0x38]
	lsls r1, 24
	lsrs r1, 24
	bl sub_80646C8
	strh r0, [r5, 0x26]
	ldrh r1, [r5, 0x3A]
	adds r1, 0x1
	strh r1, [r5, 0x3A]
	movs r2, 0x36
	ldrsh r0, [r5, r2]
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	lsls r0, 16
	asrs r2, r0, 16
	lsls r1, 16
	asrs r1, 16
	asrs r0, 17
	cmp r1, r0
	bne _08064802
	movs r6, 0x1
_08064802:
	cmp r1, r2
	blt _0806480C
	movs r0, 0
	strh r0, [r5, 0x26]
	movs r6, 0xFF
_0806480C:
	adds r0, r6, 0
	add sp, 0xC
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08064818: .4byte gUnknown_083761E6
_0806481C: .4byte gUnknown_083761EC
	thumb_func_end sub_806478C

	thumb_func_start sub_8064820
sub_8064820: @ 8064820
	strh r1, [r0, 0x34]
	bx lr
	thumb_func_end sub_8064820

	thumb_func_start sub_8064824
sub_8064824: @ 8064824
	push {lr}
	ldrh r1, [r0, 0x34]
	subs r1, 0x1
	strh r1, [r0, 0x34]
	lsls r1, 16
	cmp r1, 0
	beq _08064836
	movs r0, 0
	b _08064838
_08064836:
	movs r0, 0x1
_08064838:
	pop {r1}
	bx r1
	thumb_func_end sub_8064824

	thumb_func_start obj_anim_image_set_and_seek
obj_anim_image_set_and_seek: @ 806483C
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	adds r3, r0, 0
	adds r3, 0x2A
	strb r1, [r3]
	adds r4, r0, 0
	adds r4, 0x2C
	ldrb r3, [r4]
	movs r1, 0x41
	negs r1, r1
	ands r1, r3
	strb r1, [r4]
	adds r1, r2, 0
	bl SeekSpriteAnim
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end obj_anim_image_set_and_seek

	thumb_func_start sub_8064864
sub_8064864: @ 8064864
	push {lr}
	adds r0, 0x3F
	ldrb r1, [r0]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	bne _08064876
	movs r0, 0
	b _08064878
_08064876:
	movs r0, 0x1
_08064878:
	pop {r1}
	bx r1
	thumb_func_end sub_8064864

	thumb_func_start sub_806487C
sub_806487C: @ 806487C
	push {r4-r6,lr}
	mov r12, r0
	lsls r1, 24
	lsrs r1, 24
	mov r3, r12
	adds r3, 0x3E
	movs r0, 0x1
	ands r1, r0
	lsls r1, 2
	ldrb r2, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	movs r1, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080648E4
	mov r0, r12
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	mov r4, r12
	adds r4, 0x28
	movs r0, 0
	ldrsb r0, [r4, r0]
	ldr r2, _080648DC
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r12
	ldrh r1, [r0, 0x26]
	ldrh r2, [r0, 0x22]
	adds r1, r2
	subs r3, 0x15
	movs r0, 0
	ldrsb r0, [r3, r0]
	ldr r2, _080648E0
	adds r0, r1
	ldrh r2, [r2]
	adds r0, r2
	lsls r0, 16
	lsrs r5, r0, 16
	adds r2, r3, 0
	b _08064912
	.align 2, 0
_080648DC: .4byte 0x030024d0
_080648E0: .4byte 0x030027e0
_080648E4:
	mov r0, r12
	ldrh r1, [r0, 0x24]
	ldrh r2, [r0, 0x20]
	adds r1, r2
	mov r3, r12
	adds r3, 0x28
	movs r0, 0
	ldrsb r0, [r3, r0]
	adds r0, r1
	lsls r0, 16
	lsrs r6, r0, 16
	mov r0, r12
	ldrh r1, [r0, 0x26]
	ldrh r2, [r0, 0x22]
	adds r1, r2
	mov r2, r12
	adds r2, 0x29
	movs r0, 0
	ldrsb r0, [r2, r0]
	adds r0, r1
	lsls r0, 16
	lsrs r5, r0, 16
	adds r4, r3, 0
_08064912:
	ldrb r0, [r4]
	lsls r0, 24
	asrs r0, 25
	subs r0, r6, r0
	lsls r0, 16
	lsrs r3, r0, 16
	ldrb r0, [r2]
	lsls r0, 24
	asrs r0, 25
	subs r0, r5, r0
	lsls r0, 16
	lsrs r2, r0, 16
	lsls r0, r6, 16
	asrs r0, 16
	cmp r0, 0xFF
	bgt _0806493E
	lsls r0, r3, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _0806494A
_0806493E:
	mov r4, r12
	adds r4, 0x3E
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
_0806494A:
	lsls r0, r5, 16
	asrs r0, 16
	cmp r0, 0xAF
	bgt _0806495E
	lsls r0, r2, 16
	asrs r0, 16
	movs r1, 0x10
	negs r1, r1
	cmp r0, r1
	bge _0806496A
_0806495E:
	mov r0, r12
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
_0806496A:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806487C

	thumb_func_start sub_8064970
sub_8064970: @ 8064970
	push {r4,lr}
	adds r4, r0, 0
	ldrh r0, [r4, 0x30]
	lsls r0, 24
	lsrs r0, 24
	adds r1, r4, 0
	movs r2, 0x1
	bl SetObjectSubpriorityByZCoord
	adds r0, r4, 0
	movs r1, 0
	bl sub_806487C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8064970

	thumb_func_start sub_8064990
sub_8064990: @ 8064990
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	movs r2, 0
	ldr r6, _080649DC
_0806499E:
	lsls r0, r2, 4
	adds r0, r2
	lsls r0, 2
	adds r4, r0, r6
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _080649E4
	ldr r1, [r4, 0x1C]
	ldr r0, _080649E0
	cmp r1, r0
	bne _080649E4
	ldrh r0, [r4, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	cmp r0, r5
	bne _080649E4
	adds r0, r3, 0
	bl FieldObjectDirectionToImageAnimId
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl StartSpriteAnim
	b _080649EE
	.align 2, 0
_080649DC: .4byte 0x02020004
_080649E0: .4byte sub_8064970
_080649E4:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x3F
	bls _0806499E
_080649EE:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_8064990

	thumb_func_start oe_exec_and_other_stuff
oe_exec_and_other_stuff: @ 80649F4
	push {r4,lr}
	adds r4, r0, 0
	adds r0, r1, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _08064A18
	adds r2, r1, 0x4
	adds r3, r1, 0
	adds r3, 0x8
	bl FieldObjectGetLocalIdAndMap
	adds r0, r4, 0
	bl FieldEffectStart
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08064A18: .4byte 0x0202ff84
	thumb_func_end oe_exec_and_other_stuff

	thumb_func_start DoShadowFieldEffect
DoShadowFieldEffect: @ 8064A1C
	push {lr}
	adds r1, r0, 0
	ldrb r2, [r1, 0x2]
	lsls r0, r2, 25
	cmp r0, 0
	blt _08064A34
	movs r0, 0x40
	orrs r0, r2
	strb r0, [r1, 0x2]
	movs r0, 0x3
	bl oe_exec_and_other_stuff
_08064A34:
	pop {r0}
	bx r0
	thumb_func_end DoShadowFieldEffect

	thumb_func_start DoRippleFieldEffect
DoRippleFieldEffect: @ 8064A38
	push {r4,lr}
	adds r4, r1, 0
	ldrb r0, [r0, 0x5]
	bl GetFieldObjectGraphicsInfo
	ldr r2, _08064A70
	movs r3, 0x20
	ldrsh r1, [r4, r3]
	str r1, [r2]
	movs r3, 0x22
	ldrsh r1, [r4, r3]
	ldrh r0, [r0, 0xA]
	lsls r0, 16
	asrs r0, 17
	adds r1, r0
	subs r1, 0x2
	str r1, [r2, 0x4]
	movs r0, 0x97
	str r0, [r2, 0x8]
	movs r0, 0x3
	str r0, [r2, 0xC]
	movs r0, 0x5
	bl FieldEffectStart
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064A70: .4byte 0x0202ff84
	thumb_func_end DoRippleFieldEffect

	thumb_func_start sub_8064A74
sub_8064A74: @ 8064A74
	push {lr}
	ldr r1, _08064A90
	movs r0, 0
	strb r0, [r1]
	ldr r0, _08064A94
	ldrh r0, [r0]
	bl sub_80651C8
	ldr r0, _08064A98
	ldr r1, _08064A9C
	bl InitWindowFromConfig
	pop {r0}
	bx r0
	.align 2, 0
_08064A90: .4byte 0x030005a8
_08064A94: .4byte 0x0202e9d2
_08064A98: .4byte 0x0202e87c
_08064A9C: .4byte gWindowConfig_81E6CE4
	thumb_func_end sub_8064A74

	thumb_func_start sub_8064AA0
sub_8064AA0: @ 8064AA0
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _08064AC4
	adds r4, r0, r1
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	cmp r0, 0x1
	beq _08064ADC
	cmp r0, 0x1
	bgt _08064AC8
	cmp r0, 0
	beq _08064ACE
	b _08064B28
	.align 2, 0
_08064AC4: .4byte 0x03004b20
_08064AC8:
	cmp r0, 0x2
	beq _08064AF0
	b _08064B28
_08064ACE:
	ldr r0, _08064AD8
	bl sub_8065348
	b _08064AE2
	.align 2, 0
_08064AD8: .4byte 0x0202e87c
_08064ADC:
	ldr r0, _08064AEC
	bl draw_win
_08064AE2:
	ldrh r0, [r4, 0x8]
	adds r0, 0x1
	strh r0, [r4, 0x8]
	b _08064B28
	.align 2, 0
_08064AEC: .4byte 0x0202e87c
_08064AF0:
	ldr r0, _08064B00
	ldrb r0, [r0]
	cmp r0, 0x2
	beq _08064B04
	cmp r0, 0x3
	beq _08064B10
	b _08064B1C
	.align 2, 0
_08064B00: .4byte 0x030005a8
_08064B04:
	ldr r0, _08064B0C
	bl sub_80035AC
	b _08064B16
	.align 2, 0
_08064B0C: .4byte 0x0202e87c
_08064B10:
	ldr r0, _08064B30
	bl sub_8003778
_08064B16:
	lsls r0, 24
	cmp r0, 0
	beq _08064B28
_08064B1C:
	ldr r1, _08064B34
	movs r0, 0
	strb r0, [r1]
	adds r0, r5, 0
	bl DestroyTask
_08064B28:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064B30: .4byte 0x0202e87c
_08064B34: .4byte 0x030005a8
	thumb_func_end sub_8064AA0

	thumb_func_start task_add_textbox
task_add_textbox: @ 8064B38
	push {lr}
	ldr r0, _08064B48
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08064B48: .4byte sub_8064AA0
	thumb_func_end task_add_textbox

	thumb_func_start task_del_textbox
task_del_textbox: @ 8064B4C
	push {lr}
	ldr r0, _08064B64
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0xFF
	beq _08064B60
	bl DestroyTask
_08064B60:
	pop {r0}
	bx r0
	.align 2, 0
_08064B64: .4byte sub_8064AA0
	thumb_func_end task_del_textbox

	thumb_func_start box_related_two__2
box_related_two__2: @ 8064B68
	push {r4,lr}
	adds r1, r0, 0
	ldr r4, _08064B84
	ldrb r0, [r4]
	cmp r0, 0
	bne _08064B88
	adds r0, r1, 0
	bl textbox_fdecode_auto_and_task_add
	movs r0, 0x2
	strb r0, [r4]
	movs r0, 0x1
	b _08064B8A
	.align 2, 0
_08064B84: .4byte 0x030005a8
_08064B88:
	movs r0, 0
_08064B8A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end box_related_two__2

	thumb_func_start box_related_two__3
box_related_two__3: @ 8064B90
	push {lr}
	adds r1, r0, 0
	ldr r2, _08064BAC
	ldrb r0, [r2]
	cmp r0, 0
	bne _08064BB0
	movs r0, 0x3
	strb r0, [r2]
	adds r0, r1, 0
	bl textbox_fdecode_auto_and_task_add
	movs r0, 0x1
	b _08064BB2
	.align 2, 0
_08064BAC: .4byte 0x030005a8
_08064BB0:
	movs r0, 0
_08064BB2:
	pop {r1}
	bx r1
	thumb_func_end box_related_two__3

	thumb_func_start unref_sub_8064BB8
unref_sub_8064BB8: @ 8064BB8
	push {lr}
	ldr r2, _08064BCC
	movs r1, 0x3
	strb r1, [r2]
	bl textbox_fdecode_auto_and_task_add
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08064BCC: .4byte 0x030005a8
	thumb_func_end unref_sub_8064BB8

	thumb_func_start unref_sub_8064BD0
unref_sub_8064BD0: @ 8064BD0
	push {lr}
	ldr r1, _08064BE8
	ldrb r0, [r1]
	cmp r0, 0
	bne _08064BEC
	movs r0, 0x2
	strb r0, [r1]
	bl textbox_auto_and_task_add
	movs r0, 0x1
	b _08064BEE
	.align 2, 0
_08064BE8: .4byte 0x030005a8
_08064BEC:
	movs r0, 0
_08064BEE:
	pop {r1}
	bx r1
	thumb_func_end unref_sub_8064BD0

	thumb_func_start textbox_fdecode_auto_and_task_add
textbox_fdecode_auto_and_task_add: @ 8064BF4
	push {r4,lr}
	sub sp, 0x4
	adds r1, r0, 0
	ldr r4, _08064C20
	adds r0, r4, 0
	bl StringExpandPlaceholders
	ldr r0, _08064C24
	ldr r1, _08064C28
	ldrh r2, [r1]
	movs r1, 0xF
	str r1, [sp]
	adds r1, r4, 0
	movs r3, 0x2
	bl sub_8002EB0
	bl task_add_textbox
	add sp, 0x4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064C20: .4byte 0x020234cc
_08064C24: .4byte 0x0202e87c
_08064C28: .4byte 0x0202e9ce
	thumb_func_end textbox_fdecode_auto_and_task_add

	thumb_func_start textbox_auto_and_task_add
textbox_auto_and_task_add: @ 8064C2C
	push {lr}
	sub sp, 0x4
	ldr r0, _08064C4C
	ldr r1, _08064C50
	ldr r2, _08064C54
	ldrh r2, [r2]
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	bl task_add_textbox
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_08064C4C: .4byte 0x0202e87c
_08064C50: .4byte 0x020234cc
_08064C54: .4byte 0x0202e9ce
	thumb_func_end textbox_auto_and_task_add

	thumb_func_start textbox_close
textbox_close: @ 8064C58
	push {lr}
	bl task_del_textbox
	ldr r0, _08064C70
	bl sub_806536C
	ldr r1, _08064C74
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08064C70: .4byte 0x0202e87c
_08064C74: .4byte 0x030005a8
	thumb_func_end textbox_close

	thumb_func_start textbox_any_visible
textbox_any_visible: @ 8064C78
	ldr r0, _08064C80
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08064C80: .4byte 0x030005a8
	thumb_func_end textbox_any_visible

	thumb_func_start sub_8064C84
sub_8064C84: @ 8064C84
	push {lr}
	ldr r0, _08064C94
	ldrb r0, [r0]
	cmp r0, 0
	beq _08064C98
	movs r0, 0
	b _08064C9A
	.align 2, 0
_08064C94: .4byte 0x030005a8
_08064C98:
	movs r0, 0x1
_08064C9A:
	pop {r1}
	bx r1
	thumb_func_end sub_8064C84

	thumb_func_start unref_sub_8064CA0
unref_sub_8064CA0: @ 8064CA0
	push {lr}
	bl task_del_textbox
	ldr r0, _08064CB8
	bl draw_win
	ldr r1, _08064CBC
	movs r0, 0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08064CB8: .4byte 0x0202e87c
_08064CBC: .4byte 0x030005a8
	thumb_func_end unref_sub_8064CA0

	thumb_func_start walkrun_is_standing_still
walkrun_is_standing_still: @ 8064CC0
	push {lr}
	ldr r0, _08064CD0
	ldrb r0, [r0, 0x3]
	cmp r0, 0x1
	beq _08064CD4
	movs r0, 0x1
	b _08064CD6
	.align 2, 0
_08064CD0: .4byte 0x0202e858
_08064CD4:
	movs r0, 0
_08064CD6:
	pop {r1}
	bx r1
	thumb_func_end walkrun_is_standing_still

	thumb_func_start sub_8064CDC
sub_8064CDC: @ 8064CDC
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl walkrun_is_standing_still
	lsls r0, 24
	cmp r0, 0
	beq _08064CF6
	bl sub_80594C0
	adds r0, r4, 0
	bl DestroyTask
_08064CF6:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8064CDC

	thumb_func_start sub_8064CFC
sub_8064CFC: @ 8064CFC
	push {lr}
	ldr r0, _08064D14
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08064D18
	bl sub_80597F4
	movs r0, 0x1
	b _08064D1A
	.align 2, 0
_08064D14: .4byte sub_8064CDC
_08064D18:
	movs r0, 0
_08064D1A:
	pop {r1}
	bx r1
	thumb_func_end sub_8064CFC

	thumb_func_start sub_8064D20
sub_8064D20: @ 8064D20
	push {lr}
	bl player_bitmagic
	ldr r0, _08064D34
	movs r1, 0x50
	bl CreateTask
	pop {r0}
	bx r0
	.align 2, 0
_08064D34: .4byte sub_8064CDC
	thumb_func_end sub_8064D20

	thumb_func_start sub_8064D38
sub_8064D38: @ 8064D38
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	ldr r1, _08064DA8
	adds r5, r0, r1
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08064D62
	bl walkrun_is_standing_still
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x1
	bne _08064D62
	bl sub_80594C0
	strh r4, [r5, 0x8]
_08064D62:
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _08064D8A
	ldr r2, _08064DAC
	ldr r0, _08064DB0
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _08064D8A
	adds r0, r1, 0
	bl sub_80643A4
	movs r0, 0x1
	strh r0, [r5, 0xA]
_08064D8A:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08064DA0
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	cmp r0, 0
	beq _08064DA0
	adds r0, r6, 0
	bl DestroyTask
_08064DA0:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064DA8: .4byte 0x03004b20
_08064DAC: .4byte 0x030048a0
_08064DB0: .4byte 0x03004ae0
	thumb_func_end sub_8064D38

	thumb_func_start sub_8064DB4
sub_8064DB4: @ 8064DB4
	push {lr}
	ldr r0, _08064DCC
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08064DD0
	bl sub_80597F4
	movs r0, 0x1
	b _08064DD2
	.align 2, 0
_08064DCC: .4byte sub_8064D38
_08064DD0:
	movs r0, 0
_08064DD2:
	pop {r1}
	bx r1
	thumb_func_end sub_8064DB4

	thumb_func_start sub_8064DD8
sub_8064DD8: @ 8064DD8
	push {r4,r5,lr}
	ldr r4, _08064E1C
	ldrb r0, [r4]
	bl sub_8064470
	ldr r0, _08064E20
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r2, _08064E24
	ldrb r1, [r4]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r2
	ldrb r0, [r1]
	lsls r0, 30
	cmp r0, 0
	blt _08064E16
	adds r0, r1, 0
	bl sub_80643A4
	ldr r0, _08064E28
	lsls r1, r5, 2
	adds r1, r5
	lsls r1, 3
	adds r1, r0
	movs r0, 0x1
	strh r0, [r1, 0xA]
_08064E16:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064E1C: .4byte 0x03004ae0
_08064E20: .4byte sub_8064D38
_08064E24: .4byte 0x030048a0
_08064E28: .4byte 0x03004b20
	thumb_func_end sub_8064DD8

	thumb_func_start sub_8064E2C
sub_8064E2C: @ 8064E2C
	push {lr}
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08064E58
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80A2178
	bl sub_806451C
	pop {r0}
	bx r0
	.align 2, 0
_08064E58: .4byte 0x030048a0
	thumb_func_end sub_8064E2C

	thumb_func_start unref_sub_8064E5C
unref_sub_8064E5C: @ 8064E5C
	push {r4,lr}
	ldr r4, _08064EA4
	ldr r0, _08064EA8
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08064E7A
	adds r0, r1, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
_08064E7A:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80A2178
	bl sub_806451C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064EA4: .4byte 0x030048a0
_08064EA8: .4byte 0x03004ae0
	thumb_func_end unref_sub_8064E5C

	thumb_func_start sub_8064EAC
sub_8064EAC: @ 8064EAC
	push {lr}
	ldr r0, _08064EC8
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08064ECC
	adds r0, r1
	ldr r1, _08064ED0
	ldrb r1, [r1]
	bl FieldObjectFaceOppositeDirection
	pop {r0}
	bx r0
	.align 2, 0
_08064EC8: .4byte 0x03004ae0
_08064ECC: .4byte 0x030048a0
_08064ED0: .4byte 0x0202e8e0
	thumb_func_end sub_8064EAC

	thumb_func_start sub_8064ED4
sub_8064ED4: @ 8064ED4
	push {lr}
	ldr r0, _08064EEC
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _08064EF0
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimActive
	pop {r0}
	bx r0
	.align 2, 0
_08064EEC: .4byte 0x03004ae0
_08064EF0: .4byte 0x030048a0
	thumb_func_end sub_8064ED4

	thumb_func_start sub_8064EF4
sub_8064EF4: @ 8064EF4
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08064F04
	strh r0, [r1]
	adds r0, 0x9
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_08064F04: .4byte 0x030005ac
	thumb_func_end sub_8064EF4

	thumb_func_start sub_8064F08
sub_8064F08: @ 8064F08
	push {r4,lr}
	ldr r1, [r0, 0x2C]
	ldr r0, _08064F30
	ldrh r0, [r0]
	lsls r0, 5
	ldr r1, [r1, 0x10]
	adds r1, r0
	ldr r4, _08064F34
	ldrb r0, [r4, 0x14]
	lsrs r0, 3
	bl sub_8064FF8
	ldrb r0, [r4, 0x14]
	lsrs r0, 3
	movs r1, 0xE
	bl sub_8065014
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064F30: .4byte 0x030005ac
_08064F34: .4byte 0x02024ea4
	thumb_func_end sub_8064F08

	thumb_func_start sub_8064F38
sub_8064F38: @ 8064F38
	push {r4,r5,lr}
	lsls r5, r1, 24
	lsrs r5, 24
	ldr r1, [r0, 0x2C]
	ldr r0, _08064F64
	ldrh r0, [r0]
	lsls r0, 5
	ldr r1, [r1, 0x10]
	adds r1, r0
	ldr r4, _08064F68
	ldrb r0, [r4, 0x14]
	lsrs r0, 3
	bl sub_8064FF8
	ldrb r0, [r4, 0x14]
	lsrs r0, 3
	adds r1, r5, 0
	bl sub_8065014
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064F64: .4byte 0x030005ac
_08064F68: .4byte 0x02024ea4
	thumb_func_end sub_8064F38

	thumb_func_start sub_8064F6C
sub_8064F6C: @ 8064F6C
	push {r4,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r1, [r0, 0x2C]
	ldr r0, _08064F94
	ldrh r0, [r0]
	lsls r0, 5
	ldr r1, [r1, 0x10]
	adds r1, r0
	adds r0, r4, 0
	bl sub_8064FF8
	adds r0, r4, 0
	movs r1, 0xE
	bl sub_8065014
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08064F94: .4byte 0x030005ac
	thumb_func_end sub_8064F6C

	thumb_func_start AddTextPrinterParametrized
AddTextPrinterParametrized: @ 8064F98
	push {r4,r5,lr}
	sub sp, 0x8
	adds r4, r1, 0
	adds r5, r2, 0
	ldr r2, [sp, 0x14]
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r0, [r0, 0x2C]
	ldr r0, [r0, 0x14]
	ldr r1, _08064FD0
	ldrh r1, [r1]
	str r3, [sp]
	str r2, [sp, 0x4]
	adds r2, r4, 0
	adds r3, r5, 0
	bl DrawWindowInternal
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064FD0: .4byte 0x030005ac
	thumb_func_end AddTextPrinterParametrized

	thumb_func_start sub_8064FD4
sub_8064FD4: @ 8064FD4
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x13
	bhi _08064FEC
	lsls r0, 3
	ldr r1, _08064FE8
	adds r0, r1
	b _08064FEE
	.align 2, 0
_08064FE8: .4byte gUnknown_083761F0
_08064FEC:
	ldr r0, _08064FF4
_08064FEE:
	pop {r1}
	bx r1
	.align 2, 0
_08064FF4: .4byte gUnknown_083761F0
	thumb_func_end sub_8064FD4

	thumb_func_start sub_8064FF8
sub_8064FF8: @ 8064FF8
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	bl sub_8064FD4
	ldr r0, [r0]
	adds r1, r4, 0
	movs r2, 0x48
	bl CpuFastSet
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8064FF8

	thumb_func_start sub_8065014
sub_8065014: @ 8065014
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl sub_8064FD4
	ldr r0, [r0, 0x4]
	lsls r4, 4
	adds r1, r4, 0
	movs r2, 0x20
	bl LoadPalette
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8065014

	thumb_func_start DrawWindowInternal
DrawWindowInternal: @ 8065038
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	adds r7, r0, 0
	ldr r0, [sp, 0x3C]
	ldr r4, [sp, 0x40]
	lsls r1, 16
	lsrs r1, 16
	mov r9, r1
	lsls r2, 24
	lsrs r2, 24
	adds r6, r2, 0
	lsls r3, 24
	lsrs r5, r3, 24
	mov r10, r5
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	mov r8, r4
	adds r1, r0, 0
	cmp r0, r2
	bls _0806506E
	adds r1, r2, 0
_0806506E:
	str r1, [sp]
	adds r1, r6, 0
	cmp r6, r0
	bcs _08065078
	adds r1, r0, 0
_08065078:
	adds r6, r1, 0
	adds r3, r4, 0
	cmp r4, r5
	bls _08065082
	adds r3, r5, 0
_08065082:
	adds r5, r3, 0
	mov r0, r10
	cmp r10, r8
	bcs _0806508C
	mov r0, r8
_0806508C:
	str r0, [sp, 0x4]
	lsls r3, r5, 5
	ldr r0, [sp]
	adds r1, r3, r0
	lsls r1, 1
	adds r1, r7
	movs r4, 0xE0
	lsls r4, 8
	adds r2, r4, 0
	mov r0, r9
	orrs r0, r2
	strh r0, [r1]
	ldr r1, [sp]
	adds r1, 0x1
	lsls r0, r1, 24
	lsrs r2, r0, 24
	str r1, [sp, 0x18]
	mov r4, r9
	adds r4, 0x2
	adds r5, 0x1
	mov r8, r5
	mov r5, r9
	adds r5, 0x6
	str r5, [sp, 0x10]
	mov r0, r9
	adds r0, 0x8
	str r0, [sp, 0x14]
	cmp r2, r6
	bcs _080650E6
	mov r10, r3
	mov r1, r9
	adds r1, 0x1
	ldr r5, _080651C4
	adds r0, r5, 0
	orrs r1, r0
_080650D2:
	mov r5, r10
	adds r0, r5, r2
	lsls r0, 1
	adds r0, r7
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r6
	bcc _080650D2
_080650E6:
	adds r0, r3, r6
	lsls r0, 1
	adds r0, r7
	ldr r2, _080651C4
	adds r1, r2, 0
	orrs r4, r1
	strh r4, [r0]
	mov r4, r8
	lsls r0, r4, 24
	lsrs r3, r0, 24
	ldr r5, [sp, 0x4]
	lsls r5, 5
	mov r10, r5
	ldr r0, [sp, 0x4]
	cmp r3, r0
	bcs _0806516A
	movs r2, 0x3
	add r2, r9
	orrs r2, r1
	mov r8, r2
	ldr r4, [sp, 0x18]
	lsls r4, 24
	str r4, [sp, 0x8]
	movs r5, 0x5
	add r5, r9
	orrs r5, r1
	mov r12, r5
	mov r0, r9
	adds r0, 0x4
	str r0, [sp, 0xC]
_08065122:
	lsls r1, r3, 5
	ldr r2, [sp]
	adds r0, r1, r2
	lsls r0, 1
	adds r0, r7
	mov r4, r8
	strh r4, [r0]
	ldr r5, [sp, 0x8]
	lsrs r2, r5, 24
	adds r5, r1, 0
	adds r3, 0x1
	cmp r2, r6
	bcs _08065156
	ldr r4, _080651C4
	adds r0, r4, 0
	ldr r4, [sp, 0xC]
	orrs r4, r0
_08065144:
	adds r0, r1, r2
	lsls r0, 1
	adds r0, r7
	strh r4, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r6
	bcc _08065144
_08065156:
	adds r0, r5, r6
	lsls r0, 1
	adds r0, r7
	mov r5, r12
	strh r5, [r0]
	lsls r0, r3, 24
	lsrs r3, r0, 24
	ldr r0, [sp, 0x4]
	cmp r3, r0
	bcc _08065122
_0806516A:
	ldr r0, [sp]
	add r0, r10
	lsls r0, 1
	adds r0, r7
	ldr r1, _080651C4
	adds r4, r1, 0
	ldr r2, [sp, 0x10]
	orrs r2, r4
	strh r2, [r0]
	ldr r1, [sp, 0x18]
	lsls r0, r1, 24
	lsrs r2, r0, 24
	cmp r2, r6
	bcs _080651A0
	mov r3, r10
	mov r1, r9
	adds r1, 0x7
	orrs r1, r4
_0806518E:
	adds r0, r3, r2
	lsls r0, 1
	adds r0, r7
	strh r1, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r6
	bcc _0806518E
_080651A0:
	mov r2, r10
	adds r0, r2, r6
	lsls r0, 1
	adds r0, r7
	ldr r4, _080651C4
	adds r1, r4, 0
	ldr r5, [sp, 0x14]
	orrs r5, r1
	strh r5, [r0]
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_080651C4: .4byte 0xffffe000
	thumb_func_end DrawWindowInternal

	thumb_func_start sub_80651C8
sub_80651C8: @ 80651C8
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080651D8
	strh r0, [r1]
	adds r0, 0xE
	lsls r0, 16
	lsrs r0, 16
	bx lr
	.align 2, 0
_080651D8: .4byte 0x030005ae
	thumb_func_end sub_80651C8

	thumb_func_start unref_sub_80651DC
unref_sub_80651DC: @ 80651DC
	push {lr}
	sub sp, 0x4
	ldr r2, _080651FC
	ldrh r2, [r2]
	adds r2, 0xE
	lsls r2, 16
	lsrs r2, 16
	movs r3, 0xF
	str r3, [sp]
	movs r3, 0x2
	bl sub_8002EB0
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080651FC: .4byte 0x030005ae
	thumb_func_end unref_sub_80651DC

	thumb_func_start copy_textbox_border_tile_patterns_to_vram
copy_textbox_border_tile_patterns_to_vram: @ 8065200
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8065348
	adds r0, r4, 0
	bl draw_win
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end copy_textbox_border_tile_patterns_to_vram

	thumb_func_start draw_win_3
draw_win_3: @ 8065214
	push {r4-r6,lr}
	ldr r4, [sp, 0x10]
	lsls r0, 16
	lsrs r6, r0, 16
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	lsls r4, 24
	lsrs r0, r4, 24
	movs r1, 0x9
	cmp r2, r0
	bcc _0806523C
	subs r0, r2, r0
	adds r0, 0x3
	lsls r0, 24
	lsrs r2, r0, 24
	b _08065242
_0806523C:
	cmp r2, 0x1
	bls _08065242
	movs r2, 0x2
_08065242:
	adds r0, r3, 0x2
	cmp r5, r0
	blt _08065252
	subs r0, r5, r0
	adds r0, 0x4
	lsls r0, 24
	lsrs r5, r0, 24
	b _08065258
_08065252:
	cmp r5, 0x2
	bls _08065258
	movs r5, 0x3
_08065258:
	cmp r5, 0x6
	bhi _0806526E
	cmp r2, 0x4
	bhi _0806526E
	ldr r1, _0806527C
	lsls r0, r2, 3
	subs r0, r2
	adds r0, r5
	lsls r0, 1
	adds r0, r1
	ldrh r1, [r0]
_0806526E:
	adds r0, r1, r6
	lsls r0, 16
	lsrs r1, r0, 16
	adds r0, r1, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806527C: .4byte gUnknown_08376290
	thumb_func_end draw_win_3

	thumb_func_start draw_win_2
draw_win_2: @ 8065280
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x1C
	str r0, [sp, 0x4]
	ldr r0, [sp, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp, 0x8]
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp, 0xC]
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp, 0x10]
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r1, [sp, 0x4]
	ldrb r0, [r1, 0x6]
	lsls r0, 12
	ldr r1, _0806532C
	ldrh r1, [r1]
	orrs r0, r1
	lsls r0, 16
	lsrs r0, 16
	str r0, [sp, 0x14]
	ldr r3, [sp, 0x4]
	ldr r0, [r3, 0x2C]
	ldr r0, [r0, 0x14]
	mov r10, r0
	movs r5, 0
	mov r0, r9
	adds r0, 0x2
	cmp r5, r0
	bge _0806531C
	ldr r7, [sp, 0x10]
	adds r7, 0x6
	str r0, [sp, 0x18]
_080652D2:
	movs r4, 0
	adds r0, r5, 0x1
	mov r8, r0
	cmp r4, r7
	bge _08065310
	ldr r1, [sp, 0xC]
	adds r0, r1, r5
	lsls r6, r0, 5
_080652E2:
	mov r3, r9
	str r3, [sp]
	ldr r0, [sp, 0x14]
	adds r1, r4, 0
	adds r2, r5, 0
	ldr r3, [sp, 0x10]
	bl draw_win_3
	ldr r1, [sp, 0x8]
	adds r2, r1, r4
	adds r2, r6, r2
	lsls r2, 1
	add r2, r10
	ldr r3, [sp, 0x4]
	ldrb r1, [r3, 0x6]
	lsls r1, 12
	orrs r1, r0
	strh r1, [r2]
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, r7
	blt _080652E2
_08065310:
	mov r1, r8
	lsls r0, r1, 24
	lsrs r5, r0, 24
	ldr r3, [sp, 0x18]
	cmp r5, r3
	blt _080652D2
_0806531C:
	add sp, 0x1C
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806532C: .4byte 0x030005ae
	thumb_func_end draw_win_2

	thumb_func_start draw_win
draw_win: @ 8065330
	push {lr}
	sub sp, 0x4
	movs r1, 0x4
	str r1, [sp]
	movs r1, 0
	movs r2, 0xE
	movs r3, 0x1A
	bl draw_win_2
	add sp, 0x4
	pop {r0}
	bx r0
	thumb_func_end draw_win

	thumb_func_start sub_8065348
sub_8065348: @ 8065348
	push {lr}
	ldr r0, [r0, 0x2C]
	ldr r1, [r0, 0x10]
	ldr r0, _08065364
	ldr r2, _08065368
	ldrh r2, [r2]
	lsls r2, 5
	adds r1, r2
	movs r2, 0x70
	bl CpuFastSet
	pop {r0}
	bx r0
	.align 2, 0
_08065364: .4byte gUnknown_08EA0108
_08065368: .4byte 0x030005ae
	thumb_func_end sub_8065348

	thumb_func_start sub_806536C
sub_806536C: @ 806536C
	push {lr}
	ldr r1, [r0, 0x2C]
	ldr r1, [r1, 0x14]
	movs r2, 0xE0
	lsls r2, 2
	adds r1, r2
	ldrb r0, [r0, 0x6]
	lsls r0, 28
	lsrs r3, r0, 16
	movs r2, 0
_08065380:
	lsls r0, r2, 1
	adds r0, r1
	strh r3, [r0]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xBF
	bls _08065380
	pop {r0}
	bx r0
	thumb_func_end sub_806536C

	thumb_func_start script_env_init
script_env_init: @ 8065394
	push {lr}
	adds r3, r0, 0
	movs r0, 0
	strb r0, [r3, 0x1]
	str r0, [r3, 0x8]
	strb r0, [r3]
	str r0, [r3, 0x4]
	str r1, [r3, 0x5C]
	str r2, [r3, 0x60]
	movs r2, 0
	movs r1, 0x3
	adds r0, r3, 0
	adds r0, 0x70
_080653AE:
	str r2, [r0]
	subs r0, 0x4
	subs r1, 0x1
	cmp r1, 0
	bge _080653AE
	adds r1, r3, 0
	adds r1, 0xC
	movs r2, 0
	adds r0, r3, 0
	adds r0, 0x58
_080653C2:
	str r2, [r0]
	subs r0, 0x4
	cmp r0, r1
	bge _080653C2
	pop {r0}
	bx r0
	thumb_func_end script_env_init

	thumb_func_start script_setup_bytecode_script
script_setup_bytecode_script: @ 80653D0
	str r1, [r0, 0x8]
	movs r1, 0x1
	strb r1, [r0, 0x1]
	movs r0, 0x1
	bx lr
	thumb_func_end script_setup_bytecode_script

	thumb_func_start script_setup_asm_script
script_setup_asm_script: @ 80653DC
	movs r2, 0x2
	strb r2, [r0, 0x1]
	str r1, [r0, 0x4]
	bx lr
	thumb_func_end script_setup_asm_script

	thumb_func_start script_stop
script_stop: @ 80653E4
	movs r1, 0
	strb r1, [r0, 0x1]
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end script_stop

	thumb_func_start sub_80653EC
sub_80653EC: @ 80653EC
	push {r4,lr}
	adds r4, r0, 0
	ldrb r0, [r4, 0x1]
	cmp r0, 0
	bne _080653FA
_080653F6:
	movs r0, 0
	b _0806546C
_080653FA:
	ldrb r0, [r4, 0x1]
	cmp r0, 0x1
	beq _08065432
	cmp r0, 0x1
	bgt _0806540A
	cmp r0, 0
	beq _080653F6
	b _0806546A
_0806540A:
	cmp r0, 0x2
	bne _0806546A
	ldr r0, [r4, 0x4]
	cmp r0, 0
	beq _0806542E
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806546A
	strb r0, [r4, 0x1]
	b _0806546A
_08065424:
	strb r2, [r4, 0x1]
	b _080653F6
_08065428:
	movs r0, 0
	strb r0, [r4, 0x1]
	b _0806546C
_0806542E:
	movs r0, 0x1
	strb r0, [r4, 0x1]
_08065432:
	ldr r2, [r4, 0x8]
	cmp r2, 0
	beq _08065424
	ldr r0, _08065444
	ldr r0, [r0]
	cmp r2, r0
	bne _08065448
_08065440:
	swi 0x2
	b _08065440
	.align 2, 0
_08065444: .4byte gUnknown_083762D8
_08065448:
	ldrb r1, [r2]
	adds r0, r2, 0x1
	str r0, [r4, 0x8]
	lsls r1, 2
	ldr r0, [r4, 0x5C]
	adds r1, r0, r1
	ldr r0, [r4, 0x60]
	cmp r1, r0
	bcs _08065428
	ldr r1, [r1]
	adds r0, r4, 0
	bl _call_via_r1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08065432
_0806546A:
	movs r0, 0x1
_0806546C:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_80653EC

	thumb_func_start script_stack_push
script_stack_push: @ 8065474
	push {lr}
	adds r2, r0, 0
	adds r3, r1, 0
	ldrb r1, [r2]
	adds r0, r1, 0x1
	cmp r0, 0x13
	bgt _08065496
	lsls r0, r1, 2
	adds r1, r2, 0
	adds r1, 0xC
	adds r1, r0
	str r3, [r1]
	ldrb r0, [r2]
	adds r0, 0x1
	strb r0, [r2]
	movs r0, 0
	b _08065498
_08065496:
	movs r0, 0x1
_08065498:
	pop {r1}
	bx r1
	thumb_func_end script_stack_push

	thumb_func_start script_stack_pop
script_stack_pop: @ 806549C
	push {lr}
	adds r2, r0, 0
	ldrb r0, [r2]
	cmp r0, 0
	beq _080654B8
	subs r0, 0x1
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, r2, 0
	adds r0, 0xC
	adds r0, r1
	ldr r0, [r0]
	b _080654BA
_080654B8:
	movs r0, 0
_080654BA:
	pop {r1}
	bx r1
	thumb_func_end script_stack_pop

	thumb_func_start script_jump
script_jump: @ 80654C0
	str r1, [r0, 0x8]
	bx lr
	thumb_func_end script_jump

	thumb_func_start script_call
script_call: @ 80654C4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	ldr r1, [r4, 0x8]
	bl script_stack_push
	str r5, [r4, 0x8]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end script_call

	thumb_func_start script_return
script_return: @ 80654D8
	push {r4,lr}
	adds r4, r0, 0
	bl script_stack_pop
	str r0, [r4, 0x8]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end script_return

	thumb_func_start script_read_halfword
script_read_halfword: @ 80654E8
	adds r3, r0, 0
	ldr r2, [r3, 0x8]
	ldrb r0, [r2]
	adds r2, 0x1
	str r2, [r3, 0x8]
	ldrb r1, [r2]
	lsls r1, 8
	orrs r0, r1
	adds r2, 0x1
	str r2, [r3, 0x8]
	bx lr
	thumb_func_end script_read_halfword

	thumb_func_start script_read_word
script_read_word: @ 8065500
	push {r4-r6,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r5, [r0]
	adds r2, r0, 0x1
	str r2, [r3, 0x8]
	ldrb r4, [r0, 0x1]
	adds r1, r2, 0x1
	str r1, [r3, 0x8]
	ldrb r0, [r2, 0x1]
	adds r1, 0x1
	str r1, [r3, 0x8]
	lsls r0, 8
	adds r0, r4
	lsls r0, 8
	adds r0, r5
	lsls r0, 8
	adds r0, r6
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end script_read_word

	thumb_func_start script_env_2_enable
script_env_2_enable: @ 8065530
	ldr r1, _08065538
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08065538: .4byte 0x030006a4
	thumb_func_end script_env_2_enable

	thumb_func_start script_env_2_disable
script_env_2_disable: @ 806553C
	ldr r1, _08065544
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08065544: .4byte 0x030006a4
	thumb_func_end script_env_2_disable

	thumb_func_start script_env_2_is_enabled
script_env_2_is_enabled: @ 8065548
	ldr r0, _08065550
	ldrb r0, [r0]
	bx lr
	.align 2, 0
_08065550: .4byte 0x030006a4
	thumb_func_end script_env_2_is_enabled

	thumb_func_start script_env_1_init
script_env_1_init: @ 8065554
	push {lr}
	ldr r0, _0806556C
	ldr r1, _08065570
	ldr r2, _08065574
	bl script_env_init
	ldr r1, _08065578
	movs r0, 0x2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0806556C: .4byte 0x030005b8
_08065570: .4byte gScriptCmdTable
_08065574: .4byte gScriptCmdTableEnd
_08065578: .4byte 0x030005b0
	thumb_func_end script_env_1_init

	thumb_func_start script_env_2_run_current_script
script_env_2_run_current_script: @ 806557C
	push {r4,lr}
	ldr r4, _080655A0
	ldrb r0, [r4]
	cmp r0, 0x2
	beq _080655B0
	cmp r0, 0x1
	beq _080655B0
	bl script_env_2_enable
	ldr r0, _080655A4
	bl sub_80653EC
	lsls r0, 24
	cmp r0, 0
	beq _080655A8
	movs r0, 0x1
	b _080655B2
	.align 2, 0
_080655A0: .4byte 0x030005b0
_080655A4: .4byte 0x030005b8
_080655A8:
	movs r0, 0x2
	strb r0, [r4]
	bl script_env_2_disable
_080655B0:
	movs r0, 0
_080655B2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end script_env_2_run_current_script

	thumb_func_start script_env_1_execute_new_script
script_env_1_execute_new_script: @ 80655B8
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _080655E0
	ldr r1, _080655E4
	ldr r2, _080655E8
	adds r0, r4, 0
	bl script_env_init
	adds r0, r4, 0
	adds r1, r5, 0
	bl script_setup_bytecode_script
	bl script_env_2_enable
	ldr r1, _080655EC
	movs r0, 0
	strb r0, [r1]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080655E0: .4byte 0x030005b8
_080655E4: .4byte gScriptCmdTable
_080655E8: .4byte gScriptCmdTableEnd
_080655EC: .4byte 0x030005b0
	thumb_func_end script_env_1_execute_new_script

	thumb_func_start sub_80655F0
sub_80655F0: @ 80655F0
	ldr r1, _080655F8
	movs r0, 0x1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080655F8: .4byte 0x030005b0
	thumb_func_end sub_80655F0

	thumb_func_start script_env_2_enable_and_set_ctx_running
script_env_2_enable_and_set_ctx_running: @ 80655FC
	push {lr}
	ldr r1, _0806560C
	movs r0, 0
	strb r0, [r1]
	bl script_env_2_enable
	pop {r0}
	bx r0
	.align 2, 0
_0806560C: .4byte 0x030005b0
	thumb_func_end script_env_2_enable_and_set_ctx_running

	thumb_func_start script_env_2_execute_new_script
script_env_2_execute_new_script: @ 8065610
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r4, _0806563C
	ldr r1, _08065640
	ldr r2, _08065644
	adds r0, r4, 0
	bl script_env_init
	adds r0, r4, 0
	adds r1, r5, 0
	bl script_setup_bytecode_script
_08065628:
	ldr r0, _0806563C
	bl sub_80653EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08065628
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806563C: .4byte 0x03000630
_08065640: .4byte gScriptCmdTable
_08065644: .4byte gScriptCmdTableEnd
	thumb_func_end script_env_2_execute_new_script

	thumb_func_start mapheader_get_tagged_pointer
mapheader_get_tagged_pointer: @ 8065648
	push {lr}
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _08065660
	ldr r2, [r0, 0x8]
	cmp r2, 0
	beq _0806565C
_08065656:
	ldrb r0, [r2]
	cmp r0, 0
	bne _08065664
_0806565C:
	movs r0, 0
	b _08065682
	.align 2, 0
_08065660: .4byte 0x0202e828
_08065664:
	cmp r0, r1
	beq _0806566C
	adds r2, 0x5
	b _08065656
_0806566C:
	adds r2, 0x1
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	lsls r1, 8
	adds r0, r1
	ldrb r1, [r2, 0x2]
	lsls r1, 16
	adds r0, r1
	ldrb r1, [r2, 0x3]
	lsls r1, 24
	adds r0, r1
_08065682:
	pop {r1}
	bx r1
	thumb_func_end mapheader_get_tagged_pointer

	thumb_func_start mapheader_run_script_by_tag
mapheader_run_script_by_tag: @ 8065688
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl mapheader_get_tagged_pointer
	cmp r0, 0
	beq _0806569A
	bl script_env_2_execute_new_script
_0806569A:
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_by_tag

	thumb_func_start mapheader_get_first_match_from_tagged_ptr_list
mapheader_get_first_match_from_tagged_ptr_list: @ 80656A0
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r0, 24
	bl mapheader_get_tagged_pointer
	adds r6, r0, 0
	cmp r6, 0
	beq _080656BC
_080656B0:
	ldrb r1, [r6]
	ldrb r0, [r6, 0x1]
	lsls r0, 8
	orrs r1, r0
	cmp r1, 0
	bne _080656C0
_080656BC:
	movs r0, 0
	b _080656FA
_080656C0:
	adds r6, 0x2
	ldrb r5, [r6]
	ldrb r0, [r6, 0x1]
	lsls r0, 8
	orrs r5, r0
	adds r6, 0x2
	adds r0, r1, 0
	bl VarGet
	adds r4, r0, 0
	adds r0, r5, 0
	bl VarGet
	lsls r4, 16
	lsls r0, 16
	cmp r4, r0
	beq _080656E6
	adds r6, 0x4
	b _080656B0
_080656E6:
	ldrb r0, [r6]
	ldrb r1, [r6, 0x1]
	lsls r1, 8
	adds r0, r1
	ldrb r1, [r6, 0x2]
	lsls r1, 16
	adds r0, r1
	ldrb r1, [r6, 0x3]
	lsls r1, 24
	adds r0, r1
_080656FA:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end mapheader_get_first_match_from_tagged_ptr_list

	thumb_func_start mapheader_run_script_with_tag_x1
mapheader_run_script_with_tag_x1: @ 8065700
	push {lr}
	movs r0, 0x1
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x1

	thumb_func_start mapheader_run_script_with_tag_x3
mapheader_run_script_with_tag_x3: @ 806570C
	push {lr}
	movs r0, 0x3
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x3

	thumb_func_start mapheader_run_script_with_tag_x5
mapheader_run_script_with_tag_x5: @ 8065718
	push {lr}
	movs r0, 0x5
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x5

	thumb_func_start mapheader_run_script_with_tag_x6
mapheader_run_script_with_tag_x6: @ 8065724
	push {lr}
	movs r0, 0x6
	bl mapheader_run_script_by_tag
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_script_with_tag_x6

	thumb_func_start mapheader_run_first_tag2_script_list_match
mapheader_run_first_tag2_script_list_match: @ 8065730
	push {lr}
	movs r0, 0x2
	bl mapheader_get_first_match_from_tagged_ptr_list
	cmp r0, 0
	beq _08065744
	bl script_env_1_execute_new_script
	movs r0, 0x1
	b _08065746
_08065744:
	movs r0, 0
_08065746:
	pop {r1}
	bx r1
	thumb_func_end mapheader_run_first_tag2_script_list_match

	thumb_func_start mapheader_run_first_tag4_script_list_match
mapheader_run_first_tag4_script_list_match: @ 806574C
	push {lr}
	movs r0, 0x4
	bl mapheader_get_first_match_from_tagged_ptr_list
	cmp r0, 0
	beq _0806575C
	bl script_env_2_execute_new_script
_0806575C:
	pop {r0}
	bx r0
	thumb_func_end mapheader_run_first_tag4_script_list_match

	thumb_func_start sub_8065760
sub_8065760: @ 8065760
	push {r4,lr}
	movs r2, 0
	movs r1, 0
	ldr r4, _08065780
	ldr r3, _08065784
_0806576A:
	adds r0, r1, r3
	ldrb r0, [r0]
	adds r2, r0
	adds r1, 0x1
	cmp r1, r4
	bls _0806576A
	adds r0, r2, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065780: .4byte 0x000003e7
_08065784: .4byte 0x02028dc8
	thumb_func_end sub_8065760

	thumb_func_start killram
killram: @ 8065788
	push {lr}
	sub sp, 0x4
	movs r0, 0
	str r0, [sp]
	ldr r1, _080657A0
	ldr r2, _080657A4
	mov r0, sp
	bl CpuSet
	add sp, 0x4
	pop {r0}
	bx r0
	.align 2, 0
_080657A0: .4byte 0x02028dc4
_080657A4: .4byte 0x050000fb
	thumb_func_end killram

	thumb_func_start sub_80657A8
sub_80657A8: @ 80657A8
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	mov r9, r0
	ldr r0, [sp, 0x1C]
	lsls r1, 16
	lsrs r1, 16
	mov r8, r1
	lsls r2, 24
	lsrs r7, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r4, _080657F4
	bl killram
	ldr r0, _080657F8
	cmp r8, r0
	bhi _080657FC
	movs r0, 0x33
	strb r0, [r4]
	strb r7, [r4, 0x1]
	strb r6, [r4, 0x2]
	strb r5, [r4, 0x3]
	adds r0, r4, 0x4
	mov r1, r9
	mov r2, r8
	bl memcpy
	bl sub_8065760
	subs r1, r4, 0x4
	str r0, [r1]
	movs r0, 0x1
	b _080657FE
	.align 2, 0
_080657F4: .4byte 0x02028dc8
_080657F8: .4byte 0x000003e3
_080657FC:
	movs r0, 0
_080657FE:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80657A8

	thumb_func_start sub_806580C
sub_806580C: @ 806580C
	push {r4-r6,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r3, r0, 24
	ldr r4, _08065854
	ldr r6, _08065858
	movs r0, 0
	str r0, [r6]
	ldrb r0, [r4]
	cmp r0, 0x33
	bne _08065864
	ldrb r1, [r4, 0x1]
	ldr r0, _0806585C
	adds r2, r4, r0
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _08065864
	ldrb r1, [r4, 0x2]
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _08065864
	ldrb r0, [r4, 0x3]
	cmp r0, r3
	bne _08065864
	bl sub_8065760
	subs r1, r4, 0x4
	ldr r1, [r1]
	cmp r0, r1
	bne _08065860
	str r5, [r6]
	adds r0, r4, 0x4
	b _08065866
	.align 2, 0
_08065854: .4byte 0x02028dc8
_08065858: .4byte 0x0202e8ac
_0806585C: .4byte 0xffffc96c
_08065860:
	bl killram
_08065864:
	adds r0, r5, 0
_08065866:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806580C

	thumb_func_start s00_nop
s00_nop: @ 806586C
	movs r0, 0
	bx lr
	thumb_func_end s00_nop

	thumb_func_start sub_8065870
sub_8065870: @ 8065870
	movs r0, 0
	bx lr
	thumb_func_end sub_8065870

	thumb_func_start s02_end
s02_end: @ 8065874
	push {lr}
	bl script_stop
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s02_end

	thumb_func_start s24_execute_ASM_2
s24_execute_ASM_2: @ 8065880
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r1, r0, 0
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s24_execute_ASM_2

	thumb_func_start sub_8065898
sub_8065898: @ 8065898
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	ldr r1, _080658B4
	lsrs r0, 14
	adds r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080658B4: .4byte gUnknown_0814B194
	thumb_func_end sub_8065898

	thumb_func_start sub_80658B8
sub_80658B8: @ 80658B8
	push {r4-r6,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r6, r0, 0
	ldr r4, _080658E8
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 14
	adds r0, r4
	ldr r0, [r0]
	bl _call_via_r0
	strh r0, [r6]
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_080658E8: .4byte gUnknown_0814B194
	thumb_func_end sub_80658B8

	thumb_func_start sub_80658EC
sub_80658EC: @ 80658EC
	push {lr}
	bl script_read_word
	bl _call_via_r0
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80658EC

	thumb_func_start sub_80658FC
sub_80658FC: @ 80658FC
	push {lr}
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80658FC

	thumb_func_start s05_goto
s05_goto: @ 8065908
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r1, r0, 0
	adds r0, r4, 0
	bl script_jump
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s05_goto

	thumb_func_start s03_return
s03_return: @ 8065920
	push {lr}
	bl script_return
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s03_return

	thumb_func_start s04_call
s04_call: @ 806592C
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r1, r0, 0
	adds r0, r4, 0
	bl script_call
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s04_call

	thumb_func_start s06_if_jump
s06_if_jump: @ 8065944
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_word
	adds r2, r0, 0
	ldr r1, _0806597C
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065972
	adds r0, r5, 0
	adds r1, r2, 0
	bl script_jump
_08065972:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806597C: .4byte gUnknown_083762DC
	thumb_func_end s06_if_jump

	thumb_func_start s07_if_call
s07_if_call: @ 8065980
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_word
	adds r2, r0, 0
	ldr r1, _080659B8
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _080659AE
	adds r0, r5, 0
	adds r1, r2, 0
	bl script_call
_080659AE:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080659B8: .4byte gUnknown_083762DC
	thumb_func_end s07_if_call

	thumb_func_start sB8_set_virtual_address
sB8_set_virtual_address: @ 80659BC
	push {r4,lr}
	ldr r4, [r0, 0x8]
	subs r4, 0x1
	bl script_read_word
	ldr r1, _080659D4
	subs r0, r4
	str r0, [r1]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080659D4: .4byte 0x0202e8b0
	thumb_func_end sB8_set_virtual_address

	thumb_func_start sB9_virtual_jump
sB9_virtual_jump: @ 80659D8
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r1, r0, 0
	ldr r0, _080659F8
	ldr r0, [r0]
	subs r1, r0
	adds r0, r4, 0
	bl script_jump
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080659F8: .4byte 0x0202e8b0
	thumb_func_end sB9_virtual_jump

	thumb_func_start sBA_virtual_call
sBA_virtual_call: @ 80659FC
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r1, r0, 0
	ldr r0, _08065A1C
	ldr r0, [r0]
	subs r1, r0
	adds r0, r4, 0
	bl script_call
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065A1C: .4byte 0x0202e8b0
	thumb_func_end sBA_virtual_call

	thumb_func_start sBB_virtual_if_jump
sBB_virtual_if_jump: @ 8065A20
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_word
	ldr r1, _08065A5C
	ldr r1, [r1]
	subs r2, r0, r1
	ldr r1, _08065A60
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065A52
	adds r0, r5, 0
	adds r1, r2, 0
	bl script_jump
_08065A52:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065A5C: .4byte 0x0202e8b0
_08065A60: .4byte gUnknown_083762DC
	thumb_func_end sBB_virtual_if_jump

	thumb_func_start sBC_virtual_if_call
sBC_virtual_if_call: @ 8065A64
	push {r4,r5,lr}
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_word
	ldr r1, _08065AA0
	ldr r1, [r1]
	subs r2, r0, r1
	ldr r1, _08065AA4
	lsls r0, r4, 1
	adds r0, r4
	ldrb r3, [r5, 0x2]
	adds r0, r3
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065A96
	adds r0, r5, 0
	adds r1, r2, 0
	bl script_call
_08065A96:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065AA0: .4byte 0x0202e8b0
_08065AA4: .4byte gUnknown_083762DC
	thumb_func_end sBC_virtual_if_call

	thumb_func_start s08_jumpstd
s08_jumpstd: @ 8065AA8
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r2, 0x8]
	lsls r1, 2
	ldr r0, _08065AD0
	adds r1, r0
	ldr r0, _08065AD4
	cmp r1, r0
	bcs _08065AC8
	ldr r1, [r1]
	adds r0, r2, 0
	bl script_jump
_08065AC8:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065AD0: .4byte gUnknown_0814B6EC
_08065AD4: .4byte gUnknown_0814B70C
	thumb_func_end s08_jumpstd

	thumb_func_start s09_callstd
s09_callstd: @ 8065AD8
	push {lr}
	adds r2, r0, 0
	ldr r0, [r2, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r2, 0x8]
	lsls r1, 2
	ldr r0, _08065B00
	adds r1, r0
	ldr r0, _08065B04
	cmp r1, r0
	bcs _08065AF8
	ldr r1, [r1]
	adds r0, r2, 0
	bl script_call
_08065AF8:
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065B00: .4byte gUnknown_0814B6EC
_08065B04: .4byte gUnknown_0814B70C
	thumb_func_end s09_callstd

	thumb_func_start s0A_jumpstd_if
s0A_jumpstd_if: @ 8065B08
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldr r1, _08065B48
	lsls r0, r2, 1
	adds r0, r2
	ldrb r2, [r3, 0x2]
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065B40
	lsls r0, r4, 2
	ldr r1, _08065B4C
	adds r1, r0, r1
	ldr r0, _08065B50
	cmp r1, r0
	bcs _08065B40
	ldr r1, [r1]
	adds r0, r3, 0
	bl script_jump
_08065B40:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065B48: .4byte gUnknown_083762DC
_08065B4C: .4byte gUnknown_0814B6EC
_08065B50: .4byte gUnknown_0814B70C
	thumb_func_end s0A_jumpstd_if

	thumb_func_start s0B_callstd_if
s0B_callstd_if: @ 8065B54
	push {r4,lr}
	adds r3, r0, 0
	ldr r0, [r3, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldrb r4, [r0]
	adds r0, 0x1
	str r0, [r3, 0x8]
	ldr r1, _08065B94
	lsls r0, r2, 1
	adds r0, r2
	ldrb r2, [r3, 0x2]
	adds r0, r2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	bne _08065B8C
	lsls r0, r4, 2
	ldr r1, _08065B98
	adds r1, r0, r1
	ldr r0, _08065B9C
	cmp r1, r0
	bcs _08065B8C
	ldr r1, [r1]
	adds r0, r3, 0
	bl script_call
_08065B8C:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065B94: .4byte gUnknown_083762DC
_08065B98: .4byte gUnknown_0814B6EC
_08065B9C: .4byte gUnknown_0814B70C
	thumb_func_end s0B_callstd_if

	thumb_func_start s0C_restore_execution_after_sCF
s0C_restore_execution_after_sCF: @ 8065BA0
	push {lr}
	ldr r1, _08065BB0
	ldr r1, [r1]
	bl script_jump
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08065BB0: .4byte 0x0202e8ac
	thumb_func_end s0C_restore_execution_after_sCF

	thumb_func_start s0D_endscript_killram
s0D_endscript_killram: @ 8065BB4
	push {r4,lr}
	adds r4, r0, 0
	bl killram
	adds r0, r4, 0
	bl script_stop
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s0D_endscript_killram

	thumb_func_start s0E_set_byte
s0E_set_byte: @ 8065BCC
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sub_8126160
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s0E_set_byte

	thumb_func_start s0F_u32_var_to_const
s0F_u32_var_to_const: @ 8065BE4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl script_read_word
	lsls r5, 2
	adds r4, 0x64
	adds r4, r5
	str r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s0F_u32_var_to_const

	thumb_func_start s12_u32_var_to_ptr
s12_u32_var_to_ptr: @ 8065C08
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl script_read_word
	lsls r5, 2
	adds r4, 0x64
	adds r4, r5
	ldrb r0, [r0]
	str r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s12_u32_var_to_ptr

	thumb_func_start s11_u8_ptr_to_const
s11_u8_ptr_to_const: @ 8065C2C
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_word
	strb r4, [r0]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s11_u8_ptr_to_const

	thumb_func_start sub_8065C44
sub_8065C44: @ 8065C44
	ldr r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	lsls r3, 2
	adds r2, r0, 0
	adds r2, 0x64
	adds r2, r3
	ldrb r3, [r1]
	str r3, [r2]
	adds r1, 0x1
	str r1, [r0, 0x8]
	movs r0, 0
	bx lr
	thumb_func_end sub_8065C44

	thumb_func_start s13_u8_var_to_ptr
s13_u8_var_to_ptr: @ 8065C60
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r5, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl script_read_word
	lsls r5, 2
	adds r4, 0x64
	adds r4, r5
	ldr r1, [r4]
	strb r1, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s13_u8_var_to_ptr

	thumb_func_start s14_u32_var_to_var
s14_u32_var_to_var: @ 8065C84
	ldr r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	lsls r3, 2
	adds r0, 0x64
	adds r3, r0, r3
	lsls r2, 2
	adds r0, r2
	ldr r0, [r0]
	str r0, [r3]
	movs r0, 0
	bx lr
	thumb_func_end s14_u32_var_to_var

	thumb_func_start s15_u8_ptr_to_ptr
s15_u8_ptr_to_ptr: @ 8065CA4
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r5, r0, 0
	adds r0, r4, 0
	bl script_read_word
	ldrb r0, [r0]
	strb r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s15_u8_ptr_to_ptr

	thumb_func_start s16_u16_gvar_to_const
s16_u16_gvar_to_const: @ 8065CC0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r4, r0, 0
	adds r0, r5, 0
	bl script_read_halfword
	strh r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s16_u16_gvar_to_const

	thumb_func_start s19_u16_gvar_gvar
s19_u16_gvar_gvar: @ 8065CE4
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	ldrh r0, [r0]
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s19_u16_gvar_gvar

	thumb_func_start s1A_u16_gvar_gvar
s1A_u16_gvar_gvar: @ 8065D10
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s1A_u16_gvar_gvar

	thumb_func_start compare_012
compare_012: @ 8065D3C
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r1, 16
	cmp r0, r1
	bcs _08065D4E
	movs r0, 0
	b _08065D58
_08065D4E:
	cmp r0, r1
	beq _08065D56
	movs r0, 0x2
	b _08065D58
_08065D56:
	movs r0, 0x1
_08065D58:
	pop {r1}
	bx r1
	thumb_func_end compare_012

	thumb_func_start s1B_cmp_u8_var_var
s1B_cmp_u8_var_var: @ 8065D5C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r0, [r2]
	lsls r0, 2
	adds r3, r4, 0
	adds r3, 0x64
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	lsls r1, 2
	adds r3, r1
	ldrb r1, [r3]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s1B_cmp_u8_var_var

	thumb_func_start s1C_cmp_u8_var_const
s1C_cmp_u8_var_const: @ 8065D8C
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, 0x64
	adds r0, r1
	ldrb r0, [r0]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s1C_cmp_u8_var_const

	thumb_func_start s1D_cmp_u8_var_ptr
s1D_cmp_u8_var_ptr: @ 8065DB4
	push {r4,r5,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	lsls r1, 2
	adds r0, 0x64
	adds r0, r1
	ldrb r5, [r0]
	adds r2, 0x1
	str r2, [r4, 0x8]
	adds r0, r4, 0
	bl script_read_word
	ldrb r1, [r0]
	adds r0, r5, 0
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s1D_cmp_u8_var_ptr

	thumb_func_start s1E_cmp_u8_ptr_var
s1E_cmp_u8_ptr_var: @ 8065DE0
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	ldrb r0, [r0]
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	lsls r2, 2
	adds r1, r4, 0
	adds r1, 0x64
	adds r1, r2
	ldrb r1, [r1]
	adds r3, 0x1
	str r3, [r4, 0x8]
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s1E_cmp_u8_ptr_var

	thumb_func_start s1F_cmp_u8_ptr_const
s1F_cmp_u8_ptr_const: @ 8065E0C
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	ldrb r0, [r0]
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s1F_cmp_u8_ptr_const

	thumb_func_start s20_cmp_u8_ptr_ptr
s20_cmp_u8_ptr_ptr: @ 8065E2C
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_word
	ldrb r5, [r0]
	adds r0, r4, 0
	bl script_read_word
	ldrb r1, [r0]
	adds r0, r5, 0
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s20_cmp_u8_ptr_ptr

	thumb_func_start s21_cmp_u16_gvar_const
s21_cmp_u16_gvar_const: @ 8065E50
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	ldrh r5, [r0]
	adds r0, r4, 0
	bl script_read_halfword
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s21_cmp_u16_gvar_const

	thumb_func_start s22_cmp_u16_gvar_gvar
s22_cmp_u16_gvar_gvar: @ 8065E80
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	ldrh r2, [r5]
	ldrh r1, [r0]
	adds r0, r2, 0
	bl compare_012
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s22_cmp_u16_gvar_gvar

	thumb_func_start s17_u16_gvar_add_const
s17_u16_gvar_add_const: @ 8065EB4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r4, r0, 0
	adds r0, r5, 0
	bl script_read_halfword
	ldrh r1, [r4]
	adds r0, r1
	strh r0, [r4]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s17_u16_gvar_add_const

	thumb_func_start sub_8065EDC
sub_8065EDC: @ 8065EDC
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldrh r1, [r5]
	subs r1, r0
	strh r1, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8065EDC

	thumb_func_start s8F_get_random_val
s8F_get_random_val: @ 8065F0C
	push {r4,r5,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r5, _08065F3C
	bl Random
	lsls r0, 16
	lsrs r0, 16
	adds r1, r4, 0
	bl __umodsi3
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065F3C: .4byte 0x0202e8dc
	thumb_func_end s8F_get_random_val

	thumb_func_start sub_8065F40
sub_8065F40: @ 8065F40
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	ldr r5, _08065F80
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80A9424
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065F80: .4byte 0x0202e8dc
	thumb_func_end sub_8065F40

	thumb_func_start sub_8065F84
sub_8065F84: @ 8065F84
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	ldr r5, _08065FC4
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80A9538
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08065FC4: .4byte 0x0202e8dc
	thumb_func_end sub_8065F84

	thumb_func_start sub_8065FC8
sub_8065FC8: @ 8065FC8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	ldr r5, _08066008
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80A9344
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066008: .4byte 0x0202e8dc
	thumb_func_end sub_8065FC8

	thumb_func_start sub_806600C
sub_806600C: @ 806600C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	ldr r5, _0806604C
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_80A92D4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806604C: .4byte 0x0202e8dc
	thumb_func_end sub_806600C

	thumb_func_start s48_get_item_type
s48_get_item_type: @ 8066050
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _08066078
	bl sub_80A9670
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066078: .4byte 0x0202e8dc
	thumb_func_end s48_get_item_type

	thumb_func_start sub_806607C
sub_806607C: @ 806607C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r5, _080660BC
	adds r0, r4, 0
	bl sub_80A9760
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_080660BC: .4byte 0x0202e8dc
	thumb_func_end sub_806607C

	thumb_func_start sub_80660C0
sub_80660C0: @ 80660C0
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	ldr r5, _08066100
	adds r0, r4, 0
	bl sub_80A9718
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066100: .4byte 0x0202e8dc
	thumb_func_end sub_80660C0

	thumb_func_start sub_8066104
sub_8066104: @ 8066104
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _0806612C
	lsls r0, 24
	lsrs r0, 24
	bl IsThereStorageSpaceForDecoration
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806612C: .4byte 0x0202e8dc
	thumb_func_end sub_8066104

	thumb_func_start sub_8066130
sub_8066130: @ 8066130
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _08066158
	lsls r0, 24
	lsrs r0, 24
	bl sub_81340A8
	lsls r0, 24
	asrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066158: .4byte 0x0202e8dc
	thumb_func_end sub_8066130

	thumb_func_start sub_806615C
sub_806615C: @ 806615C
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _08066184
	lsls r0, 24
	lsrs r0, 24
	bl sub_8134074
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066184: .4byte 0x0202e8dc
	thumb_func_end sub_806615C

	thumb_func_start sub_8066188
sub_8066188: @ 8066188
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _080661B0
	lsls r0, 24
	lsrs r0, 24
	bl sub_8133FE4
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080661B0: .4byte 0x0202e8dc
	thumb_func_end sub_8066188

	thumb_func_start s29_flag_set
s29_flag_set: @ 80661B4
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl FlagSet
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s29_flag_set

	thumb_func_start s2A_flag_clear
s2A_flag_clear: @ 80661C8
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl FlagReset
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s2A_flag_clear

	thumb_func_start s2B_flag_check
s2B_flag_check: @ 80661DC
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl FlagGet
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s2B_flag_check

	thumb_func_start sC3_unknown
sC3_unknown: @ 80661F8
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sav12_xor_increment
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sC3_unknown

	thumb_func_start s9A_unknown
s9A_unknown: @ 8066210
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl sub_8081594
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end s9A_unknown

	thumb_func_start sub_806622C
sub_806622C: @ 806622C
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_8053CE4
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806622C

	thumb_func_start sub_8066248
sub_8066248: @ 8066248
	push {lr}
	ldr r0, _0806625C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08066260
	movs r0, 0
	b _08066262
	.align 2, 0
_0806625C: .4byte 0x0202f388
_08066260:
	movs r0, 0x1
_08066262:
	pop {r1}
	bx r1
	thumb_func_end sub_8066248

	thumb_func_start s97_screen_special_effect
s97_screen_special_effect: @ 8066268
	push {r4,lr}
	adds r4, r0, 0
	ldr r1, [r4, 0x8]
	ldrb r0, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	movs r1, 0
	bl fade_screen
	ldr r1, _0806628C
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806628C: .4byte sub_8066248
	thumb_func_end s97_screen_special_effect

	thumb_func_start sub_8066290
sub_8066290: @ 8066290
	push {r4,lr}
	adds r4, r0, 0
	ldr r2, [r4, 0x8]
	ldrb r0, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	bl fade_screen
	ldr r1, _080662B8
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080662B8: .4byte sub_8066248
	thumb_func_end sub_8066290

	thumb_func_start s28_pause_asm
s28_pause_asm: @ 80662BC
	push {lr}
	ldr r1, _080662D0
	ldrh r0, [r1]
	subs r0, 0x1
	strh r0, [r1]
	lsls r0, 16
	cmp r0, 0
	beq _080662D4
	movs r0, 0
	b _080662D6
	.align 2, 0
_080662D0: .4byte 0x0202e8b4
_080662D4:
	movs r0, 0x1
_080662D6:
	pop {r1}
	bx r1
	thumb_func_end s28_pause_asm

	thumb_func_start s28_pause
s28_pause: @ 80662DC
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	ldr r1, _080662F8
	strh r0, [r1]
	ldr r1, _080662FC
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080662F8: .4byte 0x0202e8b4
_080662FC: .4byte s28_pause_asm
	thumb_func_end s28_pause

	thumb_func_start s2C_unknown
s2C_unknown: @ 8066300
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl RtcInitLocalTimeOffset
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s2C_unknown

	thumb_func_start s2D_unknown
s2D_unknown: @ 8066338
	push {lr}
	bl InTrainerHill
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s2D_unknown

	thumb_func_start s2E_unknown
s2E_unknown: @ 8066344
	push {lr}
	bl RtcCalcLocalTime
	ldr r2, _0806636C
	ldr r1, _08066370
	movs r0, 0x2
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	ldr r2, _08066374
	movs r0, 0x3
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	ldr r2, _08066378
	movs r0, 0x4
	ldrsb r0, [r1, r0]
	strh r0, [r2]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806636C: .4byte 0x0202e8c4
_08066370: .4byte 0x03004038
_08066374: .4byte 0x0202e8c6
_08066378: .4byte 0x0202e8c8
	thumb_func_end s2E_unknown

	thumb_func_start sA4_set_weather_data
sA4_set_weather_data: @ 806637C
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_80806B4
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sA4_set_weather_data

	thumb_func_start sA3_set_standard_weather_data
sA3_set_standard_weather_data: @ 8066398
	push {lr}
	bl sub_80806E4
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sA3_set_standard_weather_data

	thumb_func_start sub_80663A4
sub_80663A4: @ 80663A4
	push {lr}
	bl sub_808073C
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80663A4

	thumb_func_start sA6_activate_per_step_callback_eg_ash
sA6_activate_per_step_callback_eg_ash: @ 80663B0
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	adds r0, r2, 0
	bl activate_per_step_callback
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sA6_activate_per_step_callback_eg_ash

	thumb_func_start sub_80663C8
sub_80663C8: @ 80663C8
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_8053D14
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80663C8

	thumb_func_start s39_warp_sfx
s39_warp_sfx: @ 80663E4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	bl sub_8080E88
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s39_warp_sfx

	thumb_func_start s3A_warp_new_music
s3A_warp_new_music: @ 806646C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	bl sp13E_warp_to_last_warp
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s3A_warp_new_music

	thumb_func_start s3B_warp_keep_music
s3B_warp_keep_music: @ 80664F4
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	bl sub_8080EF0
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s3B_warp_keep_music

	thumb_func_start sub_806657C
sub_806657C: @ 806657C
	push {r4-r6,lr}
	sub sp, 0x8
	ldr r1, [r0, 0x8]
	ldrb r6, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	mov r4, sp
	adds r4, 0x6
	add r0, sp, 0x4
	adds r1, r4, 0
	bl PlayerGetDestCoords
	cmp r6, 0xFF
	bne _080665BA
	cmp r5, 0xFF
	bne _080665BA
	add r0, sp, 0x4
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	asrs r1, 16
	bl sub_8053720
	b _080665DE
_080665BA:
	lsls r0, r6, 24
	asrs r0, 24
	lsls r1, r5, 24
	asrs r1, 24
	movs r2, 0x1
	negs r2, r2
	add r3, sp, 0x4
	ldrb r3, [r3]
	subs r3, 0x7
	lsls r3, 24
	asrs r3, 24
	ldrb r4, [r4]
	subs r4, 0x7
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	bl warp1_set
_080665DE:
	bl sp13F_fall_to_last_warp
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806657C

	thumb_func_start s3D_warp_v4
s3D_warp_v4: @ 80665F0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	bl sub_8080F68
	bl player_avatar_init_params_reset
	movs r0, 0x1
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s3D_warp_v4

	thumb_func_start s3E_set_new_map
s3E_set_new_map: @ 8066678
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl warp1_set
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s3E_set_new_map

	thumb_func_start s3F_set_new_map_DMA
s3F_set_new_map_DMA: @ 80666F8
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	str r4, [sp]
	lsls r0, 24
	asrs r0, 24
	str r0, [sp, 0x4]
	movs r0, 0
	mov r1, r9
	mov r2, r8
	adds r3, r6, 0
	bl saved_warp2_set_2
	movs r0, 0
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s3F_set_new_map_DMA

	thumb_func_start sub_806677C
sub_806677C: @ 806677C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_8053690
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_806677C

	thumb_func_start sub_80667FC
sub_80667FC: @ 80667FC
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_80536E4
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80667FC

	thumb_func_start sC4_unknown
sC4_unknown: @ 806687C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r1, r0, 0x1
	str r1, [r5, 0x8]
	ldrb r6, [r0, 0x1]
	adds r1, 0x1
	str r1, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	mov r1, r9
	lsls r1, 24
	asrs r1, 24
	mov r9, r1
	mov r1, r8
	lsls r1, 24
	asrs r1, 24
	mov r8, r1
	lsls r6, 24
	asrs r6, 24
	lsls r4, 24
	asrs r4, 24
	lsls r0, 24
	asrs r0, 24
	str r0, [sp]
	mov r0, r9
	adds r2, r6, 0
	adds r3, r4, 0
	bl sub_805363C
	movs r0, 0
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sC4_unknown

	thumb_func_start sub_80668FC
sub_80668FC: @ 80668FC
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r5, r0, 0
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	ldr r2, _08066930
	ldrh r1, [r2]
	strh r1, [r5]
	ldrh r1, [r2, 0x2]
	strh r1, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066930: .4byte 0x02025734
	thumb_func_end sub_80668FC

	thumb_func_start s43_get_player_party_count
s43_get_player_party_count: @ 8066934
	push {r4,lr}
	ldr r4, _0806694C
	bl calc_player_party_count
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806694C: .4byte 0x0202e8dc
	thumb_func_end s43_get_player_party_count

	thumb_func_start s2F_music_play
s2F_music_play: @ 8066950
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl audio_play
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s2F_music_play

	thumb_func_start s30_music_check_asm
s30_music_check_asm: @ 8066964
	push {lr}
	bl mplay_has_finished_maybe
	lsls r0, 24
	cmp r0, 0
	beq _08066974
	movs r0, 0
	b _08066976
_08066974:
	movs r0, 0x1
_08066976:
	pop {r1}
	bx r1
	thumb_func_end s30_music_check_asm

	thumb_func_start sub_806697C
sub_806697C: @ 806697C
	push {lr}
	ldr r1, _0806698C
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_0806698C: .4byte s30_music_check_asm
	thumb_func_end sub_806697C

	thumb_func_start s31_fanfare_play
s31_fanfare_play: @ 8066990
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl fanfare_play
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s31_fanfare_play

	thumb_func_start s32_fanfare_wait_asm
s32_fanfare_wait_asm: @ 80669A4
	push {lr}
	bl task_is_not_running_overworld_fanfare
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end s32_fanfare_wait_asm

	thumb_func_start sub_80669B4
sub_80669B4: @ 80669B4
	push {lr}
	ldr r1, _080669C4
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080669C4: .4byte s32_fanfare_wait_asm
	thumb_func_end sub_80669B4

	thumb_func_start s33_play_music
s33_play_music: @ 80669C8
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r2, r0, 16
	adds r5, r2, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0x1
	bne _080669E8
	adds r0, r2, 0
	bl sav1_set_battle_music_maybe
_080669E8:
	adds r0, r5, 0
	bl current_map_music_set
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s33_play_music

	thumb_func_start s34_unknown
s34_unknown: @ 80669F8
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl sav1_set_battle_music_maybe
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s34_unknown

	thumb_func_start s35_fade_to_default
s35_fade_to_default: @ 8066A0C
	push {lr}
	bl sub_8053F84
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s35_fade_to_default

	thumb_func_start s36_fade_to_music
s36_fade_to_music: @ 8066A18
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl sub_8053FB0
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s36_fade_to_music

	thumb_func_start s37_fadeout
s37_fadeout: @ 8066A2C
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	beq _08066A46
	lsls r0, r1, 26
	lsrs r0, 24
	bl sub_8074FB8
	b _08066A4C
_08066A46:
	movs r0, 0x4
	bl sub_8074FB8
_08066A4C:
	ldr r1, _08066A5C
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066A5C: .4byte sub_8074FD0
	thumb_func_end s37_fadeout

	thumb_func_start s38_fadein
s38_fadein: @ 8066A60
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	cmp r2, 0
	beq _08066A78
	lsls r0, r2, 26
	lsrs r0, 24
	bl sub_8074FF8
	b _08066A7E
_08066A78:
	movs r0, 0x4
	bl sub_8074FF8
_08066A7E:
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s38_fadein

	thumb_func_start s4F_execute_movement
s4F_execute_movement: @ 8066A84
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_word
	adds r3, r0, 0
	lsls r0, r4, 24
	lsrs r0, 24
	ldr r2, _08066ABC
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl exec_movement
	ldr r0, _08066AC0
	strh r4, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066ABC: .4byte 0x02025734
_08066AC0: .4byte 0x0202e8b6
	thumb_func_end s4F_execute_movement

	thumb_func_start s50_execute_movement_remote
s50_execute_movement_remote: @ 8066AC4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_word
	adds r3, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	lsls r0, r4, 24
	lsrs r0, 24
	bl exec_movement
	ldr r0, _08066B04
	strh r4, [r0]
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08066B04: .4byte 0x0202e8b6
	thumb_func_end s50_execute_movement_remote

	thumb_func_start s51a_0806B288
s51a_0806B288: @ 8066B08
	push {lr}
	ldr r0, _08066B24
	ldrb r0, [r0]
	ldr r1, _08066B28
	ldrb r1, [r1]
	ldr r2, _08066B2C
	ldrb r2, [r2]
	bl sub_80A212C
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_08066B24: .4byte 0x0202e8b6
_08066B28: .4byte 0x0202e8ba
_08066B2C: .4byte 0x0202e8b8
	thumb_func_end s51a_0806B288

	thumb_func_start s51_waitmove
s51_waitmove: @ 8066B30
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08066B4C
	ldr r0, _08066B70
	strh r1, [r0]
_08066B4C:
	ldr r1, _08066B74
	ldr r2, _08066B78
	movs r0, 0x4
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _08066B7C
	movs r0, 0x5
	ldrsb r0, [r2, r0]
	strh r0, [r1]
	ldr r1, _08066B80
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066B70: .4byte 0x0202e8b6
_08066B74: .4byte 0x0202e8b8
_08066B78: .4byte 0x02025734
_08066B7C: .4byte 0x0202e8ba
_08066B80: .4byte s51a_0806B288
	thumb_func_end s51_waitmove

	thumb_func_start s52_waitmove_remote
s52_waitmove_remote: @ 8066B84
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _08066BA0
	ldr r0, _08066BC8
	strh r1, [r0]
_08066BA0:
	ldr r0, [r4, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	ldr r0, _08066BCC
	strh r2, [r0]
	ldr r0, _08066BD0
	strh r1, [r0]
	ldr r1, _08066BD4
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066BC8: .4byte 0x0202e8b6
_08066BCC: .4byte 0x0202e8b8
_08066BD0: .4byte 0x0202e8ba
_08066BD4: .4byte s51a_0806B288
	thumb_func_end s52_waitmove_remote

	thumb_func_start sub_8066BD8
sub_8066BD8: @ 8066BD8
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066BFC
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl RemoveFieldObjectByLocalIdAndMap
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08066BFC: .4byte 0x02025734
	thumb_func_end sub_8066BD8

	thumb_func_start s54_hide_sprite_set_coords
s54_hide_sprite_set_coords: @ 8066C00
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl RemoveFieldObjectByLocalIdAndMap
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s54_hide_sprite_set_coords

	thumb_func_start sub_8066C30
sub_8066C30: @ 8066C30
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066C54
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl show_sprite
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08066C54: .4byte 0x02025734
	thumb_func_end sub_8066C30

	thumb_func_start s56_show_sprite_set_coords
s56_show_sprite_set_coords: @ 8066C58
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl show_sprite
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s56_show_sprite_set_coords

	thumb_func_start s57_move_sprites
s57_move_sprites: @ 8066C88
	push {r4-r6,lr}
	sub sp, 0x4
	adds r6, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r5, 24
	lsrs r5, 24
	ldr r2, _08066CE8
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	lsls r4, 16
	asrs r4, 16
	lsls r0, 16
	asrs r0, 16
	str r0, [sp]
	adds r0, r5, 0
	adds r3, r4, 0
	bl sub_805C0F8
	movs r0, 0
	add sp, 0x4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08066CE8: .4byte 0x02025734
	thumb_func_end s57_move_sprites

	thumb_func_start s63_new_sprite_location_permanent
s63_new_sprite_location_permanent: @ 8066CEC
	push {r4-r6,lr}
	adds r6, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r2, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 16
	asrs r4, 16
	lsls r2, 16
	asrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl update_saveblock1_field_object_coords
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end s63_new_sprite_location_permanent

	thumb_func_start s64_set_sprite_top_left_corner
s64_set_sprite_top_left_corner: @ 8066D44
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066D68
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl sub_805C78C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08066D68: .4byte 0x02025734
	thumb_func_end s64_set_sprite_top_left_corner

	thumb_func_start s58_npc_f1_clear_x20
s58_npc_f1_clear_x20: @ 8066D6C
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0
	bl npc_by_local_id_and_map_set_field_1_bit_x20
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s58_npc_f1_clear_x20

	thumb_func_start s59_npc_f1_set_x20
s59_npc_f1_set_x20: @ 8066D9C
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	movs r3, 0x1
	bl npc_by_local_id_and_map_set_field_1_bit_x20
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s59_npc_f1_set_x20

	thumb_func_start sA8_unknown
sA8_unknown: @ 8066DCC
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r5, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r5, 0x8]
	ldrb r1, [r3]
	adds r4, r3, 0x1
	str r4, [r5, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r5, 0x8]
	lsls r0, 24
	lsrs r0, 24
	adds r3, 0x53
	lsls r3, 24
	lsrs r3, 24
	bl sub_805BCF0
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sA8_unknown

	thumb_func_start sA9_unknown
sA9_unknown: @ 8066E08
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl sub_805BD48
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sA9_unknown

	thumb_func_start s5A_face_player
s5A_face_player: @ 8066E38
	push {r4,lr}
	ldr r2, _08066E68
	ldr r0, _08066E6C
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r2
	ldrb r0, [r4]
	lsls r0, 31
	cmp r0, 0
	beq _08066E60
	bl player_get_direction_lower_nybble
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl FieldObjectFaceOppositeDirection
_08066E60:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066E68: .4byte 0x030048a0
_08066E6C: .4byte 0x03004ae0
	thumb_func_end s5A_face_player

	thumb_func_start s5B_npc_set_direction
s5B_npc_set_direction: @ 8066E70
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, [r4, 0x8]
	ldrb r3, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08066EA0
	ldrb r1, [r2, 0x5]
	ldrb r2, [r2, 0x4]
	bl FieldObjectTurnByLocalIdAndMap
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066EA0: .4byte 0x02025734
	thumb_func_end s5B_npc_set_direction

	thumb_func_start s65_set_sprite_behaviour
s65_set_sprite_behaviour: @ 8066EA4
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r2, [r4, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r4, 0x8]
	lsls r0, 24
	lsrs r0, 24
	bl update_saveblock1_field_object_movement_behavior
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s65_set_sprite_behaviour

	thumb_func_start sAA_create_new_sprite
sAA_create_new_sprite: @ 8066ECC
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r5, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r3, r0, 0
	ldr r0, [r5, 0x8]
	ldrb r2, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r5, 0x8]
	lsls r4, 16
	asrs r4, 16
	lsls r3, 16
	asrs r3, 16
	str r2, [sp]
	str r1, [sp, 0x4]
	mov r0, r8
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_805B410
	movs r0, 0
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sAA_create_new_sprite

	thumb_func_start sAB_unknown
sAB_unknown: @ 8066F3C
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl sub_8064990
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sAB_unknown

	thumb_func_start sub_8066F58
sub_8066F58: @ 8066F58
	push {r4,lr}
	adds r4, r0, 0
	bl is_c1_link_related_active
	cmp r0, 0
	bne _08066F78
	bl sub_8064D20
	ldr r1, _08066F74
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	b _08066F7A
	.align 2, 0
_08066F74: .4byte sub_8064CFC
_08066F78:
	movs r0, 0
_08066F7A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8066F58

	thumb_func_start sub_8066F80
sub_8066F80: @ 8066F80
	push {r4,lr}
	adds r4, r0, 0
	bl is_c1_link_related_active
	cmp r0, 0
	beq _08066F90
	movs r0, 0
	b _08066FCE
_08066F90:
	ldr r2, _08066FB4
	ldr r0, _08066FB8
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrb r0, [r0]
	lsls r0, 31
	cmp r0, 0
	beq _08066FC0
	bl sub_8064DD8
	ldr r1, _08066FBC
	adds r0, r4, 0
	bl script_setup_asm_script
	b _08066FCC
	.align 2, 0
_08066FB4: .4byte 0x030048a0
_08066FB8: .4byte 0x03004ae0
_08066FBC: .4byte sub_8064DB4
_08066FC0:
	bl sub_8064D20
	ldr r1, _08066FD4
	adds r0, r4, 0
	bl script_setup_asm_script
_08066FCC:
	movs r0, 0x1
_08066FCE:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066FD4: .4byte sub_8064CFC
	thumb_func_end sub_8066F80

	thumb_func_start s6B_release
s6B_release: @ 8066FD8
	push {lr}
	bl textbox_close
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	ldr r1, _0806700C
	adds r0, r1
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80A2178
	bl sub_806451C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806700C: .4byte 0x030048a0
	thumb_func_end s6B_release

	thumb_func_start s6C_release_2
s6C_release_2: @ 8067010
	push {r4,lr}
	bl textbox_close
	ldr r4, _08067060
	ldr r0, _08067064
	ldrb r1, [r0]
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r4
	ldrb r0, [r1]
	lsls r0, 31
	cmp r0, 0
	beq _08067032
	adds r0, r1, 0
	bl FieldObjectClearAnimIfSpecialAnimFinished
_08067032:
	movs r0, 0xFF
	movs r1, 0
	movs r2, 0
	bl GetFieldObjectIdByLocalIdAndMap
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r0, r1, 3
	adds r0, r1
	lsls r0, 2
	adds r0, r4
	bl FieldObjectClearAnimIfSpecialAnimFinished
	bl sub_80A2178
	bl sub_806451C
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067060: .4byte 0x030048a0
_08067064: .4byte 0x03004ae0
	thumb_func_end s6C_release_2

	thumb_func_start s67_execute_box
s67_execute_box: @ 8067068
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	cmp r0, 0
	bne _08067076
	ldr r0, [r4, 0x64]
_08067076:
	bl box_related_two__2
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s67_execute_box

	thumb_func_start s9B_unknown
s9B_unknown: @ 8067084
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	cmp r0, 0
	bne _08067092
	ldr r0, [r4, 0x64]
_08067092:
	bl box_related_two__3
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s9B_unknown

	thumb_func_start sub_80670A0
sub_80670A0: @ 80670A0
	push {lr}
	ldr r1, _080670B0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080670B0: .4byte sub_8064C84
	thumb_func_end sub_80670A0

	thumb_func_start s68_close_box
s68_close_box: @ 80670B4
	push {lr}
	bl textbox_close
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s68_close_box

	thumb_func_start sub_80670C0
sub_80670C0: @ 80670C0
	push {lr}
	ldr r0, _080670DC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	bne _080670E0
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	bne _080670E0
	movs r0, 0
	b _080670E2
	.align 2, 0
_080670DC: .4byte 0x03001770
_080670E0:
	movs r0, 0x1
_080670E2:
	pop {r1}
	bx r1
	thumb_func_end sub_80670C0

	thumb_func_start sub_80670E8
sub_80670E8: @ 80670E8
	push {lr}
	ldr r1, _080670F8
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_080670F8: .4byte sub_80670C0
	thumb_func_end sub_80670E8

	thumb_func_start s6E_yes_no
s6E_yes_no: @ 80670FC
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl yes_no_box
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806711E
	movs r0, 0
	b _08067124
_0806711E:
	bl sub_80655F0
	movs r0, 0x1
_08067124:
	pop {r1}
	bx r1
	thumb_func_end s6E_yes_no

	thumb_func_start sub_8067128
sub_8067128: @ 8067128
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl sub_80B5054
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08067156
	movs r0, 0
	b _0806715C
_08067156:
	bl sub_80655F0
	movs r0, 0x1
_0806715C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067128

	thumb_func_start sub_8067164
sub_8067164: @ 8067164
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	ldr r2, [r0, 0x8]
	ldrb r1, [r2]
	mov r8, r1
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r5, r3, 0x1
	str r5, [r0, 0x8]
	ldrb r6, [r3, 0x1]
	adds r4, r5, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r5, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	str r6, [sp]
	mov r0, r8
	bl sub_80B50B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080671A2
	movs r0, 0
	b _080671A8
_080671A2:
	bl sub_80655F0
	movs r0, 0x1
_080671A8:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8067164

	thumb_func_start sub_80671B4
sub_80671B4: @ 80671B4
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl DrawDefaultWindow
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80671B4

	thumb_func_start sub_80671E0
sub_80671E0: @ 80671E0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x4
	ldr r2, [r0, 0x8]
	ldrb r1, [r2]
	mov r8, r1
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r5, r3, 0x1
	str r5, [r0, 0x8]
	ldrb r6, [r3, 0x1]
	adds r4, r5, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r5, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	str r6, [sp]
	mov r0, r8
	bl sub_80B5578
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806721E
	movs r0, 0
	b _08067224
_0806721E:
	bl sub_80655F0
	movs r0, 0x1
_08067224:
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80671E0

	thumb_func_start sub_8067230
sub_8067230: @ 8067230
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl Reset
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067230

	thumb_func_start s6F_multichoice
s6F_multichoice: @ 806725C
	push {r4,r5,lr}
	ldr r2, [r0, 0x8]
	ldrb r5, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r3, r2, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r2, 0x1]
	adds r4, r3, 0x1
	str r4, [r0, 0x8]
	ldrb r3, [r3, 0x1]
	adds r4, 0x1
	str r4, [r0, 0x8]
	adds r0, r5, 0
	bl Multichoice
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806728A
	movs r0, 0
	b _08067290
_0806728A:
	bl sub_80655F0
	movs r0, 0x1
_08067290:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s6F_multichoice

	thumb_func_start sub_8067298
sub_8067298: @ 8067298
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r3, [r4, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r4, 0x8]
	bl sub_80B58C4
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8067298

	thumb_func_start s76_close_picture_box
s76_close_picture_box: @ 80672C8
	push {r4,lr}
	adds r4, r0, 0
	bl picbox_close
	adds r1, r0, 0
	cmp r1, 0
	beq _080672E0
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	b _080672E2
_080672E0:
	movs r0, 0
_080672E2:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s76_close_picture_box

	thumb_func_start sub_80672E8
sub_80672E8: @ 80672E8
	push {lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	cmp r2, 0
	beq _080672FC
	adds r0, r2, 0
	bl sub_8106630
_080672FC:
	bl sub_80C4F10
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80672E8

	thumb_func_start sub_806730C
sub_806730C: @ 806730C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	bl script_read_word
	adds r1, r0, 0
	ldrb r5, [r1]
	ldrb r6, [r1, 0x1]
	ldrb r0, [r1, 0x2]
	mov r8, r0
	ldrb r0, [r1, 0x3]
	mov r9, r0
	ldrb r0, [r1, 0x4]
	mov r10, r0
	ldrb r7, [r1, 0x5]
	ldr r4, _08067360
	adds r1, 0x6
	adds r0, r4, 0
	bl StringBraille
	adds r0, r5, 0
	adds r1, r6, 0
	mov r2, r8
	mov r3, r9
	bl DrawDefaultWindow
	adds r0, r4, 0
	mov r1, r10
	adds r2, r7, 0
	bl Print
	movs r0, 0
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08067360: .4byte 0x020234cc
	thumb_func_end sub_806730C

	thumb_func_start sBD_virtual_message
sBD_virtual_message: @ 8067364
	push {lr}
	bl script_read_word
	ldr r1, _0806737C
	ldr r1, [r1]
	subs r0, r1
	bl box_related_two__2
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_0806737C: .4byte 0x0202e8b0
	thumb_func_end sBD_virtual_message

	thumb_func_start s7D_load_pokename
s7D_load_pokename: @ 8067380
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080673B8
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	movs r1, 0xB
	muls r1, r0
	ldr r0, _080673BC
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080673B8: .4byte gUnknown_083762F0
_080673BC: .4byte gSpeciesNames
	thumb_func_end s7D_load_pokename

	thumb_func_start s7E_load_first_pokenames
s7E_load_first_pokenames: @ 80673C0
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldr r0, _08067400
	lsls r2, 2
	adds r2, r0
	ldr r4, [r2]
	bl sub_810F87C
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x64
	muls r0, r1
	ldr r1, _08067404
	adds r0, r1
	movs r1, 0xB
	movs r2, 0
	bl PokemonGetField
	movs r1, 0xB
	muls r1, r0
	ldr r0, _08067408
	adds r1, r0
	adds r0, r4, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067400: .4byte gUnknown_083762F0
_08067404: .4byte 0x03004360
_08067408: .4byte gSpeciesNames
	thumb_func_end s7E_load_first_pokenames

	thumb_func_start s7F_load_pokename_team
s7F_load_pokename_team: @ 806740C
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	movs r1, 0x64
	muls r0, r1
	ldr r1, _0806744C
	adds r0, r1
	ldr r1, _08067450
	lsls r4, 2
	adds r4, r1
	ldr r4, [r4]
	movs r1, 0x2
	adds r2, r4, 0
	bl PokemonGetField
	adds r0, r4, 0
	bl StringGetEnd10
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806744C: .4byte 0x03004360
_08067450: .4byte gUnknown_083762F0
	thumb_func_end s7F_load_pokename_team

	thumb_func_start s80_load_item_name
s80_load_item_name: @ 8067454
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08067484
	lsls r4, 2
	adds r4, r1
	ldr r1, [r4]
	bl itemid_copy_name
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067484: .4byte gUnknown_083762F0
	thumb_func_end s80_load_item_name

	thumb_func_start sub_8067488
sub_8067488: @ 8067488
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	ldr r0, _080674BC
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	lsrs r1, 11
	ldr r2, _080674C0
	adds r1, r2
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080674BC: .4byte gUnknown_083762F0
_080674C0: .4byte gUnknown_083EB6C5
	thumb_func_end sub_8067488

	thumb_func_start s82_load_item_name
s82_load_item_name: @ 80674C4
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _080674FC
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	movs r1, 0xD
	muls r1, r0
	ldr r0, _08067500
	adds r1, r0
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080674FC: .4byte gUnknown_083762F0
_08067500: .4byte gMoveNames
	thumb_func_end s82_load_item_name

	thumb_func_start s83_load_textvar_var
s83_load_textvar_var: @ 8067504
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r4, 0
	bl sub_80BF0B8
	adds r3, r0, 0
	lsls r3, 24
	lsrs r3, 24
	ldr r0, _08067544
	lsls r5, 2
	adds r5, r0
	ldr r0, [r5]
	adds r1, r4, 0
	movs r2, 0
	bl ConvertIntToDecimalStringN
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_08067544: .4byte gUnknown_083762F0
	thumb_func_end s83_load_textvar_var

	thumb_func_start s84_load_textvar_std_expression
s84_load_textvar_std_expression: @ 8067548
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	ldr r1, _08067580
	lsls r4, 2
	adds r4, r1
	ldr r2, [r4]
	ldr r1, _08067584
	lsrs r0, 14
	adds r0, r1
	ldr r1, [r0]
	adds r0, r2, 0
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067580: .4byte gUnknown_083762F0
_08067584: .4byte gUnknown_083CE048
	thumb_func_end s84_load_textvar_std_expression

	thumb_func_start s85_load_textvar_pointer
s85_load_textvar_pointer: @ 8067588
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_word
	adds r1, r0, 0
	ldr r0, _080675AC
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080675AC: .4byte gUnknown_083762F0
	thumb_func_end s85_load_textvar_pointer

	thumb_func_start sBE_virtual_load_text
sBE_virtual_load_text: @ 80675B0
	push {lr}
	bl script_read_word
	adds r1, r0, 0
	ldr r0, _080675CC
	ldr r0, [r0]
	subs r1, r0
	ldr r0, _080675D0
	bl StringExpandPlaceholders
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080675CC: .4byte 0x0202e8b0
_080675D0: .4byte 0x020234cc
	thumb_func_end sBE_virtual_load_text

	thumb_func_start sBF_virtual_load_textbuffer
sBF_virtual_load_textbuffer: @ 80675D4
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_word
	adds r1, r0, 0
	ldr r0, _08067600
	ldr r0, [r0]
	subs r1, r0
	ldr r0, _08067604
	lsls r4, 2
	adds r4, r0
	ldr r0, [r4]
	bl StringCopy
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067600: .4byte 0x0202e8b0
_08067604: .4byte gUnknown_083762F0
	thumb_func_end sBF_virtual_load_textbuffer

	thumb_func_start s79_give_pokemon
s79_give_pokemon: @ 8067608
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x8
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r6, r0, 0
	lsls r6, 16
	lsrs r6, 16
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	mov r9, r1
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl script_read_word
	mov r8, r0
	adds r0, r4, 0
	bl script_read_word
	ldr r1, [r4, 0x8]
	ldrb r2, [r1]
	adds r1, 0x1
	str r1, [r4, 0x8]
	ldr r4, _08067684
	str r0, [sp]
	str r2, [sp, 0x4]
	adds r0, r6, 0
	mov r1, r9
	adds r2, r5, 0
	mov r3, r8
	bl sub_80C5374
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	add sp, 0x8
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08067684: .4byte 0x0202e8dc
	thumb_func_end s79_give_pokemon

	thumb_func_start s7A_create_egg
s7A_create_egg: @ 8067688
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r4, _080676B0
	bl sub_80C53F8
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080676B0: .4byte 0x0202e8dc
	thumb_func_end s7A_create_egg

	thumb_func_start s7B_change_pokedata_AP
s7B_change_pokedata_AP: @ 80676B4
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	adds r2, r4, 0
	bl sub_80C5530
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end s7B_change_pokedata_AP

	thumb_func_start sub_80676E0
sub_80676E0: @ 80676E0
	push {r4-r7,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r7, r0, 16
	ldr r1, _080676F4
	movs r0, 0x6
	strh r0, [r1]
	movs r6, 0
	b _0806772E
	.align 2, 0
_080676F4: .4byte 0x0202e8dc
_080676F8:
	adds r0, r4, 0
	movs r1, 0x2D
	bl PokemonGetField
	cmp r0, 0
	bne _08067728
	adds r0, r4, 0
	adds r1, r7, 0
	bl pokemon_has_move
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08067728
	ldr r0, _08067720
	strh r6, [r0]
	ldr r0, _08067724
	strh r5, [r0]
	b _0806774E
	.align 2, 0
_08067720: .4byte 0x0202e8dc
_08067724: .4byte 0x0202e8cc
_08067728:
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
_0806772E:
	cmp r6, 0x5
	bhi _0806774E
	movs r0, 0x64
	adds r1, r6, 0
	muls r1, r0
	ldr r0, _08067758
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xB
	movs r2, 0
	bl PokemonGetField
	lsls r0, 16
	lsrs r5, r0, 16
	cmp r5, 0
	bne _080676F8
_0806774E:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	.align 2, 0
_08067758: .4byte 0x03004360
	thumb_func_end sub_80676E0

	thumb_func_start sub_806775C
sub_806775C: @ 806775C
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _0806777A
	ldr r0, _08067784
	adds r1, r2, 0
	bl sub_80B79B8
_0806777A:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067784: .4byte 0x02025bc4
	thumb_func_end sub_806775C

	thumb_func_start sub_8067788
sub_8067788: @ 8067788
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _080677A6
	ldr r0, _080677B0
	adds r1, r2, 0
	bl sub_80B79E0
_080677A6:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080677B0: .4byte 0x02025bc4
	thumb_func_end sub_8067788

	thumb_func_start s92_check_money
s92_check_money: @ 80677B4
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_word
	adds r2, r0, 0
	ldr r0, [r4, 0x8]
	ldrb r1, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	cmp r1, 0
	bne _080677E2
	ldr r4, _080677EC
	ldr r0, _080677F0
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r2, 0
	bl IsEnoughMoney
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
_080677E2:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080677EC: .4byte 0x0202e8dc
_080677F0: .4byte 0x02025734
	thumb_func_end s92_check_money

	thumb_func_start sub_80677F4
sub_80677F4: @ 80677F4
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r1, 0
	bne _08067820
	ldr r0, _08067828
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r4, 0
	adds r2, r3, 0
	bl sub_80B7C14
_08067820:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067828: .4byte 0x02025734
	thumb_func_end sub_80677F4

	thumb_func_start sub_806782C
sub_806782C: @ 806782C
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl RemoveMoneyLabelObject
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_806782C

	thumb_func_start sub_8067848
sub_8067848: @ 8067848
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r1, 0
	bne _08067874
	ldr r0, _0806787C
	movs r1, 0x92
	lsls r1, 3
	adds r0, r1
	ldr r0, [r0]
	adds r1, r4, 0
	adds r2, r3, 0
	bl sub_80B7BEC
_08067874:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806787C: .4byte 0x02025734
	thumb_func_end sub_8067848

	thumb_func_start sub_8067880
sub_8067880: @ 8067880
	push {lr}
	ldr r3, [r0, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldr r0, _080678A4
	ldr r3, _080678A8
	adds r0, r3
	ldrh r0, [r0]
	bl sub_811A72C
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080678A4: .4byte 0x02025734
_080678A8: .4byte 0x00000494
	thumb_func_end sub_8067880

	thumb_func_start sub_80678AC
sub_80678AC: @ 80678AC
	push {lr}
	ldr r2, [r0, 0x8]
	ldrb r3, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	ldrb r1, [r2]
	adds r2, 0x1
	str r2, [r0, 0x8]
	adds r0, r3, 0
	bl sub_811A770
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_80678AC

	thumb_func_start sub_80678C8
sub_80678C8: @ 80678C8
	push {lr}
	ldr r3, [r0, 0x8]
	ldrb r1, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldrb r2, [r3]
	adds r3, 0x1
	str r3, [r0, 0x8]
	ldr r0, _080678EC
	ldr r3, _080678F0
	adds r0, r3
	ldrh r0, [r0]
	bl sub_811A704
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_080678EC: .4byte 0x02025734
_080678F0: .4byte 0x00000494
	thumb_func_end sub_80678C8

	thumb_func_start s5C_trainer_battle_configure_and_start
s5C_trainer_battle_configure_and_start: @ 80678F4
	push {r4,lr}
	adds r4, r0, 0
	ldr r0, [r4, 0x8]
	bl sub_80823C8
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s5C_trainer_battle_configure_and_start

	thumb_func_start sub_8067908
sub_8067908: @ 8067908
	push {lr}
	bl sub_80825E4
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8067908

	thumb_func_start sub_8067914
sub_8067914: @ 8067914
	push {r4,lr}
	adds r4, r0, 0
	bl sub_80826E8
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8067914

	thumb_func_start sub_8067928
sub_8067928: @ 8067928
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8082700
	str r0, [r4, 0x8]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8067928

	thumb_func_start s60_check_trainer_flag
s60_check_trainer_flag: @ 806793C
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl trainer_flag_check
	strb r0, [r4, 0x2]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end s60_check_trainer_flag

	thumb_func_start s61_set_trainer_flag
s61_set_trainer_flag: @ 8067960
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl trainer_flag_set
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s61_set_trainer_flag

	thumb_func_start s62_unset_trainer_flag
s62_unset_trainer_flag: @ 806797C
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl trainer_flag_clear
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end s62_unset_trainer_flag

	thumb_func_start sB6_load_battle
sB6_load_battle: @ 8067998
	push {r4-r6,lr}
	adds r4, r0, 0
	bl script_read_halfword
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	ldr r0, [r4, 0x8]
	ldrb r6, [r0]
	adds r0, 0x1
	str r0, [r4, 0x8]
	adds r0, r4, 0
	bl script_read_halfword
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r6, 0
	bl sub_80C54D0
	movs r0, 0
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sB6_load_battle

	thumb_func_start sub_80679CC
sub_80679CC: @ 80679CC
	push {lr}
	bl sub_8081B3C
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_80679CC

	thumb_func_start s86_pokemart
s86_pokemart: @ 80679DC
	push {lr}
	bl script_read_word
	bl CreatePokemartMenu
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end s86_pokemart

	thumb_func_start s87_pokemartdecor
s87_pokemartdecor: @ 80679F0
	push {lr}
	bl script_read_word
	bl CreateDecorationShop1Menu
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end s87_pokemartdecor

	thumb_func_start s88_pokemartbp
s88_pokemartbp: @ 8067A04
	push {lr}
	bl script_read_word
	bl CreateDecorationShop2Menu
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end s88_pokemartbp

	thumb_func_start s89_open_casino_game1
s89_open_casino_game1: @ 8067A18
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	ldr r1, _08067A3C
	bl sub_81018A0
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067A3C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end s89_open_casino_game1

	thumb_func_start berry_script_cmd
berry_script_cmd: @ 8067A40
	push {r4,r5,lr}
	ldr r1, [r0, 0x8]
	ldrb r5, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	ldrb r3, [r1]
	adds r2, r1, 0x1
	str r2, [r0, 0x8]
	ldrb r4, [r1, 0x1]
	adds r2, 0x1
	str r2, [r0, 0x8]
	cmp r3, 0
	bne _08067A68
	adds r0, r5, 0
	movs r1, 0
	adds r2, r4, 0
	movs r3, 0
	bl PlantBerryTree
	b _08067A74
_08067A68:
	adds r0, r5, 0
	adds r1, r3, 0
	adds r2, r4, 0
	movs r3, 0
	bl PlantBerryTree
_08067A74:
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end berry_script_cmd

	thumb_func_start sub_8067A7C
sub_8067A7C: @ 8067A7C
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r4, _08067AA4
	lsls r0, 24
	lsrs r0, 24
	bl GetPriceReduction
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067AA4: .4byte 0x0202e8dc
	thumb_func_end sub_8067A7C

	thumb_func_start sub_8067AA8
sub_8067AA8: @ 8067AA8
	push {lr}
	bl sub_80F99CC
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8067AA8

	thumb_func_start sub_8067AB8
sub_8067AB8: @ 8067AB8
	push {lr}
	bl sub_80C48C8
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8067AB8

	thumb_func_start sub_8067AC8
sub_8067AC8: @ 8067AC8
	push {lr}
	bl sub_80C4940
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8067AC8

	thumb_func_start sub_8067AD8
sub_8067AD8: @ 8067AD8
	push {lr}
	ldr r0, _08067AEC
	ldrb r0, [r0]
	bl sub_80C4980
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067AEC: .4byte 0x0203869c
	thumb_func_end sub_8067AD8

	thumb_func_start s9C_execute_HM
s9C_execute_HM: @ 8067AF0
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldr r1, _08067B14
	strh r0, [r1]
	lsls r0, 24
	lsrs r0, 24
	bl FieldEffectStart
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08067B14: .4byte 0x0202e8bc
	thumb_func_end s9C_execute_HM

	thumb_func_start s9D_set_HM_animation_data
s9D_set_HM_animation_data: @ 8067B18
	push {r4,lr}
	ldr r1, [r0, 0x8]
	ldrb r4, [r1]
	adds r1, 0x1
	str r1, [r0, 0x8]
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _08067B44
	lsls r4, 2
	adds r4, r1
	lsls r0, 16
	asrs r0, 16
	str r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067B44: .4byte 0x0202ff84
	thumb_func_end s9D_set_HM_animation_data

	thumb_func_start sub_8067B48
sub_8067B48: @ 8067B48
	push {lr}
	ldr r0, _08067B5C
	ldrb r0, [r0]
	bl FieldEffectActiveListContains
	lsls r0, 24
	cmp r0, 0
	beq _08067B60
	movs r0, 0
	b _08067B62
	.align 2, 0
_08067B5C: .4byte 0x0202e8bc
_08067B60:
	movs r0, 0x1
_08067B62:
	pop {r1}
	bx r1
	thumb_func_end sub_8067B48

	thumb_func_start s9E_checkarray_HM_animation
s9E_checkarray_HM_animation: @ 8067B68
	push {r4,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	ldr r1, _08067B8C
	strh r0, [r1]
	ldr r1, _08067B90
	adds r0, r4, 0
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08067B8C: .4byte 0x0202e8bc
_08067B90: .4byte sub_8067B48
	thumb_func_end s9E_checkarray_HM_animation

	thumb_func_start sub_8067B94
sub_8067B94: @ 8067B94
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	bl sub_8053588
	movs r0, 0
	pop {r1}
	bx r1
	thumb_func_end sub_8067B94

	thumb_func_start sub_8067BB0
sub_8067BB0: @ 8067BB0
	ldr r0, _08067BBC
	ldr r1, _08067BC0
	ldrb r1, [r1, 0x8]
	strh r1, [r0]
	movs r0, 0
	bx lr
	.align 2, 0
_08067BBC: .4byte 0x0202e8dc
_08067BC0: .4byte 0x02024ea4
	thumb_func_end sub_8067BB0

	thumb_func_start sA1_play_cry
sA1_play_cry: @ 8067BC4
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_8075178
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sA1_play_cry

	thumb_func_start sub_8067BFC
sub_8067BFC: @ 8067BFC
	push {lr}
	ldr r1, _08067C0C
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067C0C: .4byte sub_8075374
	thumb_func_end sub_8067BFC

	thumb_func_start sA2_setmaptile
sA2_setmaptile: @ 8067C10
	push {r4-r7,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r6, r0, 16
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r5, r0, 16
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r7, r0, 16
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	adds r1, r6, 0x7
	lsls r1, 16
	lsrs r6, r1, 16
	adds r1, r5, 0x7
	lsls r1, 16
	lsrs r5, r1, 16
	cmp r0, 0
	bne _08067C74
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r7, 0
	bl MapGridSetMetatileIdAt
	b _08067C86
_08067C74:
	movs r1, 0xC0
	lsls r1, 4
	adds r0, r1, 0
	adds r2, r7, 0
	orrs r2, r0
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08067C86:
	movs r0, 0
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sA2_setmaptile

	thumb_func_start sAC_open_door
sAC_open_door: @ 8067C90
	push {r4,r5,lr}
	adds r4, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	adds r5, 0x7
	lsls r5, 16
	lsrs r5, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r4, r0
	lsrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8058790
	lsls r0, 16
	lsrs r0, 16
	bl audio_play
	adds r0, r5, 0
	adds r1, r4, 0
	bl task_overworld_door_add_if_role_69_for_opening_door_at
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sAC_open_door

	thumb_func_start sub_8067CE8
sub_8067CE8: @ 8067CE8
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_805870C
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067CE8

	thumb_func_start sub_8067D2C
sub_8067D2C: @ 8067D2C
	push {lr}
	bl sub_805877C
	lsls r0, 24
	cmp r0, 0
	beq _08067D3C
	movs r0, 0
	b _08067D3E
_08067D3C:
	movs r0, 0x1
_08067D3E:
	pop {r1}
	bx r1
	thumb_func_end sub_8067D2C

	thumb_func_start sub_8067D44
sub_8067D44: @ 8067D44
	push {lr}
	ldr r1, _08067D54
	bl script_setup_asm_script
	movs r0, 0x1
	pop {r1}
	bx r1
	.align 2, 0
_08067D54: .4byte sub_8067D2C
	thumb_func_end sub_8067D44

	thumb_func_start sub_8067D58
sub_8067D58: @ 8067D58
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_80586B4
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067D58

	thumb_func_start sub_8067D9C
sub_8067D9C: @ 8067D9C
	push {r4,r5,lr}
	adds r5, r0, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r1, r0, 0
	lsls r1, 16
	adds r4, 0x7
	lsls r4, 16
	lsrs r4, 16
	movs r0, 0xE0
	lsls r0, 11
	adds r1, r0
	lsrs r1, 16
	adds r0, r4, 0
	bl sub_80586E0
	movs r0, 0
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8067D9C

	thumb_func_start sub_8067DE0
sub_8067DE0: @ 8067DE0
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r6, r0, 0
	ldr r0, [r6, 0x8]
	ldrb r1, [r0]
	mov r8, r1
	adds r0, 0x1
	str r0, [r6, 0x8]
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	adds r3, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r4, 24
	lsrs r4, 24
	lsls r3, 24
	lsrs r3, 24
	mov r0, r8
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_810E7AC
	movs r0, 0
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8067DE0

	thumb_func_start sub_8067E4C
sub_8067E4C: @ 8067E4C
	push {lr}
	bl sub_810E824
	bl sub_80655F0
	movs r0, 0x1
	pop {r1}
	bx r1
	thumb_func_end sub_8067E4C

	thumb_func_start sB3_get_coin_amount
sB3_get_coin_amount: @ 8067E5C
	push {r4,lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl GetVarPointer
	adds r4, r0, 0
	bl GetCoins
	strh r0, [r4]
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sB3_get_coin_amount

	thumb_func_start sub_8067E7C
sub_8067E7C: @ 8067E7C
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_811A840
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08067EA4
	ldr r1, _08067EA0
	movs r0, 0
	b _08067EA8
	.align 2, 0
_08067EA0: .4byte 0x0202e8dc
_08067EA4:
	ldr r1, _08067EB0
	movs r0, 0x1
_08067EA8:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08067EB0: .4byte 0x0202e8dc
	thumb_func_end sub_8067E7C

	thumb_func_start sub_8067EB4
sub_8067EB4: @ 8067EB4
	push {lr}
	bl script_read_halfword
	lsls r0, 16
	lsrs r0, 16
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	bl sub_811A898
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08067EDC
	ldr r1, _08067ED8
	movs r0, 0
	b _08067EE0
	.align 2, 0
_08067ED8: .4byte 0x0202e8dc
_08067EDC:
	ldr r1, _08067EE8
	movs r0, 0x1
_08067EE0:
	strh r0, [r1]
	movs r0, 0
	pop {r1}
	bx r1
	.align 2, 0
_08067EE8: .4byte 0x0202e8dc
	thumb_func_end sub_8067EB4

	thumb_func_start sub_8067EEC
sub_8067EEC: @ 8067EEC
	push {r4,r5,lr}
	movs r1, 0x2
	negs r1, r1
	movs r3, 0x3
	negs r3, r3
	movs r4, 0x5
	negs r4, r4
	movs r5, 0x9
	negs r5, r5
	movs r2, 0
	strb r2, [r0]
	ldrb r2, [r0, 0x1]
	ands r1, r2
	ands r1, r3
	ands r1, r4
	ands r1, r5
	strb r1, [r0, 0x1]
	movs r1, 0
	strb r1, [r0, 0x2]
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_8067EEC

	thumb_func_start process_overworld_input
process_overworld_input: @ 8067F18
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r0, _08067FE8
	ldrb r6, [r0, 0x3]
	ldrb r0, [r0, 0x2]
	mov r9, r0
	bl cur_mapdata_block_role_at_player_pos
	lsls r0, 24
	lsrs r0, 24
	bl sub_8056FFC
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r6, 0x2
	bne _08067F4C
	cmp r7, 0
	beq _08067F50
_08067F4C:
	cmp r6, 0
	bne _08067FB2
_08067F50:
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _08067F9C
	movs r0, 0x8
	ands r0, r5
	cmp r0, 0
	beq _08067F6C
	ldrb r0, [r4]
	movs r1, 0x4
	orrs r0, r1
	strb r0, [r4]
_08067F6C:
	movs r0, 0x4
	ands r0, r5
	cmp r0, 0
	beq _08067F7C
	ldrb r0, [r4]
	movs r1, 0x8
	orrs r0, r1
	strb r0, [r4]
_08067F7C:
	movs r0, 0x1
	ands r0, r5
	cmp r0, 0
	beq _08067F8C
	ldrb r0, [r4]
	movs r1, 0x1
	orrs r0, r1
	strb r0, [r4]
_08067F8C:
	movs r0, 0x2
	ands r0, r5
	cmp r0, 0
	beq _08067F9C
	ldrb r0, [r4]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r4]
_08067F9C:
	movs r0, 0xF0
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08067FB2
	ldrb r0, [r4]
	movs r1, 0x10
	orrs r0, r1
	movs r1, 0x20
	orrs r0, r1
	strb r0, [r4]
_08067FB2:
	cmp r7, 0
	bne _08067FD8
	cmp r6, 0x2
	bne _08067FC8
	mov r0, r9
	cmp r0, 0x2
	bne _08067FC8
	ldrb r0, [r4]
	movs r1, 0x40
	orrs r0, r1
	strb r0, [r4]
_08067FC8:
	cmp r7, 0
	bne _08067FD8
	cmp r6, 0x2
	bne _08067FD8
	ldrb r0, [r4]
	movs r1, 0x2
	orrs r0, r1
	strb r0, [r4]
_08067FD8:
	movs r0, 0x40
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08067FEC
	movs r0, 0x2
	b _08068014
	.align 2, 0
_08067FE8: .4byte 0x0202e858
_08067FEC:
	movs r0, 0x80
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08067FFA
	movs r0, 0x1
	b _08068014
_08067FFA:
	movs r0, 0x20
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08068008
	movs r0, 0x3
	b _08068014
_08068008:
	movs r0, 0x10
	mov r1, r8
	ands r0, r1
	cmp r0, 0
	beq _08068016
	movs r0, 0x4
_08068014:
	strb r0, [r4, 0x2]
_08068016:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end process_overworld_input

	thumb_func_start sub_8068024
sub_8068024: @ 8068024
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	bl player_get_direction_lower_nybble
	lsls r0, 24
	lsrs r6, r0, 24
	mov r4, sp
	mov r0, sp
	bl player_get_pos_to_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r4, r0, 16
	bl sub_8083FBC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
	bl mapheader_run_first_tag2_script_list_match
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
	ldrb r1, [r5]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _08068076
	bl sub_80687A4
	cmp r0, 0x1
	beq _08068150
_08068076:
	ldrb r1, [r5]
	movs r0, 0x40
	ands r0, r1
	cmp r0, 0
	beq _08068098
	movs r0, 0x5
	bl sav12_xor_increment
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_80687E4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_08068098:
	ldrb r1, [r5]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _080680B0
	adds r0, r4, 0
	bl is_it_battle_time_3
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_080680B0:
	ldrb r1, [r5]
	movs r0, 0x10
	ands r0, r1
	cmp r0, 0
	beq _080680D2
	ldrb r0, [r5, 0x2]
	cmp r0, r6
	bne _080680D2
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl mapheader_run_first_tag2_script_list_match_conditionally
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_080680D2:
	mov r4, sp
	mov r0, sp
	bl player_get_next_pos_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r4, r0, 16
	ldrb r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08068108
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_80681F0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_08068108:
	ldrb r1, [r5]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806812A
	ldrb r0, [r5, 0x2]
	cmp r0, r6
	bne _0806812A
	mov r0, sp
	adds r1, r4, 0
	adds r2, r6, 0
	bl map_warp_consider_2_to_inside
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068150
_0806812A:
	ldrb r1, [r5]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806813C
	bl sub_8068770
	cmp r0, 0x1
	beq _08068150
_0806813C:
	ldrb r1, [r5]
	movs r0, 0x4
	ands r0, r1
	cmp r0, 0
	beq _08068154
	movs r0, 0x6
	bl audio_play
	bl sub_8071310
_08068150:
	movs r0, 0x1
	b _08068166
_08068154:
	movs r0, 0x8
	ands r0, r1
	cmp r0, 0
	beq _08068164
	bl sub_80A6D1C
	cmp r0, 0x1
	beq _08068150
_08068164:
	movs r0, 0
_08068166:
	add sp, 0x8
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8068024

	thumb_func_start player_get_pos_to_and_height
player_get_pos_to_and_height: @ 8068170
	push {r4,lr}
	adds r4, r0, 0
	adds r1, r4, 0x2
	bl PlayerGetDestCoords
	bl PlayerGetZCoord
	strb r0, [r4, 0x4]
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end player_get_pos_to_and_height

	thumb_func_start player_get_next_pos_and_height
player_get_next_pos_and_height: @ 8068188
	push {r4,r5,lr}
	sub sp, 0x4
	adds r5, r0, 0
	adds r1, r5, 0x2
	bl GetXYCoordsOneStepInFrontOfPlayer
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _080681BA
	bl PlayerGetZCoord
_080681BA:
	strb r0, [r5, 0x4]
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end player_get_next_pos_and_height

	thumb_func_start cur_mapdata_block_role_at_player_pos
cur_mapdata_block_role_at_player_pos: @ 80681C4
	push {r4,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r0, 16
	add sp, 0x4
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end cur_mapdata_block_role_at_player_pos

	thumb_func_start sub_80681F0
sub_80681F0: @ 80681F0
	push {r4,lr}
	lsls r2, 24
	lsrs r2, 24
	lsls r1, 24
	lsrs r1, 24
	bl TryGetScriptOnPressingA
	adds r4, r0, 0
	cmp r4, 0
	bne _08068208
	movs r0, 0
	b _08068234
_08068208:
	ldr r0, _0806823C
	cmp r4, r0
	beq _0806822C
	ldr r0, _08068240
	cmp r4, r0
	beq _0806822C
	ldr r0, _08068244
	cmp r4, r0
	beq _0806822C
	ldr r0, _08068248
	cmp r4, r0
	beq _0806822C
	ldr r0, _0806824C
	cmp r4, r0
	beq _0806822C
	movs r0, 0x5
	bl audio_play
_0806822C:
	adds r0, r4, 0
	bl script_env_1_execute_new_script
	movs r0, 0x1
_08068234:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806823C: .4byte gUnknown_0815281E
_08068240: .4byte gUnknown_08152C39
_08068244: .4byte gUnknown_0815F36C
_08068248: .4byte gUnknown_0815F43A
_0806824C: .4byte gUnknown_081A0009
	thumb_func_end sub_80681F0

	thumb_func_start TryGetScriptOnPressingA
TryGetScriptOnPressingA: @ 8068250
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	mov r8, r5
	lsls r2, 24
	lsrs r4, r2, 24
	adds r7, r4, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8068364
	cmp r0, 0
	bne _0806829C
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl TryGetInvisibleMapObjectScript
	cmp r0, 0
	bne _0806829C
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_8068500
	cmp r0, 0
	bne _0806829C
	adds r0, r6, 0
	mov r1, r8
	adds r2, r7, 0
	bl TryGetFieldMoveScript
	cmp r0, 0
	bne _0806829C
	movs r0, 0
_0806829C:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end TryGetScriptOnPressingA

	thumb_func_start sub_80682A8
sub_80682A8: @ 80682A8
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r2, 24
	lsrs r6, r2, 24
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsCounter
	lsls r0, 24
	cmp r0, 0
	bne _080682D0
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	b _080682EE
_080682D0:
	ldr r1, _08068314
	lsls r2, r6, 3
	adds r0, r2, r1
	ldr r3, [r0]
	ldrh r0, [r4]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	adds r1, 0x4
	adds r2, r1
	ldr r2, [r2]
	ldrh r1, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
_080682EE:
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _0806830E
	ldr r1, _08068318
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	adds r5, r1, 0
	cmp r0, 0xFF
	bne _0806831C
_0806830E:
	movs r0, 0
	b _0806834E
	.align 2, 0
_08068314: .4byte gUnknown_0821664C
_08068318: .4byte 0x030048a0
_0806831C:
	movs r4, 0
	ldr r1, _08068354
_08068320:
	ldrb r0, [r1]
	cmp r0, 0x1
	bne _0806832C
	ldrb r0, [r1, 0x2]
	cmp r0, r3
	beq _0806830E
_0806832C:
	adds r1, 0x4
	adds r4, 0x1
	cmp r4, 0x3
	ble _08068320
	ldr r0, _08068358
	strb r3, [r0]
	ldr r1, _0806835C
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r5
	ldrb r0, [r0, 0x8]
	strh r0, [r1]
	ldr r0, _08068360
	strh r6, [r0]
	adds r0, r3, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
_0806834E:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068354: .4byte 0x02029818
_08068358: .4byte 0x03004ae0
_0806835C: .4byte 0x0202e8de
_08068360: .4byte 0x0202e8e0
	thumb_func_end sub_80682A8

	thumb_func_start sub_8068364
sub_8068364: @ 8068364
	push {r4-r6,lr}
	adds r4, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r6, r2, 24
	ldrh r0, [r4]
	ldrh r1, [r4, 0x2]
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _08068392
	ldr r1, _080683E0
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	cmp r0, 0xFF
	bne _080683E8
_08068392:
	adds r0, r5, 0
	bl MetatileBehavior_IsCounter
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080683DC
	ldr r1, _080683E4
	lsls r2, r6, 3
	adds r0, r2, r1
	ldr r3, [r0]
	ldrh r0, [r4]
	adds r0, r3
	lsls r0, 16
	lsrs r0, 16
	adds r1, 0x4
	adds r2, r1
	ldr r2, [r2]
	ldrh r1, [r4, 0x2]
	adds r1, r2
	lsls r1, 16
	lsrs r1, 16
	ldrb r2, [r4, 0x4]
	bl GetFieldObjectIdByXYZ
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x10
	beq _080683DC
	ldr r1, _080683E0
	lsls r2, r3, 3
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	cmp r0, 0xFF
	bne _080683E8
_080683DC:
	movs r0, 0
	b _0806840C
	.align 2, 0
_080683E0: .4byte 0x030048a0
_080683E4: .4byte gUnknown_0821664C
_080683E8:
	ldr r0, _08068414
	strb r3, [r0]
	ldr r4, _08068418
	adds r0, r2, r3
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x8]
	strh r0, [r4]
	ldr r0, _0806841C
	strh r6, [r0]
	adds r0, r3, 0
	bl GetFieldObjectScriptPointerByFieldObjectId
	adds r1, r0, 0
	ldrb r0, [r4]
	bl sub_806580C
	adds r1, r0, 0
_0806840C:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_08068414: .4byte 0x03004ae0
_08068418: .4byte 0x0202e8de
_0806841C: .4byte 0x0202e8e0
	thumb_func_end sub_8068364

	thumb_func_start TryGetInvisibleMapObjectScript
TryGetInvisibleMapObjectScript: @ 8068420
	push {r4,r5,lr}
	lsls r2, 24
	lsrs r5, r2, 24
	ldr r4, _08068450
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl FindInvisibleMapObjectByPosition
	cmp r0, 0
	beq _08068494
	ldr r2, [r0, 0x8]
	cmp r2, 0
	bne _08068458
	ldr r0, _08068454
	b _080684FA
	.align 2, 0
_08068450: .4byte 0x0202e828
_08068454: .4byte gUnknown_081C6C02
_08068458:
	ldrb r0, [r0, 0x5]
	cmp r0, 0x8
	bhi _080684F8
	lsls r0, 2
	ldr r1, _08068468
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08068468: .4byte _0806846C
	.align 2, 0
_0806846C:
	.4byte _080684F8
	.4byte _08068490
	.4byte _08068498
	.4byte _0806849E
	.4byte _080684A4
	.4byte _080684AA
	.4byte _080684AA
	.4byte _080684AA
	.4byte _080684D8
_08068490:
	cmp r5, 0x2
	beq _080684F8
_08068494:
	movs r0, 0
	b _080684FA
_08068498:
	cmp r5, 0x1
	beq _080684F8
	b _08068494
_0806849E:
	cmp r5, 0x4
	beq _080684F8
	b _08068494
_080684A4:
	cmp r5, 0x3
	beq _080684F8
	b _08068494
_080684AA:
	ldr r1, _080684CC
	lsrs r0, r2, 16
	movs r3, 0x96
	lsls r3, 2
	adds r0, r3
	strh r0, [r1]
	ldr r0, _080684D0
	strh r2, [r0]
	ldrh r0, [r1]
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068494
	ldr r0, _080684D4
	b _080684FA
	.align 2, 0
_080684CC: .4byte 0x0202e8cc
_080684D0: .4byte 0x0202e8ce
_080684D4: .4byte HiddenItemScript
_080684D8:
	cmp r5, 0x2
	bne _08068494
	ldr r0, _080684F0
	strh r2, [r0]
	bl sub_80BC050
	lsls r0, 24
	cmp r0, 0
	beq _08068494
	ldr r0, _080684F4
	b _080684FA
	.align 2, 0
_080684F0: .4byte 0x0202e8cc
_080684F4: .4byte gUnknown_081A2C51
_080684F8:
	adds r0, r2, 0
_080684FA:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end TryGetInvisibleMapObjectScript

	thumb_func_start sub_8068500
sub_8068500: @ 8068500
	push {r4-r6,lr}
	adds r6, r0, 0
	lsls r1, 24
	lsrs r5, r1, 24
	lsls r2, 24
	lsrs r2, 24
	adds r0, r5, 0
	adds r1, r2, 0
	bl MetatileBehavior_IsPlayerFacingTVScreen
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068524
	ldr r0, _08068520
	b _080686EE
	.align 2, 0
_08068520: .4byte gUnknown_081A6E72
_08068524:
	adds r0, r5, 0
	bl MetatileBehavior_IsPC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806853C
	ldr r0, _08068538
	b _080686EE
	.align 2, 0
_08068538: .4byte gUnknown_081A0009
_0806853C:
	adds r0, r5, 0
	bl is_tile_x8B
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068554
	ldr r0, _08068550
	b _080686EE
	.align 2, 0
_08068550: .4byte gUnknown_0814D2FF
_08068554:
	adds r0, r5, 0
	bl is_tile_x84
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806856C
	ldr r0, _08068568
	b _080686EE
	.align 2, 0
_08068568: .4byte gUnknown_081A4363
_0806856C:
	adds r0, r5, 0
	bl is_tile_x87
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068584
	ldr r0, _08068580
	b _080686EE
	.align 2, 0
_08068580: .4byte gUnknown_081C346A
_08068584:
	adds r0, r5, 0
	bl is_tile_x8C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806859C
	ldr r0, _08068598
	b _080686EE
	.align 2, 0
_08068598: .4byte gUnknown_081616E1
_0806859C:
	adds r0, r5, 0
	bl is_tile_x85
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080685B4
	ldr r0, _080685B0
	b _080686EE
	.align 2, 0
_080685B0: .4byte gUnknown_081A02D6
_080685B4:
	adds r0, r5, 0
	bl sub_805791C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080685CC
	ldr r0, _080685C8
	b _080686EE
	.align 2, 0
_080685C8: .4byte gUnknown_081B6E5A
_080685CC:
	adds r0, r5, 0
	bl sub_8057930
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080685E4
	ldr r0, _080685E0
	b _080686EE
	.align 2, 0
_080685E0: .4byte PictureBookShelfScript
_080685E4:
	adds r0, r5, 0
	bl sub_8057944
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080685FC
	ldr r0, _080685F8
	b _080686EE
	.align 2, 0
_080685F8: .4byte BookshelfScript
_080685FC:
	adds r0, r5, 0
	bl sub_8057958
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068614
	ldr r0, _08068610
	b _080686EE
	.align 2, 0
_08068610: .4byte PokemonCenterBookshelfScript
_08068614:
	adds r0, r5, 0
	bl sub_805796C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806862C
	ldr r0, _08068628
	b _080686EE
	.align 2, 0
_08068628: .4byte VaseScript
_0806862C:
	adds r0, r5, 0
	bl sub_8057980
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068644
	ldr r0, _08068640
	b _080686EE
	.align 2, 0
_08068640: .4byte TrashCanScript
_08068644:
	adds r0, r5, 0
	bl sub_8057994
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806865C
	ldr r0, _08068658
	b _080686EE
	.align 2, 0
_08068658: .4byte ShopShelfScript
_0806865C:
	adds r0, r5, 0
	bl sub_80579A8
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068674
	ldr r0, _08068670
	b _080686EE
	.align 2, 0
_08068670: .4byte BlueprintScript
_08068674:
	movs r4, 0x4
	ldrsb r4, [r6, r4]
	movs r1, 0
	ldrsh r0, [r6, r1]
	movs r2, 0x2
	ldrsh r1, [r6, r2]
	bl MapGridGetZCoordAt
	lsls r0, 24
	lsrs r0, 24
	cmp r4, r0
	bne _080686EC
	adds r0, r5, 0
	bl sub_8057238
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080686A4
	ldr r0, _080686A0
	b _080686EE
	.align 2, 0
_080686A0: .4byte gUnknown_0815F36C
_080686A4:
	adds r0, r5, 0
	bl sub_805724C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080686BC
	ldr r0, _080686B8
	b _080686EE
	.align 2, 0
_080686B8: .4byte gUnknown_0815F43A
_080686BC:
	adds r0, r5, 0
	bl sub_8057364
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080686D4
	ldr r0, _080686D0
	b _080686EE
	.align 2, 0
_080686D0: .4byte gUnknown_0815F523
_080686D4:
	adds r0, r5, 0
	bl sub_8057378
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080686EC
	ldr r0, _080686E8
	b _080686EE
	.align 2, 0
_080686E8: .4byte gUnknown_0815F528
_080686EC:
	movs r0, 0
_080686EE:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_8068500

	thumb_func_start TryGetFieldMoveScript
TryGetFieldMoveScript: @ 80686F4
	push {r4,lr}
	lsls r1, 24
	lsrs r4, r1, 24
	ldr r0, _08068724
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806872C
	bl PartyHasMonWithSurf
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806872C
	bl IsPlayerFacingSurfableFishableWater
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806872C
	ldr r0, _08068728
	b _0806876A
	.align 2, 0
_08068724: .4byte 0x0000080b
_08068728: .4byte UseSurfScript
_0806872C:
	adds r0, r4, 0
	bl MetatileBehavior_IsWaterfall
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068768
	ldr r0, _08068758
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068760
	bl IsPlayerSurfingNorth
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068760
	ldr r0, _0806875C
	b _0806876A
	.align 2, 0
_08068758: .4byte 0x0000080e
_0806875C: .4byte UseWaterfallScript
_08068760:
	ldr r0, _08068764
	b _0806876A
	.align 2, 0
_08068764: .4byte WaterfallScript
_08068768:
	movs r0, 0
_0806876A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end TryGetFieldMoveScript

	thumb_func_start sub_8068770
sub_8068770: @ 8068770
	push {lr}
	ldr r0, _08068794
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806879C
	bl sub_8068F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x2
	bne _0806879C
	ldr r0, _08068798
	bl script_env_1_execute_new_script
	movs r0, 0x1
	b _0806879E
	.align 2, 0
_08068794: .4byte 0x0000080d
_08068798: .4byte gUnknown_081B1220
_0806879C:
	movs r0, 0
_0806879E:
	pop {r1}
	bx r1
	thumb_func_end sub_8068770

	thumb_func_start sub_80687A4
sub_80687A4: @ 80687A4
	push {lr}
	ldr r0, _080687D0
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _080687DC
	ldr r0, _080687D4
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _080687DC
	bl sub_8068F18
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080687DC
	ldr r0, _080687D8
	bl script_env_1_execute_new_script
	movs r0, 0x1
	b _080687DE
	.align 2, 0
_080687D0: .4byte 0x0000080d
_080687D4: .4byte 0x0202e828
_080687D8: .4byte gUnknown_081B1269
_080687DC:
	movs r0, 0
_080687DE:
	pop {r1}
	bx r1
	thumb_func_end sub_80687A4

	thumb_func_start sub_80687E4
sub_80687E4: @ 80687E4
	push {r4-r6,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r4, r1, 16
	adds r6, r4, 0
	bl mapheader_trigger_activate_at__run_now
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8068A64
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	adds r0, r6, 0
	bl sub_8068870
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	bl sub_8068894
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	bl sub_8085558
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068834
	movs r0, 0
	b _08068836
_08068834:
	movs r0, 0x1
_08068836:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end sub_80687E4

	thumb_func_start mapheader_trigger_activate_at__run_now
mapheader_trigger_activate_at__run_now: @ 806883C
	push {r4,lr}
	ldr r4, _08068864
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl mapheader_trigger_activate_at
	cmp r0, 0
	beq _08068868
	bl script_env_1_execute_new_script
	movs r0, 0x1
	b _0806886A
	.align 2, 0
_08068864: .4byte 0x0202e828
_08068868:
	movs r0, 0
_0806886A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end mapheader_trigger_activate_at__run_now

	thumb_func_start sub_8068870
sub_8068870: @ 8068870
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_8057818
	lsls r0, 24
	cmp r0, 0
	bne _08068884
	movs r0, 0
	b _0806888C
_08068884:
	ldr r0, _08068890
	bl script_env_1_execute_new_script
	movs r0, 0x1
_0806888C:
	pop {r1}
	bx r1
	.align 2, 0
_08068890: .4byte gUnknown_081C6BC5
	thumb_func_end sub_8068870

	thumb_func_start sub_8068894
sub_8068894: @ 8068894
	push {lr}
	bl sub_8082B78
	bl happiness_algorithm_step
	bl overworld_poison_step
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _080688B4
	ldr r0, _080688B0
	b _080688E8
	.align 2, 0
_080688B0: .4byte gUnknown_081A14B8
_080688B4:
	bl sub_80422A0
	lsls r0, 24
	cmp r0, 0
	beq _080688CC
	movs r0, 0xD
	bl sav12_xor_increment
	ldr r0, _080688C8
	b _080688E8
	.align 2, 0
_080688C8: .4byte gUnknown_081B25BC
_080688CC:
	bl safari_step
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080688EC
	movs r0, 0x1
	bl sub_810D9B0
	cmp r0, 0x1
	beq _080688E6
	movs r0, 0
	b _080688EE
_080688E6:
	ldr r0, _080688F4
_080688E8:
	bl script_env_1_execute_new_script
_080688EC:
	movs r0, 0x1
_080688EE:
	pop {r1}
	bx r1
	.align 2, 0
_080688F4: .4byte gUnknown_0815FD0D
	thumb_func_end sub_8068894

	thumb_func_start unref_sub_80688F8
unref_sub_80688F8: @ 80688F8
	push {lr}
	ldr r0, _08068908
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08068908: .4byte 0x0000402a
	thumb_func_end unref_sub_80688F8

	thumb_func_start happiness_algorithm_step
happiness_algorithm_step: @ 806890C
	push {r4,r5,lr}
	ldr r0, _08068940
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r2, 0x7F
	ands r1, r2
	strh r1, [r0]
	cmp r1, 0
	bne _0806893A
	ldr r5, _08068944
	movs r4, 0x5
_0806892A:
	adds r0, r5, 0
	movs r1, 0x5
	bl sub_803FCD4
	adds r5, 0x64
	subs r4, 0x1
	cmp r4, 0
	bge _0806892A
_0806893A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08068940: .4byte 0x0000402a
_08068944: .4byte 0x03004360
	thumb_func_end happiness_algorithm_step

	thumb_func_start overworld_poison_timer_set
overworld_poison_timer_set: @ 8068948
	push {lr}
	ldr r0, _08068958
	movs r1, 0
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_08068958: .4byte 0x0000402b
	thumb_func_end overworld_poison_timer_set

	thumb_func_start overworld_poison_step
overworld_poison_step: @ 806895C
	push {lr}
	ldr r0, _08068994
	ldrb r0, [r0, 0x17]
	cmp r0, 0x9
	beq _0806899C
	ldr r0, _08068998
	bl GetVarPointer
	ldrh r1, [r0]
	adds r1, 0x1
	strh r1, [r0]
	ldrh r1, [r0]
	movs r2, 0x3
	ands r1, r2
	strh r1, [r0]
	cmp r1, 0
	bne _0806899C
	bl overworld_poison
	cmp r0, 0x1
	beq _0806899C
	cmp r0, 0x1
	ble _0806899C
	cmp r0, 0x2
	bne _0806899C
	movs r0, 0x1
	b _0806899E
	.align 2, 0
_08068994: .4byte 0x0202e828
_08068998: .4byte 0x0000402b
_0806899C:
	movs r0, 0
_0806899E:
	pop {r1}
	bx r1
	thumb_func_end overworld_poison_step

	thumb_func_start prev_quest_postbuffer_cursor_backup_reset
prev_quest_postbuffer_cursor_backup_reset: @ 80689A4
	ldr r1, _080689AC
	movs r0, 0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080689AC: .4byte 0x0202e8c0
	thumb_func_end prev_quest_postbuffer_cursor_backup_reset

	thumb_func_start is_it_battle_time_3
is_it_battle_time_3: @ 80689B0
	push {r4-r7,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r7, r4, 0
	ldr r6, _080689CC
	ldrb r0, [r6]
	cmp r0, 0x3
	bhi _080689D4
	adds r0, 0x1
	strb r0, [r6]
	ldr r0, _080689D0
	strh r4, [r0]
	movs r0, 0
	b _080689F8
	.align 2, 0
_080689CC: .4byte 0x0202e8c0
_080689D0: .4byte 0x0202e8c2
_080689D4:
	ldr r5, _080689EC
	ldrh r1, [r5]
	adds r0, r4, 0
	bl sub_8085104
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _080689F0
	strh r4, [r5]
	movs r0, 0
	b _080689F8
	.align 2, 0
_080689EC: .4byte 0x0202e8c2
_080689F0:
	movs r0, 0
	strb r0, [r6]
	strh r7, [r5]
	movs r0, 0x1
_080689F8:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end is_it_battle_time_3

	thumb_func_start mapheader_run_first_tag2_script_list_match_conditionally
mapheader_run_first_tag2_script_list_match_conditionally: @ 8068A00
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r7, r0, 0
	adds r4, r1, 0
	adds r5, r2, 0
	lsls r4, 16
	lsrs r4, 16
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _08068A54
	mov r8, r0
	adds r1, r7, 0
	bl map_warp_check_packed
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl is_non_stair_warp_tile
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068A58
	lsls r0, r6, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08068A58
	bl walkrun_find_lowest_active_bit_in_bitfield
	mov r0, r8
	adds r1, r4, 0
	adds r2, r7, 0
	bl sub_8068C30
	bl sub_8080E88
	movs r0, 0x1
	b _08068A5A
	.align 2, 0
_08068A54: .4byte 0x0202e828
_08068A58:
	movs r0, 0
_08068A5A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end mapheader_run_first_tag2_script_list_match_conditionally

	thumb_func_start sub_8068A64
sub_8068A64: @ 8068A64
	push {r4-r7,lr}
	adds r6, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r7, _08068ABC
	adds r0, r7, 0
	adds r1, r6, 0
	bl map_warp_check_packed
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08068B28
	adds r0, r5, 0
	bl sub_8068B30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068B28
	bl walkrun_find_lowest_active_bit_in_bitfield
	adds r0, r7, 0
	adds r1, r4, 0
	adds r2, r6, 0
	bl sub_8068C30
	lsls r0, r5, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl MetatileBehavior_IsEscalator
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AC0
	adds r0, r4, 0
	bl sub_8080F2C
	movs r0, 0x1
	b _08068B2A
	.align 2, 0
_08068ABC: .4byte 0x0202e828
_08068AC0:
	adds r0, r4, 0
	bl sub_8057798
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AD6
	bl sub_8080F48
	movs r0, 0x1
	b _08068B2A
_08068AD6:
	adds r0, r4, 0
	bl is_role_x68
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068AEC
	bl sub_8080F58
	movs r0, 0x1
	b _08068B2A
_08068AEC:
	adds r0, r4, 0
	bl MetatileBehavior_IsAquaHideoutWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068B02
	bl sub_8080F68
	movs r0, 0x1
	b _08068B2A
_08068B02:
	adds r0, r4, 0
	bl sub_8057804
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068B20
	ldr r0, _08068B1C
	bl script_env_1_execute_new_script
	movs r0, 0x1
	b _08068B2A
	.align 2, 0
_08068B1C: .4byte gUnknown_081C6BDE
_08068B20:
	bl sub_8080E88
	movs r0, 0x1
	b _08068B2A
_08068B28:
	movs r0, 0
_08068B2A:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_8068A64

	thumb_func_start sub_8068B30
sub_8068B30: @ 8068B30
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl is_tile_x69_2_warp_door
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl MetatileBehavior_IsLadder
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl MetatileBehavior_IsEscalator
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl sub_8056F08
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl sub_8057798
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl is_role_x68
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl MetatileBehavior_IsAquaHideoutWarp
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	adds r0, r4, 0
	bl sub_8057804
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _08068BAA
	movs r0, 0
	b _08068BAC
_08068BAA:
	movs r0, 0x1
_08068BAC:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end sub_8068B30

	thumb_func_start is_non_stair_warp_tile
is_non_stair_warp_tile: @ 8068BB4
	push {lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r1, 24
	adds r2, r1, 0
	cmp r1, 0x2
	beq _08068BD8
	cmp r1, 0x2
	bgt _08068BCE
	cmp r1, 0x1
	beq _08068BE2
	b _08068C04
_08068BCE:
	cmp r2, 0x3
	beq _08068BEC
	cmp r2, 0x4
	beq _08068BF6
	b _08068C04
_08068BD8:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsNorthArrowWarp
	b _08068BFE
_08068BE2:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsSouthArrowWarp
	b _08068BFE
_08068BEC:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsWestArrowWarp
	b _08068BFE
_08068BF6:
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsEastArrowWarp
_08068BFE:
	lsls r0, 24
	lsrs r0, 24
	b _08068C06
_08068C04:
	movs r0, 0
_08068C06:
	pop {r1}
	bx r1
	thumb_func_end is_non_stair_warp_tile

	thumb_func_start map_warp_check_packed
map_warp_check_packed: @ 8068C0C
	push {lr}
	adds r3, r1, 0
	ldrh r1, [r3]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r3, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r3, 0x4]
	bl map_warp_check
	lsls r0, 24
	asrs r0, 24
	pop {r1}
	bx r1
	thumb_func_end map_warp_check_packed

	thumb_func_start sub_8068C30
sub_8068C30: @ 8068C30
	push {r4-r7,lr}
	adds r5, r2, 0
	ldr r0, _08068C50
	ldr r0, [r0, 0x4]
	lsls r1, 24
	asrs r7, r1, 24
	lsls r6, r7, 3
	ldr r0, [r0, 0x8]
	adds r4, r0, r6
	ldrb r0, [r4, 0x6]
	cmp r0, 0x7F
	bne _08068C54
	ldrb r0, [r4, 0x5]
	bl copy_saved_warp2_bank_and_enter_x_to_warp1
	b _08068C9E
	.align 2, 0
_08068C50: .4byte 0x0202e828
_08068C54:
	movs r0, 0x7
	ldrsb r0, [r4, r0]
	movs r1, 0x6
	ldrsb r1, [r4, r1]
	movs r2, 0x5
	ldrsb r2, [r4, r2]
	bl warp1_set_2
	movs r1, 0
	ldrsh r0, [r5, r1]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl sub_80535C4
	ldrb r0, [r4, 0x7]
	ldrb r1, [r4, 0x6]
	bl get_mapheader_by_bank_and_number
	ldr r1, [r0, 0x4]
	ldrb r0, [r4, 0x5]
	ldr r1, [r1, 0x8]
	lsls r0, 3
	adds r0, r1
	ldrb r0, [r0, 0x6]
	cmp r0, 0x7F
	bne _08068C9E
	adds r0, r6, r1
	ldrb r0, [r0, 0x5]
	ldr r2, _08068CA4
	movs r1, 0x4
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, 0x5]
	lsls r2, 24
	asrs r2, 24
	adds r3, r7, 0
	bl saved_warp2_set
_08068C9E:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068CA4: .4byte 0x02025734
	thumb_func_end sub_8068C30

	thumb_func_start map_warp_consider_2_to_inside
map_warp_consider_2_to_inside: @ 8068CA8
	push {r4-r7,lr}
	adds r5, r0, 0
	lsls r1, 16
	lsrs r0, r1, 16
	adds r7, r0, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0x2
	bne _08068D2C
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80571C0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068CE0
	ldr r0, _08068CDC
	ldr r1, [r0, 0x4]
	adds r0, r5, 0
	bl sub_80BC038
	movs r0, 0x1
	b _08068D2E
	.align 2, 0
_08068CDC: .4byte 0x0202e828
_08068CE0:
	adds r0, r4, 0
	bl is_tile_x69_2_warp_door
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068D2C
	ldr r6, _08068D28
	adds r0, r6, 0
	adds r1, r5, 0
	bl map_warp_check_packed
	lsls r0, 24
	asrs r4, r0, 24
	movs r0, 0x1
	negs r0, r0
	cmp r4, r0
	beq _08068D2C
	adds r0, r7, 0
	bl sub_8068B30
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068D2C
	bl walkrun_find_lowest_active_bit_in_bitfield
	adds r0, r6, 0
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8068C30
	bl sub_8080EF0
	movs r0, 0x1
	b _08068D2E
	.align 2, 0
_08068D28: .4byte 0x0202e828
_08068D2C:
	movs r0, 0
_08068D2E:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end map_warp_consider_2_to_inside

	thumb_func_start map_warp_check
map_warp_check: @ 8068D34
	push {r4-r6,lr}
	lsls r1, 16
	lsrs r6, r1, 16
	lsls r2, 16
	lsrs r5, r2, 16
	lsls r3, 24
	lsrs r4, r3, 24
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0x8]
	ldrb r3, [r0, 0x1]
	movs r2, 0
	cmp r2, r3
	bge _08068D72
_08068D4E:
	ldrh r0, [r1]
	cmp r0, r6
	bne _08068D6A
	ldrh r0, [r1, 0x2]
	cmp r0, r5
	bne _08068D6A
	ldrb r0, [r1, 0x4]
	cmp r0, r4
	beq _08068D64
	cmp r0, 0
	bne _08068D6A
_08068D64:
	lsls r0, r2, 24
	asrs r0, 24
	b _08068D76
_08068D6A:
	adds r2, 0x1
	adds r1, 0x8
	cmp r2, r3
	blt _08068D4E
_08068D72:
	movs r0, 0x1
	negs r0, r0
_08068D76:
	pop {r4-r6}
	pop {r1}
	bx r1
	thumb_func_end map_warp_check

	thumb_func_start trigger_activate
trigger_activate: @ 8068D7C
	push {r4,lr}
	adds r4, r0, 0
	cmp r4, 0
	beq _08068DB2
	ldr r1, [r4, 0xC]
	cmp r1, 0
	bne _08068D92
	ldrb r0, [r4, 0x6]
	bl sub_8069408
	b _08068DB2
_08068D92:
	ldrh r0, [r4, 0x6]
	cmp r0, 0
	beq _08068DAC
	ldrh r0, [r4, 0x6]
	bl VarGet
	lsls r0, 16
	lsrs r0, 16
	ldrb r1, [r4, 0x8]
	cmp r0, r1
	bne _08068DB2
	ldr r0, [r4, 0xC]
	b _08068DB4
_08068DAC:
	adds r0, r1, 0
	bl script_env_2_execute_new_script
_08068DB2:
	movs r0, 0
_08068DB4:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end trigger_activate

	thumb_func_start mapheader_trigger_activate_at
mapheader_trigger_activate_at: @ 8068DBC
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r1, 16
	lsrs r1, 16
	mov r10, r1
	lsls r2, 16
	lsrs r2, 16
	mov r9, r2
	lsls r3, 24
	lsrs r3, 24
	mov r8, r3
	ldr r0, [r0, 0x4]
	ldr r1, [r0, 0xC]
	ldrb r7, [r0, 0x2]
	movs r6, 0
	cmp r6, r7
	bge _08068E12
	adds r5, r1, 0
	adds r4, r5, 0
_08068DE8:
	ldrh r0, [r4]
	cmp r0, r10
	bne _08068E08
	ldrh r0, [r4, 0x2]
	cmp r0, r9
	bne _08068E08
	ldrb r0, [r4, 0x4]
	cmp r0, r8
	beq _08068DFE
	cmp r0, 0
	bne _08068E08
_08068DFE:
	adds r0, r5, 0
	bl trigger_activate
	cmp r0, 0
	bne _08068E14
_08068E08:
	adds r4, 0x10
	adds r5, 0x10
	adds r6, 0x1
	cmp r6, r7
	blt _08068DE8
_08068E12:
	movs r0, 0
_08068E14:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end mapheader_trigger_activate_at

	thumb_func_start sub_8068E24
sub_8068E24: @ 8068E24
	push {r4,lr}
	ldr r4, _08068E48
	ldrh r1, [r0]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	ldrh r2, [r0, 0x2]
	subs r2, 0x7
	lsls r2, 16
	lsrs r2, 16
	ldrb r3, [r0, 0x4]
	adds r0, r4, 0
	bl mapheader_trigger_activate_at
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08068E48: .4byte 0x0202e828
	thumb_func_end sub_8068E24

	thumb_func_start FindInvisibleMapObjectByPosition
FindInvisibleMapObjectByPosition: @ 8068E4C
	push {r4-r7,lr}
	lsls r1, 16
	lsrs r7, r1, 16
	lsls r2, 16
	lsrs r6, r2, 16
	lsls r3, 24
	lsrs r5, r3, 24
	ldr r0, [r0, 0x4]
	ldr r4, [r0, 0x10]
	ldrb r3, [r0, 0x3]
	movs r2, 0
	cmp r2, r3
	bcs _08068E92
_08068E66:
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 2
	adds r1, r0, r4
	ldrh r0, [r1]
	cmp r0, r7
	bne _08068E88
	ldrh r0, [r1, 0x2]
	cmp r0, r6
	bne _08068E88
	ldrb r0, [r1, 0x4]
	cmp r0, r5
	beq _08068E84
	cmp r0, 0
	bne _08068E88
_08068E84:
	adds r0, r1, 0
	b _08068E94
_08068E88:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, r3
	bcc _08068E66
_08068E92:
	movs r0, 0
_08068E94:
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end FindInvisibleMapObjectByPosition

	thumb_func_start dive_warp
dive_warp: @ 8068E9C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	ldr r0, _08068ED0
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _08068ED4
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_805750C
	lsls r0, 24
	cmp r0, 0
	bne _08068ED4
	ldrh r0, [r4]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x2]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538B0
	b _08068EF8
	.align 2, 0
_08068ED0: .4byte 0x0202e828
_08068ED4:
	lsls r0, r5, 24
	lsrs r0, 24
	bl sub_80574EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068F10
	ldrh r0, [r4]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4, 0x2]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538D0
_08068EF8:
	lsls r0, 24
	cmp r0, 0
	beq _08068F10
	bl walkrun_find_lowest_active_bit_in_bitfield
	bl sp13E_warp_to_last_warp
	movs r0, 0xE9
	bl audio_play
	movs r0, 0x1
	b _08068F12
_08068F10:
	movs r0, 0
_08068F12:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end dive_warp

	thumb_func_start sub_8068F18
sub_8068F18: @ 8068F18
	push {r4,r5,lr}
	sub sp, 0x4
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _08068F70
	ldrb r0, [r0, 0x17]
	cmp r0, 0x5
	bne _08068F74
	adds r0, r5, 0
	bl sub_805750C
	lsls r0, 24
	cmp r0, 0
	bne _08068F74
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538B0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068FA4
	movs r0, 0x1
	b _08068FA6
	.align 2, 0
_08068F70: .4byte 0x0202e828
_08068F74:
	adds r0, r5, 0
	bl sub_80574EC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068FA4
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	lsrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	lsrs r1, 16
	bl sub_80538D0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08068FA4
	movs r0, 0x2
	b _08068FA6
_08068FA4:
	movs r0, 0
_08068FA6:
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8068F18

	thumb_func_start GetFieldObjectScriptPointerForComparison
GetFieldObjectScriptPointerForComparison: @ 8068FB0
	push {r4,r5,lr}
	sub sp, 0x8
	bl player_get_direction_upper_nybble
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	mov r5, sp
	mov r0, sp
	bl player_get_next_pos_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, sp
	adds r2, r4, 0
	bl sub_8068364
	add sp, 0x8
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end GetFieldObjectScriptPointerForComparison

	thumb_func_start sub_8068FEC
sub_8068FEC: @ 8068FEC
	push {r4,lr}
	sub sp, 0x8
	bl player_get_direction_upper_nybble
	mov r4, sp
	mov r0, sp
	bl player_get_pos_to_and_height
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0x2
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	ldr r4, _0806902C
	adds r0, r4, 0
	mov r1, sp
	bl map_warp_check_packed
	adds r1, r0, 0
	lsls r1, 24
	asrs r1, 24
	adds r0, r4, 0
	mov r2, sp
	bl sub_8068C30
	movs r0, 0
	add sp, 0x8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806902C: .4byte 0x0202e828
	thumb_func_end sub_8068FEC

	thumb_func_start sub_8069030
sub_8069030: @ 8069030
	push {r4,lr}
	ldr r4, _08069064
	movs r2, 0x90
	lsls r2, 1
	adds r0, r4, 0
	movs r1, 0
	bl memset
	movs r0, 0x90
	lsls r0, 1
	adds r4, r0
	movs r2, 0x80
	lsls r2, 2
	adds r0, r4, 0
	movs r1, 0
	bl memset
	ldr r0, _08069068
	movs r1, 0
	movs r2, 0x10
	bl memset
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069064: .4byte 0x02026954
_08069068: .4byte 0x0202e8e2
	thumb_func_end sub_8069030

	thumb_func_start sub_806906C
sub_806906C: @ 806906C
	push {lr}
	ldr r0, _080690A0
	movs r1, 0
	str r1, [r0]
	movs r1, 0x90
	lsls r1, 1
	adds r0, r1
	movs r1, 0
	movs r2, 0x20
	bl memset
	ldr r0, _080690A4
	bl FlagReset
	ldr r0, _080690A8
	bl FlagReset
	ldr r0, _080690AC
	bl FlagReset
	ldr r0, _080690B0
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080690A0: .4byte 0x02026954
_080690A4: .4byte 0x0000084d
_080690A8: .4byte 0x0000084e
_080690AC: .4byte 0x00000829
_080690B0: .4byte 0x00000861
	thumb_func_end sub_806906C

	thumb_func_start sub_80690B4
sub_80690B4: @ 80690B4
	push {lr}
	ldr r0, _080690C4
	movs r1, 0
	movs r2, 0x8
	bl memset
	pop {r0}
	bx r0
	.align 2, 0
_080690C4: .4byte 0x02026a6c
	thumb_func_end sub_80690B4

	thumb_func_start sub_80690C8
sub_80690C8: @ 80690C8
	push {lr}
	ldr r0, _080690E4
	bl GetVarPointer
	ldr r2, _080690E8
	movs r1, 0
	strb r1, [r2, 0x1A]
	strh r1, [r0]
	ldr r0, _080690EC
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080690E4: .4byte 0x00004046
_080690E8: .4byte 0x02024ea4
_080690EC: .4byte 0x00000836
	thumb_func_end sub_80690C8

	thumb_func_start sub_80690F0
sub_80690F0: @ 80690F0
	push {r4,r5,lr}
	ldr r0, _0806911C
	bl GetVarPointer
	ldr r4, _08069120
	movs r5, 0
	movs r1, 0xDA
	strb r1, [r4, 0x1A]
	ldr r2, _08069124
	adds r1, r2, 0
	strh r1, [r0]
	ldr r0, _08069128
	bl FlagSet
	movs r0, 0x1
	strb r0, [r4, 0x19]
	strb r5, [r4, 0x18]
	bl sub_808C0A0
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806911C: .4byte 0x00004046
_08069120: .4byte 0x02024ea4
_08069124: .4byte 0x00000302
_08069128: .4byte 0x00000836
	thumb_func_end sub_80690F0

	thumb_func_start sub_806912C
sub_806912C: @ 806912C
	push {lr}
	ldr r0, _08069154
	ldrb r0, [r0, 0x1A]
	cmp r0, 0xDA
	bne _08069164
	ldr r0, _08069158
	bl VarGet
	lsls r0, 16
	ldr r1, _0806915C
	cmp r0, r1
	bne _08069164
	ldr r0, _08069160
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08069164
	movs r0, 0x1
	b _08069166
	.align 2, 0
_08069154: .4byte 0x02024ea4
_08069158: .4byte 0x00004046
_0806915C: .4byte 0x03020000
_08069160: .4byte 0x00000836
_08069164:
	movs r0, 0
_08069166:
	pop {r1}
	bx r1
	thumb_func_end sub_806912C

	thumb_func_start unref_sub_806916C
unref_sub_806916C: @ 806916C
	push {lr}
	ldr r0, _08069178
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_08069178: .4byte 0x0000084c
	thumb_func_end unref_sub_806916C

	thumb_func_start unref_sub_806917C
unref_sub_806917C: @ 806917C
	push {lr}
	ldr r0, _08069188
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_08069188: .4byte 0x0000084c
	thumb_func_end unref_sub_806917C

	thumb_func_start sub_806918C
sub_806918C: @ 806918C
	push {lr}
	ldr r0, _0806919C
	bl FlagGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806919C: .4byte 0x0000084c
	thumb_func_end sub_806918C

	thumb_func_start sub_80691A0
sub_80691A0: @ 80691A0
	push {lr}
	ldr r0, _080691B4
	movs r1, 0
	bl VarSet
	ldr r0, _080691B8
	bl FlagReset
	pop {r0}
	bx r0
	.align 2, 0
_080691B4: .4byte 0x0000402c
_080691B8: .4byte 0x00000862
	thumb_func_end sub_80691A0

	thumb_func_start sub_80691BC
sub_80691BC: @ 80691BC
	push {lr}
	ldr r0, _080691D4
	movs r1, 0x92
	lsls r1, 4
	bl VarSet
	ldr r0, _080691D8
	bl FlagSet
	pop {r0}
	bx r0
	.align 2, 0
_080691D4: .4byte 0x0000402c
_080691D8: .4byte 0x00000862
	thumb_func_end sub_80691BC

	thumb_func_start sub_80691DC
sub_80691DC: @ 80691DC
	push {lr}
	ldr r0, _08069200
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _08069208
	ldr r0, _08069204
	bl VarGet
	lsls r0, 16
	movs r1, 0x92
	lsls r1, 20
	cmp r0, r1
	bne _08069208
	movs r0, 0x1
	b _0806920A
	.align 2, 0
_08069200: .4byte 0x00000862
_08069204: .4byte 0x0000402c
_08069208:
	movs r0, 0
_0806920A:
	pop {r1}
	bx r1
	thumb_func_end sub_80691DC

	thumb_func_start GetVarPointer
GetVarPointer: @ 8069210
	push {lr}
	lsls r0, 16
	lsrs r1, r0, 16
	adds r2, r1, 0
	ldr r0, _08069224
	cmp r1, r0
	bhi _08069228
	movs r0, 0
	b _0806924A
	.align 2, 0
_08069224: .4byte 0x00003fff
_08069228:
	lsls r0, r1, 16
	cmp r0, 0
	bge _08069244
	ldr r0, _0806923C
	ldr r2, _08069240
	adds r1, r2
	lsls r1, 2
	adds r1, r0
	ldr r0, [r1]
	b _0806924A
	.align 2, 0
_0806923C: .4byte gUnknown_0814B14C
_08069240: .4byte 0xffff8000
_08069244:
	lsls r0, r2, 1
	ldr r1, _08069250
	adds r0, r1
_0806924A:
	pop {r1}
	bx r1
	.align 2, 0
_08069250: .4byte 0x0201ea74
	thumb_func_end GetVarPointer

	thumb_func_start VarGet
VarGet: @ 8069254
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetVarPointer
	cmp r0, 0
	beq _08069268
	ldrh r0, [r0]
	b _0806926A
_08069268:
	adds r0, r4, 0
_0806926A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarGet

	thumb_func_start VarSet
VarSet: @ 8069270
	push {r4,lr}
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 16
	lsrs r4, r1, 16
	bl GetVarPointer
	cmp r0, 0
	beq _08069288
	strh r4, [r0]
	movs r0, 0x1
	b _0806928A
_08069288:
	movs r0, 0
_0806928A:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end VarSet

	thumb_func_start VarGetFieldObjectGraphicsId
VarGetFieldObjectGraphicsId: @ 8069290
	push {lr}
	lsls r0, 24
	lsrs r0, 8
	ldr r1, _080692A8
	adds r0, r1
	lsrs r0, 16
	bl VarGet
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_080692A8: .4byte 0x40100000
	thumb_func_end VarGetFieldObjectGraphicsId

	thumb_func_start GetFlagPointer
GetFlagPointer: @ 80692AC
	push {lr}
	lsls r2, r0, 16
	lsrs r1, r2, 16
	adds r3, r1, 0
	cmp r1, 0
	bne _080692BC
	movs r0, 0
	b _080692E2
_080692BC:
	ldr r0, _080692C8
	cmp r1, r0
	bhi _080692D0
	lsrs r0, r2, 19
	ldr r1, _080692CC
	b _080692E0
	.align 2, 0
_080692C8: .4byte 0x00003fff
_080692CC: .4byte 0x02026954
_080692D0:
	ldr r1, _080692E8
	adds r0, r3, r1
	cmp r0, 0
	bge _080692DC
	adds r1, 0x7
	adds r0, r3, r1
_080692DC:
	asrs r0, 3
	ldr r1, _080692EC
_080692E0:
	adds r0, r1
_080692E2:
	pop {r1}
	bx r1
	.align 2, 0
_080692E8: .4byte 0xffffc000
_080692EC: .4byte 0x0202e8e2
	thumb_func_end GetFlagPointer

	thumb_func_start FlagSet
FlagSet: @ 80692F0
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	adds r2, r0, 0
	cmp r2, 0
	beq _08069310
	movs r0, 0x7
	ands r0, r4
	movs r1, 0x1
	lsls r1, r0
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
_08069310:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagSet

	thumb_func_start FlagReset
FlagReset: @ 8069318
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	adds r2, r0, 0
	cmp r2, 0
	beq _08069338
	movs r0, 0x7
	ands r0, r4
	movs r1, 0x1
	lsls r1, r0
	ldrb r0, [r2]
	bics r0, r1
	strb r0, [r2]
_08069338:
	movs r0, 0
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagReset

	thumb_func_start FlagGet
FlagGet: @ 8069340
	push {r4,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	adds r0, r4, 0
	bl GetFlagPointer
	cmp r0, 0
	beq _08069364
	ldrb r0, [r0]
	movs r1, 0x7
	ands r1, r4
	asrs r0, r1
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _08069364
	movs r0, 0x1
	b _08069366
_08069364:
	movs r0, 0
_08069366:
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end FlagGet

	thumb_func_start sub_806936C
sub_806936C: @ 806936C
	push {lr}
	movs r0, 0x1
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_806936C

	thumb_func_start sub_8069378
sub_8069378: @ 8069378
	push {lr}
	movs r0, 0x2
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069378

	thumb_func_start sub_8069384
sub_8069384: @ 8069384
	push {lr}
	movs r0, 0x3
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069384

	thumb_func_start sub_8069390
sub_8069390: @ 8069390
	push {lr}
	movs r0, 0x4
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_8069390

	thumb_func_start sub_806939C
sub_806939C: @ 806939C
	push {lr}
	movs r0, 0x5
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_806939C

	thumb_func_start sub_80693A8
sub_80693A8: @ 80693A8
	push {lr}
	movs r0, 0x6
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693A8

	thumb_func_start sub_80693B4
sub_80693B4: @ 80693B4
	push {lr}
	movs r0, 0x9
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693B4

	thumb_func_start sub_80693C0
sub_80693C0: @ 80693C0
	push {lr}
	movs r0, 0x7
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693C0

	thumb_func_start sub_80693CC
sub_80693CC: @ 80693CC
	push {lr}
	movs r0, 0x8
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693CC

	thumb_func_start sub_80693D8
sub_80693D8: @ 80693D8
	push {lr}
	movs r0, 0xB
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693D8

	thumb_func_start sub_80693E4
sub_80693E4: @ 80693E4
	push {lr}
	movs r0, 0xC
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693E4

	thumb_func_start sub_80693F0
sub_80693F0: @ 80693F0
	push {lr}
	movs r0, 0x14
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693F0

	thumb_func_start sub_80693FC
sub_80693FC: @ 80693FC
	push {lr}
	movs r0, 0x15
	bl sub_808070C
	pop {r0}
	bx r0
	thumb_func_end sub_80693FC

	thumb_func_start sub_8069408
sub_8069408: @ 8069408
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	movs r2, 0
	ldr r3, _08069428
_08069412:
	lsls r1, r2, 3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, r4
	bne _0806942C
	adds r0, r3, 0x4
	adds r0, r1, r0
	ldr r0, [r0]
	bl _call_via_r0
	b _08069436
	.align 2, 0
_08069428: .4byte gUnknown_083762FC
_0806942C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xC
	bls _08069412
_08069436:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_8069408

	thumb_func_start task_per_step_callback_manager
task_per_step_callback_manager: @ 806943C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _08069460
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r2, 0x8
	ldrsh r1, [r1, r2]
	ldr r2, _08069464
	lsls r1, 2
	adds r1, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08069460: .4byte 0x03004b20
_08069464: .4byte gUnknown_08376364
	thumb_func_end task_per_step_callback_manager

	thumb_func_start sub_8069468
sub_8069468: @ 8069468
	push {r4,lr}
	adds r4, r0, 0
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0806947A
	cmp r0, 0x1
	beq _08069498
	b _080694AC
_0806947A:
	ldr r0, _08069494
	ldr r0, [r0, 0x20]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	beq _080694AC
	bl InTrainerHill
	ldrh r0, [r4]
	adds r0, 0x1
	b _080694AA
	.align 2, 0
_08069494: .4byte 0x03001770
_08069498:
	ldr r0, _080694B4
	ldr r0, [r0, 0x20]
	movs r1, 0x80
	lsls r1, 5
	ands r0, r1
	cmp r0, 0
	bne _080694AC
	ldrh r0, [r4]
	subs r0, 0x1
_080694AA:
	strh r0, [r4]
_080694AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080694B4: .4byte 0x03001770
	thumb_func_end sub_8069468

	thumb_func_start sub_80694B8
sub_80694B8: @ 80694B8
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _080694E8
	adds r4, r1, r0
	bl script_env_2_is_enabled
	lsls r0, 24
	cmp r0, 0
	bne _080694E0
	adds r0, r4, 0
	bl sub_8069468
	adds r0, r4, 0x2
	adds r1, r4, 0x4
	bl sub_80540D0
_080694E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080694E8: .4byte 0x03004b28
	thumb_func_end sub_80694B8

	thumb_func_start overworld_ensure_per_step_coros_running
overworld_ensure_per_step_coros_running: @ 80694EC
	push {r4,r5,lr}
	ldr r5, _08069548
	adds r0, r5, 0
	bl FuncIsActiveTask
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0
	bne _08069516
	adds r0, r5, 0
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806954C
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	strh r4, [r1, 0x8]
_08069516:
	ldr r4, _08069550
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _0806952C
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_0806952C:
	ldr r4, _08069554
	adds r0, r4, 0
	bl FuncIsActiveTask
	lsls r0, 24
	cmp r0, 0
	bne _08069542
	adds r0, r4, 0
	movs r1, 0x50
	bl CreateTask
_08069542:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069548: .4byte task_per_step_callback_manager
_0806954C: .4byte 0x03004b20
_08069550: .4byte sub_806A1E8
_08069554: .4byte sub_80694B8
	thumb_func_end overworld_ensure_per_step_coros_running

	thumb_func_start activate_per_step_callback
activate_per_step_callback: @ 8069558
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _08069590
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _0806959A
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _08069594
	adds r1, r0, r1
	movs r2, 0
	adds r0, r1, 0
	adds r0, 0x1E
_0806957C:
	strh r2, [r0]
	subs r0, 0x2
	cmp r0, r1
	bge _0806957C
	cmp r4, 0x7
	bls _08069598
	movs r0, 0
	strh r0, [r1]
	b _0806959A
	.align 2, 0
_08069590: .4byte task_per_step_callback_manager
_08069594: .4byte 0x03004b28
_08069598:
	strh r4, [r1]
_0806959A:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end activate_per_step_callback

	thumb_func_start wild_encounter_reset_coro_args
wild_encounter_reset_coro_args: @ 80695A0
	push {lr}
	ldr r0, _080695D0
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r0, _080695D4
	bl FindTaskIdByFunc
	lsls r0, 24
	lsrs r1, r0, 24
	cmp r1, 0xFF
	beq _080695CA
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	ldr r1, _080695D8
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x2]
	strh r1, [r0, 0x4]
_080695CA:
	pop {r0}
	bx r0
	.align 2, 0
_080695D0: .4byte task_per_step_callback_manager
_080695D4: .4byte sub_80694B8
_080695D8: .4byte 0x03004b28
	thumb_func_end wild_encounter_reset_coro_args

	thumb_func_start nullsub_51
nullsub_51: @ 80695DC
	bx lr
	thumb_func_end nullsub_51

	thumb_func_start sub_80695E0
sub_80695E0: @ 80695E0
	push {r4,r5,lr}
	adds r5, r0, 0
	lsls r1, 24
	lsrs r4, r1, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _080695F8
	adds r0, r5, 0
	b _08069630
_080695F8:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _0806960A
	adds r0, r5, 0
	adds r0, 0x8
	b _08069630
_0806960A:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _0806961C
	adds r0, r5, 0
	adds r0, 0x10
	b _08069630
_0806961C:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	bne _0806962C
	movs r0, 0
	b _08069630
_0806962C:
	adds r0, r5, 0
	adds r0, 0x18
_08069630:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_80695E0

	thumb_func_start sub_8069638
sub_8069638: @ 8069638
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r5, r0, 0
	mov r8, r3
	lsls r1, 16
	asrs r6, r1, 16
	lsls r2, 16
	asrs r7, r2, 16
	adds r0, r6, 0
	adds r1, r7, 0
	bl MapGridGetMetatileBehaviorAt
	adds r1, r0, 0
	lsls r1, 16
	lsrs r1, 16
	adds r0, r5, 0
	bl sub_80695E0
	adds r4, r0, 0
	adds r5, r4, 0
	cmp r4, 0
	beq _080696B6
	movs r0, 0
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	adds r1, r7, r1
	ldrh r2, [r4, 0x2]
	bl MapGridSetMetatileIdAt
	mov r0, r8
	cmp r0, 0
	beq _0806968E
	movs r0, 0
	ldrsb r0, [r4, r0]
	adds r0, r6, r0
	movs r1, 0x1
	ldrsb r1, [r4, r1]
	adds r1, r7, r1
	bl CurrentMapDrawMetatileAt
_0806968E:
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	adds r0, r6, r0
	movs r1, 0x5
	ldrsb r1, [r5, r1]
	adds r1, r7, r1
	ldrh r2, [r5, 0x6]
	bl MapGridSetMetatileIdAt
	mov r0, r8
	cmp r0, 0
	beq _080696B6
	movs r0, 0x4
	ldrsb r0, [r5, r0]
	adds r0, r6, r0
	movs r1, 0x5
	ldrsb r1, [r5, r1]
	adds r1, r7, r1
	bl CurrentMapDrawMetatileAt
_080696B6:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069638

	thumb_func_start sub_80696C0
sub_80696C0: @ 80696C0
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _080696E0
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_080696E0: .4byte gUnknown_08376384
	thumb_func_end sub_80696C0

	thumb_func_start sub_80696E4
sub_80696E4: @ 80696E4
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08069704
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069704: .4byte gUnknown_083763A4
	thumb_func_end sub_80696E4

	thumb_func_start sub_8069708
sub_8069708: @ 8069708
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r3, r2, 0
	ldr r0, _08069728
	lsls r4, 16
	asrs r4, 16
	lsls r5, 16
	asrs r5, 16
	adds r1, r4, 0
	adds r2, r5, 0
	bl sub_8069638
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069728: .4byte gUnknown_083763C4
	thumb_func_end sub_8069708

	thumb_func_start sub_806972C
sub_806972C: @ 806972C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 16
	lsrs r0, 16
	mov r8, r0
	mov r10, r8
	lsls r1, 16
	lsrs r7, r1, 16
	mov r9, r7
	lsls r2, 16
	asrs r6, r2, 16
	lsls r3, 16
	asrs r5, r3, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _08069770
	lsls r0, r7, 16
	asrs r0, 16
	cmp r0, r5
	ble _080697B6
_0806976C:
	movs r0, 0
	b _080697B8
_08069770:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _08069788
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r5
	bge _080697B6
	b _0806976C
_08069788:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _080697A0
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r6
	ble _080697B6
	b _0806976C
_080697A0:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	beq _080697B6
	mov r1, r10
	lsls r0, r1, 16
	asrs r0, 16
	cmp r0, r6
	blt _0806976C
_080697B6:
	movs r0, 0x1
_080697B8:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806972C

	thumb_func_start sub_80697C8
sub_80697C8: @ 80697C8
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	mov r10, r8
	lsls r3, 16
	lsrs r7, r3, 16
	mov r9, r7
	lsls r0, 16
	asrs r6, r0, 16
	lsls r1, 16
	asrs r5, r1, 16
	adds r0, r6, 0
	adds r1, r5, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	bl sub_80576A0
	lsls r0, 24
	cmp r0, 0
	beq _0806980C
	lsls r0, r7, 16
	asrs r0, 16
	cmp r5, r0
	bge _08069852
_08069808:
	movs r0, 0
	b _08069854
_0806980C:
	adds r0, r4, 0
	bl sub_80576B4
	lsls r0, 24
	cmp r0, 0
	beq _08069824
	mov r1, r9
	lsls r0, r1, 16
	asrs r0, 16
	cmp r5, r0
	ble _08069852
	b _08069808
_08069824:
	adds r0, r4, 0
	bl sub_80576C8
	lsls r0, 24
	cmp r0, 0
	beq _0806983C
	mov r1, r8
	lsls r0, r1, 16
	asrs r0, 16
	cmp r6, r0
	bge _08069852
	b _08069808
_0806983C:
	adds r0, r4, 0
	bl sub_80576DC
	lsls r0, 24
	cmp r0, 0
	beq _08069852
	mov r1, r10
	lsls r0, r1, 16
	asrs r0, 16
	cmp r6, r0
	bgt _08069808
_08069852:
	movs r0, 0x1
_08069854:
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_80697C8

	thumb_func_start sub_8069864
sub_8069864: @ 8069864
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069898
	adds r4, r1, r0
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	movs r1, 0x2
	ldrsh r0, [r4, r1]
	adds r6, r5, 0
	cmp r0, 0x1
	beq _080698BE
	cmp r0, 0x1
	bgt _0806989C
	cmp r0, 0
	beq _080698A2
	b _080699CE
	.align 2, 0
_08069898: .4byte 0x03004b28
_0806989C:
	cmp r0, 0x2
	beq _0806998C
	b _080699CE
_080698A2:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r3, 0
	ldrsh r1, [r5, r3]
	movs r2, 0x1
	bl sub_80696E4
	b _080699CA
_080698BE:
	mov r0, sp
	movs r7, 0
	ldrsh r1, [r0, r7]
	movs r2, 0x4
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080698D8
	movs r3, 0
	ldrsh r1, [r5, r3]
	movs r7, 0x6
	ldrsh r0, [r4, r7]
	cmp r1, r0
	beq _080699CE
_080698D8:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r5, 0x6
	ldrsh r3, [r4, r5]
	bl sub_806972C
	cmp r0, 0
	beq _08069920
	movs r7, 0x4
	ldrsh r0, [r4, r7]
	movs r2, 0x6
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	bl sub_80696C0
	movs r3, 0x4
	ldrsh r0, [r4, r3]
	movs r5, 0x6
	ldrsh r1, [r4, r5]
	movs r2, 0
	bl sub_8069708
	ldrh r0, [r4, 0x4]
	strh r0, [r4, 0x8]
	ldrh r0, [r4, 0x6]
	strh r0, [r4, 0xA]
	movs r0, 0x2
	strh r0, [r4, 0x2]
	movs r0, 0x8
	strh r0, [r4, 0xC]
	b _0806992A
_08069920:
	movs r7, 0x1
	negs r7, r7
	adds r0, r7, 0
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
_0806992A:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	adds r5, r6, 0
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	movs r7, 0x6
	ldrsh r3, [r4, r7]
	bl sub_80697C8
	cmp r0, 0
	beq _0806995E
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x1
	bl sub_80696C0
	movs r0, 0x2
	strh r0, [r4, 0x2]
	movs r0, 0x8
	strh r0, [r4, 0xC]
_0806995E:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r6]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r5, 0
	ldrsh r1, [r6, r5]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsPacifidlogLog
	lsls r0, 24
	cmp r0, 0
	beq _080699CE
	movs r0, 0x46
	bl audio_play
	b _080699CE
_0806998C:
	ldrh r0, [r4, 0xC]
	subs r0, 0x1
	strh r0, [r4, 0xC]
	lsls r0, 16
	cmp r0, 0
	bne _080699CE
	mov r0, sp
	movs r7, 0
	ldrsh r0, [r0, r7]
	movs r2, 0
	ldrsh r1, [r5, r2]
	movs r2, 0x1
	bl sub_80696E4
	movs r3, 0x8
	ldrsh r0, [r4, r3]
	movs r1, 0x1
	negs r1, r1
	cmp r0, r1
	beq _080699CA
	movs r5, 0xA
	ldrsh r0, [r4, r5]
	cmp r0, r1
	beq _080699CA
	movs r7, 0x8
	ldrsh r0, [r4, r7]
	movs r2, 0xA
	ldrsh r1, [r4, r2]
	movs r2, 0x1
	bl sub_8069708
_080699CA:
	movs r0, 0x1
	strh r0, [r4, 0x2]
_080699CE:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069864

	thumb_func_start sub_80699D8
sub_80699D8: @ 80699D8
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08069A32
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r5, 16
	asrs r5, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _08069A14
	cmp r1, r0
	beq _08069A18
	adds r0, 0x8
	cmp r1, r0
	beq _08069A28
	b _08069A32
	.align 2, 0
_08069A14: .4byte 0x0000024e
_08069A18:
	ldr r2, _08069A24
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _08069A32
	.align 2, 0
_08069A24: .4byte 0x0000024f
_08069A28:
	ldr r2, _08069A38
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08069A32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069A38: .4byte 0x00000257
	thumb_func_end sub_80699D8

	thumb_func_start sub_8069A3C
sub_8069A3C: @ 8069A3C
	push {r4,r5,lr}
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r5, r1, 16
	bl PlayerGetZCoord
	lsls r0, 24
	lsrs r0, 24
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	bne _08069A96
	lsls r0, r4, 16
	asrs r4, r0, 16
	lsls r0, r5, 16
	asrs r5, r0, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridGetMetatileIdAt
	adds r1, r0, 0
	ldr r0, _08069A78
	cmp r1, r0
	beq _08069A7C
	adds r0, 0x8
	cmp r1, r0
	beq _08069A8C
	b _08069A96
	.align 2, 0
_08069A78: .4byte 0x0000024f
_08069A7C:
	ldr r2, _08069A88
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
	b _08069A96
	.align 2, 0
_08069A88: .4byte 0x0000024e
_08069A8C:
	ldr r2, _08069A9C
	adds r0, r4, 0
	adds r1, r5, 0
	bl MapGridSetMetatileIdAt
_08069A96:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069A9C: .4byte 0x00000256
	thumb_func_end sub_8069A3C

	thumb_func_start sub_8069AA0
sub_8069AA0: @ 8069AA0
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069ADC
	adds r6, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	movs r0, 0x2
	ldrsh r5, [r6, r0]
	mov r9, r4
	cmp r5, 0x1
	beq _08069B34
	cmp r5, 0x1
	bgt _08069AE0
	cmp r5, 0
	beq _08069AE8
	b _08069CA6
	.align 2, 0
_08069ADC: .4byte 0x03004b28
_08069AE0:
	cmp r5, 0x2
	bne _08069AE6
	b _08069C14
_08069AE6:
	b _08069CA6
_08069AE8:
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	mov r1, r9
	ldrh r0, [r1]
	strh r0, [r6, 0x6]
	mov r0, sp
	movs r2, 0
	ldrsh r0, [r0, r2]
	movs r3, 0
	ldrsh r1, [r1, r3]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	cmp r0, 0
	bne _08069B12
	b _08069CA2
_08069B12:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl sub_80699D8
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl CurrentMapDrawMetatileAt
	b _08069CA2
_08069B34:
	ldrh r0, [r6, 0x6]
	mov r8, r0
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	ldrh r2, [r6, 0x4]
	mov r10, r2
	movs r3, 0x4
	ldrsh r7, [r6, r3]
	cmp r0, r7
	bne _08069B5C
	mov r0, r9
	movs r2, 0
	ldrsh r1, [r0, r2]
	mov r3, r8
	lsls r0, r3, 16
	asrs r0, 16
	cmp r1, r0
	bne _08069B5C
	b _08069CA6
_08069B5C:
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	lsrs r0, 24
	str r0, [sp, 0x4]
	mov r0, r8
	lsls r4, r0, 16
	asrs r1, r4, 16
	adds r0, r7, 0
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsFortreeBridge
	lsls r0, 24
	lsrs r7, r0, 24
	bl PlayerGetZCoord
	movs r1, 0
	ands r5, r0
	lsls r0, r5, 24
	adds r5, r4, 0
	cmp r0, 0
	bne _08069BA4
	movs r1, 0x1
_08069BA4:
	cmp r1, 0
	beq _08069BB8
	ldr r1, [sp, 0x4]
	cmp r1, 0x1
	beq _08069BB2
	cmp r7, 0x1
	bne _08069BB8
_08069BB2:
	movs r0, 0x47
	bl audio_play
_08069BB8:
	cmp r7, 0
	beq _08069BF4
	mov r2, r10
	lsls r4, r2, 16
	asrs r4, 16
	asrs r5, 16
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_8069A3C
	adds r0, r4, 0
	adds r1, r5, 0
	bl CurrentMapDrawMetatileAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl sub_80699D8
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	mov r2, r9
	movs r3, 0
	ldrsh r1, [r2, r3]
	bl CurrentMapDrawMetatileAt
_08069BF4:
	mov r0, r10
	strh r0, [r6, 0x8]
	mov r1, r8
	strh r1, [r6, 0xA]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r6, 0x4]
	mov r2, r9
	ldrh r0, [r2]
	strh r0, [r6, 0x6]
	cmp r7, 0
	beq _08069CA6
	movs r0, 0x10
	strh r0, [r6, 0xC]
	movs r0, 0x2
	strh r0, [r6, 0x2]
_08069C14:
	ldrh r0, [r6, 0xC]
	subs r0, 0x1
	strh r0, [r6, 0xC]
	ldrh r3, [r6, 0x8]
	mov r10, r3
	ldrh r0, [r6, 0xA]
	mov r8, r0
	movs r1, 0xC
	ldrsh r0, [r6, r1]
	movs r1, 0x7
	bl __modsi3
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x7
	bhi _08069C9A
	lsls r0, 2
	ldr r1, _08069C40
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08069C40: .4byte _08069C44
	.align 2, 0
_08069C44:
	.4byte _08069C64
	.4byte _08069C9A
	.4byte _08069C9A
	.4byte _08069C9A
	.4byte _08069C76
	.4byte _08069C9A
	.4byte _08069C9A
	.4byte _08069C9A
_08069C64:
	mov r2, r10
	lsls r0, r2, 16
	asrs r0, 16
	mov r3, r8
	lsls r1, r3, 16
	asrs r1, 16
	bl CurrentMapDrawMetatileAt
	b _08069C9A
_08069C76:
	mov r0, r10
	lsls r5, r0, 16
	asrs r5, 16
	mov r1, r8
	lsls r4, r1, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_80699D8
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069A3C
_08069C9A:
	movs r2, 0xC
	ldrsh r0, [r6, r2]
	cmp r0, 0
	bne _08069CA6
_08069CA2:
	movs r0, 0x1
	strh r0, [r6, 0x2]
_08069CA6:
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_8069AA0

	thumb_func_start sub_8069CB8
sub_8069CB8: @ 8069CB8
	push {lr}
	lsls r1, 16
	lsrs r1, 16
	lsls r0, 16
	ldr r2, _08069CE8
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xA
	bhi _08069CF4
	lsls r0, r1, 16
	asrs r1, r0, 16
	ldr r2, _08069CEC
	adds r0, r2
	lsrs r0, 16
	cmp r0, 0xD
	bhi _08069CF4
	ldr r0, _08069CF0
	lsls r1, 1
	adds r1, r0
	ldrh r0, [r1]
	cmp r0, 0
	beq _08069CF4
	movs r0, 0x1
	b _08069CF6
	.align 2, 0
_08069CE8: .4byte 0xfffd0000
_08069CEC: .4byte 0xfffa0000
_08069CF0: .4byte gUnknown_083763E4
_08069CF4:
	movs r0, 0
_08069CF6:
	pop {r1}
	bx r1
	thumb_func_end sub_8069CB8

	thumb_func_start sub_8069CFC
sub_8069CFC: @ 8069CFC
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069CB8
	cmp r0, 0
	beq _08069D2A
	ldr r1, _08069D30
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	bl GetVarPointer
	subs r2, r5, 0x3
	movs r1, 0x1
	lsls r1, r2
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
_08069D2A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069D30: .4byte gUnknown_083763E4
	thumb_func_end sub_8069CFC

	thumb_func_start sub_8069D34
sub_8069D34: @ 8069D34
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_8069CB8
	cmp r0, 0
	beq _08069D66
	ldr r1, _08069D6C
	lsls r0, r4, 1
	adds r0, r1
	ldrh r0, [r0]
	bl VarGet
	lsls r0, 16
	subs r2, r5, 0x3
	movs r1, 0x80
	lsls r1, 9
	lsls r1, r2
	ands r1, r0
	cmp r1, 0
	bne _08069D70
_08069D66:
	movs r0, 0
	b _08069D72
	.align 2, 0
_08069D6C: .4byte gUnknown_083763E4
_08069D70:
	movs r0, 0x1
_08069D72:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_8069D34

	thumb_func_start sub_8069D78
sub_8069D78: @ 8069D78
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	ldr r0, _08069DCC
	ldr r0, [r0]
	ldr r1, [r0]
	mov r9, r1
	ldr r7, [r0, 0x4]
	movs r5, 0
	cmp r5, r9
	bge _08069DC0
_08069D90:
	movs r4, 0
	adds r0, r5, 0x1
	mov r8, r0
	cmp r4, r7
	bge _08069DBA
	lsls r6, r5, 16
_08069D9C:
	lsls r1, r4, 16
	asrs r1, 16
	asrs r0, r6, 16
	bl sub_8069D34
	cmp r0, 0x1
	bne _08069DB4
	adds r1, r4, 0x7
	adds r0, r5, 0x7
	ldr r2, _08069DD0
	bl MapGridSetMetatileIdAt
_08069DB4:
	adds r4, 0x1
	cmp r4, r7
	blt _08069D9C
_08069DBA:
	mov r5, r8
	cmp r5, r9
	blt _08069D90
_08069DC0:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069DCC: .4byte 0x0202e828
_08069DD0: .4byte 0x0000020e
	thumb_func_end sub_8069D78

	thumb_func_start sub_8069DD4
sub_8069DD4: @ 8069DD4
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069DF8
	adds r5, r1, r0
	movs r1, 0x2
	ldrsh r0, [r5, r1]
	cmp r0, 0x1
	beq _08069E20
	cmp r0, 0x1
	bgt _08069DFC
	cmp r0, 0
	beq _08069E08
	b _08069F56
	.align 2, 0
_08069DF8: .4byte 0x03004b28
_08069DFC:
	cmp r0, 0x2
	beq _08069EB6
	cmp r0, 0x3
	bne _08069E06
	b _08069F10
_08069E06:
	b _08069F56
_08069E08:
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x4]
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	b _08069F52
_08069E20:
	mov r7, sp
	adds r7, 0x2
	mov r0, sp
	adds r1, r7, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08069E4A
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08069E4A
	b _08069F56
_08069E4A:
	strh r2, [r5, 0x4]
	ldrh r0, [r7]
	strh r0, [r5, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r7, r2]
	bl MapGridGetMetatileBehaviorAt
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	ldr r0, _08069E8C
	bl GetVarPointer
	adds r6, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r4, 0
	bl sub_8057540
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08069E90
	ldrh r0, [r6]
	adds r0, 0x1
	strh r0, [r6]
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x2
	b _08069EA8
	.align 2, 0
_08069E8C: .4byte 0x00004022
_08069E90:
	adds r0, r4, 0
	bl sub_8057554
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _08069F56
	movs r0, 0
	strh r0, [r6]
	movs r0, 0x4
	strh r0, [r5, 0xC]
	movs r0, 0x3
_08069EA8:
	strh r0, [r5, 0x2]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x8]
	ldrh r0, [r7]
	strh r0, [r5, 0xA]
	b _08069F56
_08069EB6:
	ldrh r1, [r5, 0xC]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	cmp r0, 0
	bne _08069F1A
	mov r1, sp
	ldrh r0, [r5, 0x8]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x2
	ldrh r0, [r5, 0xA]
	strh r0, [r4]
	movs r0, 0x2A
	bl audio_play
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _08069F0C
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
	mov r0, sp
	ldrh r0, [r0]
	subs r0, 0x7
	lsls r0, 16
	asrs r0, 16
	ldrh r1, [r4]
	subs r1, 0x7
	lsls r1, 16
	asrs r1, 16
	bl sub_8069CFC
	b _08069F52
	.align 2, 0
_08069F0C: .4byte 0x0000020e
_08069F10:
	ldrh r1, [r5, 0xC]
	movs r3, 0xC
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _08069F20
_08069F1A:
	subs r0, r1, 0x1
	strh r0, [r5, 0xC]
	b _08069F56
_08069F20:
	mov r1, sp
	ldrh r0, [r5, 0x8]
	strh r0, [r1]
	mov r4, sp
	adds r4, 0x2
	ldrh r0, [r5, 0xA]
	strh r0, [r4]
	movs r0, 0x29
	bl audio_play
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _08069F60
	bl MapGridSetMetatileIdAt
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl CurrentMapDrawMetatileAt
_08069F52:
	movs r0, 0x1
	strh r0, [r5, 0x2]
_08069F56:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_08069F60: .4byte 0x00000206
	thumb_func_end sub_8069DD4

	thumb_func_start sub_8069F64
sub_8069F64: @ 8069F64
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _08069FE8
	adds r5, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x2
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _08069F9E
	movs r0, 0
	ldrsh r1, [r4, r0]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A02A
_08069F9E:
	strh r2, [r5, 0x2]
	ldrh r0, [r4]
	strh r0, [r5, 0x4]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsAsh
	lsls r0, 24
	cmp r0, 0
	beq _0806A02A
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileIdAt
	ldr r1, _08069FEC
	cmp r0, r1
	bne _08069FF4
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _08069FF0
	movs r3, 0x4
	bl ash
	b _0806A006
	.align 2, 0
_08069FE8: .4byte 0x03004b28
_08069FEC: .4byte 0x0000020a
_08069FF0: .4byte 0x00000212
_08069FF4:
	mov r0, sp
	movs r3, 0
	ldrsh r0, [r0, r3]
	movs r2, 0
	ldrsh r1, [r4, r2]
	ldr r2, _0806A034
	movs r3, 0x4
	bl ash
_0806A006:
	movs r0, 0x87
	lsls r0, 1
	movs r1, 0x1
	bl sub_80A92D4
	lsls r0, 24
	cmp r0, 0
	beq _0806A02A
	ldr r0, _0806A038
	bl GetVarPointer
	adds r2, r0, 0
	ldrh r1, [r2]
	ldr r0, _0806A03C
	cmp r1, r0
	bhi _0806A02A
	adds r0, r1, 0x1
	strh r0, [r2]
_0806A02A:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A034: .4byte 0x00000206
_0806A038: .4byte 0x00004048
_0806A03C: .4byte 0x0000270e
	thumb_func_end sub_8069F64

	thumb_func_start sub_806A040
sub_806A040: @ 806A040
	push {r4,r5,lr}
	lsls r0, 16
	asrs r5, r0, 16
	lsls r1, 16
	asrs r4, r1, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridGetMetatileIdAt
	ldr r1, _0806A074
	ldr r2, _0806A078
	cmp r0, r1
	bne _0806A05C
	subs r2, 0x31
_0806A05C:
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A074: .4byte 0x0000022f
_0806A078: .4byte 0x00000237
	thumb_func_end sub_806A040

	thumb_func_start sub_806A07C
sub_806A07C: @ 806A07C
	push {r4-r7,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806A164
	adds r5, r1, r0
	mov r4, sp
	adds r4, 0x2
	mov r0, sp
	adds r1, r4, 0
	bl PlayerGetDestCoords
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r4, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 16
	lsrs r6, r0, 16
	ldrh r1, [r5, 0x8]
	movs r3, 0x8
	ldrsh r0, [r5, r3]
	adds r7, r4, 0
	cmp r0, 0
	beq _0806A0CE
	subs r0, r1, 0x1
	strh r0, [r5, 0x8]
	lsls r0, 16
	cmp r0, 0
	bne _0806A0CE
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	movs r2, 0xC
	ldrsh r1, [r5, r2]
	bl sub_806A040
_0806A0CE:
	ldrh r1, [r5, 0xE]
	movs r3, 0xE
	ldrsh r0, [r5, r3]
	cmp r0, 0
	beq _0806A0EE
	subs r0, r1, 0x1
	strh r0, [r5, 0xE]
	lsls r0, 16
	cmp r0, 0
	bne _0806A0EE
	movs r1, 0x10
	ldrsh r0, [r5, r1]
	movs r2, 0x12
	ldrsh r1, [r5, r2]
	bl sub_806A040
_0806A0EE:
	lsls r0, r6, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl sub_8057818
	lsls r0, 24
	cmp r0, 0
	beq _0806A106
	ldr r0, _0806A168
	movs r1, 0
	bl VarSet
_0806A106:
	mov r0, sp
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r1, [r0, r3]
	movs r3, 0x4
	ldrsh r0, [r5, r3]
	cmp r1, r0
	bne _0806A122
	movs r0, 0
	ldrsh r1, [r7, r0]
	movs r3, 0x6
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A182
_0806A122:
	strh r2, [r5, 0x4]
	adds r4, r7, 0
	ldrh r0, [r4]
	strh r0, [r5, 0x6]
	adds r0, r6, 0
	bl sub_805782C
	lsls r0, 24
	cmp r0, 0
	beq _0806A182
	bl sub_80E6034
	lsls r0, 16
	asrs r0, 16
	cmp r0, 0x4
	beq _0806A14A
	ldr r0, _0806A168
	movs r1, 0
	bl VarSet
_0806A14A:
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	cmp r0, 0
	bne _0806A16C
	movs r0, 0x3
	strh r0, [r5, 0x8]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0xA]
	ldrh r0, [r4]
	strh r0, [r5, 0xC]
	b _0806A182
	.align 2, 0
_0806A164: .4byte 0x03004b28
_0806A168: .4byte 0x00004022
_0806A16C:
	movs r2, 0xE
	ldrsh r0, [r5, r2]
	cmp r0, 0
	bne _0806A182
	movs r0, 0x3
	strh r0, [r5, 0xE]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, 0x10]
	ldrh r0, [r7]
	strh r0, [r5, 0x12]
_0806A182:
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A07C

	thumb_func_start sub_806A18C
sub_806A18C: @ 806A18C
	push {r4,r5,lr}
	adds r3, r0, 0
	lsls r1, 16
	lsrs r5, r1, 16
	lsls r2, 16
	lsrs r4, r2, 16
	ldrh r0, [r3]
	subs r0, 0x1
	strh r0, [r3]
	lsls r0, 16
	cmp r0, 0
	bne _0806A1A8
	movs r2, 0xE8
	b _0806A1BC
_0806A1A8:
	ldr r1, _0806A1E4
	movs r2, 0
	ldrsh r0, [r3, r2]
	cmp r0, 0
	bge _0806A1B4
	adds r0, 0x7
_0806A1B4:
	asrs r0, 3
	lsls r0, 1
	adds r0, r1
	ldrh r2, [r0]
_0806A1BC:
	lsls r5, 16
	asrs r5, 16
	lsls r4, 16
	asrs r4, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl MapGridSetMetatileIdAt
	adds r0, r5, 0
	adds r1, r4, 0
	bl CurrentMapDrawMetatileAt
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0xE8
	bl MapGridSetMetatileIdAt
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A1E4: .4byte gUnknown_08376418
	thumb_func_end sub_806A18C

	thumb_func_start sub_806A1E8
sub_806A1E8: @ 806A1E8
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x4
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	ldr r0, _0806A230
	adds r4, r1, r0
	mov r5, sp
	adds r5, 0x2
	mov r0, sp
	adds r1, r5, 0
	bl PlayerGetDestCoords
	ldr r0, _0806A234
	movs r1, 0x4
	ldrsb r1, [r0, r1]
	lsls r1, 8
	ldrb r0, [r0, 0x5]
	lsls r0, 24
	asrs r0, 24
	orrs r0, r1
	lsls r0, 16
	lsrs r7, r0, 16
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	mov r8, r5
	cmp r1, 0
	beq _0806A238
	cmp r1, 0x1
	beq _0806A264
	b _0806A2B8
	.align 2, 0
_0806A230: .4byte 0x03004b28
_0806A234: .4byte 0x02025734
_0806A238:
	strh r7, [r4]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	movs r0, 0x1
	strh r0, [r4, 0x2]
	strh r1, [r4, 0x8]
	strh r1, [r4, 0xE]
	strh r1, [r4, 0x14]
	strh r1, [r4, 0x1A]
	b _0806A2B8
_0806A252:
	movs r0, 0x20
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1, 0x2]
	mov r2, r8
	ldrh r0, [r2]
	strh r0, [r1, 0x4]
	b _0806A2B8
_0806A264:
	mov r0, sp
	movs r3, 0x4
	ldrsh r1, [r4, r3]
	ldrh r2, [r0]
	movs r3, 0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bne _0806A280
	movs r0, 0x6
	ldrsh r1, [r4, r0]
	movs r3, 0
	ldrsh r0, [r5, r3]
	cmp r1, r0
	beq _0806A2B8
_0806A280:
	strh r2, [r4, 0x4]
	ldrh r0, [r5]
	strh r0, [r4, 0x6]
	mov r0, sp
	movs r1, 0
	ldrsh r0, [r0, r1]
	movs r2, 0
	ldrsh r1, [r5, r2]
	bl MapGridGetMetatileBehaviorAt
	lsls r0, 24
	lsrs r0, 24
	bl MetatileBehavior_IsMuddySlope
	lsls r0, 24
	cmp r0, 0
	beq _0806A2B8
	movs r6, 0x4
	adds r1, r4, 0
	adds r1, 0x8
_0806A2A8:
	movs r3, 0
	ldrsh r0, [r1, r3]
	cmp r0, 0
	beq _0806A252
	adds r1, 0x6
	adds r6, 0x3
	cmp r6, 0xD
	ble _0806A2A8
_0806A2B8:
	ldr r2, _0806A2D4
	ldrb r1, [r2]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806A2D8
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r7, r0
	beq _0806A2D8
	strh r7, [r4]
	ldrh r0, [r2, 0x4]
	ldrh r1, [r2, 0x8]
	b _0806A2DC
	.align 2, 0
_0806A2D4: .4byte 0x0202e844
_0806A2D8:
	movs r0, 0
	movs r1, 0
_0806A2DC:
	lsls r0, 16
	asrs r0, 16
	mov r8, r0
	lsls r0, r1, 16
	asrs r7, r0, 16
	adds r5, r4, 0
	adds r5, 0x8
	adds r4, r5, 0
	movs r6, 0x9
_0806A2EE:
	movs r2, 0
	ldrsh r0, [r4, r2]
	cmp r0, 0
	beq _0806A312
	ldrh r0, [r4, 0x2]
	mov r3, r8
	subs r0, r3
	strh r0, [r4, 0x2]
	ldrh r0, [r4, 0x4]
	subs r0, r7
	strh r0, [r4, 0x4]
	movs r0, 0x2
	ldrsh r1, [r4, r0]
	movs r3, 0x4
	ldrsh r2, [r4, r3]
	adds r0, r5, 0
	bl sub_806A18C
_0806A312:
	adds r4, 0x6
	adds r5, 0x6
	subs r6, 0x3
	cmp r6, 0
	bge _0806A2EE
	add sp, 0x4
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A1E8

	thumb_func_start sub_806A328
sub_806A328: @ 806A328
	push {lr}
	ldr r0, _0806A350
	bl FlagSet
	bl RtcCalcLocalTime
	ldr r2, _0806A354
	adds r2, 0xA0
	ldr r3, _0806A358
	ldr r0, [r3]
	ldr r1, [r3, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806A35C
	ldrh r1, [r3]
	bl VarSet
	pop {r0}
	bx r0
	.align 2, 0
_0806A350: .4byte 0x00000835
_0806A354: .4byte 0x02024ea4
_0806A358: .4byte 0x03004038
_0806A35C: .4byte 0x00004040
	thumb_func_end sub_806A328

	thumb_func_start InTrainerHill
InTrainerHill: @ 806A360
	push {r4,lr}
	ldr r0, _0806A388
	bl FlagGet
	lsls r0, 24
	cmp r0, 0
	beq _0806A380
	bl RtcCalcLocalTime
	ldr r4, _0806A38C
	adds r0, r4, 0
	bl sub_806A390
	adds r0, r4, 0
	bl sub_806A3F4
_0806A380:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A388: .4byte 0x00000835
_0806A38C: .4byte 0x03004038
	thumb_func_end InTrainerHill

	thumb_func_start sub_806A390
sub_806A390: @ 806A390
	push {r4-r6,lr}
	adds r5, r0, 0
	ldr r0, _0806A3F0
	bl GetVarPointer
	adds r6, r0, 0
	ldrh r0, [r6]
	movs r2, 0
	ldrsh r1, [r5, r2]
	cmp r0, r1
	beq _0806A3EA
	cmp r0, r1
	bgt _0806A3EA
	ldrh r4, [r5]
	subs r4, r0
	lsls r4, 16
	lsrs r4, 16
	bl sub_80690B4
	adds r0, r4, 0
	bl sub_80FA220
	adds r0, r4, 0
	bl sub_80BE8C4
	adds r0, r4, 0
	bl sub_8080834
	adds r0, r4, 0
	bl sub_80401D8
	adds r0, r4, 0
	bl sub_810D2F4
	adds r0, r4, 0
	bl sub_810D410
	adds r0, r4, 0
	bl sub_810F618
	adds r0, r4, 0
	bl sub_8145AA4
	ldrh r0, [r5]
	strh r0, [r6]
_0806A3EA:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A3F0: .4byte 0x00004040
	thumb_func_end sub_806A390

	thumb_func_start sub_806A3F4
sub_806A3F4: @ 806A3F4
	push {r4-r6,lr}
	sub sp, 0x8
	adds r5, r0, 0
	mov r4, sp
	ldr r6, _0806A448
	mov r0, sp
	adds r1, r6, 0
	adds r2, r5, 0
	bl CalcTimeDifference
	mov r0, sp
	movs r2, 0
	ldrsh r1, [r0, r2]
	lsls r0, r1, 1
	adds r0, r1
	lsls r1, r0, 4
	subs r1, r0
	lsls r1, 5
	movs r2, 0x2
	ldrsb r2, [r4, r2]
	lsls r0, r2, 4
	subs r0, r2
	lsls r0, 2
	adds r1, r0
	movs r0, 0x3
	ldrsb r0, [r4, r0]
	adds r0, r1, r0
	cmp r0, 0
	beq _0806A43E
	cmp r0, 0
	blt _0806A43E
	bl BerryTreeTimeUpdate
	ldr r0, [r5]
	ldr r1, [r5, 0x4]
	str r0, [r6]
	str r1, [r6, 0x4]
_0806A43E:
	add sp, 0x8
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A448: .4byte 0x02024f44
	thumb_func_end sub_806A3F4

	thumb_func_start sub_806A44C
sub_806A44C: @ 806A44C
	push {lr}
	bl sub_806A328
	ldr r0, _0806A45C
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0806A45C: .4byte c2_exit_to_overworld_1_continue_scripts_restart_music
	thumb_func_end sub_806A44C

	thumb_func_start sub_806A460
sub_806A460: @ 806A460
	push {lr}
	ldr r0, _0806A474
	bl SetMainCallback2
	ldr r1, _0806A478
	ldr r0, _0806A47C
	str r0, [r1, 0x8]
	pop {r0}
	bx r0
	.align 2, 0
_0806A474: .4byte Cb2_StartWallClock
_0806A478: .4byte 0x03001770
_0806A47C: .4byte sub_806A44C
	thumb_func_end sub_806A460

	thumb_func_start sub_806A480
sub_806A480: @ 806A480
	push {lr}
	adds r3, r0, 0
	ldr r2, _0806A4B0
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	beq _0806A596
	strh r1, [r3, 0x30]
	subs r0, r1, 0x1
	cmp r0, 0x5
	bhi _0806A596
	lsls r0, 2
	ldr r1, _0806A4B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A4B0: .4byte 0x03004b20
_0806A4B4: .4byte _0806A4B8
	.align 2, 0
_0806A4B8:
	.4byte _0806A4D0
	.4byte _0806A4F4
	.4byte _0806A518
	.4byte _0806A53C
	.4byte _0806A566
	.4byte _0806A590
_0806A4D0:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x35
	b _0806A55E
_0806A4F4:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x56
	b _0806A55E
_0806A518:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x6B
	b _0806A55E
_0806A53C:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x1
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x41
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x80
_0806A55E:
	strh r0, [r3, 0x20]
	movs r0, 0x44
	strh r0, [r3, 0x22]
	b _0806A596
_0806A566:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0x2
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x42
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x9B
	strh r0, [r3, 0x20]
	movs r0, 0x50
	strh r0, [r3, 0x22]
	b _0806A596
_0806A590:
	adds r0, r3, 0
	bl DestroySprite
_0806A596:
	pop {r0}
	bx r0
	thumb_func_end sub_806A480

	thumb_func_start sub_806A59C
sub_806A59C: @ 806A59C
	push {lr}
	adds r3, r0, 0
	ldr r2, _0806A5CC
	movs r0, 0x2E
	ldrsh r1, [r3, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	movs r2, 0xC
	ldrsh r1, [r0, r2]
	movs r2, 0x30
	ldrsh r0, [r3, r2]
	cmp r1, r0
	beq _0806A696
	strh r1, [r3, 0x30]
	subs r0, r1, 0x1
	cmp r0, 0x5
	bhi _0806A696
	lsls r0, 2
	ldr r1, _0806A5D0
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806A5CC: .4byte 0x03004b20
_0806A5D0: .4byte _0806A5D4
	.align 2, 0
_0806A5D4:
	.4byte _0806A5EC
	.4byte _0806A610
	.4byte _0806A634
	.4byte _0806A658
	.4byte _0806A682
	.4byte _0806A690
_0806A5EC:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x35
	b _0806A67A
_0806A610:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x56
	b _0806A67A
_0806A634:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x6B
	b _0806A67A
_0806A658:
	adds r2, r3, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, 0
	adds r1, 0x2A
	movs r0, 0
	strb r0, [r1]
	subs r2, 0x12
	ldrb r1, [r2]
	subs r0, 0x40
	ands r0, r1
	strb r0, [r2]
	movs r0, 0x80
_0806A67A:
	strh r0, [r3, 0x20]
	movs r0, 0x5C
	strh r0, [r3, 0x22]
	b _0806A696
_0806A682:
	adds r0, r3, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806A696
_0806A690:
	adds r0, r3, 0
	bl DestroySprite
_0806A696:
	pop {r0}
	bx r0
	thumb_func_end sub_806A59C

	thumb_func_start sub_806A69C
sub_806A69C: @ 806A69C
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0806A70C
	bl LoadSpritePalette
	ldr r0, _0806A710
	mov r8, r0
	movs r1, 0x35
	movs r2, 0x44
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	ldr r6, _0806A714
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r6, 0
	adds r4, 0x1C
	adds r2, r0, r4
	ldr r1, _0806A718
	str r1, [r2]
	adds r0, r6
	strh r5, [r0, 0x2E]
	ldr r1, _0806A71C
	strh r1, [r0, 0x30]
	mov r0, r8
	movs r1, 0x35
	movs r2, 0x44
	movs r3, 0
	bl CreateSpriteAtEnd
	lsls r0, 24
	lsrs r1, r0, 24
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r4, r0, r4
	ldr r1, _0806A720
	str r1, [r4]
	adds r0, r6
	strh r5, [r0, 0x2E]
	movs r1, 0x1
	negs r1, r1
	strh r1, [r0, 0x30]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A70C: .4byte gUnknown_083764BC
_0806A710: .4byte gUnknown_083764E8
_0806A714: .4byte 0x02020004
_0806A718: .4byte sub_806A480
_0806A71C: .4byte 0x0000ffff
_0806A720: .4byte sub_806A59C
	thumb_func_end sub_806A69C

	thumb_func_start sub_806A724
sub_806A724: @ 806A724
	push {lr}
	ldr r0, _0806A734
	ldrh r0, [r0, 0x4]
	bl FreeSpritePaletteByTag
	pop {r0}
	bx r0
	.align 2, 0
_0806A734: .4byte gUnknown_083764BC
	thumb_func_end sub_806A724

	thumb_func_start sub_806A738
sub_806A738: @ 806A738
	push {lr}
	movs r0, 0x3
	movs r1, 0x8
	movs r2, 0x19
	movs r3, 0xB
	bl Reset
	pop {r0}
	bx r0
	thumb_func_end sub_806A738

	thumb_func_start sub_806A74C
sub_806A74C: @ 806A74C
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x4
	mov r10, r0
	adds r0, r2, 0
	adds r4, r3, 0
	ldr r6, [sp, 0x24]
	ldr r2, [sp, 0x28]
	mov r9, r2
	mov r2, r10
	lsls r2, 24
	lsrs r2, 24
	mov r10, r2
	lsls r1, 24
	lsrs r1, 24
	str r1, [sp]
	lsls r0, 16
	lsrs r0, 16
	lsls r4, 24
	lsrs r4, 24
	lsls r6, 24
	lsrs r6, 24
	mov r1, r9
	lsls r1, 24
	lsrs r1, 24
	mov r9, r1
	ldr r7, _0806A83C
	ldr r1, _0806A840
	bl __umodsi3
	adds r5, r0, 0
	lsls r5, 16
	lsrs r5, 16
	adds r0, r4, 0
	movs r1, 0x18
	bl __umodsi3
	mov r8, r0
	mov r2, r8
	lsls r2, 24
	lsrs r2, 24
	mov r8, r2
	adds r0, r6, 0
	movs r1, 0x3C
	bl __umodsi3
	adds r6, r0, 0
	lsls r6, 24
	lsrs r6, 24
	mov r0, r9
	movs r1, 0x3C
	bl __umodsi3
	mov r9, r0
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r4, _0806A844
	adds r0, r4, 0
	adds r1, r5, 0
	movs r2, 0x18
	movs r3, 0x1
	bl sub_8072C44
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r1, _0806A848
	bl StringCopy
	adds r7, r0, 0
	adds r0, r4, 0
	mov r1, r8
	movs r2, 0x12
	movs r3, 0x1
	bl sub_8072C44
	adds r0, r7, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	ldr r4, _0806A84C
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	adds r1, r6, 0
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	adds r7, r0, 0
	adds r1, r4, 0
	bl StringCopy
	adds r7, r0, 0
	mov r1, r9
	movs r2, 0x2
	movs r3, 0x2
	bl ConvertIntToDecimalStringN
	ldr r0, _0806A83C
	mov r1, r10
	ldr r2, [sp]
	bl Print
	add sp, 0x4
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806A83C: .4byte 0x020234cc
_0806A840: .4byte 0x00002710
_0806A844: .4byte 0x020231cc
_0806A848: .4byte gUnknown_0842D4F6
_0806A84C: .4byte gUnknown_08376500
	thumb_func_end sub_806A74C

	thumb_func_start sub_806A850
sub_806A850: @ 806A850
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	sub sp, 0x8
	adds r6, r0, 0
	mov r8, r1
	adds r4, r2, 0
	adds r5, r3, 0
	lsls r6, 16
	lsrs r6, 16
	mov r0, r8
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r0, 0x3
	movs r1, 0x8
	movs r2, 0x19
	movs r3, 0xB
	bl DrawDefaultWindow
	ldr r0, _0806A8A8
	movs r1, 0x14
	movs r2, 0x9
	bl Print
	str r4, [sp]
	str r5, [sp, 0x4]
	movs r0, 0x4
	movs r1, 0x9
	adds r2, r6, 0
	mov r3, r8
	bl sub_806A74C
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A8A8: .4byte gUnknown_0842D4FC
	thumb_func_end sub_806A850

	thumb_func_start sub_806A8AC
sub_806A8AC: @ 806A8AC
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r3, 16
	lsrs r3, 16
	adds r1, r3, 0
	movs r0, 0x80
	ands r0, r3
	cmp r0, 0
	beq _0806A8C6
	ldrh r0, [r4]
	subs r0, 0x1
	b _0806A8E0
_0806A8C6:
	movs r0, 0x40
	ands r0, r3
	cmp r0, 0
	beq _0806A8D4
	ldrh r0, [r4]
	adds r0, 0x1
	b _0806A8FE
_0806A8D4:
	movs r0, 0x20
	ands r0, r3
	cmp r0, 0
	beq _0806A8EE
	ldrh r0, [r4]
	subs r0, 0xA
_0806A8E0:
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r5
	bge _0806A90A
	strh r2, [r4]
	b _0806A90A
_0806A8EE:
	movs r0, 0x10
	ands r1, r0
	cmp r1, 0
	bne _0806A8FA
	movs r0, 0
	b _0806A90C
_0806A8FA:
	ldrh r0, [r4]
	adds r0, 0xA
_0806A8FE:
	strh r0, [r4]
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, r2
	ble _0806A90A
	strh r5, [r4]
_0806A90A:
	movs r0, 0x1
_0806A90C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806A8AC

	thumb_func_start sub_806A914
sub_806A914: @ 806A914
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806A928
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	movs r0, 0x1
	strh r0, [r1, 0x8]
	bx lr
	.align 2, 0
_0806A928: .4byte 0x03004b20
	thumb_func_end sub_806A914

	thumb_func_start sub_806A92C
sub_806A92C: @ 806A92C
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_806A738
	bl sub_806A724
	ldr r1, _0806A950
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806A954
	str r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806A950: .4byte 0x03004b20
_0806A954: .4byte sub_806A914
	thumb_func_end sub_806A92C

	thumb_func_start sub_806A958
sub_806A958: @ 806A958
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r0, r6, 2
	adds r0, r6
	lsls r7, r0, 3
	ldr r0, _0806A99C
	mov r8, r0
	adds r5, r7, r0
	ldrb r4, [r5, 0x4]
	lsls r0, r4, 1
	adds r0, r4
	lsls r0, 2
	ldr r1, _0806A9A0
	adds r2, r0, r1
	ldr r1, _0806A9A4
	ldrh r3, [r1, 0x2E]
	movs r0, 0x2
	ands r0, r3
	mov r12, r1
	cmp r0, 0
	beq _0806A9AC
	mov r0, r8
	subs r0, 0x8
	adds r0, r7, r0
	ldr r1, _0806A9A8
	str r1, [r0]
	movs r0, 0
	strh r0, [r5, 0x2]
	movs r0, 0x6
	b _0806A9CC
	.align 2, 0
_0806A99C: .4byte 0x03004b28
_0806A9A0: .4byte gUnknown_08376414
_0806A9A4: .4byte 0x03001770
_0806A9A8: .4byte sub_806A92C
_0806A9AC:
	movs r0, 0x10
	ands r0, r3
	cmp r0, 0
	beq _0806A9BA
	ldrb r0, [r2, 0x7]
	cmp r0, 0
	bne _0806A9CC
_0806A9BA:
	mov r3, r12
	ldrh r1, [r3, 0x2E]
	movs r0, 0x20
	ands r0, r1
	cmp r0, 0
	beq _0806A9D6
	ldrb r0, [r2, 0x6]
	cmp r0, 0
	beq _0806A9D6
_0806A9CC:
	strh r0, [r5, 0x4]
	movs r0, 0x5
	bl audio_play
	b _0806AA58
_0806A9D6:
	cmp r4, 0x5
	bne _0806AA24
	mov r0, r12
	ldrh r1, [r0, 0x2E]
	movs r4, 0x1
	adds r0, r4, 0
	ands r0, r1
	cmp r0, 0
	beq _0806AA58
	ldr r1, _0806AA18
	ldrh r0, [r5, 0x6]
	strh r0, [r1]
	ldrh r0, [r5, 0x8]
	strb r0, [r1, 0x2]
	ldrh r0, [r5, 0xA]
	strb r0, [r1, 0x3]
	ldrh r0, [r5, 0xC]
	strb r0, [r1, 0x4]
	movs r0, 0x5
	bl audio_play
	ldr r1, _0806AA1C
	lsls r0, r6, 2
	adds r0, r6
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806AA20
	str r1, [r0]
	strh r4, [r5, 0x2]
	movs r0, 0x6
	strh r0, [r5, 0x4]
	b _0806AA58
	.align 2, 0
_0806AA18: .4byte 0x03004038
_0806AA1C: .4byte 0x03004b20
_0806AA20: .4byte sub_806A92C
_0806AA24:
	ldrb r0, [r2]
	lsls r0, 1
	adds r0, r5, r0
	ldrh r1, [r2, 0x2]
	ldrh r2, [r2, 0x4]
	mov r3, r12
	ldrh r4, [r3, 0x30]
	movs r3, 0xC0
	ands r3, r4
	bl sub_806A8AC
	cmp r0, 0
	beq _0806AA58
	movs r0, 0x5
	bl audio_play
	ldrh r2, [r5, 0x6]
	ldrb r3, [r5, 0x8]
	ldrb r0, [r5, 0xA]
	str r0, [sp]
	ldrb r0, [r5, 0xC]
	str r0, [sp, 0x4]
	movs r0, 0x4
	movs r1, 0x9
	bl sub_806A74C
_0806AA58:
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806A958

	thumb_func_start sub_806AA64
sub_806AA64: @ 806AA64
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	lsls r6, r5, 2
	adds r6, r5
	lsls r6, 3
	ldr r0, _0806AACC
	mov r8, r0
	adds r4, r6, r0
	movs r0, 0
	strh r0, [r4]
	ldr r3, _0806AAD0
	ldrh r0, [r3]
	strh r0, [r4, 0x6]
	movs r1, 0x2
	ldrsb r1, [r3, r1]
	strh r1, [r4, 0x8]
	movs r2, 0x3
	ldrsb r2, [r3, r2]
	strh r2, [r4, 0xA]
	ldrb r3, [r3, 0x4]
	lsls r3, 24
	asrs r3, 24
	strh r3, [r4, 0xC]
	ldrh r0, [r4, 0x6]
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_806A850
	adds r0, r5, 0
	bl sub_806A69C
	movs r0, 0x2
	strh r0, [r4, 0x4]
	movs r0, 0x8
	negs r0, r0
	add r8, r0
	add r6, r8
	ldr r0, _0806AAD4
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AACC: .4byte 0x03004b28
_0806AAD0: .4byte 0x03004038
_0806AAD4: .4byte sub_806A958
	thumb_func_end sub_806AA64

	thumb_func_start sub_806AAD8
sub_806AAD8: @ 806AAD8
	push {r4-r7,lr}
	sub sp, 0x4
	movs r0, 0x80
	lsls r0, 19
	movs r4, 0
	strh r4, [r0]
	movs r0, 0
	bl SetVBlankCallback
	movs r2, 0xA0
	lsls r2, 19
	mov r0, sp
	strh r4, [r0]
	ldr r1, _0806AB94
	str r0, [r1]
	str r2, [r1, 0x4]
	ldr r0, _0806AB98
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r2, 0xC0
	lsls r2, 19
	movs r3, 0xC0
	lsls r3, 9
	mov r4, sp
	movs r6, 0
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0806AB9C
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0806AB16:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r2, r5
	subs r3, r5
	cmp r3, r5
	bhi _0806AB16
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	str r2, [r1, 0x4]
	lsrs r0, r3, 1
	mov r2, r12
	orrs r0, r2
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0
	movs r1, 0x80
	bl ResetOamRange
	bl LoadOam
	bl remove_some_task
	bl dp12_8087EA4
	bl ResetSpriteData
	bl ResetTasks
	bl ResetPaletteFade
	ldr r4, _0806ABA0
	adds r0, r4, 0
	bl SetUpWindowConfig
	adds r0, r4, 0
	bl sub_8071C4C
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0x88
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0806ABA4
	bl SetVBlankCallback
	ldr r0, _0806ABA8
	bl SetMainCallback2
	ldr r0, _0806ABAC
	movs r1, 0x50
	bl CreateTask
	add sp, 0x4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806AB94: .4byte 0x040000d4
_0806AB98: .4byte 0x81000200
_0806AB9C: .4byte 0x81000800
_0806ABA0: .4byte gWindowConfig_81E6CE4
_0806ABA4: .4byte sub_806ABC8
_0806ABA8: .4byte sub_806ABB0
_0806ABAC: .4byte sub_806ACCC
	thumb_func_end sub_806AAD8

	thumb_func_start sub_806ABB0
sub_806ABB0: @ 806ABB0
	push {lr}
	bl RunTasks
	bl AnimateSprites
	bl BuildOamBuffer
	bl UpdatePaletteFade
	pop {r0}
	bx r0
	thumb_func_end sub_806ABB0

	thumb_func_start sub_806ABC8
sub_806ABC8: @ 806ABC8
	push {lr}
	bl ProcessSpriteCopyRequests
	bl LoadOam
	bl TransferPlttBuffer
	pop {r0}
	bx r0
	thumb_func_end sub_806ABC8

	thumb_func_start sub_806ABDC
sub_806ABDC: @ 806ABDC
	push {r4,lr}
	adds r4, r0, 0
	bl sub_8071FFC
	adds r0, r4, 0
	movs r1, 0x2
	movs r2, 0xF
	bl Print
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806ABDC

	thumb_func_start sub_806ABF4
sub_806ABF4: @ 806ABF4
	push {r4,r5,lr}
	sub sp, 0x8
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	ldr r1, _0806AC14
	adds r4, r0, r1
	movs r1, 0
	ldrsh r0, [r4, r1]
	cmp r0, 0
	beq _0806AC18
	cmp r0, 0x1
	beq _0806AC80
	b _0806ACC4
	.align 2, 0
_0806AC14: .4byte 0x03004b28
_0806AC18:
	bl sub_8071EF4
	movs r0, 0
	movs r1, 0
	movs r2, 0x14
	movs r3, 0xA
	bl DrawDefaultWindow
	ldr r0, _0806AC98
	movs r1, 0x1
	movs r2, 0x1
	bl Print
	ldr r0, _0806AC9C
	ldrh r2, [r0]
	ldrb r3, [r0, 0x2]
	ldrb r1, [r0, 0x3]
	str r1, [sp]
	ldrb r0, [r0, 0x4]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x3
	bl sub_806A74C
	ldr r0, _0806ACA0
	movs r1, 0x1
	movs r2, 0x5
	bl Print
	ldr r1, _0806ACA4
	adds r0, r1, 0
	adds r0, 0xA0
	ldrh r2, [r0]
	adds r0, 0x2
	ldrb r3, [r0]
	adds r0, 0x1
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r1, 0
	adds r0, 0xA4
	ldrb r0, [r0]
	str r0, [sp, 0x4]
	movs r0, 0x1
	movs r1, 0x7
	bl sub_806A74C
	ldr r0, _0806ACA8
	bl sub_806ABDC
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
_0806AC80:
	ldr r0, _0806ACAC
	ldrh r1, [r0, 0x2E]
	movs r0, 0x2
	ands r0, r1
	cmp r0, 0
	beq _0806ACB0
	adds r0, r5, 0
	bl DestroyTask
	bl DoSoftReset
	b _0806ACC4
	.align 2, 0
_0806AC98: .4byte gUnknown_08411804
_0806AC9C: .4byte 0x03004038
_0806ACA0: .4byte gUnknown_08411819
_0806ACA4: .4byte 0x02024ea4
_0806ACA8: .4byte gUnknown_084117E3
_0806ACAC: .4byte 0x03001770
_0806ACB0:
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806ACC4
	movs r0, 0x5
	bl audio_play
	adds r0, r5, 0
	bl DestroyTask
_0806ACC4:
	add sp, 0x8
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806ABF4

	thumb_func_start sub_806ACCC
sub_806ACCC: @ 806ACCC
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	ldr r1, _0806ACF4
	adds r5, r0, r1
	movs r1, 0
	ldrsh r0, [r5, r1]
	cmp r0, 0x6
	bls _0806ACE8
	b _0806AEC4
_0806ACE8:
	lsls r0, 2
	ldr r1, _0806ACF8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806ACF4: .4byte 0x03004b28
_0806ACF8: .4byte _0806ACFC
	.align 2, 0
_0806ACFC:
	.4byte _0806AD18
	.4byte _0806AD34
	.4byte _0806AD80
	.4byte _0806ADD8
	.4byte _0806AE5C
	.4byte _0806AE8C
	.4byte _0806AEAE
_0806AD18:
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0806AD30
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	movs r0, 0x1
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AD30: .4byte 0x0000ffff
_0806AD34:
	ldr r0, _0806AD5C
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	beq _0806AD42
	b _0806AEC4
_0806AD42:
	ldr r0, _0806AD60
	ldrh r0, [r0]
	cmp r0, 0
	beq _0806AD4E
	cmp r0, 0x2
	bne _0806AD68
_0806AD4E:
	ldr r0, _0806AD64
	bl sub_806ABDC
	movs r0, 0x5
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AD5C: .4byte 0x0202f388
_0806AD60: .4byte 0x03005eb8
_0806AD64: .4byte gUnknown_084118A0
_0806AD68:
	bl RtcCalcLocalTime
	ldr r0, _0806AD7C
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x2]
	b _0806ADFC
	.align 2, 0
_0806AD7C: .4byte sub_806ABF4
_0806AD80:
	ldr r2, _0806ADC4
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r0, r2
	ldrb r0, [r0, 0x4]
	cmp r0, 0x1
	bne _0806AD96
	b _0806AEC4
_0806AD96:
	bl sub_8071EF4
	ldr r0, _0806ADC8
	bl sub_806ABDC
	ldr r2, _0806ADCC
	ldr r0, _0806ADD0
	adds r0, 0xA0
	ldr r1, [r0, 0x4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806ADD4
	movs r1, 0x50
	bl CreateTask
	lsls r0, 24
	lsrs r0, 24
	strh r0, [r5, 0x2]
	movs r0, 0x3
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806ADC4: .4byte 0x03004b20
_0806ADC8: .4byte gUnknown_0841182F
_0806ADCC: .4byte 0x03004038
_0806ADD0: .4byte 0x02024ea4
_0806ADD4: .4byte sub_806AA64
_0806ADD8:
	ldr r2, _0806AE04
	movs r0, 0x2
	ldrsh r1, [r5, r0]
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 3
	adds r1, r0, r2
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0
	beq _0806AEC4
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806AE08
	ldrb r0, [r5, 0x2]
	bl DestroyTask
_0806ADFC:
	movs r0, 0x2
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AE04: .4byte 0x03004b20
_0806AE08:
	ldrb r0, [r5, 0x2]
	bl DestroyTask
	bl RtcReset
	ldr r4, _0806AE4C
	movs r1, 0
	ldrsh r0, [r4, r1]
	movs r1, 0x2
	ldrsb r1, [r4, r1]
	movs r2, 0x3
	ldrsb r2, [r4, r2]
	movs r3, 0x4
	ldrsb r3, [r4, r3]
	bl RtcCalcLocalTimeOffset
	ldr r2, _0806AE50
	adds r2, 0xA0
	ldr r0, [r4]
	ldr r1, [r4, 0x4]
	str r0, [r2]
	str r1, [r2, 0x4]
	ldr r0, _0806AE54
	ldrh r1, [r4]
	bl VarSet
	bl sub_80691A0
	ldr r0, _0806AE58
	bl sub_806ABDC
	movs r0, 0x4
	strh r0, [r5]
	b _0806AEC4
	.align 2, 0
_0806AE4C: .4byte 0x03004038
_0806AE50: .4byte 0x02024ea4
_0806AE54: .4byte 0x00004040
_0806AE58: .4byte gUnknown_08411846
_0806AE5C:
	movs r0, 0
	bl sub_8125D44
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806AE7C
	ldr r0, _0806AE78
	bl sub_806ABDC
	movs r0, 0x49
	bl audio_play
	b _0806AE88
	.align 2, 0
_0806AE78: .4byte gUnknown_08411881
_0806AE7C:
	ldr r0, _0806AECC
	bl sub_806ABDC
	movs r0, 0x16
	bl audio_play
_0806AE88:
	movs r0, 0x5
	strh r0, [r5]
_0806AE8C:
	ldr r0, _0806AED0
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806AEC4
	movs r0, 0x1
	negs r0, r0
	ldr r1, _0806AED4
	str r1, [sp]
	movs r1, 0x1
	movs r2, 0
	movs r3, 0x10
	bl BeginNormalPaletteFade
	movs r0, 0x6
	strh r0, [r5]
_0806AEAE:
	ldr r0, _0806AED8
	ldrb r1, [r0, 0x7]
	movs r0, 0x80
	ands r0, r1
	cmp r0, 0
	bne _0806AEC4
	adds r0, r4, 0
	bl DestroyTask
	bl DoSoftReset
_0806AEC4:
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AECC: .4byte gUnknown_08411891
_0806AED0: .4byte 0x03001770
_0806AED4: .4byte 0x0000ffff
_0806AED8: .4byte 0x0202f388
	thumb_func_end sub_806ACCC

	thumb_func_start sub_806AEDC
sub_806AEDC: @ 806AEDC
	push {r4-r6,lr}
	sub sp, 0x4
	bl AnimateSprites
	bl BuildOamBuffer
	ldr r0, _0806AF2C
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 4
	ldr r1, _0806AF30
	adds r5, r0, r1
	movs r6, 0
_0806AEF8:
	ldrb r0, [r5]
	lsls r0, 3
	ldrb r1, [r5, 0x1]
	lsls r1, 3
	ldr r2, [r5, 0x4]
	lsls r3, r6, 5
	movs r4, 0x80
	lsls r4, 2
	orrs r3, r4
	str r3, [sp]
	movs r3, 0
	bl sub_800142C
	adds r5, 0x8
	adds r6, 0x1
	cmp r6, 0x5
	ble _0806AEF8
	bl RunTasks
	bl UpdatePaletteFade
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AF2C: .4byte 0x0202e8fa
_0806AF30: .4byte gUnknown_08376BB4
	thumb_func_end sub_806AEDC

	thumb_func_start sub_806AF34
sub_806AF34: @ 806AF34
	push {lr}
	bl LoadOam
	bl ProcessSpriteCopyRequests
	bl TransferPlttBuffer
	bl sub_806B548
	pop {r0}
	bx r0
	thumb_func_end sub_806AF34

	thumb_func_start sub_806AF4C
sub_806AF4C: @ 806AF4C
	push {r4,r5,lr}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r3, 24
	lsrs r3, 24
	cmp r1, 0xFF
	beq _0806AF64
	ldr r0, _0806AF84
	strh r1, [r0]
_0806AF64:
	ldr r0, _0806AF88
	movs r5, 0x96
	lsls r5, 2
	adds r1, r0, r5
	strb r2, [r1]
	movs r2, 0x97
	lsls r2, 2
	adds r1, r0, r2
	str r4, [r1]
	adds r5, 0x1
	adds r0, r5
	strb r3, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AF84: .4byte 0x020239f8
_0806AF88: .4byte 0x0201b000
	thumb_func_end sub_806AF4C

	thumb_func_start sub_806AF8C
sub_806AF8C: @ 806AF8C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r3, 24
	lsrs r3, 24
	bl sub_806AF4C
	ldr r0, _0806AFA8
	bl SetMainCallback2
	pop {r0}
	bx r0
	.align 2, 0
_0806AFA8: .4byte sub_806B460
	thumb_func_end sub_806AF8C

	thumb_func_start sub_806AFAC
sub_806AFAC: @ 806AFAC
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0806AFCC
	lsls r3, r0, 1
	adds r3, r0
	lsls r3, 2
	adds r3, r2
	ldr r2, [r3]
	ldrb r3, [r3, 0x8]
	bl sub_806AF8C
	pop {r0}
	bx r0
	.align 2, 0
_0806AFCC: .4byte gUnknown_08376C74
	thumb_func_end sub_806AFAC

	thumb_func_start sub_806AFD0
sub_806AFD0: @ 806AFD0
	push {r4,r5,lr}
	ldr r1, _0806AFF0
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	ldrsh r0, [r0, r2]
	adds r4, r1, 0
	cmp r0, 0x9
	bls _0806AFE6
	b _0806B11A
_0806AFE6:
	lsls r0, 2
	ldr r1, _0806AFF4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806AFF0: .4byte 0x0201b000
_0806AFF4: .4byte _0806AFF8
	.align 2, 0
_0806AFF8:
	.4byte _0806B020
	.4byte _0806B060
	.4byte _0806B066
	.4byte _0806B07A
	.4byte _0806B0A4
	.4byte _0806B0AA
	.4byte _0806B0BC
	.4byte _0806B0C2
	.4byte _0806B0D4
	.4byte _0806B0EC
_0806B020:
	ldr r0, _0806B048
	adds r5, r4, r0
	movs r1, 0
	ldrsh r3, [r5, r1]
	ldr r0, _0806B04C
	ldrb r0, [r0]
	cmp r3, r0
	bge _0806B054
	movs r2, 0x98
	lsls r2, 2
	adds r0, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r5]
	movs r2, 0x64
	muls r2, r3
	ldr r3, _0806B050
	adds r2, r3
	bl sub_806D90C
	b _0806B114
	.align 2, 0
_0806B048: .4byte 0x00000266
_0806B04C: .4byte 0x03004350
_0806B050: .4byte 0x03004360
_0806B054:
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _0806B0E0
_0806B060:
	bl sub_806DA98
	b _0806B0D8
_0806B066:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	bl sub_806DC34
	movs r2, 0x99
	lsls r2, 2
	adds r1, r4, r2
	b _0806B0E0
_0806B07A:
	movs r1, 0x98
	lsls r1, 2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _0806B0A0
	adds r5, r4, r2
	ldrb r1, [r5]
	bl sub_806BD58
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B114
	movs r0, 0
	strh r0, [r5]
	movs r0, 0x99
	lsls r0, 2
	adds r1, r4, r0
	b _0806B0E0
	.align 2, 0
_0806B0A0: .4byte 0x00000266
_0806B0A4:
	bl sub_806E334
	b _0806B0D8
_0806B0AA:
	bl sub_806E0C4
	ldr r1, _0806B0B8
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _0806B0E0
	.align 2, 0
_0806B0B8: .4byte 0x0201b000
_0806B0BC:
	bl sub_806E53C
	b _0806B0D8
_0806B0C2:
	bl nullsub_13
	ldr r1, _0806B0D0
	movs r0, 0x99
	lsls r0, 2
	adds r1, r0
	b _0806B0E0
	.align 2, 0
_0806B0D0: .4byte 0x0201b000
_0806B0D4:
	bl sub_806E6C8
_0806B0D8:
	ldr r1, _0806B0E8
	movs r2, 0x99
	lsls r2, 2
	adds r1, r2
_0806B0E0:
	ldrh r0, [r1]
	adds r0, 0x1
	strh r0, [r1]
	b _0806B11A
	.align 2, 0
_0806B0E8: .4byte 0x0201b000
_0806B0EC:
	ldr r0, _0806B110
	adds r5, r4, r0
	ldrb r0, [r5]
	bl sub_806B58C
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B114
	movs r1, 0
	strh r1, [r5]
	movs r2, 0x99
	lsls r2, 2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, 0x1
	b _0806B11C
	.align 2, 0
_0806B110: .4byte 0x00000266
_0806B114:
	ldrh r0, [r5]
	adds r0, 0x1
	strh r0, [r5]
_0806B11A:
	movs r0, 0
_0806B11C:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806AFD0

	thumb_func_start sub_806B124
sub_806B124: @ 806B124
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0xC
	ldr r0, _0806B144
	ldr r1, _0806B148
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x11
	bls _0806B13A
	b _0806B450
_0806B13A:
	lsls r0, 2
	ldr r1, _0806B14C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B144: .4byte 0x03001770
_0806B148: .4byte 0x0000043c
_0806B14C: .4byte _0806B150
	.align 2, 0
_0806B150:
	.4byte _0806B198
	.4byte _0806B240
	.4byte _0806B246
	.4byte _0806B27C
	.4byte _0806B282
	.4byte _0806B2AC
	.4byte _0806B2B2
	.4byte _0806B2D0
	.4byte _0806B2EC
	.4byte _0806B318
	.4byte _0806B344
	.4byte _0806B37C
	.4byte _0806B382
	.4byte _0806B3C0
	.4byte _0806B3CC
	.4byte _0806B3E4
	.4byte _0806B40C
	.4byte _0806B440
_0806B198:
	movs r0, 0
	bl SetVBlankCallback
	movs r3, 0xC0
	lsls r3, 19
	movs r4, 0xC0
	lsls r4, 9
	add r2, sp, 0x8
	mov r8, r2
	add r2, sp, 0x4
	movs r6, 0
	ldr r1, _0806B22C
	movs r5, 0x80
	lsls r5, 5
	ldr r7, _0806B230
	movs r0, 0x81
	lsls r0, 24
	mov r12, r0
_0806B1BC:
	strh r6, [r2]
	add r0, sp, 0x4
	str r0, [r1]
	str r3, [r1, 0x4]
	str r7, [r1, 0x8]
	ldr r0, [r1, 0x8]
	adds r3, r5
	subs r4, r5
	cmp r4, r5
	bhi _0806B1BC
	strh r6, [r2]
	add r2, sp, 0x4
	str r2, [r1]
	str r3, [r1, 0x4]
	lsrs r0, r4, 1
	mov r3, r12
	orrs r0, r3
	str r0, [r1, 0x8]
	ldr r0, [r1, 0x8]
	movs r0, 0xE0
	lsls r0, 19
	movs r3, 0x80
	lsls r3, 3
	movs r4, 0
	str r4, [sp, 0x8]
	ldr r2, _0806B22C
	mov r1, r8
	str r1, [r2]
	str r0, [r2, 0x4]
	lsrs r0, r3, 2
	movs r1, 0x85
	lsls r1, 24
	orrs r0, r1
	str r0, [r2, 0x8]
	ldr r0, [r2, 0x8]
	movs r1, 0xA0
	lsls r1, 19
	add r0, sp, 0x4
	strh r4, [r0]
	str r0, [r2]
	str r1, [r2, 0x4]
	lsrs r3, 1
	movs r0, 0x81
	lsls r0, 24
	orrs r3, r0
	str r3, [r2, 0x8]
	ldr r0, [r2, 0x8]
	ldr r2, _0806B234
	ldrb r0, [r2, 0x8]
	movs r1, 0x80
	orrs r0, r1
	strb r0, [r2, 0x8]
	ldr r1, _0806B238
	ldr r2, _0806B23C
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B22C: .4byte 0x040000d4
_0806B230: .4byte 0x81000800
_0806B234: .4byte 0x0202f388
_0806B238: .4byte 0x03001770
_0806B23C: .4byte 0x0000043c
_0806B240:
	bl remove_some_task
	b _0806B426
_0806B246:
	bl sub_806B4A8
	ldr r1, _0806B26C
	movs r2, 0x99
	lsls r2, 2
	adds r0, r1, r2
	movs r2, 0
	strh r2, [r0]
	ldr r3, _0806B270
	adds r0, r1, r3
	strh r2, [r0]
	movs r0, 0x9A
	lsls r0, 2
	adds r1, r0
	strh r2, [r1]
	ldr r1, _0806B274
	ldr r2, _0806B278
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B26C: .4byte 0x0201b000
_0806B270: .4byte 0x00000266
_0806B274: .4byte 0x03001770
_0806B278: .4byte 0x0000043c
_0806B27C:
	bl ResetSpriteData
	b _0806B426
_0806B282:
	ldr r0, _0806B2A0
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x1
	beq _0806B298
	cmp r0, 0x5
	beq _0806B298
	bl ResetTasks
_0806B298:
	ldr r1, _0806B2A4
	ldr r2, _0806B2A8
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B2A0: .4byte 0x0201b000
_0806B2A4: .4byte 0x03001770
_0806B2A8: .4byte 0x0000043c
_0806B2AC:
	bl FreeAllSpritePalettes
	b _0806B426
_0806B2B2:
	ldr r4, _0806B2CC
	movs r1, 0x97
	lsls r1, 2
	adds r0, r4, r1
	ldr r0, [r0]
	movs r1, 0
	bl CreateTask
	movs r2, 0x98
	lsls r2, 2
	adds r1, r4, r2
	strb r0, [r1]
	b _0806B426
	.align 2, 0
_0806B2CC: .4byte 0x0201b000
_0806B2D0:
	ldr r0, _0806B2E0
	bl SetUpWindowConfig
	ldr r1, _0806B2E4
	ldr r0, _0806B2E8
	adds r1, r0
	b _0806B42C
	.align 2, 0
_0806B2E0: .4byte gWindowConfig_81E6C90
_0806B2E4: .4byte 0x03001770
_0806B2E8: .4byte 0x0000043c
_0806B2EC:
	ldr r4, _0806B308
	ldr r1, _0806B30C
	adds r0, r4, 0
	bl InitWindowFromConfig
	adds r0, r4, 0
	movs r1, 0x1
	bl MultistepInitWindowTileData
	ldr r1, _0806B310
	ldr r2, _0806B314
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B308: .4byte 0x03004210
_0806B30C: .4byte gWindowConfig_81E6C90
_0806B310: .4byte 0x03001770
_0806B314: .4byte 0x0000043c
_0806B318:
	bl MultistepLoadFont
	cmp r0, 0
	bne _0806B322
	b _0806B450
_0806B322:
	ldr r0, _0806B338
	movs r3, 0x99
	lsls r3, 2
	adds r0, r3
	movs r1, 0x1
	strh r1, [r0]
	ldr r1, _0806B33C
	ldr r0, _0806B340
	adds r1, r0
	b _0806B42C
	.align 2, 0
_0806B338: .4byte 0x0201b000
_0806B33C: .4byte 0x03001770
_0806B340: .4byte 0x0000043c
_0806B344:
	ldr r0, _0806B368
	movs r1, 0x99
	lsls r1, 2
	adds r4, r0, r1
	ldrb r0, [r4]
	bl sub_806D718
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B374
	movs r0, 0
	strh r0, [r4]
	ldr r1, _0806B36C
	ldr r2, _0806B370
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B368: .4byte 0x0201b000
_0806B36C: .4byte 0x03001770
_0806B370: .4byte 0x0000043c
_0806B374:
	ldrh r0, [r4]
	adds r0, 0x1
	strh r0, [r4]
	b _0806B450
_0806B37C:
	bl sub_809D51C
	b _0806B426
_0806B382:
	ldr r2, _0806B3B0
	ldr r0, _0806B3B4
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1
	ldrb r1, [r0]
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 2
	adds r2, 0x4
	adds r0, r2
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B450
	ldr r1, _0806B3B8
	ldr r2, _0806B3BC
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B3B0: .4byte gUnknown_08376C74
_0806B3B4: .4byte 0x0201b000
_0806B3B8: .4byte 0x03001770
_0806B3BC: .4byte 0x0000043c
_0806B3C0:
	ldr r0, _0806B3C8
	bl sub_8071C58
	b _0806B426
	.align 2, 0
_0806B3C8: .4byte gWindowConfig_81E6CC8
_0806B3CC:
	bl sub_8071C94
	cmp r0, 0
	beq _0806B450
	ldr r1, _0806B3DC
	ldr r0, _0806B3E0
	adds r1, r0
	b _0806B42C
	.align 2, 0
_0806B3DC: .4byte 0x03001770
_0806B3E0: .4byte 0x0000043c
_0806B3E4:
	ldr r0, _0806B3FC
	ldr r1, _0806B400
	adds r0, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_806D538
	ldr r1, _0806B404
	ldr r2, _0806B408
	adds r1, r2
	b _0806B42C
	.align 2, 0
_0806B3FC: .4byte 0x0201b000
_0806B400: .4byte 0x00000259
_0806B404: .4byte 0x03001770
_0806B408: .4byte 0x0000043c
_0806B40C:
	movs r0, 0x1
	negs r0, r0
	movs r1, 0
	str r1, [sp]
	movs r2, 0x10
	movs r3, 0
	bl BeginNormalPaletteFade
	ldr r2, _0806B434
	ldrb r1, [r2, 0x8]
	movs r0, 0x7F
	ands r0, r1
	strb r0, [r2, 0x8]
_0806B426:
	ldr r1, _0806B438
	ldr r3, _0806B43C
	adds r1, r3
_0806B42C:
	ldrb r0, [r1]
	adds r0, 0x1
	strb r0, [r1]
	b _0806B450
	.align 2, 0
_0806B434: .4byte 0x0202f388
_0806B438: .4byte 0x03001770
_0806B43C: .4byte 0x0000043c
_0806B440:
	ldr r0, _0806B44C
	bl SetVBlankCallback
	movs r0, 0x1
	b _0806B452
	.align 2, 0
_0806B44C: .4byte sub_806AF34
_0806B450:
	movs r0, 0
_0806B452:
	add sp, 0xC
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r1}
	bx r1
	thumb_func_end sub_806B124

	thumb_func_start sub_806B460
sub_806B460: @ 806B460
	push {lr}
	b _0806B470
_0806B464:
	bl sub_80F9344
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806B49C
_0806B470:
	bl sub_806B124
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B464
	ldr r1, _0806B4A0
	movs r2, 0x96
	lsls r2, 2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, 0x5
	beq _0806B496
	adds r2, 0x8
	adds r0, r1, r2
	ldrb r0, [r0]
	movs r1, 0
	bl sub_806BF74
_0806B496:
	ldr r0, _0806B4A4
	bl SetMainCallback2
_0806B49C:
	pop {r0}
	bx r0
	.align 2, 0
_0806B4A0: .4byte 0x0201b000
_0806B4A4: .4byte sub_806AEDC
	thumb_func_end sub_806B460

	thumb_func_start sub_806B4A8
sub_806B4A8: @ 806B4A8
	push {lr}
	movs r0, 0
	bl SetHBlankCallback
	movs r1, 0x80
	lsls r1, 19
	movs r2, 0xFA
	lsls r2, 5
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x8
	ldr r2, _0806B50C
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0806B510
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0806B514
	adds r0, r2, 0
	strh r0, [r1]
	adds r1, 0x2
	ldr r2, _0806B518
	adds r0, r2, 0
	strh r0, [r1]
	ldr r0, _0806B51C
	movs r1, 0
	strh r1, [r0]
	subs r0, 0x40
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	adds r0, 0x2
	strh r1, [r0]
	ldr r2, _0806B520
	strh r1, [r2]
	ldr r1, _0806B524
	adds r0, r1, 0
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0806B50C: .4byte 0x00001e05
_0806B510: .4byte 0x00000703
_0806B514: .4byte 0x00000f08
_0806B518: .4byte 0x00000602
_0806B51C: .4byte 0x04000050
_0806B520: .4byte 0x0400001e
_0806B524: .4byte 0x0000ffff
	thumb_func_end sub_806B4A8

	thumb_func_start sub_806B528
sub_806B528: @ 806B528
	push {lr}
	ldr r0, _0806B53C
	ldrh r1, [r0]
	movs r0, 0x4B
	ands r0, r1
	cmp r0, 0x4B
	beq _0806B540
	movs r0, 0
	b _0806B542
	.align 2, 0
_0806B53C: .4byte 0x020239f8
_0806B540:
	movs r0, 0x1
_0806B542:
	pop {r1}
	bx r1
	thumb_func_end sub_806B528

	thumb_func_start sub_806B548
sub_806B548: @ 806B548
	push {r4,lr}
	ldr r0, _0806B574
	ldr r1, _0806B578
	adds r4, r0, r1
	ldrb r3, [r4]
	cmp r3, 0
	beq _0806B56E
	ldr r1, _0806B57C
	ldr r2, _0806B580
	ldr r0, _0806B584
	str r1, [r0]
	str r2, [r0, 0x4]
	ldr r1, _0806B588
	str r1, [r0, 0x8]
	ldr r0, [r0, 0x8]
	cmp r3, 0x2
	bne _0806B56E
	movs r0, 0
	strb r0, [r4]
_0806B56E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B574: .4byte 0x0201b000
_0806B578: .4byte 0x00000261
_0806B57C: .4byte 0x020221cc
_0806B580: .4byte 0x06003000
_0806B584: .4byte 0x040000d4
_0806B588: .4byte 0x80000400
	thumb_func_end sub_806B548

	thumb_func_start sub_806B58C
sub_806B58C: @ 806B58C
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	bl battle_type_is_double
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0
	bne _0806B5A8
	ldr r0, _0806B5A4
	strb r2, [r0]
	b _0806B5C8
	.align 2, 0
_0806B5A4: .4byte 0x0202e8fa
_0806B5A8:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B5C0
	ldr r1, _0806B5BC
	movs r0, 0x2
	b _0806B5C4
	.align 2, 0
_0806B5BC: .4byte 0x0202e8fa
_0806B5C0:
	ldr r1, _0806B5E4
	movs r0, 0x1
_0806B5C4:
	strb r0, [r1]
	adds r0, r1, 0
_0806B5C8:
	ldrb r0, [r0]
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 2
	ldr r0, _0806B5E8
	adds r4, r1, r0
	cmp r5, 0x8
	bls _0806B5DA
	b _0806B900
_0806B5DA:
	lsls r0, r5, 2
	ldr r1, _0806B5EC
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806B5E4: .4byte 0x0202e8fa
_0806B5E8: .4byte gUnknown_083769A8
_0806B5EC: .4byte _0806B5F0
	.align 2, 0
_0806B5F0:
	.4byte _0806B614
	.4byte _0806B628
	.4byte _0806B638
	.4byte _0806B694
	.4byte _0806B71A
	.4byte _0806B7A2
	.4byte _0806B832
	.4byte _0806B8C6
	.4byte _0806B8E8
_0806B614:
	ldr r0, _0806B624
	movs r2, 0x80
	lsls r2, 4
	movs r1, 0
	bl memset
	b _0806B900
	.align 2, 0
_0806B624: .4byte 0x020221cc
_0806B628:
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r4, 0
	movs r1, 0
	b _0806B8A8
_0806B638:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B666
	ldr r0, _0806B65C
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0806B660
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x2
	movs r1, 0x1
	b _0806B8A8
	.align 2, 0
_0806B65C: .4byte 0x03004350
_0806B660:
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	b _0806B8BC
_0806B666:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B684
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	movs r2, 0x4
	bl sub_806B9A4
	adds r0, r4, 0x2
	movs r1, 0x1
	movs r2, 0x4
	b _0806B8AA
_0806B684:
	ldrb r0, [r4, 0x2]
	ldrb r1, [r4, 0x3]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r4, 0x2
	movs r1, 0x1
	b _0806B8A8
_0806B694:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B6C2
	ldr r0, _0806B6B8
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0806B6BC
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x4
	movs r1, 0x2
	b _0806B8A8
	.align 2, 0
_0806B6B8: .4byte 0x03004350
_0806B6BC:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	b _0806B8BC
_0806B6C2:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B6F6
	ldr r0, _0806B6EC
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806B6F0
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x4
	movs r1, 0x2
	b _0806B8A8
	.align 2, 0
_0806B6EC: .4byte 0x03004428
_0806B6F0:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	b _0806B8BC
_0806B6F6:
	ldr r0, _0806B710
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0806B714
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x4
	movs r1, 0x2
	b _0806B8A8
	.align 2, 0
_0806B710: .4byte 0x03004350
_0806B714:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	b _0806B8BC
_0806B71A:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B74A
	ldr r0, _0806B740
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _0806B744
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x6
	movs r1, 0x3
	b _0806B8A8
	.align 2, 0
_0806B740: .4byte 0x03004350
_0806B744:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	b _0806B8BC
_0806B74A:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B77E
	ldr r0, _0806B774
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806B778
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x6
	movs r1, 0x3
	b _0806B8A8
	.align 2, 0
_0806B774: .4byte 0x0300448c
_0806B778:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	b _0806B8BC
_0806B77E:
	ldr r0, _0806B798
	ldrb r0, [r0]
	cmp r0, 0x3
	bls _0806B79C
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0x6
	movs r1, 0x3
	b _0806B8A8
	.align 2, 0
_0806B798: .4byte 0x03004350
_0806B79C:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	b _0806B8BC
_0806B7A2:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B7D2
	ldr r0, _0806B7C8
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806B7CC
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x4
	b _0806B8A8
	.align 2, 0
_0806B7C8: .4byte 0x03004350
_0806B7CC:
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	b _0806B8BC
_0806B7D2:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B80A
	ldr r0, _0806B800
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806B804
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x4
	movs r2, 0x4
	b _0806B8AA
	.align 2, 0
_0806B800: .4byte 0x030044f0
_0806B804:
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	b _0806B884
_0806B80A:
	ldr r0, _0806B828
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806B82C
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0x8
	movs r1, 0x4
	b _0806B8A8
	.align 2, 0
_0806B828: .4byte 0x03004350
_0806B82C:
	ldrb r0, [r4, 0x8]
	ldrb r1, [r4, 0x9]
	b _0806B8BC
_0806B832:
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806B84C
	ldr r0, _0806B848
	ldrb r0, [r0]
	cmp r0, 0x5
	bhi _0806B896
	b _0806B8B8
	.align 2, 0
_0806B848: .4byte 0x03004350
_0806B84C:
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806B88E
	ldr r0, _0806B87C
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806B880
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0xA
	movs r1, 0x5
	movs r2, 0x4
	b _0806B8AA
	.align 2, 0
_0806B87C: .4byte 0x03004554
_0806B880:
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
_0806B884:
	movs r2, 0x1
	movs r3, 0x4
	bl sub_806BA94
	b _0806B900
_0806B88E:
	ldr r0, _0806B8B4
	ldrb r0, [r0]
	cmp r0, 0x5
	bls _0806B8B8
_0806B896:
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	adds r0, r4, 0
	adds r0, 0xA
	movs r1, 0x5
_0806B8A8:
	movs r2, 0x3
_0806B8AA:
	movs r3, 0
	bl sub_806BF24
	b _0806B900
	.align 2, 0
_0806B8B4: .4byte 0x03004350
_0806B8B8:
	ldrb r0, [r4, 0xA]
	ldrb r1, [r4, 0xB]
_0806B8BC:
	movs r2, 0x1
	movs r3, 0x3
	bl sub_806BA94
	b _0806B900
_0806B8C6:
	ldr r0, _0806B8E4
	movs r1, 0x96
	lsls r1, 2
	adds r0, r1
	ldrb r0, [r0]
	cmp r0, 0x4
	bne _0806B8DA
	movs r0, 0x1
	bl sub_806BB9C
_0806B8DA:
	movs r0, 0x1
	bl sub_806BBEC
	b _0806B900
	.align 2, 0
_0806B8E4: .4byte 0x0201b000
_0806B8E8:
	ldr r0, _0806B8F8
	ldr r1, _0806B8FC
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x1
	b _0806B902
	.align 2, 0
_0806B8F8: .4byte 0x0201b000
_0806B8FC: .4byte 0x00000261
_0806B900:
	movs r0, 0
_0806B902:
	pop {r4,r5}
	pop {r1}
	bx r1
	thumb_func_end sub_806B58C

	thumb_func_start sub_806B908
sub_806B908: @ 806B908
	push {r4,r5,lr}
	ldr r0, _0806B948
	movs r2, 0x80
	lsls r2, 4
	movs r1, 0
	bl memset
	ldr r1, _0806B94C
	movs r0, 0x3
	strb r0, [r1]
	ldr r0, _0806B950
	adds r4, r0, 0
	adds r4, 0x24
	ldr r5, _0806B954
	ldrb r0, [r4]
	ldrb r1, [r4, 0x1]
	movs r2, 0x3
	bl sub_806B9A4
	adds r0, r5, 0
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806B958
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	b _0806B964
	.align 2, 0
_0806B948: .4byte 0x020221cc
_0806B94C: .4byte 0x0202e8fa
_0806B950: .4byte gUnknown_083769A8
_0806B954: .4byte 0x030043c4
_0806B958:
	ldrb r0, [r4, 0x4]
	ldrb r1, [r4, 0x5]
	movs r2, 0x1
	movs r3, 0x3
	bl sub_806BA94
_0806B964:
	adds r0, r5, 0
	adds r0, 0x64
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806B980
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0
	movs r3, 0x3
	bl sub_806BA94
	b _0806B98C
_0806B980:
	ldrb r0, [r4, 0x6]
	ldrb r1, [r4, 0x7]
	movs r2, 0x1
	movs r3, 0x3
	bl sub_806BA94
_0806B98C:
	ldr r0, _0806B99C
	ldr r1, _0806B9A0
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B99C: .4byte 0x0201b000
_0806B9A0: .4byte 0x00000261
	thumb_func_end sub_806B908

	thumb_func_start sub_806B9A4
sub_806B9A4: @ 806B9A4
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r2, 24
	lsrs r2, 24
	str r2, [sp]
	lsls r1, 21
	lsrs r1, 16
	str r1, [sp, 0x4]
	movs r1, 0
	lsls r0, 16
	mov r8, r0
	asrs r0, 16
	mov r10, r0
	ldr r4, _0806BA2C
	mov r9, r4
_0806B9CA:
	movs r3, 0
	adds r7, r1, 0x1
	mov r0, r10
	cmp r0, 0x1F
	bgt _0806BA12
	mov r4, r8
	asrs r2, r4, 16
	lsls r0, r1, 5
	ldr r4, [sp, 0x4]
	adds r6, r4, r0
	ldr r0, _0806BA30
	mov r12, r0
	ldr r4, [sp]
	lsls r5, r4, 12
	movs r0, 0xB
	adds r4, r1, 0
	muls r4, r0
_0806B9EC:
	adds r0, r2, r3
	cmp r0, 0
	blt _0806BA02
	adds r0, r6, r0
	lsls r0, 1
	add r0, r12
	adds r1, r4, r3
	add r1, r9
	ldrb r1, [r1]
	orrs r1, r5
	strh r1, [r0]
_0806BA02:
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0xA
	bhi _0806BA12
	adds r0, r2, r3
	cmp r0, 0x1F
	ble _0806B9EC
_0806BA12:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _0806B9CA
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BA2C: .4byte gUnknown_083769D8
_0806BA30: .4byte 0x020221cc
	thumb_func_end sub_806B9A4

	thumb_func_start sub_806BA34
sub_806BA34: @ 806BA34
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 21
	lsrs r1, 16
	mov r8, r1
	movs r1, 0
	lsls r7, r0, 16
	asrs r0, r7, 16
	mov r12, r0
_0806BA48:
	movs r2, 0
	adds r4, r1, 0x1
	mov r5, r12
	cmp r5, 0x1F
	bgt _0806BA7C
	asrs r3, r7, 16
	lsls r0, r1, 5
	mov r5, r8
	adds r1, r5, r0
	ldr r6, _0806BA90
	movs r5, 0
_0806BA5E:
	adds r0, r3, r2
	cmp r0, 0
	blt _0806BA6C
	adds r0, r1, r0
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
_0806BA6C:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0xA
	bhi _0806BA7C
	adds r0, r3, r2
	cmp r0, 0x1F
	ble _0806BA5E
_0806BA7C:
	lsls r0, r4, 24
	lsrs r1, r0, 24
	cmp r1, 0x6
	bls _0806BA48
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BA90: .4byte 0x020221cc
	thumb_func_end sub_806BA34

	thumb_func_start sub_806BA94
sub_806BA94: @ 806BA94
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	sub sp, 0x8
	lsls r0, 16
	lsrs r4, r0, 16
	lsls r1, 16
	lsrs r0, r1, 16
	lsls r2, 24
	lsls r3, 24
	lsrs r3, 24
	str r3, [sp]
	ldr r1, _0806BB30
	mov r9, r1
	cmp r2, 0
	bne _0806BABC
	ldr r1, _0806BB34
	mov r9, r1
_0806BABC:
	lsls r0, 21
	lsrs r0, 16
	str r0, [sp, 0x4]
	movs r1, 0
	lsls r4, 16
	mov r12, r4
	asrs r4, 16
	mov r10, r4
_0806BACC:
	movs r2, 0
	adds r7, r1, 0x1
	mov r0, r10
	cmp r0, 0x1F
	bgt _0806BB16
	mov r4, r12
	asrs r3, r4, 16
	lsls r0, r1, 5
	ldr r4, [sp, 0x4]
	adds r6, r4, r0
	ldr r0, _0806BB38
	mov r8, r0
	ldr r4, [sp]
	lsls r5, r4, 12
	lsls r0, r1, 2
	adds r0, r1
	lsls r0, 2
	subs r4, r0, r1
_0806BAF0:
	adds r0, r3, r2
	cmp r0, 0
	blt _0806BB06
	adds r0, r6, r0
	lsls r0, 1
	add r0, r8
	adds r1, r4, r2
	add r1, r9
	ldrb r1, [r1]
	orrs r1, r5
	strh r1, [r0]
_0806BB06:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bhi _0806BB16
	adds r0, r3, r2
	cmp r0, 0x1F
	ble _0806BAF0
_0806BB16:
	lsls r0, r7, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _0806BACC
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BB30: .4byte gUnknown_08376A5E
_0806BB34: .4byte gUnknown_08376A25
_0806BB38: .4byte 0x020221cc
	thumb_func_end sub_806BA94

	thumb_func_start sub_806BB3C
sub_806BB3C: @ 806BB3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r1, 21
	lsrs r1, 16
	mov r8, r1
	movs r1, 0
	lsls r7, r0, 16
	asrs r0, r7, 16
	mov r12, r0
_0806BB50:
	movs r2, 0
	adds r4, r1, 0x1
	mov r5, r12
	cmp r5, 0x1F
	bgt _0806BB84
	asrs r3, r7, 16
	lsls r0, r1, 5
	mov r5, r8
	adds r1, r5, r0
	ldr r6, _0806BB98
	movs r5, 0
_0806BB66:
	adds r0, r3, r2
	cmp r0, 0
	blt _0806BB74
	adds r0, r1, r0
	lsls r0, 1
	adds r0, r6
	strh r5, [r0]
_0806BB74:
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x12
	bhi _0806BB84
	adds r0, r3, r2
	cmp r0, 0x1F
	ble _0806BB66
_0806BB84:
	lsls r0, r4, 24
	lsrs r1, r0, 24
	cmp r1, 0x2
	bls _0806BB50
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BB98: .4byte 0x020221cc
	thumb_func_end sub_806BB3C

	thumb_func_start sub_806BB9C
sub_806BB9C: @ 806BB9C
	push {r4,lr}
	sub sp, 0x18
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0806BBE4
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldr r3, _0806BBE8
	movs r2, 0
	lsls r4, 12
_0806BBB6:
	lsls r0, r2, 1
	adds r1, r0, r3
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r1, 0x40
	adds r0, r2, 0x6
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _0806BBB6
	add sp, 0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BBE4: .4byte gUnknown_08376CD4
_0806BBE8: .4byte 0x06003c30
	thumb_func_end sub_806BB9C

	thumb_func_start sub_806BBEC
sub_806BBEC: @ 806BBEC
	push {r4,lr}
	sub sp, 0x18
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0806BC34
	mov r0, sp
	movs r2, 0x18
	bl memcpy
	ldr r3, _0806BC38
	movs r2, 0
	lsls r4, 12
_0806BC06:
	lsls r0, r2, 1
	adds r1, r0, r3
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r1, 0x40
	adds r0, r2, 0x6
	lsls r0, 1
	add r0, sp
	ldrh r0, [r0]
	adds r0, r4
	strh r0, [r1]
	adds r0, r2, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r2, 0x5
	bls _0806BC06
	add sp, 0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806BC34: .4byte gUnknown_08376CEC
_0806BC38: .4byte 0x06003cb0
	thumb_func_end sub_806BBEC

	thumb_func_start sub_806BC3C
sub_806BC3C: @ 806BC3C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r0, 0
	adds r5, r1, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0806BCB0
	bl battle_type_is_double
	lsls r4, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	adds r4, r6
	ldr r7, [r4]
	movs r6, 0
	adds r0, r5, 0
	movs r1, 0x7
	bl __udivsi3
	lsls r0, 24
	lsrs r4, r0, 19
	ldr r5, _0806BCB4
	movs r0, 0x86
	lsls r0, 1
	adds r3, r0, 0
_0806BC7C:
	adds r1, r6, r4
	lsls r2, r6, 1
	adds r2, r7
	lsls r0, r1, 1
	adds r0, r5
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r2]
	adds r2, 0x40
	adds r1, 0x20
	lsls r1, 1
	adds r1, r5
	ldrh r1, [r1]
	adds r0, r3, r1
	strh r0, [r2]
	adds r0, r6, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	cmp r6, 0x6
	bls _0806BC7C
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BCB0: .4byte gUnknown_08376918
_0806BCB4: .4byte gUnknown_08E9A300
	thumb_func_end sub_806BC3C

	thumb_func_start unref_sub_806BCB8
unref_sub_806BCB8: @ 806BCB8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _0806BCE4
	ldrb r1, [r0]
	cmp r4, r1
	bcs _0806BCDE
	adds r6, r0, 0
_0806BCCA:
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806BC3C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r0, [r6]
	cmp r4, r0
	bcc _0806BCCA
_0806BCDE:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806BCE4: .4byte 0x03004350
	thumb_func_end unref_sub_806BCB8

	thumb_func_start sub_806BCE8
sub_806BCE8: @ 806BCE8
	push {r4,r5,lr}
	movs r5, 0
	b _0806BD46
_0806BCEE:
	movs r0, 0x64
	adds r1, r5, 0
	muls r1, r0
	ldr r0, _0806BD20
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0x2D
	bl PokemonGetField
	cmp r0, 0
	bne _0806BD38
	adds r0, r4, 0
	bl pokemon_get_gender
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0806BD24
	cmp r0, 0xFE
	beq _0806BD2E
	adds r0, r5, 0
	movs r1, 0x46
	bl sub_806BC3C
	b _0806BD40
	.align 2, 0
_0806BD20: .4byte 0x03004360
_0806BD24:
	adds r0, r5, 0
	movs r1, 0x54
	bl sub_806BC3C
	b _0806BD40
_0806BD2E:
	adds r0, r5, 0
	movs r1, 0x62
	bl sub_806BC3C
	b _0806BD40
_0806BD38:
	adds r0, r5, 0
	movs r1, 0x46
	bl sub_806BC3C
_0806BD40:
	adds r0, r5, 0x1
	lsls r0, 24
	lsrs r5, r0, 24
_0806BD46:
	ldr r0, _0806BD54
	ldrb r0, [r0]
	cmp r5, r0
	bcc _0806BCEE
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806BD54: .4byte 0x03004350
	thumb_func_end sub_806BCE8

	thumb_func_start sub_806BD58
sub_806BD58: @ 806BD58
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0806BD7C
	bl object_new_hidden_with_callback
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_806CA18
	movs r0, 0x1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806BD7C: .4byte SpriteCallbackDummy
	thumb_func_end sub_806BD58

	thumb_func_start sub_806BD80
sub_806BD80: @ 806BD80
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _0806BD9C
	ldrh r0, [r0, 0x30]
	cmp r0, 0x20
	beq _0806BDB2
	cmp r0, 0x20
	bgt _0806BDA0
	cmp r0, 0x10
	beq _0806BDB6
	b _0806BDB8
	.align 2, 0
_0806BD9C: .4byte 0x03001770
_0806BDA0:
	cmp r0, 0x40
	beq _0806BDAA
	cmp r0, 0x80
	beq _0806BDAE
	b _0806BDB8
_0806BDAA:
	movs r4, 0xFF
	b _0806BDB8
_0806BDAE:
	movs r4, 0x1
	b _0806BDB8
_0806BDB2:
	movs r4, 0xFE
	b _0806BDB8
_0806BDB6:
	movs r4, 0x2
_0806BDB8:
	lsls r0, r4, 24
	cmp r0, 0
	bne _0806BDDC
	bl sub_80F92BC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BDD0
	cmp r0, 0x2
	beq _0806BDD4
	b _0806BDD6
_0806BDD0:
	movs r4, 0xFF
	b _0806BDD6
_0806BDD4:
	movs r4, 0x1
_0806BDD6:
	lsls r0, r4, 24
	cmp r0, 0
	beq _0806BDF0
_0806BDDC:
	asrs r1, r0, 24
	adds r0, r5, 0
	bl sub_806BF74
	ldr r0, _0806BDEC
	ldrh r0, [r0, 0x30]
	b _0806BE2C
	.align 2, 0
_0806BDEC: .4byte 0x03001770
_0806BDF0:
	ldr r0, _0806BE1C
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806BE24
	ldr r4, _0806BE20
	adds r0, r5, 0
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x7
	bne _0806BE24
	movs r0, 0x2
	b _0806BE2C
	.align 2, 0
_0806BE1C: .4byte 0x03001770
_0806BE20: .4byte 0x02020004
_0806BE24:
	ldr r0, _0806BE34
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
_0806BE2C:
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806BE34: .4byte 0x03001770
	thumb_func_end sub_806BD80

	thumb_func_start sub_806BE38
sub_806BE38: @ 806BE38
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	ldr r0, _0806BE54
	ldrh r1, [r0, 0x30]
	adds r6, r0, 0
	cmp r1, 0x20
	beq _0806BE6A
	cmp r1, 0x20
	bgt _0806BE58
	cmp r1, 0x10
	beq _0806BE6E
	b _0806BE70
	.align 2, 0
_0806BE54: .4byte 0x03001770
_0806BE58:
	cmp r1, 0x40
	beq _0806BE62
	cmp r1, 0x80
	beq _0806BE66
	b _0806BE70
_0806BE62:
	movs r4, 0xFF
	b _0806BE8E
_0806BE66:
	movs r4, 0x1
	b _0806BE8E
_0806BE6A:
	movs r4, 0xFE
	b _0806BE8E
_0806BE6E:
	movs r4, 0x2
_0806BE70:
	cmp r4, 0
	bne _0806BE8E
	bl sub_80F92BC
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BE86
	cmp r0, 0x2
	beq _0806BE8A
	b _0806BE8C
_0806BE86:
	movs r4, 0xFF
	b _0806BE8C
_0806BE8A:
	movs r4, 0x1
_0806BE8C:
	ldr r6, _0806BEA4
_0806BE8E:
	ldrh r2, [r6, 0x2E]
	movs r0, 0x8
	ands r0, r2
	cmp r0, 0
	beq _0806BEA8
	adds r0, r5, 0
	bl sub_806C890
	movs r0, 0x8
	b _0806BEF0
	.align 2, 0
_0806BEA4: .4byte 0x03001770
_0806BEA8:
	lsls r0, r4, 24
	asrs r1, r0, 24
	cmp r1, 0
	beq _0806BEBA
	adds r0, r5, 0
	bl sub_806C658
	ldrh r0, [r6, 0x30]
	b _0806BEF0
_0806BEBA:
	movs r0, 0x1
	ands r0, r2
	cmp r0, 0
	beq _0806BEE8
	ldr r4, _0806BEE4
	adds r0, r5, 0
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r4
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	cmp r0, 0x7
	bne _0806BEE8
	movs r0, 0x2
	b _0806BEF0
	.align 2, 0
_0806BEE4: .4byte 0x02020004
_0806BEE8:
	ldr r0, _0806BEF8
	ldrh r1, [r0, 0x2E]
	movs r0, 0x3
	ands r0, r1
_0806BEF0:
	pop {r4-r6}
	pop {r1}
	bx r1
	.align 2, 0
_0806BEF8: .4byte 0x03001770
	thumb_func_end sub_806BE38

	thumb_func_start task_pc_turn_off
task_pc_turn_off: @ 806BEFC
	push {lr}
	adds r2, r0, 0
	lsls r1, 24
	lsrs r3, r1, 24
	ldrb r0, [r2]
	cmp r0, 0
	beq _0806BF14
	ldrb r1, [r2, 0x1]
	movs r2, 0
	bl sub_806BA94
	b _0806BF1E
_0806BF14:
	ldrb r0, [r2]
	ldrb r1, [r2, 0x1]
	adds r2, r3, 0
	bl sub_806B9A4
_0806BF1E:
	pop {r0}
	bx r0
	thumb_func_end task_pc_turn_off

	thumb_func_start sub_806BF24
sub_806BF24: @ 806BF24
	push {r4-r7,lr}
	adds r7, r0, 0
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	movs r0, 0x64
	muls r1, r0
	ldr r0, _0806BF70
	adds r5, r1, r0
	adds r0, r5, 0
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806BF56
	adds r0, r5, 0
	movs r1, 0x39
	bl PokemonGetField
	cmp r0, 0
	bne _0806BF56
	movs r4, 0x5
_0806BF56:
	cmp r6, 0x1
	bne _0806BF60
	adds r0, r4, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
_0806BF60:
	adds r0, r7, 0
	adds r1, r4, 0
	bl task_pc_turn_off
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806BF70: .4byte 0x03004360
	thumb_func_end sub_806BF24

	thumb_func_start sub_806BF74
sub_806BF74: @ 806BF74
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0806C0C4
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	mov r0, r9
	adds r1, r5, 0
	movs r2, 0
	bl sub_806DA44
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	beq _0806BFB6
	b _0806C0D8
_0806BFB6:
	cmp r5, 0
	beq _0806BFC2
	cmp r5, 0x2
	beq _0806BFC2
	cmp r5, 0x3
	bne _0806BFD2
_0806BFC2:
	lsls r0, r5, 1
	ldr r1, _0806C0C8
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
_0806BFD2:
	cmp r5, 0x1
	beq _0806BFDE
	cmp r5, 0x4
	beq _0806BFDE
	cmp r5, 0x5
	bne _0806BFEE
_0806BFDE:
	lsls r0, r5, 1
	ldr r1, _0806C0C8
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x4
	movs r3, 0
	bl sub_806BF24
_0806BFEE:
	cmp r5, 0x7
	bne _0806BFF8
	movs r0, 0x1
	bl sub_806BBEC
_0806BFF8:
	lsls r2, r4, 24
	asrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806C490
	ldr r2, _0806C0C4
	lsls r1, r6, 4
	adds r0, r1, r6
	lsls r0, 2
	adds r0, r2
	movs r2, 0x2E
	ldrsh r0, [r0, r2]
	mov r8, r1
	cmp r0, 0
	beq _0806C020
	cmp r0, 0x2
	beq _0806C020
	cmp r0, 0x3
	bne _0806C042
_0806C020:
	ldr r0, _0806C0C4
	mov r4, r8
	adds r1, r4, r6
	lsls r1, 2
	adds r1, r0
	movs r7, 0x2E
	ldrsh r0, [r1, r7]
	lsls r0, 1
	ldr r2, _0806C0C8
	adds r0, r2
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
_0806C042:
	ldr r1, _0806C0C4
	mov r2, r8
	adds r0, r2, r6
	lsls r0, 2
	adds r0, r1
	movs r4, 0x2E
	ldrsh r0, [r0, r4]
	cmp r0, 0x1
	beq _0806C05C
	cmp r0, 0x4
	beq _0806C05C
	cmp r0, 0x5
	bne _0806C07E
_0806C05C:
	ldr r0, _0806C0C4
	mov r7, r8
	adds r1, r7, r6
	lsls r1, 2
	adds r1, r0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r2, _0806C0C8
	adds r0, r2
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x4
	movs r3, 0x1
	bl sub_806BF24
_0806C07E:
	ldr r7, _0806C0C4
	mov r4, r8
	adds r0, r4, r6
	lsls r0, 2
	adds r4, r0, r7
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	cmp r0, 0x7
	bne _0806C096
	movs r0, 0x2
	bl sub_806BBEC
_0806C096:
	ldr r0, _0806C0CC
	ldr r2, _0806C0D0
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	ldr r1, _0806C0D4
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	adds r0, 0x40
	ldrb r0, [r0]
	strh r0, [r4, 0x20]
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	lsls r0, 2
	adds r0, r1
	adds r0, 0x41
	ldrb r0, [r0]
	strh r0, [r4, 0x22]
	adds r0, r7, 0
	b _0806C1A4
	.align 2, 0
_0806C0C4: .4byte 0x02020004
_0806C0C8: .4byte gUnknown_083769C0
_0806C0CC: .4byte 0x0201b000
_0806C0D0: .4byte 0x00000261
_0806C0D4: .4byte gUnknown_083768B8
_0806C0D8:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r5, 0x5
	bhi _0806C104
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	lsls r1, r5, 1
	adds r0, r1
	ldr r1, _0806C100
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	b _0806C10A
	.align 2, 0
_0806C100: .4byte gUnknown_083769A8
_0806C104:
	movs r0, 0x1
	bl sub_806BBEC
_0806C10A:
	cmp r7, 0
	bne _0806C11C
	lsls r2, r4, 24
	asrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806C1E4
	b _0806C128
_0806C11C:
	lsls r2, r4, 24
	asrs r2, 24
	adds r0, r6, 0
	adds r1, r5, 0
	bl sub_806C310
_0806C128:
	ldr r1, _0806C160
	lsls r2, r6, 4
	adds r0, r2, r6
	lsls r0, 2
	adds r1, r0, r1
	ldrh r3, [r1, 0x2E]
	movs r4, 0x2E
	ldrsh r0, [r1, r4]
	mov r8, r2
	cmp r0, 0x5
	bgt _0806C168
	lsls r0, r7, 1
	adds r0, r7
	lsls r0, 2
	movs r2, 0x2E
	ldrsh r1, [r1, r2]
	lsls r1, 1
	adds r0, r1
	ldr r1, _0806C164
	adds r0, r1
	lsls r1, r3, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
	b _0806C16E
	.align 2, 0
_0806C160: .4byte 0x02020004
_0806C164: .4byte gUnknown_083769A8
_0806C168:
	movs r0, 0x2
	bl sub_806BBEC
_0806C16E:
	ldr r0, _0806C1D4
	ldr r4, _0806C1D8
	adds r0, r4
	movs r1, 0x2
	strb r1, [r0]
	ldr r4, _0806C1DC
	mov r0, r8
	adds r1, r0, r6
	lsls r1, 2
	adds r1, r4
	ldr r3, _0806C1E0
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 2
	lsls r2, r7, 5
	adds r0, r2
	adds r0, r3
	ldrb r0, [r0]
	strh r0, [r1, 0x20]
	movs r7, 0x2E
	ldrsh r0, [r1, r7]
	lsls r0, 2
	adds r0, r2
	adds r0, r3
	ldrb r0, [r0, 0x1]
	strh r0, [r1, 0x22]
	adds r0, r4, 0
_0806C1A4:
	mov r1, r8
	adds r4, r1, r6
	lsls r4, 2
	adds r4, r0
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	movs r2, 0x1
	bl sub_806DA44
	movs r2, 0x2E
	ldrsh r0, [r4, r2]
	cmp r5, r0
	beq _0806C1C8
	movs r0, 0x5
	bl audio_play
_0806C1C8:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C1D4: .4byte 0x0201b000
_0806C1D8: .4byte 0x00000261
_0806C1DC: .4byte 0x02020004
_0806C1E0: .4byte gUnknown_083768B8
	thumb_func_end sub_806BF74

	thumb_func_start sub_806C1E4
sub_806C1E4: @ 806C1E4
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	asrs r0, r2, 24
	cmp r0, 0x4
	bls _0806C200
	b _0806C306
_0806C200:
	lsls r0, 2
	ldr r1, _0806C20C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C20C: .4byte _0806C210
	.align 2, 0
_0806C210:
	.4byte _0806C2EC
	.4byte _0806C238
	.4byte _0806C224
	.4byte _0806C25C
	.4byte _0806C2BC
_0806C224:
	ldr r0, _0806C234
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x30]
	b _0806C306
	.align 2, 0
_0806C234: .4byte 0x02020004
_0806C238:
	cmp r3, 0
	beq _0806C266
	cmp r3, 0x7
	bne _0806C298
	ldr r2, _0806C254
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	ldr r0, _0806C258
	ldrb r0, [r0]
	subs r0, 0x1
	b _0806C2AA
	.align 2, 0
_0806C254: .4byte 0x02020004
_0806C258: .4byte 0x03004350
_0806C25C:
	ldr r0, _0806C278
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r3, r0
	bne _0806C280
_0806C266:
	ldr r2, _0806C27C
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0x7
	strh r1, [r0, 0x2E]
	b _0806C2AC
	.align 2, 0
_0806C278: .4byte 0x03004350
_0806C27C: .4byte 0x02020004
_0806C280:
	cmp r3, 0x7
	bne _0806C298
	ldr r2, _0806C294
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _0806C2AC
	.align 2, 0
_0806C294: .4byte 0x02020004
_0806C298:
	ldr r2, _0806C2B8
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	lsls r0, r5, 24
	asrs r0, 24
	ldrh r5, [r1, 0x2E]
	adds r0, r5
_0806C2AA:
	strh r0, [r1, 0x2E]
_0806C2AC:
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C306
	.align 2, 0
_0806C2B8: .4byte 0x02020004
_0806C2BC:
	ldr r0, _0806C2E4
	ldrb r0, [r0]
	cmp r0, 0x1
	bls _0806C306
	cmp r3, 0
	bne _0806C306
	ldr r0, _0806C2E8
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806C2DE
	movs r0, 0x1
	strh r0, [r1, 0x30]
_0806C2DE:
	ldrh r0, [r1, 0x30]
	strh r0, [r1, 0x2E]
	b _0806C306
	.align 2, 0
_0806C2E4: .4byte 0x03004350
_0806C2E8: .4byte 0x02020004
_0806C2EC:
	subs r0, r3, 0x1
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x4
	bhi _0806C306
	ldr r0, _0806C30C
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r3, [r1, 0x30]
_0806C306:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C30C: .4byte 0x02020004
	thumb_func_end sub_806C1E4

	thumb_func_start sub_806C310
sub_806C310: @ 806C310
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r3, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	asrs r0, r2, 24
	cmp r0, 0x4
	bls _0806C32C
	b _0806C486
_0806C32C:
	lsls r0, 2
	ldr r1, _0806C338
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C338: .4byte _0806C33C
	.align 2, 0
_0806C33C:
	.4byte _0806C44E
	.4byte _0806C38C
	.4byte _0806C350
	.4byte _0806C364
	.4byte _0806C3E8
_0806C350:
	ldr r0, _0806C360
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x30]
	b _0806C486
	.align 2, 0
_0806C360: .4byte 0x02020004
_0806C364:
	cmp r3, 0x7
	bne _0806C37C
	ldr r2, _0806C378
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _0806C3D8
	.align 2, 0
_0806C378: .4byte 0x02020004
_0806C37C:
	ldr r0, _0806C388
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r3, r0
	beq _0806C390
	b _0806C3C4
	.align 2, 0
_0806C388: .4byte 0x03004350
_0806C38C:
	cmp r3, 0
	bne _0806C3A4
_0806C390:
	ldr r2, _0806C3A0
	lsls r3, r4, 4
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0x7
	strh r1, [r0, 0x2E]
	b _0806C3D8
	.align 2, 0
_0806C3A0: .4byte 0x02020004
_0806C3A4:
	cmp r3, 0x7
	bne _0806C3C4
	ldr r2, _0806C3BC
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	ldr r0, _0806C3C0
	ldrb r0, [r0]
	subs r0, 0x1
	b _0806C3D6
	.align 2, 0
_0806C3BC: .4byte 0x02020004
_0806C3C0: .4byte 0x03004350
_0806C3C4:
	ldr r2, _0806C3E4
	lsls r3, r4, 4
	adds r1, r3, r4
	lsls r1, 2
	adds r1, r2
	lsls r0, r5, 24
	asrs r0, 24
	ldrh r5, [r1, 0x2E]
	adds r0, r5
_0806C3D6:
	strh r0, [r1, 0x2E]
_0806C3D8:
	adds r0, r3, r4
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C486
	.align 2, 0
_0806C3E4: .4byte 0x02020004
_0806C3E8:
	cmp r3, 0
	bne _0806C418
	ldr r0, _0806C410
	ldrb r0, [r0]
	cmp r0, 0x2
	bls _0806C486
	ldr r0, _0806C414
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x30]
	subs r0, r2, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _0806C43A
	movs r0, 0x2
	strh r0, [r1, 0x2E]
	b _0806C486
	.align 2, 0
_0806C410: .4byte 0x03004350
_0806C414: .4byte 0x02020004
_0806C418:
	cmp r3, 0x1
	bne _0806C486
	ldr r0, _0806C440
	ldrb r0, [r0]
	cmp r0, 0x4
	bls _0806C486
	ldr r0, _0806C444
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	ldrh r2, [r1, 0x30]
	subs r0, r2, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0806C448
_0806C43A:
	strh r2, [r1, 0x2E]
	b _0806C486
	.align 2, 0
_0806C440: .4byte 0x03004350
_0806C444: .4byte 0x02020004
_0806C448:
	movs r0, 0x4
	strh r0, [r1, 0x2E]
	b _0806C486
_0806C44E:
	subs r0, r3, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C46C
	ldr r0, _0806C468
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	b _0806C482
	.align 2, 0
_0806C468: .4byte 0x02020004
_0806C46C:
	subs r0, r3, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C486
	ldr r0, _0806C48C
	lsls r1, r4, 4
	adds r1, r4
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
_0806C482:
	strh r0, [r1, 0x2E]
	strh r3, [r1, 0x30]
_0806C486:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C48C: .4byte 0x02020004
	thumb_func_end sub_806C310

	thumb_func_start sub_806C490
sub_806C490: @ 806C490
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 24
	lsrs r4, r1, 24
	lsls r2, 24
	movs r0, 0x80
	lsls r0, 18
	adds r2, r0
	asrs r0, r2, 24
	cmp r0, 0x4
	bls _0806C4AA
	b _0806C64E
_0806C4AA:
	lsls r0, 2
	ldr r1, _0806C4B4
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C4B4: .4byte _0806C4B8
	.align 2, 0
_0806C4B8:
	.4byte _0806C618
	.4byte _0806C524
	.4byte _0806C4CC
	.4byte _0806C4E0
	.4byte _0806C57C
_0806C4CC:
	ldr r0, _0806C4DC
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x30]
	b _0806C64E
	.align 2, 0
_0806C4DC: .4byte 0x02020004
_0806C4E0:
	cmp r4, 0x7
	bne _0806C4FC
	ldr r2, _0806C4F8
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	adds r1, r2, 0
	adds r6, r3, 0
	b _0806C566
	.align 2, 0
_0806C4F8: .4byte 0x02020004
_0806C4FC:
	lsls r6, r5, 4
	b _0806C518
_0806C500:
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0806C520
	adds r0, r1
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	bne _0806C528
_0806C518:
	cmp r4, 0x5
	bne _0806C500
	b _0806C558
	.align 2, 0
_0806C520: .4byte 0x03004360
_0806C524:
	lsls r6, r5, 4
	b _0806C554
_0806C528:
	ldr r1, _0806C534
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r1
	strh r4, [r0, 0x2E]
	b _0806C566
	.align 2, 0
_0806C534: .4byte 0x02020004
_0806C538:
	subs r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	beq _0806C554
	movs r0, 0x64
	muls r0, r4
	ldr r1, _0806C574
	adds r0, r1
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	bne _0806C528
_0806C554:
	cmp r4, 0
	bne _0806C538
_0806C558:
	ldr r0, _0806C578
	adds r1, r6, r5
	lsls r1, 2
	adds r1, r0
	movs r2, 0x7
	strh r2, [r1, 0x2E]
	adds r1, r0, 0
_0806C566:
	adds r0, r6, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C64E
	.align 2, 0
_0806C574: .4byte 0x03004360
_0806C578: .4byte 0x02020004
_0806C57C:
	cmp r4, 0
	bne _0806C5C8
	ldr r0, _0806C5AC
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r4, r1, r0
	ldrh r1, [r4, 0x30]
	subs r0, r1, 0x2
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bls _0806C5E2
	ldr r5, _0806C5B0
	adds r0, r5, 0
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806C5B4
	movs r0, 0x2
	strh r0, [r4, 0x2E]
	b _0806C64E
	.align 2, 0
_0806C5AC: .4byte 0x02020004
_0806C5B0: .4byte 0x03004428
_0806C5B4:
	adds r0, r5, 0
	adds r0, 0x64
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806C64E
	movs r0, 0x3
	strh r0, [r4, 0x2E]
	b _0806C64E
_0806C5C8:
	cmp r4, 0x1
	bne _0806C64E
	ldr r0, _0806C5E8
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r4, r1, r0
	ldrh r1, [r4, 0x30]
	subs r0, r1, 0x4
	lsls r0, 16
	lsrs r0, 16
	cmp r0, 0x1
	bhi _0806C5EC
_0806C5E2:
	strh r1, [r4, 0x2E]
	b _0806C64E
	.align 2, 0
_0806C5E8: .4byte 0x02020004
_0806C5EC:
	ldr r5, _0806C600
	adds r0, r5, 0
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806C604
	movs r0, 0x4
	strh r0, [r4, 0x2E]
	b _0806C64E
	.align 2, 0
_0806C600: .4byte 0x030044f0
_0806C604:
	adds r0, r5, 0
	adds r0, 0x64
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806C64E
	movs r0, 0x5
	strh r0, [r4, 0x2E]
	b _0806C64E
_0806C618:
	subs r0, r4, 0x2
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C634
	ldr r0, _0806C630
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	b _0806C64A
	.align 2, 0
_0806C630: .4byte 0x02020004
_0806C634:
	subs r0, r4, 0x4
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bhi _0806C64E
	ldr r0, _0806C654
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0x1
_0806C64A:
	strh r0, [r1, 0x2E]
	strh r4, [r1, 0x30]
_0806C64E:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C654: .4byte 0x02020004
	thumb_func_end sub_806C490

	thumb_func_start sub_806C658
sub_806C658: @ 806C658
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r1, 24
	lsrs r4, r1, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0806C6A0
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	mov r0, r8
	adds r1, r6, 0
	movs r2, 0
	bl sub_806DA44
	cmp r6, 0x5
	bhi _0806C6A8
	lsls r0, r6, 1
	ldr r1, _0806C6A4
	adds r0, r1
	adds r1, r6, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	b _0806C6BA
	.align 2, 0
_0806C6A0: .4byte 0x02020004
_0806C6A4: .4byte gUnknown_083769A8
_0806C6A8:
	cmp r6, 0x6
	bne _0806C6B4
	movs r0, 0x1
	bl sub_806BB9C
	b _0806C6BA
_0806C6B4:
	movs r0, 0x1
	bl sub_806BBEC
_0806C6BA:
	lsls r1, r4, 24
	movs r2, 0x80
	lsls r2, 18
	adds r0, r1, r2
	asrs r0, 24
	lsls r4, r5, 4
	adds r7, r1, 0
	cmp r0, 0x4
	bls _0806C6CE
	b _0806C7EA
_0806C6CE:
	lsls r0, 2
	ldr r1, _0806C6D8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806C6D8: .4byte _0806C6DC
	.align 2, 0
_0806C6DC:
	.4byte _0806C7D0
	.4byte _0806C708
	.4byte _0806C6F0
	.4byte _0806C740
	.4byte _0806C7A0
_0806C6F0:
	ldr r1, _0806C704
	lsls r2, r5, 4
	adds r0, r2, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	adds r4, r2, 0
	b _0806C7EA
	.align 2, 0
_0806C704: .4byte 0x02020004
_0806C708:
	cmp r6, 0
	bne _0806C720
	ldr r2, _0806C71C
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0x7
	strh r1, [r0, 0x2E]
	b _0806C78E
	.align 2, 0
_0806C71C: .4byte 0x02020004
_0806C720:
	cmp r6, 0x6
	bne _0806C77C
	ldr r2, _0806C738
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	ldr r0, _0806C73C
	ldrb r0, [r0]
	subs r0, 0x1
	b _0806C78C
	.align 2, 0
_0806C738: .4byte 0x02020004
_0806C73C: .4byte 0x03004350
_0806C740:
	ldr r0, _0806C75C
	ldrb r0, [r0]
	subs r0, 0x1
	cmp r6, r0
	bne _0806C764
	ldr r2, _0806C760
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0x6
	strh r1, [r0, 0x2E]
	b _0806C78E
	.align 2, 0
_0806C75C: .4byte 0x03004350
_0806C760: .4byte 0x02020004
_0806C764:
	cmp r6, 0x7
	bne _0806C77C
	ldr r2, _0806C778
	lsls r3, r5, 4
	adds r0, r3, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x2E]
	b _0806C78E
	.align 2, 0
_0806C778: .4byte 0x02020004
_0806C77C:
	ldr r2, _0806C79C
	lsls r3, r5, 4
	adds r1, r3, r5
	lsls r1, 2
	adds r1, r2
	asrs r0, r7, 24
	ldrh r4, [r1, 0x2E]
	adds r0, r4
_0806C78C:
	strh r0, [r1, 0x2E]
_0806C78E:
	adds r4, r3, 0
	adds r0, r4, r5
	lsls r0, 2
	adds r0, r2
	movs r1, 0
	strh r1, [r0, 0x30]
	b _0806C7EA
	.align 2, 0
_0806C79C: .4byte 0x02020004
_0806C7A0:
	ldr r0, _0806C7C8
	ldrb r0, [r0]
	lsls r4, r5, 4
	cmp r0, 0x1
	bls _0806C7EA
	cmp r6, 0
	bne _0806C7EA
	ldr r0, _0806C7CC
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	movs r2, 0x30
	ldrsh r0, [r1, r2]
	cmp r0, 0
	bne _0806C7C2
	movs r0, 0x1
	strh r0, [r1, 0x30]
_0806C7C2:
	ldrh r0, [r1, 0x30]
	strh r0, [r1, 0x2E]
	b _0806C7EA
	.align 2, 0
_0806C7C8: .4byte 0x03004350
_0806C7CC: .4byte 0x02020004
_0806C7D0:
	subs r0, r6, 0x1
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r5, 4
	cmp r0, 0x4
	bhi _0806C7EA
	ldr r0, _0806C82C
	adds r1, r4, r5
	lsls r1, 2
	adds r1, r0
	movs r0, 0
	strh r0, [r1, 0x2E]
	strh r6, [r1, 0x30]
_0806C7EA:
	ldr r1, _0806C82C
	adds r0, r4, r5
	lsls r0, 2
	adds r2, r0, r1
	ldr r1, _0806C830
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0]
	strh r0, [r2, 0x20]
	movs r3, 0x2E
	ldrsh r0, [r2, r3]
	lsls r0, 2
	adds r0, r1
	ldrb r0, [r0, 0x1]
	strh r0, [r2, 0x22]
	ldrh r3, [r2, 0x2E]
	movs r1, 0x2E
	ldrsh r0, [r2, r1]
	cmp r0, 0x5
	bgt _0806C838
	lsls r0, 1
	ldr r1, _0806C834
	adds r0, r1
	lsls r1, r3, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
	b _0806C84A
	.align 2, 0
_0806C82C: .4byte 0x02020004
_0806C830: .4byte gUnknown_083768B8
_0806C834: .4byte gUnknown_083769A8
_0806C838:
	cmp r0, 0x6
	bne _0806C844
	movs r0, 0x2
	bl sub_806BB9C
	b _0806C84A
_0806C844:
	movs r0, 0x2
	bl sub_806BBEC
_0806C84A:
	ldr r0, _0806C884
	ldr r2, _0806C888
	adds r0, r2
	movs r1, 0x2
	strb r1, [r0]
	ldr r0, _0806C88C
	adds r4, r5
	lsls r4, 2
	adds r4, r0
	ldrh r1, [r4, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	mov r0, r8
	movs r2, 0x1
	bl sub_806DA44
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r6, r0
	beq _0806C878
	movs r0, 0x5
	bl audio_play
_0806C878:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C884: .4byte 0x0201b000
_0806C888: .4byte 0x00000261
_0806C88C: .4byte 0x02020004
	thumb_func_end sub_806C658

	thumb_func_start sub_806C890
sub_806C890: @ 806C890
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	adds r0, r6, 0
	bl sub_806CA00
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r1, _0806C8D4
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x6
	beq _0806C914
	adds r0, r6, 0
	adds r1, r4, 0
	movs r2, 0
	bl sub_806DA44
	cmp r4, 0x5
	bhi _0806C8DC
	lsls r0, r4, 1
	ldr r1, _0806C8D8
	adds r0, r1
	adds r1, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	b _0806C8E2
	.align 2, 0
_0806C8D4: .4byte 0x02020004
_0806C8D8: .4byte gUnknown_083769A8
_0806C8DC:
	movs r0, 0x1
	bl sub_806BBEC
_0806C8E2:
	ldr r1, _0806C91C
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	movs r1, 0
	strh r1, [r0, 0x30]
	movs r1, 0x6
	strh r1, [r0, 0x2E]
	ldr r2, _0806C920
	ldrb r1, [r2, 0x18]
	strh r1, [r0, 0x20]
	ldrb r1, [r2, 0x19]
	strh r1, [r0, 0x22]
	movs r0, 0x2
	bl sub_806BB9C
	ldr r0, _0806C924
	ldr r1, _0806C928
	adds r0, r1
	movs r1, 0x2
	strb r1, [r0]
	movs r0, 0x5
	bl audio_play
_0806C914:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C91C: .4byte 0x02020004
_0806C920: .4byte gUnknown_083768B8
_0806C924: .4byte 0x0201b000
_0806C928: .4byte 0x00000261
	thumb_func_end sub_806C890

	thumb_func_start sub_806C92C
sub_806C92C: @ 806C92C
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	ldr r0, _0806C960
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	adds r1, r0
	ldrh r0, [r1, 0x2E]
	lsls r0, 24
	lsrs r6, r0, 24
	ldrh r0, [r1, 0x30]
	lsls r0, 24
	lsrs r4, r0, 24
	bl battle_type_is_double
	lsls r0, 24
	cmp r0, 0
	bne _0806C96A
	cmp r6, 0
	bne _0806C964
	cmp r4, 0
	bne _0806C97C
	movs r4, 0x1
	b _0806C97C
	.align 2, 0
_0806C960: .4byte 0x02020004
_0806C964:
	cmp r4, 0
	beq _0806C97C
	b _0806C97A
_0806C96A:
	cmp r6, 0x1
	bhi _0806C976
	cmp r4, 0x1
	bhi _0806C97C
	movs r4, 0x2
	b _0806C97C
_0806C976:
	cmp r4, 0x1
	bls _0806C97C
_0806C97A:
	movs r4, 0
_0806C97C:
	ldr r1, _0806C990
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	strh r4, [r0, 0x30]
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806C990: .4byte 0x02020004
	thumb_func_end sub_806C92C

	thumb_func_start sub_806C994
sub_806C994: @ 806C994
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806C9C0
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	strh r4, [r1, 0x2E]
	bl sub_806C92C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C9C0: .4byte 0x02020004
	thumb_func_end sub_806C994

	thumb_func_start sub_806C9C4
sub_806C9C4: @ 806C9C4
	push {r4,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806C9FC
	lsls r2, r4, 4
	adds r2, r4
	lsls r2, 2
	adds r2, r3
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r3
	ldrh r0, [r1, 0x20]
	strh r0, [r2, 0x20]
	ldrh r0, [r1, 0x22]
	strh r0, [r2, 0x22]
	ldrh r0, [r1, 0x2E]
	strh r0, [r2, 0x2E]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806C9FC: .4byte 0x02020004
	thumb_func_end sub_806C9C4

	thumb_func_start sub_806CA00
sub_806CA00: @ 806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806CA14
	lsls r1, r0, 2
	adds r1, r0
	lsls r1, 3
	adds r1, r2
	ldrh r0, [r1, 0xE]
	lsrs r0, 8
	bx lr
	.align 2, 0
_0806CA14: .4byte 0x03004b20
	thumb_func_end sub_806CA00

	thumb_func_start sub_806CA18
sub_806CA18: @ 806CA18
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	ldr r3, _0806CA34
	lsls r2, r0, 2
	adds r2, r0
	lsls r2, 3
	adds r2, r3
	ldrb r0, [r2, 0xE]
	lsrs r1, 16
	orrs r0, r1
	strh r0, [r2, 0xE]
	bx lr
	.align 2, 0
_0806CA34: .4byte 0x03004b20
	thumb_func_end sub_806CA18

	thumb_func_start sub_806CA38
sub_806CA38: @ 806CA38
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	bl sub_806CA00
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806CA5C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x2E]
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806CA5C: .4byte 0x02020004
	thumb_func_end sub_806CA38

	thumb_func_start sub_806CA60
sub_806CA60: @ 806CA60
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r1, _0806CAD8
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CADC
	str r1, [r0]
	ldr r5, _0806CAE0
	strb r4, [r5]
	ldr r0, _0806CAE4
	movs r1, 0
	bl CreateTask
	ldr r0, _0806CAE8
	bl object_new_hidden_with_callback
	strb r0, [r5, 0x1]
	ldrb r1, [r5, 0x1]
	adds r0, r4, 0
	bl sub_806C9C4
	adds r0, r4, 0
	bl sub_806CA00
	strb r0, [r5, 0x2]
	ldr r1, _0806CAEC
	adds r0, r5, r1
	ldrb r0, [r0]
	movs r1, 0
	bl sub_806D538
	ldr r2, _0806CAF0
	ldrb r0, [r5, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r2, _0806CAF4
	adds r0, r2
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x6
	movs r3, 0
	bl sub_806BF24
	ldr r0, _0806CAF8
	adds r5, r0
	movs r0, 0x2
	strb r0, [r5]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CAD8: .4byte 0x03004b20
_0806CADC: .4byte TaskDummy
_0806CAE0: .4byte 0x02001000
_0806CAE4: .4byte sub_806CB74
_0806CAE8: .4byte SpriteCallbackDummy
_0806CAEC: .4byte 0x0001a272
_0806CAF0: .4byte 0x02020004
_0806CAF4: .4byte gUnknown_083769A8
_0806CAF8: .4byte 0x0001a261
	thumb_func_end sub_806CA60

	thumb_func_start sub_806CAFC
sub_806CAFC: @ 806CAFC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r0, 24
	ldr r4, _0806CB48
	ldrb r3, [r4, 0x1]
	lsls r2, r3, 4
	adds r2, r3
	lsls r2, 2
	ldr r3, _0806CB4C
	adds r5, r2, r3
	ldrb r2, [r4, 0x2]
	lsls r4, r2, 4
	adds r4, r2
	lsls r4, 2
	adds r4, r3
	lsls r1, 24
	asrs r1, 24
	bl sub_806BF74
	ldrh r2, [r5, 0x2E]
	movs r0, 0x2E
	ldrsh r1, [r5, r0]
	movs r3, 0x2E
	ldrsh r0, [r4, r3]
	cmp r1, r0
	beq _0806CB54
	adds r0, r1, 0
	lsls r0, 1
	ldr r1, _0806CB50
	adds r0, r1
	lsls r1, r2, 24
	lsrs r1, 24
	movs r2, 0x6
	movs r3, 0x1
	bl sub_806BF24
	b _0806CB6A
	.align 2, 0
_0806CB48: .4byte 0x02001000
_0806CB4C: .4byte 0x02020004
_0806CB50: .4byte gUnknown_083769A8
_0806CB54:
	movs r3, 0x2E
	ldrsh r0, [r5, r3]
	lsls r0, 1
	ldr r1, _0806CB70
	adds r0, r1
	lsls r1, r2, 24
	lsrs r1, 24
	movs r2, 0x6
	movs r3, 0
	bl sub_806BF24
_0806CB6A:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CB70: .4byte gUnknown_083769A8
	thumb_func_end sub_806CAFC

	thumb_func_start sub_806CB74
sub_806CB74: @ 806CB74
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r0, _0806CB8C
	ldrh r0, [r0, 0x30]
	cmp r0, 0x20
	beq _0806CBBC
	cmp r0, 0x20
	bgt _0806CB90
	cmp r0, 0x10
	beq _0806CBD0
	b _0806CBDA
	.align 2, 0
_0806CB8C: .4byte 0x03001770
_0806CB90:
	cmp r0, 0x40
	beq _0806CB9A
	cmp r0, 0x80
	beq _0806CBAC
	b _0806CBDA
_0806CB9A:
	ldr r0, _0806CBA8
	ldrb r0, [r0]
	movs r1, 0x1
	negs r1, r1
	bl sub_806CAFC
	b _0806CBDA
	.align 2, 0
_0806CBA8: .4byte 0x02001000
_0806CBAC:
	ldr r0, _0806CBB8
	ldrb r0, [r0]
	movs r1, 0x1
	bl sub_806CAFC
	b _0806CBDA
	.align 2, 0
_0806CBB8: .4byte 0x02001000
_0806CBBC:
	ldr r0, _0806CBCC
	ldrb r0, [r0]
	movs r1, 0x2
	negs r1, r1
	bl sub_806CAFC
	b _0806CBDA
	.align 2, 0
_0806CBCC: .4byte 0x02001000
_0806CBD0:
	ldr r0, _0806CC04
	ldrb r0, [r0]
	movs r1, 0x2
	bl sub_806CAFC
_0806CBDA:
	ldr r0, _0806CC08
	ldrh r1, [r0, 0x2E]
	movs r0, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806CC10
	movs r0, 0x5
	bl audio_play
	ldr r1, _0806CC0C
	lsls r0, r4, 2
	adds r0, r4
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CC04
	ldr r1, [r1, 0xC]
	str r1, [r0]
	adds r0, r4, 0
	bl _call_via_r1
	b _0806CC24
	.align 2, 0
_0806CC04: .4byte 0x02001000
_0806CC08: .4byte 0x03001770
_0806CC0C: .4byte 0x03004b20
_0806CC10:
	lsls r0, r1, 16
	lsrs r0, 16
	cmp r0, 0x2
	bne _0806CC24
	movs r0, 0x5
	bl audio_play
	adds r0, r4, 0
	bl sub_806CD44
_0806CC24:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806CB74

	thumb_func_start sub_806CC2C
sub_806CC2C: @ 806CC2C
	push {r4,r5,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r5, _0806CC68
	ldrb r1, [r5, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r1, _0806CC6C
	adds r0, r1
	bl DestroySprite
	movs r0, 0
	movs r1, 0
	bl sub_806D538
	ldr r0, _0806CC70
	adds r1, r5, r0
	movs r0, 0x2
	strb r0, [r1]
	ldrb r0, [r5]
	bl SwitchTaskToFollowupFunc
	adds r0, r4, 0
	bl DestroyTask
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CC68: .4byte 0x02001000
_0806CC6C: .4byte 0x02020004
_0806CC70: .4byte 0x0001a261
	thumb_func_end sub_806CC2C

	thumb_func_start sub_806CC74
sub_806CC74: @ 806CC74
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0806CCD8
	mov r8, r0
	ldr r6, _0806CCDC
	ldrb r0, [r6, 0x2]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	ldr r5, _0806CCE0
	adds r0, r5
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
	ldrb r0, [r6, 0x1]
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r8
	movs r2, 0x2E
	ldrsh r0, [r1, r2]
	lsls r0, 1
	adds r0, r5
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
	adds r0, r4, 0
	bl sub_806CC2C
	pop {r3}
	mov r8, r3
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806CCD8: .4byte 0x02020004
_0806CCDC: .4byte 0x02001000
_0806CCE0: .4byte gUnknown_083769A8
	thumb_func_end sub_806CC74

	thumb_func_start sub_806CCE4
sub_806CCE4: @ 806CCE4
	push {r4,r5,lr}
	ldr r3, _0806CD38
	ldr r2, _0806CD3C
	ldrb r1, [r2, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	ldrb r1, [r2, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r3
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	cmp r4, 0x5
	bhi _0806CD1E
	lsls r0, r4, 1
	ldr r1, _0806CD40
	adds r0, r1
	adds r1, r4, 0
	movs r2, 0x3
	movs r3, 0
	bl sub_806BF24
_0806CD1E:
	cmp r5, 0x5
	bhi _0806CD32
	lsls r0, r5, 1
	ldr r1, _0806CD40
	adds r0, r1
	adds r1, r5, 0
	movs r2, 0x3
	movs r3, 0x1
	bl sub_806BF24
_0806CD32:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CD38: .4byte 0x02020004
_0806CD3C: .4byte 0x02001000
_0806CD40: .4byte gUnknown_083769A8
	thumb_func_end sub_806CCE4

	thumb_func_start sub_806CD44
sub_806CD44: @ 806CD44
	push {r4,lr}
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	bl sub_806CCE4
	adds r0, r4, 0
	bl sub_806CC2C
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806CD44

	thumb_func_start sub_806CD5C
sub_806CD5C: @ 806CD5C
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	ldr r2, _0806CDA8
	ldr r6, _0806CDAC
	ldrb r1, [r6, 0x1]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r5, r0, 24
	mov r9, r5
	ldrb r1, [r6, 0x2]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldrh r0, [r0, 0x2E]
	lsls r0, 24
	lsrs r4, r0, 24
	adds r7, r4, 0
	cmp r5, r4
	beq _0806CD9E
	cmp r5, 0x7
	beq _0806CD9E
	cmp r4, 0x7
	bne _0806CDB0
_0806CD9E:
	mov r0, r8
	bl sub_806CD44
	b _0806CED2
	.align 2, 0
_0806CDA8: .4byte 0x02020004
_0806CDAC: .4byte 0x02001000
_0806CDB0:
	adds r0, r5, 0
	bl sub_806D5B8
	adds r0, r4, 0
	bl sub_806D5B8
	cmp r5, r4
	bls _0806CDC6
	strb r4, [r6, 0x5]
	strb r5, [r6, 0x6]
	b _0806CDCC
_0806CDC6:
	mov r0, r9
	strb r0, [r6, 0x5]
	strb r7, [r6, 0x6]
_0806CDCC:
	ldr r4, _0806CE1C
	ldrb r0, [r4]
	ldrb r1, [r4, 0x5]
	bl sub_806DDA0
	strb r0, [r4, 0x3]
	ldrb r0, [r4]
	ldrb r1, [r4, 0x6]
	bl sub_806DDA0
	strb r0, [r4, 0x4]
	ldrb r3, [r4, 0x5]
	cmp r3, 0
	bne _0806CE34
	ldr r2, _0806CE20
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0806CE24
	strh r1, [r0, 0x2E]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	ldr r1, _0806CE28
	strh r1, [r0, 0x32]
	strh r3, [r4, 0x8]
	movs r0, 0xB
	strh r0, [r4, 0xA]
	ldr r1, _0806CE2C
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CE30
	b _0806CE66
	.align 2, 0
_0806CE1C: .4byte 0x02001000
_0806CE20: .4byte 0x02020004
_0806CE24: .4byte 0x0000fff8
_0806CE28: .4byte 0x0000ff58
_0806CE2C: .4byte 0x03004b20
_0806CE30: .4byte sub_806D014
_0806CE34:
	ldr r2, _0806CEE0
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0x8
	strh r1, [r0, 0x2E]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r2
	movs r1, 0xA8
	strh r1, [r0, 0x32]
	movs r0, 0xB
	strh r0, [r4, 0x8]
	strh r0, [r4, 0xA]
	ldr r1, _0806CEE4
	mov r3, r8
	lsls r0, r3, 2
	add r0, r8
	lsls r0, 3
	adds r0, r1
	ldr r1, _0806CEE8
_0806CE66:
	str r1, [r0]
	ldr r0, _0806CEEC
	adds r1, r4, r0
	movs r0, 0x1
	strb r0, [r1]
	adds r6, r2, 0
	ldr r4, _0806CEF0
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r6, 0
	adds r5, 0x1C
	adds r0, r5
	ldr r2, _0806CEF4
	str r2, [r0]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0x8
	strh r1, [r0, 0x2E]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r6
	movs r1, 0xA8
	strh r1, [r0, 0x32]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r2, [r0]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r1, r0, r5
	adds r0, r6
	ldr r1, [r1]
	bl _call_via_r1
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r5, r0, r5
	adds r0, r6
	ldr r1, [r5]
	bl _call_via_r1
_0806CED2:
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CEE0: .4byte 0x02020004
_0806CEE4: .4byte 0x03004b20
_0806CEE8: .4byte sub_806D118
_0806CEEC: .4byte 0x0001a261
_0806CEF0: .4byte 0x02001000
_0806CEF4: .4byte sub_806D37C
	thumb_func_end sub_806CD5C

	thumb_func_start sub_806CEF8
sub_806CEF8: @ 806CEF8
	ldrh r3, [r0]
	ldrh r2, [r1]
	strh r2, [r0]
	strh r3, [r1]
	bx lr
	thumb_func_end sub_806CEF8

	thumb_func_start sub_806CF04
sub_806CF04: @ 806CF04
	push {r4,r5,lr}
	ldr r4, _0806CF94
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	ldr r5, _0806CF98
	adds r0, r5
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r5, 0x2
	adds r0, r3
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r5, 0x4
	adds r0, r3
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r3, r5, 0
	adds r3, 0xE
	adds r0, r3
	ldrb r2, [r4, 0x4]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	bl sub_806CEF8
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	subs r5, 0x4
	adds r0, r5
	ldr r2, _0806CF9C
	str r2, [r0]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	str r2, [r0]
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806CF94: .4byte 0x02001000
_0806CF98: .4byte 0x02020024
_0806CF9C: .4byte sub_806D37C
	thumb_func_end sub_806CF04

	thumb_func_start sub_806CFA0
sub_806CFA0: @ 806CFA0
	push {r4-r6,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r5, _0806CFDC
	ldrb r1, [r5, 0x6]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	movs r1, 0x3
	bl sub_806BA34
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	adds r1, r6, 0
	bl sub_806BB3C
	cmp r4, 0
	bne _0806CFE0
	ldrh r0, [r5, 0x8]
	subs r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	b _0806CFEA
	.align 2, 0
_0806CFDC: .4byte 0x02001000
_0806CFE0:
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
_0806CFEA:
	strh r0, [r5, 0xA]
	ldr r4, _0806D010
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	movs r1, 0x3
	movs r2, 0xA
	bl sub_806B9A4
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0xA
	bl sub_806BA94
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D010: .4byte 0x02001000
	thumb_func_end sub_806CFA0

	thumb_func_start sub_806D014
sub_806D014: @ 806D014
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_806CFA0
	ldr r2, _0806D050
	movs r0, 0x8
	ldrsh r1, [r2, r0]
	movs r0, 0xD
	negs r0, r0
	cmp r1, r0
	bge _0806D04A
	movs r1, 0xA
	ldrsh r0, [r2, r1]
	cmp r0, 0x20
	ble _0806D04A
	bl sub_806CF04
	ldr r0, _0806D054
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D058
	str r0, [r1]
_0806D04A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D050: .4byte 0x02001000
_0806D054: .4byte 0x03004b20
_0806D058: .4byte sub_806D05C
	thumb_func_end sub_806D014

	thumb_func_start sub_806D05C
sub_806D05C: @ 806D05C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806CFA0
	ldr r0, _0806D08C
	ldr r1, [r0, 0x8]
	movs r0, 0xB0
	lsls r0, 12
	cmp r1, r0
	bne _0806D084
	ldr r0, _0806D090
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D094
	str r0, [r1]
_0806D084:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D08C: .4byte 0x02001000
_0806D090: .4byte 0x03004b20
_0806D094: .4byte sub_806D198
	thumb_func_end sub_806D05C

	thumb_func_start sub_806D098
sub_806D098: @ 806D098
	push {r4-r7,lr}
	lsls r4, r1, 24
	lsrs r4, 24
	ldr r5, _0806D0E0
	ldrb r1, [r5, 0x5]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	ldrb r1, [r5, 0x6]
	subs r1, 0x1
	lsls r0, r1, 1
	adds r0, r1
	adds r0, 0x1
	lsls r0, 24
	lsrs r6, r0, 24
	movs r1, 0x8
	ldrsh r0, [r5, r1]
	adds r1, r7, 0
	bl sub_806BB3C
	movs r1, 0xA
	ldrsh r0, [r5, r1]
	adds r1, r6, 0
	bl sub_806BB3C
	cmp r4, 0
	bne _0806D0E4
	ldrh r0, [r5, 0x8]
	adds r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	adds r0, 0x1
	b _0806D0EE
	.align 2, 0
_0806D0E0: .4byte 0x02001000
_0806D0E4:
	ldrh r0, [r5, 0x8]
	subs r0, 0x1
	strh r0, [r5, 0x8]
	ldrh r0, [r5, 0xA]
	subs r0, 0x1
_0806D0EE:
	strh r0, [r5, 0xA]
	ldr r4, _0806D114
	movs r1, 0x8
	ldrsh r0, [r4, r1]
	adds r1, r7, 0
	movs r2, 0
	movs r3, 0xA
	bl sub_806BA94
	movs r1, 0xA
	ldrsh r0, [r4, r1]
	adds r1, r6, 0
	movs r2, 0
	movs r3, 0xA
	bl sub_806BA94
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D114: .4byte 0x02001000
	thumb_func_end sub_806D098

	thumb_func_start sub_806D118
sub_806D118: @ 806D118
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0
	bl sub_806D098
	ldr r1, _0806D150
	movs r2, 0x8
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	ble _0806D14A
	movs r2, 0xA
	ldrsh r0, [r1, r2]
	cmp r0, 0x20
	ble _0806D14A
	bl sub_806CF04
	ldr r0, _0806D154
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D158
	str r0, [r1]
_0806D14A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D150: .4byte 0x02001000
_0806D154: .4byte 0x03004b20
_0806D158: .4byte sub_806D15C
	thumb_func_end sub_806D118

	thumb_func_start sub_806D15C
sub_806D15C: @ 806D15C
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	adds r0, r4, 0
	movs r1, 0x1
	bl sub_806D098
	ldr r0, _0806D188
	ldr r1, [r0, 0x8]
	ldr r0, _0806D18C
	cmp r1, r0
	bne _0806D182
	ldr r0, _0806D190
	lsls r1, r4, 2
	adds r1, r4
	lsls r1, 3
	adds r1, r0
	ldr r0, _0806D194
	str r0, [r1]
_0806D182:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D188: .4byte 0x02001000
_0806D18C: .4byte 0x000b000b
_0806D190: .4byte 0x03004b20
_0806D194: .4byte sub_806D198
	thumb_func_end sub_806D15C

	thumb_func_start sub_806D198
sub_806D198: @ 806D198
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	mov r10, r0
	lsls r0, 24
	lsrs r0, 24
	mov r10, r0
	ldr r4, _0806D364
	ldrb r0, [r4]
	ldrb r1, [r4, 0x5]
	ldrb r2, [r4, 0x4]
	bl sub_806DE50
	ldrb r0, [r4]
	ldrb r1, [r4, 0x6]
	ldrb r2, [r4, 0x3]
	bl sub_806DE50
	bl battle_type_is_double
	ldr r5, _0806D368
	ldrb r1, [r4, 0x3]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldr r6, _0806D36C
	ldrb r2, [r4, 0x6]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2]
	movs r1, 0
	mov r8, r1
	strh r0, [r3, 0x20]
	bl battle_type_is_double
	ldrb r1, [r4, 0x3]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldrb r2, [r4, 0x6]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2, 0x1]
	strh r0, [r3, 0x22]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x24]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x26]
	ldrb r1, [r4, 0x3]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	movs r1, 0x1C
	adds r1, r5
	mov r9, r1
	add r0, r9
	ldr r7, _0806D370
	str r7, [r0]
	bl battle_type_is_double
	ldrb r1, [r4, 0x4]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldrb r2, [r4, 0x5]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2]
	strh r0, [r3, 0x20]
	bl battle_type_is_double
	ldrb r1, [r4, 0x4]
	lsls r3, r1, 4
	adds r3, r1
	lsls r3, 2
	adds r3, r5
	ldrb r2, [r4, 0x5]
	lsls r2, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r2, r1
	adds r2, r6
	ldrb r0, [r2, 0x1]
	strh r0, [r3, 0x22]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x24]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r0, r5
	mov r1, r8
	strh r1, [r0, 0x26]
	ldrb r1, [r4, 0x4]
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	add r0, r9
	str r7, [r0]
	ldrb r0, [r4]
	ldrb r2, [r4, 0x2]
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r5
	ldrh r1, [r1, 0x2E]
	lsls r1, 24
	lsrs r1, 24
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	add r1, r9
	ldr r0, _0806D374
	str r0, [r1]
	ldrb r0, [r4, 0x5]
	movs r6, 0x64
	muls r0, r6
	ldr r5, _0806D378
	adds r0, r5
	ldrb r1, [r4, 0x6]
	muls r1, r6
	adds r1, r5
	bl sub_806E6F0
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E2C0
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E07C
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E4E8
	ldrb r0, [r4, 0x5]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl nullsub_12
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E2C0
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E07C
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl sub_806E4E8
	ldrb r0, [r4, 0x6]
	adds r1, r0, 0
	muls r1, r6
	adds r1, r5
	bl nullsub_12
	bl sub_806E6C8
	mov r0, r10
	bl sub_806CC74
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D364: .4byte 0x02001000
_0806D368: .4byte 0x02020004
_0806D36C: .4byte gUnknown_08376678
_0806D370: .4byte sub_806DA38
_0806D374: .4byte sub_806DA0C
_0806D378: .4byte 0x03004360
	thumb_func_end sub_806D198

	thumb_func_start sub_806D37C
sub_806D37C: @ 806D37C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809D638
	ldrh r2, [r4, 0x24]
	movs r0, 0x24
	ldrsh r1, [r4, r0]
	movs r3, 0x32
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bne _0806D3A8
	movs r1, 0x2E
	ldrsh r0, [r4, r1]
	negs r0, r0
	movs r1, 0
	strh r0, [r4, 0x2E]
	strh r1, [r4, 0x32]
	ldr r0, _0806D3A4
	str r0, [r4, 0x1C]
	b _0806D3AE
	.align 2, 0
_0806D3A4: .4byte sub_806DA38
_0806D3A8:
	ldrh r0, [r4, 0x2E]
	adds r0, r2, r0
	strh r0, [r4, 0x24]
_0806D3AE:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806D37C

	thumb_func_start sub_806D3B4
sub_806D3B4: @ 806D3B4
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	lsls r4, 16
	lsrs r4, 16
	lsls r2, 16
	lsrs r2, 16
	mov r8, r2
	ldr r6, _0806D438
	ldr r1, _0806D43C
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r5, r0, r1
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x2]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x3]
	bl sub_806BA34
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x9]
	bl sub_806BB3C
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0xA]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0xB]
	bl sub_806BB3C
	ldrh r1, [r5, 0x8]
	subs r1, 0x1
	strh r1, [r5, 0x8]
	ldrb r0, [r6, 0x2]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x3]
	movs r2, 0x4
	bl sub_806B9A4
	cmp r4, 0
	beq _0806D440
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x9]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	b _0806D454
	.align 2, 0
_0806D438: .4byte gUnknown_083769C0
_0806D43C: .4byte 0x03004b20
_0806D440:
	ldrh r0, [r5, 0x8]
	ldrb r1, [r6, 0x8]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0x9]
	movs r2, 0x1
	movs r3, 0x4
	bl sub_806BA94
_0806D454:
	mov r0, r8
	cmp r0, 0
	beq _0806D480
	ldr r1, _0806D47C
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	ldrb r1, [r6, 0xA]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0xB]
	movs r2, 0
	movs r3, 0x4
	bl sub_806BA94
	b _0806D49E
	.align 2, 0
_0806D47C: .4byte 0x03004b20
_0806D480:
	ldr r1, _0806D4A8
	lsls r0, r7, 2
	adds r0, r7
	lsls r0, 3
	adds r0, r1
	ldrh r0, [r0, 0x8]
	ldrb r1, [r6, 0xA]
	adds r0, r1
	lsls r0, 16
	asrs r0, 16
	ldrb r1, [r6, 0xB]
	movs r2, 0x1
	movs r3, 0x4
	bl sub_806BA94
_0806D49E:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D4A8: .4byte 0x03004b20
	thumb_func_end sub_806D3B4

	thumb_func_start sub_806D4AC
sub_806D4AC: @ 806D4AC
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	lsls r1, 16
	lsls r2, 24
	lsrs r2, 24
	cmp r1, 0
	beq _0806D4F6
	adds r1, r2, 0x3
	lsls r1, 24
	lsrs r1, 24
	adds r0, r5, 0
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806D4FC
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r4, r1, r2
	ldr r0, _0806D500
	strh r0, [r4, 0x2E]
	ldr r3, _0806D504
	lsls r0, r5, 2
	adds r0, r5
	lsls r0, 3
	adds r0, r3
	movs r3, 0x8
	ldrsh r0, [r0, r3]
	lsls r0, 3
	negs r0, r0
	strh r0, [r4, 0x32]
	adds r2, 0x1C
	adds r1, r2
	ldr r0, _0806D508
	str r0, [r1]
_0806D4F6:
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D4FC: .4byte 0x02020004
_0806D500: .4byte 0x0000fff8
_0806D504: .4byte 0x03004b20
_0806D508: .4byte sub_806D37C
	thumb_func_end sub_806D4AC

	thumb_func_start sub_806D50C
sub_806D50C: @ 806D50C
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl sub_806DDA0
	ldr r2, _0806D534
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x20]
	adds r0, 0xF0
	strh r0, [r1, 0x20]
	pop {r0}
	bx r0
	.align 2, 0
_0806D534: .4byte 0x02020004
	thumb_func_end sub_806D50C

	thumb_func_start sub_806D538
sub_806D538: @ 806D538
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	lsls r1, 24
	lsrs r1, 24
	adds r0, r1, 0
	cmp r4, 0xFF
	beq _0806D59A
	cmp r1, 0x1
	beq _0806D568
	cmp r1, 0x1
	bgt _0806D556
	cmp r1, 0
	beq _0806D560
	b _0806D58A
_0806D556:
	cmp r0, 0x2
	beq _0806D570
	cmp r0, 0x3
	beq _0806D57E
	b _0806D58A
_0806D560:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x17
	b _0806D576
_0806D568:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x13
	b _0806D576
_0806D570:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x16
_0806D576:
	movs r3, 0x13
	bl DrawDefaultWindow
	b _0806D58A
_0806D57E:
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x12
	movs r3, 0x13
	bl DrawDefaultWindow
_0806D58A:
	ldr r0, _0806D5A0
	lsls r1, r4, 2
	adds r1, r0
	ldr r0, [r1]
	movs r1, 0x1
	movs r2, 0x11
	bl Print
_0806D59A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806D5A0: .4byte gUnknown_08376624
	thumb_func_end sub_806D538

	thumb_func_start sub_806D5A4
sub_806D5A4: @ 806D5A4
	push {lr}
	movs r0, 0
	movs r1, 0x10
	movs r2, 0x1D
	movs r3, 0x13
	bl Reset
	pop {r0}
	bx r0
	thumb_func_end sub_806D5A4

	thumb_func_start sub_806D5B8
sub_806D5B8: @ 806D5B8
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0806D658
	bl battle_type_is_double
	lsls r4, r5, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1]
	mov r10, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x1]
	mov r9, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x2]
	mov r8, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	adds r4, r6
	ldrb r1, [r4, 0x3]
	ldr r0, _0806D65C
	str r1, [sp]
	mov r1, r10
	mov r2, r9
	mov r3, r8
	bl ZeroFillWindowRect
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r5, 10
	ldr r0, _0806D660
	adds r5, r0
	ldr r2, _0806D664
	add r0, sp, 0x4
	adds r1, r5, 0
	bl CpuFastSet
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D658: .4byte gUnknown_08376948
_0806D65C: .4byte 0x03004210
_0806D660: .4byte 0x06014000
_0806D664: .4byte 0x01000100
	thumb_func_end sub_806D5B8

	thumb_func_start sub_806D668
sub_806D668: @ 806D668
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r6, _0806D708
	bl battle_type_is_double
	lsls r4, r5, 2
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1]
	mov r10, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x1]
	mov r9, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r1, r4, r1
	adds r1, r6
	ldrb r1, [r1, 0x2]
	mov r8, r1
	bl battle_type_is_double
	lsls r0, 24
	lsrs r0, 24
	lsls r1, r0, 1
	adds r1, r0
	lsls r1, 3
	adds r4, r1
	adds r4, r6
	ldrb r1, [r4, 0x3]
	ldr r0, _0806D70C
	str r1, [sp]
	mov r1, r10
	mov r2, r9
	mov r3, r8
	bl ZeroFillWindowRect
	movs r0, 0
	str r0, [sp, 0x4]
	lsls r5, 10
	ldr r0, _0806D710
	adds r5, r0
	ldr r2, _0806D714
	add r0, sp, 0x4
	adds r1, r5, 0
	bl CpuFastSet
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D708: .4byte gUnknown_08376978
_0806D70C: .4byte 0x03004210
_0806D710: .4byte 0x06014300
_0806D714: .4byte 0x01000040
	thumb_func_end sub_806D668

	thumb_func_start sub_806D718
sub_806D718: @ 806D718
	push {r4,r5,lr}
	sub sp, 0x4
	lsls r0, 24
	lsrs r4, r0, 24
	ldr r1, _0806D7C4
	mov r0, sp
	strh r1, [r0]
	movs r5, 0
	cmp r4, 0x1
	bhi _0806D736
	ldr r0, _0806D7C8
	movs r1, 0xC0
	lsls r1, 19
	bl LZDecompressVram
_0806D736:
	cmp r4, 0x2
	beq _0806D73E
	cmp r4, 0
	bne _0806D746
_0806D73E:
	ldr r0, _0806D7CC
	ldr r1, _0806D7D0
	bl LZDecompressVram
_0806D746:
	cmp r4, 0x3
	beq _0806D74E
	cmp r4, 0
	bne _0806D75A
_0806D74E:
	ldr r0, _0806D7D4
	movs r2, 0xB0
	lsls r2, 1
	movs r1, 0
	bl LoadCompressedPalette
_0806D75A:
	cmp r4, 0x4
	beq _0806D762
	cmp r4, 0
	bne _0806D776
_0806D762:
	mov r0, sp
	movs r1, 0
	movs r2, 0x2
	bl LoadPalette
	ldr r0, _0806D7D8
	movs r1, 0xF0
	movs r2, 0x20
	bl LoadPalette
_0806D776:
	cmp r4, 0x5
	beq _0806D77E
	cmp r4, 0
	bne _0806D786
_0806D77E:
	ldr r0, _0806D7DC
	ldr r1, _0806D7E0
	bl LZDecompressVram
_0806D786:
	cmp r4, 0x6
	beq _0806D78E
	cmp r4, 0
	bne _0806D796
_0806D78E:
	ldr r0, _0806D7E4
	ldr r1, _0806D7E8
	bl LZDecompressVram
_0806D796:
	cmp r4, 0x7
	beq _0806D79E
	cmp r4, 0
	bne _0806D7A6
_0806D79E:
	ldr r0, _0806D7EC
	ldr r1, _0806D7F0
	bl LZDecompressVram
_0806D7A6:
	cmp r4, 0x8
	beq _0806D7AE
	cmp r4, 0
	bne _0806D7BA
_0806D7AE:
	ldr r0, _0806D7F4
	movs r1, 0xB0
	movs r2, 0x20
	bl LoadCompressedPalette
	movs r5, 0x1
_0806D7BA:
	adds r0, r5, 0
	add sp, 0x4
	pop {r4,r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806D7C4: .4byte 0x00007fff
_0806D7C8: .4byte gUnknown_08E71354
_0806D7CC: .4byte gUnknown_08E71788
_0806D7D0: .4byte 0x06003800
_0806D7D4: .4byte gUnknown_08E716A0
_0806D7D8: .4byte gFontDefaultPalette
_0806D7DC: .4byte gUnknown_08E71894
_0806D7E0: .4byte 0x06006000
_0806D7E4: .4byte gUnknown_08E71934
_0806D7E8: .4byte 0x06006180
_0806D7EC: .4byte gUnknown_08E72860
_0806D7F0: .4byte 0x06007180
_0806D7F4: .4byte gUnknown_08E72A50
	thumb_func_end sub_806D718

	thumb_func_start sub_806D7F8
sub_806D7F8: @ 806D7F8
	push {r4-r6,lr}
	lsls r0, 24
	lsrs r6, r0, 24
	lsls r1, 16
	lsls r2, 16
	lsrs r5, r1, 16
	asrs r1, 16
	lsrs r4, r2, 16
	asrs r2, 16
	adds r0, r1, 0
	adds r1, r2, 0
	bl sub_8046200
	lsls r0, 24
	lsrs r0, 24
	movs r2, 0
	cmp r5, r4
	beq _0806D830
	movs r2, 0x1
	cmp r0, 0x3
	beq _0806D830
	movs r2, 0x2
	cmp r0, 0x2
	beq _0806D830
	movs r2, 0x4
	cmp r0, 0x1
	bne _0806D830
	movs r2, 0x3
_0806D830:
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	ldr r1, _0806D848
	adds r0, r1
	adds r1, r2, 0
	bl sub_809D824
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D848: .4byte 0x02020004
	thumb_func_end sub_806D7F8

	thumb_func_start sub_806D84C
sub_806D84C: @ 806D84C
	push {r4-r6,lr}
	adds r5, r0, 0
	adds r6, r1, 0
	lsls r5, 24
	lsrs r5, 24
	adds r0, r6, 0
	movs r1, 0x39
	bl PokemonGetField
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r6, 0
	movs r1, 0x3A
	bl PokemonGetField
	adds r2, r0, 0
	lsls r2, 16
	lsrs r2, 16
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_806D7F8
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806D84C

	thumb_func_start sub_806D880
sub_806D880: @ 806D880
	push {r4-r6,lr}
	mov r6, r10
	mov r5, r9
	mov r4, r8
	push {r4-r6}
	sub sp, 0x8
	adds r6, r0, 0
	adds r5, r1, 0
	mov r8, r3
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806D904
	lsls r1, r5, 2
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r1, r3
	ldrb r0, [r1]
	mov r9, r0
	ldrb r1, [r1, 0x1]
	mov r10, r1
	mov r0, r8
	movs r1, 0x41
	bl PokemonGetField
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0
	bl PokemonGetField
	ldr r1, _0806D908
	movs r2, 0x5
	str r2, [sp]
	str r0, [sp, 0x4]
	adds r0, r4, 0
	mov r2, r9
	mov r3, r10
	bl sub_809D2FC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_806DE50
	adds r0, r4, 0
	mov r1, r8
	bl sub_806D84C
	add sp, 0x8
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D904: .4byte gUnknown_08376678
_0806D908: .4byte sub_809D62C
	thumb_func_end sub_806D880

	thumb_func_start sub_806D90C
sub_806D90C: @ 806D90C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	adds r4, r2, 0
	lsls r0, 24
	lsrs r6, r0, 24
	mov r8, r6
	lsls r1, 24
	lsrs r5, r1, 24
	adds r7, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806D95A
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806D946
	adds r0, r6, 0
	adds r1, r5, 0
	movs r2, 0x2
	adds r3, r4, 0
	bl sub_806D880
	b _0806D95A
_0806D946:
	bl battle_type_is_double
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	mov r0, r8
	adds r1, r7, 0
	adds r3, r4, 0
	bl sub_806D880
_0806D95A:
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806D90C

	thumb_func_start unref_sub_806D964
unref_sub_806D964: @ 806D964
	push {r4,r5,lr}
	lsls r0, 24
	lsrs r5, r0, 24
	movs r4, 0
	b _0806D986
_0806D96E:
	movs r0, 0x64
	adds r2, r4, 0
	muls r2, r0
	ldr r0, _0806D994
	adds r2, r0
	adds r0, r5, 0
	adds r1, r4, 0
	bl sub_806D90C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
_0806D986:
	ldr r0, _0806D998
	ldrb r0, [r0]
	cmp r4, r0
	bcc _0806D96E
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D994: .4byte 0x03004360
_0806D998: .4byte 0x03004350
	thumb_func_end unref_sub_806D964

	thumb_func_start sub_806D99C
sub_806D99C: @ 806D99C
	push {r4-r7,lr}
	mov r7, r8
	push {r7}
	sub sp, 0x8
	adds r6, r0, 0
	adds r5, r1, 0
	mov r8, r3
	lsls r6, 24
	lsrs r6, 24
	lsls r5, 24
	lsrs r5, 24
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806DA04
	lsls r1, r5, 2
	lsls r0, r2, 1
	adds r0, r2
	lsls r0, 3
	adds r1, r0
	adds r1, r3
	ldrb r2, [r1]
	ldrb r3, [r1, 0x1]
	mov r1, r8
	ldrh r0, [r1]
	ldr r1, _0806DA08
	movs r4, 0x5
	str r4, [sp]
	mov r7, r8
	ldr r4, [r7, 0x18]
	str r4, [sp, 0x4]
	bl sub_809D2FC
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	adds r0, r6, 0
	adds r1, r5, 0
	adds r2, r4, 0
	bl sub_806DE50
	ldrh r1, [r7, 0x10]
	ldrh r2, [r7, 0x12]
	adds r0, r4, 0
	bl sub_806D7F8
	add sp, 0x8
	pop {r3}
	mov r8, r3
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA04: .4byte gUnknown_08376678
_0806DA08: .4byte sub_809D62C
	thumb_func_end sub_806D99C

	thumb_func_start sub_806DA0C
sub_806DA0C: @ 806DA0C
	push {r4,lr}
	adds r4, r0, 0
	bl sub_809D638
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0
	beq _0806DA32
	movs r1, 0x1
	ands r0, r1
	cmp r0, 0
	beq _0806DA30
	ldr r0, _0806DA2C
	strh r0, [r4, 0x26]
	b _0806DA32
	.align 2, 0
_0806DA2C: .4byte 0x0000fffd
_0806DA30:
	strh r1, [r4, 0x26]
_0806DA32:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806DA0C

	thumb_func_start sub_806DA38
sub_806DA38: @ 806DA38
	push {lr}
	bl sub_809D638
	pop {r0}
	bx r0
	thumb_func_end sub_806DA38

	thumb_func_start sub_806DA44
sub_806DA44: @ 806DA44
	push {r4,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r1, 0x5
	bhi _0806DA8E
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r3, _0806DA7C
	lsls r1, r0, 4
	adds r1, r0
	lsls r2, r1, 2
	adds r1, r2, r3
	movs r0, 0
	strh r0, [r1, 0x26]
	strh r0, [r1, 0x2E]
	cmp r4, 0
	bne _0806DA84
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r2, r0
	ldr r1, _0806DA80
	b _0806DA8C
	.align 2, 0
_0806DA7C: .4byte 0x02020004
_0806DA80: .4byte sub_806DA38
_0806DA84:
	adds r0, r3, 0
	adds r0, 0x1C
	adds r0, r2, r0
	ldr r1, _0806DA94
_0806DA8C:
	str r1, [r0]
_0806DA8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA94: .4byte sub_806DA0C
	thumb_func_end sub_806DA44

	thumb_func_start sub_806DA98
sub_806DA98: @ 806DA98
	push {lr}
	ldr r0, _0806DAAC
	bl LoadSpriteSheet
	ldr r0, _0806DAB0
	bl LoadSpritePalette
	pop {r0}
	bx r0
	.align 2, 0
_0806DAAC: .4byte gUnknown_083765DC
_0806DAB0: .4byte gUnknown_083765E4
	thumb_func_end sub_806DA98

	thumb_func_start sub_806DAB4
sub_806DAB4: @ 806DAB4
	push {r4,lr}
	adds r4, r0, 0
	ldrh r1, [r4, 0x3C]
	lsls r1, 24
	lsrs r1, 24
	ldr r2, _0806DAE4
	lsls r0, r1, 4
	adds r0, r1
	lsls r0, 2
	adds r2, r0, r2
	adds r0, r2, 0
	adds r0, 0x3E
	ldrb r0, [r0]
	lsls r0, 29
	cmp r0, 0
	bge _0806DAE8
	adds r0, r4, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806DB06
	.align 2, 0
_0806DAE4: .4byte 0x02020004
_0806DAE8:
	adds r3, r4, 0
	adds r3, 0x3E
	ldrb r1, [r3]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r3]
	ldrh r0, [r2, 0x24]
	ldrh r1, [r2, 0x20]
	adds r0, r1
	strh r0, [r4, 0x20]
	ldrh r0, [r2, 0x26]
	ldrh r2, [r2, 0x22]
	adds r0, r2
	strh r0, [r4, 0x22]
_0806DB06:
	pop {r4}
	pop {r0}
	bx r0
	thumb_func_end sub_806DAB4

	thumb_func_start sub_806DB0C
sub_806DB0C: @ 806DB0C
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	adds r6, r0, 0
	mov r9, r1
	lsls r6, 24
	lsrs r6, 24
	mov r0, r9
	lsls r0, 24
	lsrs r0, 24
	mov r9, r0
	ldr r0, _0806DB84
	mov r8, r0
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	add r0, r8
	adds r0, 0x43
	ldrb r3, [r0]
	ldr r0, _0806DB88
	subs r3, 0x1
	lsls r3, 24
	lsrs r3, 24
	movs r1, 0xFA
	movs r2, 0xAA
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	mov r0, r8
	adds r5, r4, r0
	movs r0, 0x4
	strh r0, [r5, 0x24]
	movs r0, 0xA
	strh r0, [r5, 0x26]
	movs r0, 0x1C
	add r8, r0
	add r4, r8
	ldr r0, _0806DB8C
	str r0, [r4]
	strh r6, [r5, 0x3C]
	adds r0, r5, 0
	mov r1, r9
	bl StartSpriteAnim
	ldr r1, [r4]
	adds r0, r5, 0
	bl _call_via_r1
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DB84: .4byte 0x02020004
_0806DB88: .4byte gUnknown_0837660C
_0806DB8C: .4byte sub_806DAB4
	thumb_func_end sub_806DB0C

	thumb_func_start sub_806DB90
sub_806DB90: @ 806DB90
	push {r4-r7,lr}
	adds r6, r0, 0
	adds r7, r1, 0
	lsls r2, 24
	lsrs r2, 24
	cmp r2, 0
	beq _0806DBA4
	cmp r2, 0x1
	beq _0806DBEC
	b _0806DC28
_0806DBA4:
	movs r5, 0
	ldrb r0, [r6]
	cmp r5, r0
	bcs _0806DC28
_0806DBAC:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0806DBE8
	adds r0, r1
	movs r1, 0xC
	bl PokemonGetField
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0806DBD8
	adds r0, r7, r5
	ldrb r4, [r0]
	adds r0, r1, 0
	bl itemid_is_mail
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_806DB0C
_0806DBD8:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
	ldrb r0, [r6]
	cmp r5, r0
	bcc _0806DBAC
	b _0806DC28
	.align 2, 0
_0806DBE8: .4byte 0x03004360
_0806DBEC:
	movs r5, 0
	b _0806DC22
_0806DBF0:
	movs r0, 0x64
	muls r0, r5
	ldr r1, _0806DC30
	adds r0, r1
	movs r1, 0xC
	bl PokemonGetField
	lsls r0, 16
	lsrs r1, r0, 16
	cmp r1, 0
	beq _0806DC1C
	adds r0, r5, r7
	ldrb r4, [r0, 0x6]
	adds r0, r1, 0
	bl itemid_is_mail
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r4, 0
	bl sub_806DB0C
_0806DC1C:
	adds r0, r5, 0x1
	lsls r0, 16
	lsrs r5, r0, 16
_0806DC22:
	ldrb r0, [r6, 0x1]
	cmp r5, r0
	bcc _0806DBF0
_0806DC28:
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DC30: .4byte 0x030045c0
	thumb_func_end sub_806DB90

	thumb_func_start sub_806DC34
sub_806DC34: @ 806DC34
	push {r4-r7,lr}
	mov r7, r10
	mov r6, r9
	mov r5, r8
	push {r5-r7}
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	movs r7, 0
	ldr r0, _0806DCC8
	mov r9, r0
	movs r1, 0x1C
	add r1, r9
	mov r10, r1
_0806DC50:
	movs r0, 0x64
	muls r0, r7
	ldr r1, _0806DCCC
	adds r0, r1
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806DCB0
	mov r0, r8
	adds r1, r7, 0
	bl sub_806DDA0
	adds r5, r0, 0
	lsls r5, 24
	lsrs r5, 24
	ldr r0, _0806DCD0
	movs r1, 0xFA
	movs r2, 0xAA
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r0, 24
	lsls r4, r0, 4
	adds r4, r0
	lsls r4, 2
	mov r1, r9
	adds r6, r4, r1
	movs r1, 0x4
	strh r1, [r6, 0x24]
	movs r1, 0xA
	strh r1, [r6, 0x26]
	strh r5, [r6, 0x3C]
	lsls r1, r5, 4
	adds r1, r5
	lsls r1, 2
	add r1, r9
	strh r0, [r1, 0x3C]
	mov r0, r8
	adds r1, r7, 0
	bl sub_806DF60
	add r4, r10
	ldr r1, [r4]
	adds r0, r6, 0
	bl _call_via_r1
_0806DCB0:
	adds r0, r7, 0x1
	lsls r0, 24
	lsrs r7, r0, 24
	cmp r7, 0x5
	bls _0806DC50
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DCC8: .4byte 0x02020004
_0806DCCC: .4byte 0x03004360
_0806DCD0: .4byte gUnknown_0837660C
	thumb_func_end sub_806DC34

	thumb_func_start sub_806DCD4
sub_806DCD4: @ 806DCD4
	push {r4-r7,lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 16
	lsrs r7, r2, 16
	bl sub_806DDA0
	adds r4, r0, 0
	lsls r4, 24
	lsrs r4, 24
	ldr r0, _0806DD2C
	movs r1, 0xFA
	movs r2, 0xAA
	movs r3, 0x4
	bl CreateSprite
	lsls r0, 24
	lsrs r6, r0, 24
	ldr r1, _0806DD30
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r5, r0, r1
	movs r0, 0x4
	strh r0, [r5, 0x24]
	movs r0, 0xA
	strh r0, [r5, 0x26]
	strh r4, [r5, 0x3C]
	lsls r0, r4, 4
	adds r0, r4
	lsls r0, 2
	adds r0, r1
	strh r6, [r0, 0x3C]
	cmp r7, 0
	bne _0806DD34
	adds r0, r5, 0
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806DD5C
	.align 2, 0
_0806DD2C: .4byte gUnknown_0837660C
_0806DD30: .4byte 0x02020004
_0806DD34:
	adds r0, r7, 0
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806DD46
	adds r0, r5, 0
	movs r1, 0x1
	b _0806DD4A
_0806DD46:
	adds r0, r5, 0
	movs r1, 0
_0806DD4A:
	bl StartSpriteAnim
	adds r2, r5, 0
	adds r2, 0x3E
	ldrb r1, [r2]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r2]
_0806DD5C:
	ldr r2, _0806DD78
	lsls r0, r6, 4
	adds r0, r6
	lsls r0, 2
	adds r1, r2, 0
	adds r1, 0x1C
	adds r1, r0, r1
	adds r0, r2
	ldr r1, [r1]
	bl _call_via_r1
	pop {r4-r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DD78: .4byte 0x02020004
	thumb_func_end sub_806DCD4

	thumb_func_start sub_806DD7C
sub_806DD7C: @ 806DD7C
	ldrh r2, [r0, 0x3C]
	lsls r2, 24
	lsrs r2, 24
	ldr r3, _0806DD9C
	lsls r1, r2, 4
	adds r1, r2
	lsls r1, 2
	adds r1, r3
	ldrh r2, [r1, 0x24]
	ldrh r3, [r1, 0x20]
	adds r2, r3
	strh r2, [r0, 0x20]
	ldrh r1, [r1, 0x22]
	strh r1, [r0, 0x22]
	bx lr
	.align 2, 0
_0806DD9C: .4byte 0x02020004
	thumb_func_end sub_806DD7C

	thumb_func_start sub_806DDA0
sub_806DDA0: @ 806DDA0
	push {lr}
	lsls r0, 24
	lsrs r2, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	cmp r0, 0x5
	bhi _0806DE38
	lsls r0, 2
	ldr r1, _0806DDB8
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DDB8: .4byte _0806DDBC
	.align 2, 0
_0806DDBC:
	.4byte _0806DE38
	.4byte _0806DDD4
	.4byte _0806DDE8
	.4byte _0806DDFC
	.4byte _0806DE10
	.4byte _0806DE24
_0806DDD4:
	ldr r0, _0806DDE4
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0x8]
	b _0806DE46
	.align 2, 0
_0806DDE4: .4byte 0x03004b20
_0806DDE8:
	ldr r0, _0806DDF8
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xA]
	b _0806DE44
	.align 2, 0
_0806DDF8: .4byte 0x03004b20
_0806DDFC:
	ldr r0, _0806DE0C
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0xA]
	b _0806DE46
	.align 2, 0
_0806DE0C: .4byte 0x03004b20
_0806DE10:
	ldr r0, _0806DE20
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0xC]
	b _0806DE44
	.align 2, 0
_0806DE20: .4byte 0x03004b20
_0806DE24:
	ldr r0, _0806DE34
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrb r0, [r1, 0xC]
	b _0806DE46
	.align 2, 0
_0806DE34: .4byte 0x03004b20
_0806DE38:
	ldr r0, _0806DE4C
	lsls r1, r2, 2
	adds r1, r2
	lsls r1, 3
	adds r1, r0
	ldrh r0, [r1, 0x8]
_0806DE44:
	lsrs r0, 8
_0806DE46:
	pop {r1}
	bx r1
	.align 2, 0
_0806DE4C: .4byte 0x03004b20
	thumb_func_end sub_806DDA0

	thumb_func_start sub_806DE50
sub_806DE50: @ 806DE50
	push {r4,lr}
	lsls r0, 24
	lsrs r3, r0, 24
	lsls r1, 24
	lsrs r0, r1, 24
	lsls r2, 24
	lsrs r4, r2, 24
	cmp r0, 0x5
	bhi _0806DF24
	lsls r0, 2
	ldr r1, _0806DE6C
	adds r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806DE6C: .4byte _0806DE70
	.align 2, 0
_0806DE70:
	.4byte _0806DE88
	.4byte _0806DEA0
	.4byte _0806DEC0
	.4byte _0806DED8
	.4byte _0806DEF8
	.4byte _0806DF10
_0806DE88:
	ldr r1, _0806DE9C
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0x8]
	lsls r2, r4, 8
	orrs r1, r2
	strh r1, [r0, 0x8]
	b _0806DF24
	.align 2, 0
_0806DE9C: .4byte 0x03004b20
_0806DEA0:
	ldr r0, _0806DEB8
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0x8]
	ldr r0, _0806DEBC
	ands r0, r2
	orrs r0, r4
	strh r0, [r1, 0x8]
	b _0806DF24
	.align 2, 0
_0806DEB8: .4byte 0x03004b20
_0806DEBC: .4byte 0xffffff00
_0806DEC0:
	ldr r1, _0806DED4
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xA]
	lsls r2, r4, 8
	orrs r1, r2
	strh r1, [r0, 0xA]
	b _0806DF24
	.align 2, 0
_0806DED4: .4byte 0x03004b20
_0806DED8:
	ldr r0, _0806DEF0
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xA]
	ldr r0, _0806DEF4
	ands r0, r2
	orrs r0, r4
	strh r0, [r1, 0xA]
	b _0806DF24
	.align 2, 0
_0806DEF0: .4byte 0x03004b20
_0806DEF4: .4byte 0xffffff00
_0806DEF8:
	ldr r1, _0806DF0C
	lsls r0, r3, 2
	adds r0, r3
	lsls r0, 3
	adds r0, r1
	ldrb r1, [r0, 0xC]
	lsls r2, r4, 8
	orrs r1, r2
	strh r1, [r0, 0xC]
	b _0806DF24
	.align 2, 0
_0806DF0C: .4byte 0x03004b20
_0806DF10:
	ldr r0, _0806DF2C
	lsls r1, r3, 2
	adds r1, r3
	lsls r1, 3
	adds r1, r0
	ldrh r2, [r1, 0xC]
	ldr r0, _0806DF30
	ands r0, r2
	orrs r0, r4
	strh r0, [r1, 0xC]
_0806DF24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806DF2C: .4byte 0x03004b20
_0806DF30: .4byte 0xffffff00
	thumb_func_end sub_806DE50

	thumb_func_start sub_806DF34
sub_806DF34: @ 806DF34
	push {lr}
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	bl sub_806DDA0
	lsls r0, 24
	lsrs r0, 24
	ldr r2, _0806DF5C
	lsls r1, r0, 4
	adds r1, r0
	lsls r1, 2
	adds r1, r2
	ldrh r0, [r1, 0x3C]
	lsls r0, 24
	lsrs r0, 24
	pop {r1}
	bx r1
	.align 2, 0
_0806DF5C: .4byte 0x02020004
	thumb_func_end sub_806DF34

	thumb_func_start sub_806DF60
sub_806DF60: @ 806DF60
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r0, 24
	lsls r4, 24
	lsrs r4, 24
	adds r1, r4, 0
	bl sub_806DF34
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	movs r0, 0x64
	adds r1, r4, 0
	muls r1, r0
	ldr r0, _0806DFA4
	adds r4, r1, r0
	adds r0, r4, 0
	movs r1, 0xC
	bl PokemonGetField
	cmp r0, 0
	bne _0806DFAC
	ldr r1, _0806DFA8
	lsls r0, r5, 4
	adds r0, r5
	lsls r0, 2
	adds r0, r1
	adds r0, 0x3E
	ldrb r1, [r0]
	movs r2, 0x4
	orrs r1, r2
	strb r1, [r0]
	b _0806DFF6
	.align 2, 0
_0806DFA4: .4byte 0x03004360
_0806DFA8: .4byte 0x02020004
_0806DFAC:
	adds r0, r4, 0
	movs r1, 0xC
	bl PokemonGetField
	lsls r0, 16
	lsrs r0, 16
	bl itemid_is_mail
	lsls r0, 24
	cmp r0, 0
	beq _0806DFD8
	lsls r4, r5, 4
	adds r4, r5
	lsls r4, 2
	ldr r0, _0806DFD4
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0x1
	b _0806DFE6
	.align 2, 0
_0806DFD4: .4byte 0x02020004
_0806DFD8:
	lsls r4, r6, 4
	adds r4, r6
	lsls r4, 2
	ldr r0, _0806DFFC
	adds r4, r0
	adds r0, r4, 0
	movs r1, 0
_0806DFE6:
	bl StartSpriteAnim
	adds r4, 0x3E
	ldrb r1, [r4]
	movs r0, 0x5
	negs r0, r0
	ands r0, r1
	strb r0, [r4]
_0806DFF6:
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806DFFC: .4byte 0x02020004
	thumb_func_end sub_806DF60

	thumb_func_start box_print
box_print: @ 806E000
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r6, r2, 0
	lsls r4, 24
	lsrs r4, 24
	movs r0, 0
	str r0, [sp]
	ldr r5, _0806E040
	ldr r2, _0806E044
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _0806E048
	adds r1, r5, 0
	adds r2, r6, 0
	bl sub_8004E3C
	lsls r4, 10
	ldr r0, _0806E04C
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x80
	bl CpuFastSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E040: .4byte 0x02039360
_0806E044: .4byte 0x01000100
_0806E048: .4byte gWindowConfig_81E6CAC
_0806E04C: .4byte 0x06014000
	thumb_func_end box_print

	thumb_func_start sub_806E050
sub_806E050: @ 806E050
	push {r4,r5,lr}
	sub sp, 0xC
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	mov r1, sp
	bl GetMonNickname
	adds r0, r4, 0
	adds r1, r5, 0
	mov r2, sp
	bl box_print
	add sp, 0xC
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806E050

	thumb_func_start sub_806E07C
sub_806E07C: @ 806E07C
	push {r4-r6,lr}
	adds r4, r1, 0
	lsls r0, 24
	lsrs r5, r0, 24
	adds r6, r5, 0
	adds r0, r4, 0
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806E0BC
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E0AA
	adds r0, r5, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl sub_806E050
	b _0806E0BC
_0806E0AA:
	bl battle_type_is_double
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	adds r0, r6, 0
	adds r2, r4, 0
	bl sub_806E050
_0806E0BC:
	pop {r4-r6}
	pop {r0}
	bx r0
	thumb_func_end sub_806E07C

	thumb_func_start sub_806E0C4
sub_806E0C4: @ 806E0C4
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E0E8
_0806E0CC:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl sub_806E07C
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E0CC
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E0E8: .4byte 0x03004360
	thumb_func_end sub_806E0C4

	thumb_func_start GetMonNickname
GetMonNickname: @ 806E0EC
	push {r4,lr}
	adds r4, r1, 0
	movs r1, 0x2
	adds r2, r4, 0
	bl PokemonGetField
	adds r0, r4, 0
	bl StringGetEnd10
	pop {r4}
	pop {r1}
	bx r1
	thumb_func_end GetMonNickname

	thumb_func_start sub_806E104
sub_806E104: @ 806E104
	push {r4,r5,lr}
	lsls r0, 24
	lsls r1, 24
	lsrs r1, 24
	ldr r4, _0806E15C
	lsrs r0, 22
	lsls r3, r1, 1
	adds r3, r1
	lsls r3, 3
	adds r0, r3
	adds r0, r4
	ldrb r1, [r0]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r0, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 19
	adds r1, r0
	lsls r1, 1
	ldr r0, _0806E160
	adds r4, r1, r0
	lsls r2, 26
	lsrs r2, 24
	movs r3, 0
	movs r0, 0xC6
	lsls r0, 1
	adds r2, r0
	ldr r0, _0806E164
	adds r5, r0, 0
_0806E142:
	lsls r0, r3, 1
	adds r0, r4
	adds r1, r2, r3
	orrs r1, r5
	strh r1, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0806E142
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E15C: .4byte gUnknown_08376738
_0806E160: .4byte 0x0600f000
_0806E164: .4byte 0xffffb000
	thumb_func_end sub_806E104

	thumb_func_start sub_806E168
sub_806E168: @ 806E168
	push {r4,lr}
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E17E
	movs r3, 0x2
	b _0806E186
_0806E17E:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r3, r0, 24
_0806E186:
	ldr r1, _0806E1C8
	lsls r2, r4, 2
	lsls r0, r3, 1
	adds r0, r3
	lsls r0, 3
	adds r2, r0
	adds r2, r1
	ldrb r1, [r2]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	ldrb r0, [r2, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r0, 19
	adds r1, r0
	lsls r1, 1
	ldr r0, _0806E1CC
	adds r1, r0
	movs r3, 0
	movs r2, 0
_0806E1B0:
	lsls r0, r3, 1
	adds r0, r1
	strh r2, [r0]
	adds r0, r3, 0x1
	lsls r0, 24
	lsrs r3, r0, 24
	cmp r3, 0x3
	bls _0806E1B0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E1C8: .4byte gUnknown_08376738
_0806E1CC: .4byte 0x0600f000
	thumb_func_end sub_806E168

	thumb_func_start sub_806E1D0
sub_806E1D0: @ 806E1D0
	lsls r0, 24
	lsrs r0, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r2, 24
	lsrs r2, 19
	adds r1, r2
	lsls r1, 1
	ldr r2, _0806E1F0
	adds r1, r2
	movs r2, 0x86
	lsls r2, 1
	adds r0, r2
	strh r0, [r1]
	bx lr
	.align 2, 0
_0806E1F0: .4byte 0x0600f000
	thumb_func_end sub_806E1D0

	thumb_func_start sub_806E1F4
sub_806E1F4: @ 806E1F4
	push {r4-r6,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r5, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 24
	lsrs r1, 24
	lsls r5, 24
	lsrs r5, 24
	ldr r3, _0806E278
	lsls r2, r4, 2
	lsls r0, r1, 1
	adds r0, r1
	lsls r0, 3
	adds r2, r0
	adds r2, r3
	ldrb r1, [r2]
	ldrb r2, [r2, 0x1]
	subs r1, 0x1
	lsls r1, 24
	lsrs r1, 24
	adds r2, 0x1
	lsls r2, 24
	lsrs r2, 24
	movs r0, 0x40
	bl sub_806E1D0
	ldr r6, _0806E27C
	movs r0, 0xFC
	strb r0, [r6]
	movs r0, 0x12
	strb r0, [r6, 0x1]
	movs r0, 0x8
	strb r0, [r6, 0x2]
	adds r0, r6, 0x3
	adds r1, r5, 0
	bl ConvertIntToDecimalString
	movs r0, 0
	str r0, [sp]
	ldr r5, _0806E280
	ldr r2, _0806E284
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _0806E288
	ldr r2, _0806E28C
	adds r1, r5, r2
	adds r2, r6, 0
	bl sub_8004E3C
	lsls r4, 10
	ldr r0, _0806E290
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x20
	bl CpuFastSet
	add sp, 0x4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E278: .4byte gUnknown_08376738
_0806E27C: .4byte 0x020231cc
_0806E280: .4byte 0x02039460
_0806E284: .4byte 0x01000020
_0806E288: .4byte gWindowConfig_81E6CAC
_0806E28C: .4byte 0xffffff00
_0806E290: .4byte 0x06014200
	thumb_func_end sub_806E1F4

	thumb_func_start sub_806E294
sub_806E294: @ 806E294
	push {r4,r5,lr}
	adds r4, r0, 0
	adds r5, r1, 0
	adds r0, r2, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r5, 24
	lsrs r5, 24
	movs r1, 0x38
	bl PokemonGetField
	adds r2, r0, 0
	lsls r2, 24
	lsrs r2, 24
	adds r0, r4, 0
	adds r1, r5, 0
	bl sub_806E1F4
	pop {r4,r5}
	pop {r0}
	bx r0
	thumb_func_end sub_806E294

	thumb_func_start sub_806E2C0
sub_806E2C0: @ 806E2C0
	push {r4-r7,lr}
	adds r5, r1, 0
	lsls r0, 24
	lsrs r7, r0, 24
	adds r0, r5, 0
	movs r1, 0xB
	bl PokemonGetField
	cmp r0, 0
	beq _0806E32E
	adds r0, r5, 0
	movs r1, 0x2D
	bl PokemonGetField
	cmp r0, 0
	bne _0806E32E
	adds r0, r5, 0
	bl sub_80A1CD8
	lsls r0, 24
	lsrs r4, r0, 24
	bl sub_806B528
	lsls r0, 24
	lsrs r0, 24
	cmp r0, 0x1
	bne _0806E2FA
	movs r6, 0x2
	b _0806E302
_0806E2FA:
	bl battle_type_is_double
	lsls r0, 24
	lsrs r6, r0, 24
_0806E302:
	cmp r4, 0
	beq _0806E31A
	cmp r4, 0x6
	beq _0806E31A
	subs r2, r4, 0x1
	lsls r2, 24
	lsrs r2, 24
	adds r0, r7, 0
	adds r1, r6, 0
	bl sub_806E104
	b _0806E324
_0806E31A:
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_806E294
_0806E324:
	adds r0, r7, 0
	adds r1, r6, 0
	adds r2, r5, 0
	bl sub_806E3C0
_0806E32E:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806E2C0

	thumb_func_start sub_806E334
sub_806E334: @ 806E334
	push {r4-r6,lr}
	movs r4, 0
	movs r6, 0x64
	ldr r5, _0806E358
_0806E33C:
	adds r1, r4, 0
	muls r1, r6
	adds r1, r5
	adds r0, r4, 0
	bl sub_806E2C0
	adds r0, r4, 0x1
	lsls r0, 24
	lsrs r4, r0, 24
	cmp r4, 0x5
	bls _0806E33C
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E358: .4byte 0x03004360
	thumb_func_end sub_806E334

	thumb_func_start sub_806E35C
sub_806E35C: @ 806E35C
	push {r4-r7,lr}
	ldr r4, [sp, 0x14]
	lsls r0, 16
	lsrs r0, 16
	lsls r1, 24
	lsrs r7, r1, 24
	lsls r2, 24
	lsrs r5, r2, 24
	lsls r3, 24
	lsrs r6, r3, 24
	adds r1, r4, 0
	bl sub_8040D8C
	cmp r0, 0
	bne _0806E3BA
	ldr r2, _0806E3A4
	lsls r1, r6, 2
	lsls r0, r5, 1
	adds r0, r5
	lsls r0, 3
	adds r1, r0
	adds r1, r2
	ldrb r0, [r1]
	adds r0, 0x3
	lsls r0, 24
	lsrs r3, r0, 24
	ldrb r0, [r1, 0x1]
	adds r0, 0x1
	lsls r0, 24
	lsrs r2, r0, 24
	cmp r7, 0
	beq _0806E3A8
	cmp r7, 0xFE
	beq _0806E3B2
	b _0806E3BA
	.align 2, 0
_0806E3A4: .4byte gUnknown_08376738
_0806E3A8:
	movs r0, 0x42
	adds r1, r3, 0
	bl sub_806E1D0
	b _0806E3BA
_0806E3B2:
	movs r0, 0x44
	adds r1, r3, 0
	bl sub_806E1D0
_0806E3BA:
	pop {r4-r7}
	pop {r0}
	bx r0
	thumb_func_end sub_806E35C

	thumb_func_start sub_806E3C0
sub_806E3C0: @ 806E3C0
	push {r4-r6,lr}
	mov r6, r9
	mov r5, r8
	push {r5,r6}
	sub sp, 0x4
	mov r8, r0
	adds r6, r1, 0
	adds r5, r2, 0
	lsls r0, 24
	lsrs r0, 24
	mov r8, r0
	lsls r6, 24
	lsrs r6, 24
	ldr r0, _0806E41C
	mov r9, r0
	adds r0, r5, 0
	mov r1, r9
	bl GetMonNickname
	adds r0, r5, 0
	movs r1, 0x41
	bl PokemonGetField
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	adds r0, r5, 0
	bl pokemon_get_gender
	adds r1, r0, 0
	lsls r1, 24
	lsrs r1, 24
	mov r0, r9
	str r0, [sp]
	adds r0, r4, 0
	adds r2, r6, 0
	mov r3, r8
	bl sub_806E35C
	add sp, 0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806E41C: .4byte 0x020231cc
	thumb_func_end sub_806E3C0

	thumb_func_start sub_806E420
sub_806E420: @ 806E420
	push {r4,r5,lr}
	sub sp, 0x4
	adds r4, r0, 0
	adds r1, r2, 0
	adds r5, r3, 0
	lsls r4, 24
	lsrs r4, 24
	lsls r1, 16
	lsrs r1, 16
	lsls r5, 16
	lsrs r5, 16
	ldr r2, _0806E48C
	adds r0, r2, 0
	movs r2, 0xF
	movs r3, 0x1
	bl sub_8072C14
	adds r2, r0, 0
	movs r0, 0xBA
	strb r0, [r2]
	adds r2, 0x1
	adds r0, r2, 0
	adds r1, r5, 0
	movs r2, 0x23
	movs r3, 0x1
	bl sub_8072C14
	movs r0, 0
	str r0, [sp]
	ldr r5, _0806E490
	ldr r2, _0806E494
	mov r0, sp
	adds r1, r5, 0
	bl CpuFastSet
	ldr r0, _0806E498
	ldr r2, _0806E49C
	adds r1, r5, r2
	ldr r2, _0806E48C
	bl sub_8004E3C
	lsls r4, 10
	ldr r0, _0806E4A0
	adds r4, r0
	adds r0, r5, 0
	adds r1, r4, 0
	movs r2, 0x40
	bl CpuFastSet
	add sp, 0x4
	pop {r4,r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806E48C: .4byte 0x020231cc
_0806E490: .4byte 0x02039460
_0806E494: .4byte 0x01000040
_0806E498: .4byte gWindowConfig_81E6CAC
_0806E49C: .4byte 0xffffff00
_0806E4A0: .4byte 0x06014300
	thumb_func_end sub_806E420

	thumb_func_start sub_806E4A4
sub_806E4A4: @ 806E4A4
	push {r4-r6,lr}
	mov r6, r8
	push {r6}
	adds r5, r0, 0
	adds r6, r1, 0
	mov r8, r2
	lsls r5, 24
	lsrs r5, 24
	lsls r6, 24
	lsrs r6, 24
	mov r0, r8
	movs r1, 0x39
	bl PokemonGetField
	adds r4, r0, 0
	lsls r4, 16
	lsrs r4, 16
	mov r0, r8
	movs r1, 0x3A
	bl PokemonGetField
	adds r3, r0, 0
	lsls r3, 16
	lsrs r3, 16
	adds r0, r5, 0
	adds r1, r6, 0
	adds r2, r4, 0
	bl sub_806E420
	pop {r3}
	mov r8, r3
	pop {r0}