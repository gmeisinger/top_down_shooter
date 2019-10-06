extends "res://scenes/util/stateMachine/baseState.gd"

func enter():
	host.get_weapon().primary_fire(host.get_target())
	host.velocity = Vector2.ZERO

func update(delta):
	if host.velocity == Vector2.ZERO:
		host.play_anim("idle")
	else:
		host.play_anim("walk")
	#host.process_movement(delta)
	host.process_move_and_collide(delta)
	if host.get_weapon().attack_ready:
		state_machine.change_state("walking")