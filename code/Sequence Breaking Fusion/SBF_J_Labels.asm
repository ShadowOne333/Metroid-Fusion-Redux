; .definelabel for things that should go into the sym file?
; equ for constants?

;=====================================
; RAM
.definelabel CopiedTo203800C, 0x3000012
.definelabel AbilityCount, 0x300001F
.definelabel Difficulty, 0x3000020
.definelabel SecurityHatchFlashLevelBackup, 0x3000022
.definelabel RebootGameFlag, 0x3000025
.definelabel AreaID, 0x3000032
.definelabel RoomID, 0x3000033
.definelabel PrevDoor, 0x3000034
.definelabel DoorUnlockTimer, 0x300004C
.definelabel CurrEventBasedEffect, 0x3000050
.definelabel SpritesetNum, 0x3000058
.definelabel CurrClipdataAffectingAction, 0x3000059
.definelabel SubEventCounter, 0x3000066
.definelabel CurrPowerBomb, 0x3000114
.definelabel SpriteData, 0x3000174
.definelabel AtmosphericStabilizersOnline, 0x30006E2
.definelabel CurrSpriteData, 0x30006F0
.definelabel ParticleEffects, 0x300082C
.definelabel ProjectileData, 0x3000994
.definelabel CurrProjectileData, 0x3000B94
.definelabel ArmCannonYPosition, 0x3000BB4
.definelabel ArmCannonXPosition, 0x3000BB6
.definelabel EventCounter, 0x3000BBB
.definelabel SubGameMode1, 0x3000C14
.definelabel BG1XPosition, 0x300125C
;.definelabel SamusData, 0x3001278
.definelabel SamusGraphicsInfo, 0x30012D0
.definelabel SamusTimersAndCounters, 0x3001324
.definelabel Equipment, 0x3001344
.definelabel BeamStatus, 0x300134E
.definelabel SuitMiscStatus, 0x3001350
.definelabel MusicSlotSwitch, 0x3001A24
.definelabel MusicInfo_Unk21, 0x3001A25
.definelabel HatchData, 0x3004E1C
.definelabel DoorPositionStart, 0x3004E3C
.definelabel SamusDoorPositionOffset, 0x3004E68
.definelabel DestinationRoom, 0x3004E6C
.definelabel ColorFading, 0x3004E88

;=====================================
; ROM
;.definelabel PlaySound, 0x8002754
.definelabel PlayMusic, 0x800359C
.definelabel FadeOutMusic, 0x8003754
;Address    Length 	Description 	Arguments 	    Returns
;3CD4 	    28 	    Music related 	u16 Sound ID	void
;3CFC 	    2C 	    Music related 	void 	        void
.definelabel MusicRelated_3CD4, 0x8003D38
.definelabel MusicRelated_3CFC, 0x8003D60
.definelabel CallUpdateArmCannonOam, 0x800516C
.definelabel Sax_WalkingStart, 0x80165FC
.definelabel CheckOnEvent_RestrictedZoneWarning, 0x8061220
.definelabel CheckOnEvent_EscapedNocSax, 0x80612CC
.definelabel CheckOnEvent_NocSaxEncounter, 0x8061314
.definelabel SetCurrNavRoom, 0x80637D4
.definelabel SetCurrEventBasedEffect, 0x8063A30
.definelabel CheckLockHatchesWithTimer, 0x80643EC
.definelabel ProcessDoorType, 0x8069AEC
.definelabel FindEventBasedDoor, 0x8069B2C
.definelabel PlayRoomMusicTrack, 0x8071C58
.definelabel SetParticleEffect, 0x8073790
.definelabel SetEvent, 0x807501C
.definelabel CheckPlayCutsceneDuringTransition, 0x8075334
.definelabel CheckAmountOfProjectiles, 0x8081DCC
.definelabel InitProjectile, 0x8081E1C
.definelabel InitSecondaryProjectile, 0x8081EBC
.definelabel AdvanceProjectileAnim, 0x80825C4
.definelabel CheckDespawnProjectile, 0x8082858
.definelabel MoveProjectile, 0x8082D80
.definelabel ProjectileCheckHittingSolid, 0x8082E4C
.definelabel ProjectileCheckVerticalCollisionAtPosition, 0x8082E8C
.definelabel MoveWideBeamParts, 0x80830C4
.definelabel SetBeamTrailGfx, 0x8083440
.definelabel CheckWeaponHitSprite, 0x80834E8
.definelabel CheckSpriteMakesDebrisWhenHit, 0x8083C4C
.definelabel GetSpriteWeakness, 0x8083CA4
.definelabel CreateSpriteDebris, 0x8083CF0
.definelabel CreateSpriteDebris_PiercingBeam, 0x8083E24
.definelabel LowerSpriteHealth, 0x808425C
.definelabel LowerSpriteHealth_IceMissile, 0x80843E8
.definelabel LowerSpriteHealth_DiffusionFlake, 0x808454C
.definelabel LowerSpriteHealth_IceBeam, 0x80846A0
.definelabel ProjectileSetIsftForSolid, 0x80847D4
.definelabel StartMissileTumble, 0x80852BC
.definelabel bx_r0, 0x80A5718
.definelabel DoubleToInt_Overflow, 0x80A57EC
.definelabel MultiplyDoubles, 0x80A5F2C
.definelabel IntToDouble, 0x80A6650
.definelabel TankIncreaseAmounts, 0x83CB898
.definelabel NumTanksPerArea, 0x857868C
.definelabel SecurityUnlockEvents, 0x85787CC
.definelabel NormalBeamPal, 0x858BBF4
.definelabel ChargeBeamPal, 0x858BC14
.definelabel WideBeamPal, 0x858BC34
.definelabel PlasmaBeamPal, 0x858BC54
.definelabel WaveBeamPal, 0x858BC74
.definelabel IceBeamPal, 0x858BC94
.definelabel NormalBeamGfx, 0x858BCB4
.definelabel ChargeBeamGfx, 0x858C1B4
.definelabel WideBeamGfx, 0x858C6B4
.definelabel PlasmaBeamGfx, 0x858CBB4
.definelabel WaveBeamGfx, 0x858D0B4
.definelabel IceBeamGfx, 0x858D5B4
.definelabel NormalMissileGfx, 0x858DAB4
.definelabel SuperMissileGfx, 0x858DBB4
.definelabel IceMissileGfx, 0x858DCB4
.definelabel DiffusionMissileGfx, 0x858DDB4
.definelabel AreaDoorsPtrs, 0x87EDF44
.definelabel ProcessProjectilePtrs, 0x87EE918
