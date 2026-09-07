extends Node2D
@onready var themed_timer: Node2D = $ThemedTimer

var garlic_collected = 0
var timer_end = false
var positions = [
	Vector2(50, 100),
	Vector2(270, 100),
	Vector2(730, 100),
	Vector2(950, 100),
	Vector2(50, 270),
	Vector2(950, 270),
	Vector2(50, 450),
	Vector2(270, 450),
	Vector2(730, 450),
	Vector2(950, 450),
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	positions.shuffle()
	$Garlic1.position = positions[0]	
	$Garlic2.position = positions[1]	
	$Garlic3.position = positions[2]	
	
	$Garlic1.garlic_collected.connect(garlic_collect)
	$Garlic2.garlic_collected.connect(garlic_collect)
	$Garlic3.garlic_collected.connect(garlic_collect)
	await themed_timer.Timer(10.0)
	timer_end = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if garlic_collected == 3:
		if Global.minigames_done == 3:
			get_tree().change_scene_to_file("res://Scenes/done_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/timer_screen.tscn")
	
	if timer_end:
		Global.minigames_done -= 1
		Global.lives -= 1
		if Global.lives > 0:
			get_tree().change_scene_to_file("res://Scenes/timer_screen.tscn")
		else:
			get_tree().change_scene_to_file("res://Scenes/fail_screen.tscn")

func garlic_collect() -> void:
	garlic_collected += 1
	return
