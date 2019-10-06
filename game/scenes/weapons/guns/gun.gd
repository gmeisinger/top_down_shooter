extends "res://scenes/weapons/weapon.gd"

"""
Base class for guns

on top of weapon class, guns need to aim

George Meisinger 2019
"""

var bullet_scn = load("res://scenes/weapons/bullets/bullet.tscn")

func primary_fire(target : Vector2):
	play_anim("fire")
	attack_ready = false
	var bullet = bullet_scn.instance()
	globals.get("cur_scene").add_child(bullet)
	bullet.position = $"Sprite/fire_point".global_position
	bullet.fire(target)
	

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fire":
		attack_ready = true
