extends Control

@onready var key_total = $KeyTotal
@onready var key_label = $KeyLabel
@onready var level_label = $LevelLabel

func set_key_total(value):
	key_total.text = str(value)

func set_key_amount(value):
	key_label.text = str(value)

func set_level_name(value):
	level_label.text = str(value)
