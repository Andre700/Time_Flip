extends Area2D

@onready var player = get_tree().get_first_node_in_group('player')

var required_keys

func _ready():
	required_keys = get_tree().get_nodes_in_group('key').size()

func _process(_delta):
	if overlaps_body(player) and Input.is_action_just_pressed("action"):
		print("overlapping")
		if player.key_amount == required_keys:
			queue_free()
