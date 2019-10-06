extends "res://scenes/actors/player/states/basePlayerState.gd"

func update(delta):
	#if host.is_on_floor() && Input.is_action_just_pressed("jump"):
	#	change_state("jumping")
	#	return
	if Input.is_action_just_pressed("dodge"):
		change_state("dodging")
		return
	if Input.is_action_pressed("primary"):
		host.primary_fire(host.get_target())
	if host.velocity == Vector2.ZERO:
		host.play_anim("idle")
	else:
		host.play_anim("walk")
	host.process_movement(delta)
	host.process_move_and_collide(delta)
	host.update_camera()