extends CanvasLayer

@onready var sky = $Sky

var present_sprite = preload("res://assets/textures/bg/night sky.png")
var past_sprite = preload("res://assets/textures/bg/past Sky.png")

func toggle_background():
	if sky.texture == present_sprite:
		sky.texture = past_sprite
	else:
		sky.texture = present_sprite
	
