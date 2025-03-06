extends CanvasLayer

@onready var game: Node2D = $"Game"
@onready var game_over_overlay: ColorRect = $"GameOverOverlay"

func _on_button_ok_pressed() -> void:
  print("Button OK pressed")
  game_over_overlay.hide()
  game.get_tree().reload_current_scene()
