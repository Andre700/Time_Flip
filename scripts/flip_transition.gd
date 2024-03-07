extends CanvasLayer

@onready var animation_player = $Overlay/AnimationPlayer

func fade_out():
	animation_player.play("flip")
	
func fade_in():
	animation_player.play_backwards("flip")
