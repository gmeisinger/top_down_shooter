extends Camera2D

const DAMP_TIME = 0.3

var max_offset_x
var max_offset_y
onready var vp_size = get_viewport_rect().size
onready var tween = $Tween

func _ready():
	globals.set("vp_size", vp_size)
	max_offset_x = vp_size.x/4
	max_offset_y = vp_size.y/4

func update_offset(target : Vector2):
	var new_offset = target / 4.0
	var distance = new_offset - offset
	if (distance.x < max_offset_x) and (distance.y < max_offset_y):
		tween.interpolate_property(self, "offset", offset, new_offset, DAMP_TIME, Tween.TRANS_QUAD, Tween.EASE_OUT)
		#offset = new_offset
		tween.start()