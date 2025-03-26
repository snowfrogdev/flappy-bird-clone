extends CheckButton

func _on_toggled(toggled_on: bool) -> void:
  if toggled_on:
    Music.play()
  else:
    Music.stop()