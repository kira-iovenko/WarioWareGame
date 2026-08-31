extends Node2D
@onready var timer: RichTextLabel = $timer

var time : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func Timer(start_time: float):
	time = start_time
	while time > 0.0:
		await wait(0.1)
		time -= 0.1
	return
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
