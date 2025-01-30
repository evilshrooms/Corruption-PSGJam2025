class_name State_Attack extends State

var attacking : bool = false 


@export_range(1,20,0.4) var decelarate_speed : float = 5

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var idle : State = $"../Idle"
@onready var walk : State = $"../Walk"
@onready var hurt_box : HurtBox = $"../../Interactions/HurtBox"


#what happens when the player enters this state
func Enter() -> void:
	player.UpdateAnimation("attack")
	animation_player.animation_finished.connect( EndAttack )
	
	
	
	
	
	attacking = true
	
	
	await get_tree().create_timer( 0.075 ).timeout
	hurt_box.monitoring = true
	pass

#what happens when the player exits this state
func Exit() -> void:
	animation_player.animation_finished.disconnect( EndAttack )
	attacking = false 
	hurt_box.monitoring = false
	pass


#what happens during the _process in this state
func Process( _delta : float ) -> State:
	player.velocity -= player.velocity * decelarate_speed * _delta
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null


#what happens during the _physics_process update in this state
func physics( _delta: float) -> State:
	return null


#what happens with input events in this state
func HandleInput( _event: InputEvent ) -> State:
	return null




func EndAttack( _newAniName : String ) ->void:
	attacking = false
