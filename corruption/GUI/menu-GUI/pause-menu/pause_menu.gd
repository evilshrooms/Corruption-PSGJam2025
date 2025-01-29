extends Control

@export var gameplay_manager : GameplayManager

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	gameplay_manager.connect("toggle_game_paused", _on_game_manager_toggle_game_paused)
	

func _on_game_manager_toggle_game_paused(is_paused):
	if(is_paused):
		show()
	else:
		hide()


func _on_resume_pressed():
	gameplay_manager.game_paused = false


func _on_quit_pressed():
	get_tree().quit()
