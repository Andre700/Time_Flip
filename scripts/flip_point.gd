extends Area2D

signal flip_world

@onready var player = get_tree().get_first_node_in_group('player')
@onready var sprite = $Sprite2D
@onready var help_text = $HelpText
@onready var animation_player = $HelpText/AnimationPlayer

var present_sprite = preload("res://assets/textures/other/Flip Point present-sheet.png")
var past_sprite = preload("res://assets/textures/other/Flip Point past-sheet.png")

func _process(_delta):
	if overlaps_body(player) and Input.is_action_just_pressed("action"):
		flip_world.emit()

func toggle_sprite():
	if sprite.texture == present_sprite:
		sprite.texture = past_sprite
	else:
		sprite.texture = present_sprite

func _on_body_entered(body):
	if body is Player:
		help_text.visible = true
		animation_player.play("up_and_down")

func _on_body_exited(_body):
	help_text.visible = false
	animation_player.pause()
