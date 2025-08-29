extends Node2D


@export var slimer_scene : PackedScene
# 创建名为 slimer_scene 的scene变量
@export var slimer_spawn_timer : Timer 
# 创建名为 slimer_spawn_timer 的timer变量
@export var score : int = 0
@export var score_label : Label
@export var gameover : Label

func _ready() -> void:
	pass 
# 喵


func _process(delta: float) -> void:
	slimer_spawn_timer.wait_time -= 0.2 * delta
# _spawn_timer完成一次的时间-0.2S/S
	slimer_spawn_timer.wait_time = clamp(slimer_spawn_timer.wait_time, 1, 3)
# 限制_spawn_timer在1-3范围内
	score_label.text = "Score : " + str(score)	


func spawn_slimer() -> void:
	var slimer_node = slimer_scene.instantiate()
# 创建新的slimer_scene,并将其存放在slimer_node变量内
	slimer_node.position = Vector2(260, randf_range(50, 115))
# 新slimer生成的位置是坐标(260, 50-115之间)
	get_tree().current_scene.add_child(slimer_node)
# 联系树,在当前scene创建节点slimer_node


func show_gameover():
	gameover.visible = true
	
