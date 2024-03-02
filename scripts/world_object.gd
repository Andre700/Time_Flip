extends StaticBody2D

@export var show = true

func _ready():
	if not show:
		toggle_show()

func toggle_show():
	show = !show
	visible = !visible
	var collision = get_node("CollisionShape2D")
	collision.disabled = !collision.disabled
