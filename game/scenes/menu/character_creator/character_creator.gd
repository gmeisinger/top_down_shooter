extends Control

var hair = []
var shirt = []
var pants = []

var hair_index = 1
var shirt_index = 1
var pants_index = 1

onready var model = $panel/actor

func _ready():
	get_paths()
	$panel/vert_box/hair_section/hair_left_button.grab_focus()

func update_hair():
	var tex = hair[hair_index -1]
	model.set_hair(tex)
	$panel/vert_box/hair_section/Label.set_text(String(hair_index))

func update_shirt():
	var tex = shirt[shirt_index -1]
	model.set_shirt(tex)
	$panel/vert_box/shirt_section/Label.set_text(String(shirt_index))
	
func update_pants():
	var tex = pants[pants_index -1]
	model.set_pants(tex)
	$panel/vert_box/pants_section/Label.set_text(String(pants_index))

func get_paths():
	var dir = Directory.new()
	#HAIR
	var path = "res://assets/images/actor_sprites/hair"
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") and file.ends_with(".png"):
			var full_path = path + "/" + file
			var tex = load(full_path)
			hair.append(tex)
	dir.list_dir_end()
	#SHIRT
	path = "res://assets/images/actor_sprites/shirts"
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") and file.ends_with(".png"):
			var full_path = path + "/" + file
			var tex = load(full_path)
			shirt.append(tex)
	dir.list_dir_end()
	#PANTS
	path = "res://assets/images/actor_sprites/pants"
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") and file.ends_with(".png"):
			var full_path = path + "/" + file
			var tex = load(full_path)
			pants.append(tex)
	dir.list_dir_end()

func _on_hair_left_button_button_up():
	if hair_index == 1:
		hair_index = hair.size()
	else:
		hair_index -= 1
	update_hair()


func _on_hair_right_button_button_up():
	if hair_index == hair.size():
		hair_index = 1
	else:
		hair_index += 1
	update_hair()


func _on_shirt_left_button_button_up():
	if shirt_index == 1:
		shirt_index = shirt.size()
	else:
		shirt_index -= 1
	update_shirt()


func _on_shirt_right_button_button_up():
	if shirt_index == shirt.size():
		shirt_index = 1
	else:
		shirt_index += 1
	update_shirt()


func _on_pants_left_button_button_up():
	if pants_index == 1:
		pants_index = pants.size()
	else:
		pants_index -= 1
	update_pants()


func _on_pants_right_button_button_up():
	if pants_index == pants.size():
		pants_index = 1
	else:
		pants_index += 1
	update_pants()
