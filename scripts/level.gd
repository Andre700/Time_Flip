extends Node2D

@export var next_level: PackedScene = null

@onready var start = $Start
@onready var exit = $Exit

var player

func _ready():
	var flip_points = get_tree().get_nodes_in_group("flip_point")
	for point in flip_points:
		point.flip_world.connect(_on_flip_world)
	
	player = get_tree().get_first_node_in_group("player")
	if player:
		player.global_position = start.get_spawn_pos()
	
	exit.body_entered.connect(_on_exit_body_entered)

func _on_flip_world():
	var world_b = get_tree().get_first_node_in_group("world_b")
	world_b.visible = !world_b.visible
	
	var world_b_children = world_b.get_children()
	for node in world_b_children:
		if node is CollisionShape2D:
			node.disabled = !node.disabled
	
	var world_a = get_tree().get_first_node_in_group("world_a")
	world_a.visible = !world_a.visible
	
	var world_a_children = world_a.get_children()
	for node in world_a_children:
		if node is CollisionShape2D:
			node.disabled = !node.disabled

func _on_exit_body_entered(body):
	if body is Player:
		player.active = false
		await get_tree().create_timer(1.5).timeout
		if next_level:
			get_tree().change_scene_to_packed(next_level)
