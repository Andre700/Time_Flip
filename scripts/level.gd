extends Node2D

@export var next_level: PackedScene = null

@onready var start = $Start
@onready var exit = $Exit
@onready var death_zone = $DeathZone
@onready var world_a = $World_A
@onready var world_b = $World_B

var player
var in_world_a = true

func _ready():
	var flip_points = get_tree().get_nodes_in_group("flip_point")
	for point in flip_points:
		point.flip_world.connect(_on_flip_world)
	
	player = get_tree().get_first_node_in_group("player")
	if player:
		player.global_position = start.get_spawn_pos()
	
	exit.body_entered.connect(_on_exit_body_entered)
	death_zone.body_entered.connect(_on_deathzone_body_entered)

func _on_flip_world():	
	var world_b_children = world_b.get_children()
	for node in world_b_children:
		node.toggle_show()
	
	var world_a_children = world_a.get_children()
	for node in world_a_children:
		node.toggle_show()

func _on_exit_body_entered(body):
	if body is Player:
		player.active = false
		await get_tree().create_timer(1.5).timeout
		if next_level:
			get_tree().change_scene_to_packed(next_level)

func _on_deathzone_body_entered(_body):
	player.global_position = start.get_spawn_pos()
	player.velocity = Vector2.ZERO
