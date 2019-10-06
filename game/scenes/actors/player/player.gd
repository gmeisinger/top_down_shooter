extends "res://scenes/actors/actor.gd"

#control vars
enum { MODE_MOUSE, MODE_JOY }
var control_mode = MODE_MOUSE
var joy = -1

func _ready():
	globals.set("player", self)
	var wep_scn = load("res://scenes/weapons/guns/gun.tscn")
	var wep = wep_scn.instance()
	equip_weapon(wep)

# Movement
func process_movement(delta):
	var target_speed = Vector2()
	if Input.is_action_pressed("move_up"):
		target_speed.y -= 1
	if Input.is_action_pressed("move_down"):
		target_speed.y += 1
	if Input.is_action_pressed("move_left"):
		target_speed.x -= 1
		face_direction = -1
	if Input.is_action_pressed("move_right"):
		target_speed.x += 1
		face_direction = 1
	#target_speed *= walk_speed
	velocity = target_speed.normalized()
	#flip sprites
	face_sprites(sign(get_target().x))

# Combat
func primary_fire(target : Vector2):
	if has_weapon():
		if get_weapon().attack_ready:
			get_weapon().primary_fire(target)

func get_target():
	match(control_mode):
		MODE_MOUSE:
			return get_local_mouse_position()
		MODE_JOY:
			var ret = $inputMgr.get_right_axis_vector(joy) * (globals.get("vp_size")/2) # to move outside of normal
			#if ret == Vector2.ZERO:
			#	ret = $inputMgr.get_left_axis_vector(joy) * (globals.get("vp_size")/8) 
			if ret == Vector2.ZERO:
				ret = $inputMgr.default_vector
				ret.x *= face_direction
			return ret

func update_camera():
	$game_camera.update_offset(get_target())