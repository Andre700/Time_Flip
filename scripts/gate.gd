extends Area2D

@onready var player = get_tree().get_first_node_in_group('player')
@onready var help_text = $HelpText
@onready var animation_player = $HelpText/AnimationPlayer

var required_keys = 0

func set_required_keys(value):
	required_keys = value

func _process(_delta):
	if overlaps_body(player) and Input.is_action_just_pressed("action"):
		if can_be_opened():
			queue_free()


func _on_body_entered(body):
	if body is Player and can_be_opened():
		help_text.visible = true
		animation_player.play("up_and_down")

func _on_body_exited(_body):
	help_text.visible = false
	animation_player.pause()

func can_be_opened():
	return player.key_amount == required_keys
