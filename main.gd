extends CanvasLayer

@onready var game: Node2D = $"Game"
@onready var game_over_overlay: ColorRect = $"GameOverOverlay"
@onready var score_control: Control = $"Score"
@onready var title_screen: Control = $"TitleScreen"

func _on_button_ok_pressed() -> void:
  print("Button OK pressed")
  game_over_overlay.hide()
  game.get_tree().reload_current_scene()

func _process(_delta):
  if game.get_tree().paused and not game_over_overlay.is_visible_in_tree() and Input.is_action_just_pressed("Flap Wings"):
    game.get_tree().paused = false
    score_control.show()
    title_screen.hide()