extends Area2D

signal flip_world

@onready var player = get_tree().get_first_node_in_group('player')

func _process(_delta):
	if overlaps_body(player) and Input.is_action_just_pressed("action"):
		flip_world.emit()
