extends Node

var current_state = null

export var debug : bool
export var disabled : bool

func _ready():
	var host = get_parent()
	for child in get_children():
		child.init(self, host)
		if child.is_starting_state:
			current_state = child
	if current_state != null:
		print_dbg("starting state is " + current_state.name)
		current_state.enter()
	else:
		print_dbg("no starting state")


func change_state(state_name):
	if current_state != null:
		print_dbg("exiting state " + current_state.name)
		current_state.exit()
	current_state = get_node(state_name)
	print_dbg("entering state " + current_state.name)
	current_state.enter()

func _physics_process(delta):
	if disabled:
		return
	if current_state != null:
		current_state.update(delta)

func print_dbg(msg):
	if !debug:
		return
	print(msg)