extends CharacterBody2D

@export var player_speed : float = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	 
	Input.get_vector("Left", "Right", "Up", "Down" ) 
	velocity = Input.get_vector("Left", "Right", "Up", "Down" ) * player_speed
	move_and_slide()
