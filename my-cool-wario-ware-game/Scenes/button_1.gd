extends TextureButton
@onready var parent = $".."

var speed: float
var direction: Vector2
var change_direction_time: float

func _on_pressed() -> void:
	hide()
	parent.buttons_pressed += 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed = randf_range(100, 200)
	direction = Vector2.from_angle(randf_range(0, 360)).normalized()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	if position.x < 0 or position.x > 950:
		direction.x *= -1
	if position.y < 0 or position.y > 450:
		direction.y *= -1
