extends KinematicBody2D

# Fashion vars
export var shirtColor : Color = Color("891e2b")
export var pantsColor : Color = Color("5d2c28")
export var hairColor : Color = Color("000000")

var velocity = Vector2()
var face_direction = 1
export var walk_speed = 1.0

func _ready():
	$shirt.modulate = shirtColor
	$pants.modulate = pantsColor
	$hair.modulate = hairColor

func has_weapon():
	if $hands/weapon.get_child_count() > 0:
		return true
	else:
		return false
	
func get_weapon():
	return $hands/weapon.get_child(0)

# Movement
func process_movement(delta):
	pass
	
func get_target():
	pass

func process_move_and_collide(delta):
	var collision_data = move_and_collide(velocity * walk_speed)
	return collision_data

func face_sprites(face):
	var flip = false
	if face == -1:
		flip = true
	elif face == 1:
		flip = false
	else:
		return
	$body.flip_h = flip
	$shirt.flip_h = flip
	$pants.flip_h = flip
	$hair.flip_h = flip
	$hands.flip(face)

# Combat
func primary_fire(target : Vector2):
	pass

func equip_weapon(weapon):
	$hands.equip_weapon(weapon)

# Fashion
func set_hair(tex):
	$hair.set_texture(tex)

func set_shirt(tex):
	$shirt.set_texture(tex)

func set_pants(tex):
	$pants.set_texture(tex)

# Animation
func play_anim(anim_name):
	$hands.play_anim(anim_name)
	if $AnimationPlayer.current_animation != anim_name:
		$AnimationPlayer.play(anim_name)
		
func anim_playing():
	return $AnimationPlayer.is_playing()