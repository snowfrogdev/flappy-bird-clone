extends Area2D

func _on_body_entered(body: Node2D) -> void:
	# When the obstacles enter the area, remove them
  print("Obstacle entered")
  body.queue_free()
