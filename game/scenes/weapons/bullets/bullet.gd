extends KinematicBody2D

var speed = 200.0
var fired = false
var velocity : Vector2 = Vector2(0.0, 0.0)

func fire(target : Vector2):
	fired = true
	velocity = target.normalized() * speed
	
func _physics_process(delta):
	if fired:
		var col = move_and_collide(velocity * delta)

func _on_hitbox_body_entered(body):
	queue_free()
