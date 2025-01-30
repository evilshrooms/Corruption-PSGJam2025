extends Control

@export var main_menu_scene_path : String

# Hide menu on ready and connect to GameplayManager
func _ready():
	hide()
	GameplayManager.toggle_game_paused.connect(_on_game_manager_toggle_game_paused) 

#if is_paused show pause menu
func _on_game_manager_toggle_game_paused(is_paused):
	if(is_paused):
		show()
	else:
		hide()

#Menu Button Code
func _on_resume_pressed():
	GameplayManager.game_paused = false

func _on_main_menu_pressed():
	GameplayManager.switch_scene(main_menu_scene_path)
	

func _on_quit_pressed():
	get_tree().quit()
