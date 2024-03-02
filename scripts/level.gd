extends Node2D

@onready var area = $Area2D

var flip_points

func _ready():
	flip_points = get_tree().get_nodes_in_group("flip_point")
	for point in flip_points:
		point.flip_world.connect(_on_flip_world)

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
