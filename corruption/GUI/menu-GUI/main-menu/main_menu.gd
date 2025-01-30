extends Control

class_name MainMenu

@onready var start_button = $TextureRect/HBoxContainer/VBoxContainer/Game_Start_Button as Button
@onready var exit_button = $TextureRect/HBoxContainer/VBoxContainer/Game_Exit_Button as Button
@export var start_scene_path : String

func _ready():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_file(start_scene_path)
	pass
	
func on_exit_pressed() -> void:
	get_tree().quit()
	
