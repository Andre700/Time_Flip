extends Node2D

@export var next_level: PackedScene = null

@onready var start = $Start
@onready var exit = $Exit
@onready var death_zone = $DeathZone
@onready var world_a = $World_A
@onready var world_b = $World_B
@onready var tile_map = $TileMap
@onready var bg = $BG
@onready var hud = $UILayer/HUD
@onready var ui_layer = $UILayer

var player
var flip_points
var gate
var keys

func _ready():
	hud.set_level_name(name)
	
	keys = get_tree().get_nodes_in_group('key')
	for key in keys:
		key.picked_up.connect(_on_key_picked_up)
	
	if keys:
		hud.set_key_total(keys.size())
	
	gate = get_tree().get_first_node_in_group('gate')
	if gate:	
		gate.set_required_keys(keys.size())
	
	flip_points = get_tree().get_nodes_in_group("flip_point")
	for point in flip_points:
		point.flip_world.connect(_on_flip_world)
	
	player = get_tree().get_first_node_in_group("player")
	if player:
		player.global_position = start.get_spawn_pos()
	
	exit.body_entered.connect(_on_exit_body_entered)
	death_zone.body_entered.connect(_on_deathzone_body_entered)

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _on_flip_world():	
	FlipTransition.fade_out()
	var world_b_children = world_b.get_children()
	for node in world_b_children:
		node.toggle_show()
	
	var world_a_children = world_a.get_children()
	for node in world_a_children:
		node.toggle_show()
	
	for point in flip_points:
		point.toggle_sprite()
	
	tile_map.toggle_layers()
	bg.toggle_background()
	FlipTransition.fade_in()

func _on_exit_body_entered(body):
	if body is Player:
		player.active = false
		if next_level:
			SceneTransition.scene_transition(next_level)
		else:
			ui_layer.show_win_screen(true)

func _on_deathzone_body_entered(_body):
	player.global_position = start.get_spawn_pos()
	player.velocity = Vector2.ZERO

func _on_key_picked_up():
	player.key_amount += 1
	hud.set_key_amount(player.key_amount)
