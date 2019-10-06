extends "res://scenes/actors/player/states/basePlayerState.gd"

func enter():
	host.play_anim("dodge")
	host.velocity *= 2.0
	host.face_sprites(sign(host.velocity.x))

func update(delta):
	if not host.anim_playing():
		change_state("walking")
		return
	#host.process_movement(delta)
	host.process_move_and_collide(delta)
	host.update_camera()