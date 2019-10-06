extends Node

export var is_starting_state : bool

var state_machine
var host


func init(state_machine, host):
	self.state_machine = state_machine
	self.host = host

func enter():
	pass

func exit():
	pass

func update(delta):
	pass

func change_state(state_name):
	state_machine.change_state(state_name)