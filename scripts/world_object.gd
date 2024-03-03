extends StaticBody2D

@export var start_hidden = false

func _ready():
	if start_hidden:
		toggle_show()

func toggle_show():
	visible = !visible
	var collision = get_node("CollisionShape2D")
	collision.disabled = !collision.disabled
