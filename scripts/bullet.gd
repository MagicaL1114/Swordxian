extends Area2D

@export var bullet_speed: float = 300
# 子弹速度 = 300
func _ready() -> void:
	await get_tree().create_timer(3).timeout
	queue_free() 
# 3s自动清除子弹scene



func _physics_process(delta: float) -> void:
	position += Vector2(bullet_speed, 0) * delta
# 子弹向左运动
