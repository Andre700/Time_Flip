extends CharacterBody2D
class_name Player

@onready var animated_sprite = $AnimatedSprite2D
@onready var camera = $Camera2D
@onready var tilemap: TileMap = get_tree().get_first_node_in_group("tilemap")

@export var gravity = 400
@export var jump_force = 200
@export var speed = 125

var active = true

func _ready():
	set_camera_boundaries()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var direction = 0
	if active:
		if Input.is_action_just_pressed("jump") && is_on_floor():
			velocity.y = -jump_force
		
		direction = Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		animated_sprite.flip_h = (direction == -1)
	
	velocity.x = direction * speed
	
	move_and_slide()
	
	update_animations(direction)

func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")

func set_camera_boundaries():
	var map_limits = tilemap.get_used_rect()
	var map_cellsize = tilemap.rendering_quadrant_size
	camera.limit_left = map_limits.position.x * map_cellsize
	camera.limit_right = map_limits.end.x * map_cellsize
