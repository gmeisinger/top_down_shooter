extends "res://scenes/actors/actor.gd"

var target_location
var chasing = false
var ATTACK_DISTANCE = 32.0

var unarmed_scn = preload("res://scenes/weapons/unarmed/unarmed_weapon.tscn")

var player

func _ready():
	var unarmed = unarmed_scn.instance()
	equip_weapon(unarmed)
	get_weapon().set_enemy(true)
	player = globals.get("player")

func get_target():
	return (player.global_position - global_position)

# Movement
func process_movement(delta):
	var target_speed = global_position.direction_to(player.global_position)
	#target_speed *= walk_speed
	velocity = target_speed.normalized()
	#flip sprites
	face_sprites(sign(get_target().x))
	if global_position.distance_to(player.global_position) <= ATTACK_DISTANCE:
		$stateMachine.change_state("attacking")