extends "res://scenes/util/stateMachine/baseState.gd"

func enter():
	host.state = host.ONE

func update(delta):
	host.point_at(host.get_target())