extends TileMap

func toggle_layers():
	if is_layer_enabled(0):
		set_layer_enabled(0, false)
		set_layer_enabled(1, true)
	else:
		set_layer_enabled(1, false)
		set_layer_enabled(0, true)
