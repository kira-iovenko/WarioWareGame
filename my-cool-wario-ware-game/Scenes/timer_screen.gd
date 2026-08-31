extends Node2D
@onready var garlic_container: HBoxContainer= $GarlicContainer
@onready var garlic_1: TextureRect = $GarlicContainer/Garlic1
@onready var garlic_2: TextureRect = $GarlicContainer/Garlic2
@onready var garlic_3: TextureRect = $GarlicContainer/Garlic3
@onready var garlic_4: TextureRect = $GarlicContainer/Garlic4
@onready var garlic_5: TextureRect = $GarlicContainer/Garlic5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await Timer(5.0)
	
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done + 1
		get_tree().change_scene_to_file("res://Scenes/minigame_" + str(Global.minigames_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match Global.lives:
		4:
			garlic_1.hide()
		3:
			garlic_1.hide()
			garlic_2.hide()
		2:
			garlic_1.hide()
			garlic_2.hide()
			garlic_3.hide()
		1:
			garlic_1.hide()
			garlic_2.hide()
			garlic_3.hide()
			garlic_4.hide()
		0:
			garlic_container.hide()
	
	timer.text = str(time)
	level.text = "Level " + str(Global.minigames_done)

func Timer(start_time: float):
	time = start_time
	while time > 0.0:
		await wait(0.1)
		time -= 0.1
	return

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout
