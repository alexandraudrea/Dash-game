extends CharacterBody2D


const SPEED = 150
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	var input_vector = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"), Input.get_action_strength("move_down") - Input.get_action_strength("move_up")).normalized()
	
	velocity = input_vector * SPEED
	
	move_and_slide()
	_update_animation(input_vector)
	

func _update_animation(direction: Vector2) ->void:
	if direction != Vector2.ZERO:
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = direction.x < 0
	else:
		$AnimatedSprite2D.play("idle")
