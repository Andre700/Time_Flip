extends Node

var key = preload("res://assets/audio/key pickup.wav")
var time_warp = preload("res://assets/audio/time warp.wav")
var win = preload("res://assets/audio/win.wav")
var gate = preload("res://assets/audio/gate open.wav")

func play_sfx(sfx_name: String):
	var stream = null
	if sfx_name == "key":
		stream = key
	elif sfx_name == "time_warp":
		stream = time_warp
	elif sfx_name == "win":
		stream = win
	elif sfx_name == "gate":
		stream = gate
	else:
		print("Invalid sfx name")
		return
	
	var asp = AudioStreamPlayer.new()
	asp.stream = stream
	asp.name = "SFX"
	
	add_child(asp)
	
	asp.play()
	
	await asp.finished
	
	asp.queue_free()	
