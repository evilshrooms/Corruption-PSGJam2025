extends Node

#signal pause menu: game is paused
signal toggle_game_paused(is_paused : bool)

#store current scene
var current_scene = null
#Check if game paused emit signal if so
var game_paused : bool = false:	
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		toggle_game_paused.emit(game_paused)

func _ready() -> void:
	#get the root of the scene
	var root = get_tree().root
	current_scene = root.get_child(-1)
	print_debug(current_scene)

#if input "pause", signal the GameplayManager to pause or unpause the game
func _input(event: InputEvent):
	if(event.is_action_pressed("pause")):
		game_paused = !game_paused



#function to call elsewhere to switch scenes
func switch_scene(res_path):
	#make sure Godot knows what the current scene is
	current_scene = get_tree().current_scene
	#run function to safely exit the scene.
	_deffered_switch_scene.call_deferred(res_path)
	#make sure the game is not paused when switching scenes
	if game_paused:
		game_paused = !game_paused


#make sure we switch scenes after all code is done executing
func _deffered_switch_scene(res_path):
	current_scene.free()
	var s = ResourceLoader.load(res_path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
