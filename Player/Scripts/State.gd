class_name State extends Node


# stores a reference to the player that this state belongs to
static var player: Player

func _ready():
	pass # Replace with function body.

#what happens when the player enters this state
func Enter() -> void:
	pass

#what happens when the player exits this state
func Exit() -> void:
	pass


#what happens during the _process in this state
func Process( _delta : float ) -> State:
	return null


#what happens during the _physics_process update in this state
func physics( _delta: float) -> State:
	return null


#what happens with input events in this state
func HandleInput( _event: InputEvent ) -> State:
	return null
