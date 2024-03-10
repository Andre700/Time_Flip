extends Control

@onready var key_total = $KeyTotal
@onready var key_label = $KeyLabel

func set_key_total(value):
	key_total.text = str(value)

func set_key_amount(value):
	key_label.text = str(value)
