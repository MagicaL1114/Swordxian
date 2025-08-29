extends Area2D

var slimer_speed: float = -100
var is_dead: bool = false

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_dead:
		position += Vector2(-100, 0) * delta
	if position.x < -253:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and not is_dead : 

		body.game_over()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		$AnimatedSprite2D.play("die")
		is_dead = true
		get_tree().current_scene.score += 1
		area.queue_free()
		$deathsound.play()
		
		
		await get_tree().create_timer(0.3).timeout
		queue_free()
