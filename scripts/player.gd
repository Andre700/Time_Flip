extends CharacterBody2D
class_name Player

@export var gravity = 400
@export var jump_force = 200
@export var speed = 125

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
	
	var direction = Input.get_axis("move_left", "move_right")
	
	velocity.x = direction * speed
	
	move_and_slide()
