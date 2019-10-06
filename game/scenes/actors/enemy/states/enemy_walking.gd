extends "res://scenes/util/stateMachine/baseState.gd"

func update(delta):
	if host.velocity == Vector2.ZERO:
		host.play_anim("idle")
	else:
		host.play_anim("walk")
	host.process_movement(delta)
	host.process_move_and_collide(delta)