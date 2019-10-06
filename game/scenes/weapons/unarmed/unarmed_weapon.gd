extends "res://scenes/weapons/weapon.gd"

func primary_fire(target : Vector2):
	play_anim("fire")
	attack_ready = false
	$hands/hand2/hitbox/shape.disabled = false

func set_enemy(enemy = true):
	if enemy:
		$hands/hand2/hitbox.set_collision_layer_bit(3, false)
		$hands/hand2/hitbox.set_collision_layer_bit(2, true)
		$hands/hand2/hitbox.set_collision_mask_bit(2, false)
		$hands/hand2/hitbox.set_collision_mask_bit(1, true)
	else:
		$hands/hand2/hitbox.set_collision_layer_bit(3, true)
		$hands/hand2/hitbox.set_collision_layer_bit(2, false)
		$hands/hand2/hitbox.set_collision_mask_bit(2, true)
		$hands/hand2/hitbox.set_collision_mask_bit(1, false)
		

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fire":
		attack_ready = true
		$hands/hand2/hitbox/shape.disabled = true
