extends Node

export(bool) var debug_input = false
export var JOYSTICK_DEADZONE = 0.1
onready var host = get_parent()

var default_vector = Vector2(8.0, 6.0)

func _ready():
	Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")
	if Input.get_connected_joypads().size() > 0:
		host.control_mode = host.MODE_JOY
		host.joy = Input.get_connected_joypads()[0]
	
func _on_joy_connection_changed(device_id, connected):
	if connected:
		host.control_mode = host.MODE_JOY
		host.joy = device_id
	elif device_id == host.joy:
		host.control_mode = host.MODE_MOUSE
		host.joy = -1

func get_right_axis_vector(device = host.joy):
	var x_axis = Input.get_joy_axis(device, JOY_AXIS_3)
	var y_axis = Input.get_joy_axis(device, JOY_AXIS_4)
	if abs(x_axis) < JOYSTICK_DEADZONE:
		x_axis = 0.0
	if abs(y_axis) < JOYSTICK_DEADZONE:
		y_axis = 0.0
	var norm_vec = Vector2(x_axis, y_axis)
	return norm_vec

func get_left_axis_vector(device = host.joy):
	var x_axis = Input.get_joy_axis(device, JOY_AXIS_0)
	var y_axis = Input.get_joy_axis(device, JOY_AXIS_1)
	if abs(x_axis) < JOYSTICK_DEADZONE:
		x_axis = 0.0
	if abs(y_axis) < JOYSTICK_DEADZONE:
		y_axis = 0.0
	return Vector2(x_axis, y_axis)

func _input(event):
	if debug_input:
		if event is InputEventJoypadMotion:
			if abs(event.axis_value) > JOYSTICK_DEADZONE:
				print(event.as_text())
		elif !(event is InputEventMouseMotion):
			print(event.as_text())