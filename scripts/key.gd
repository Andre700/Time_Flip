extends Area2D

func _on_body_entered(body):
	if body is Player:
		body.key_amount += 1
		queue_free()
