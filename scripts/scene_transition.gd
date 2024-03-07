extends CanvasLayer

@onready var animation_player = $Overlay/AnimationPlayer

func scene_transition(target: PackedScene):
	animation_player.play("dissolve")
	await animation_player.animation_finished
	get_tree().change_scene_to_packed(target)
	animation_player.play_backwards("dissolve")
