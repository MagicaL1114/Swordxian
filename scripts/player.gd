extends CharacterBody2D

@export var player_speed : float = 100
# 角色速度
@export var animated : AnimatedSprite2D
# 
@export var bullet_tscn: PackedScene
var is_game_over: bool = false

func _process(delta: float) -> void:
	if velocity == Vector2.ZERO or is_game_over:
		$runningaudio.stop()
	elif not $runningaudio.playing:
		$runningaudio.play()
		

func _physics_process(delta: float) -> void:
	if not is_game_over: 

		velocity = Input.get_vector("Left", "Right", "Up", "Down" ) * player_speed
	
		if velocity == Vector2.ZERO:
			animated.play("idle")
		else: 
			animated.play("move")
		
		move_and_slide()


func game_over(): 
	if not is_game_over:
		is_game_over = true
		animated.play("die")
		get_tree().current_scene.show_gameover()
		$gameoveraudio.play()
		
	
		
		$restarTtimer.start()	
		




func _on_fire() -> void:
	if velocity != Vector2.ZERO or is_game_over :
		return
		
	$gun.play()
		
		
	var bullet_node = bullet_tscn.instantiate() # Replace with function body.
	bullet_node.position = position + Vector2(17, 7)
	get_tree().current_scene.add_child(bullet_node)


func reloadscene() -> void:
	get_tree().reload_current_scene()
