extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:

	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	
	if direction:
		if direction.x < 0:
			$Sprite2D.rotation_degrees = 90
		elif direction.x > 0:
			$Sprite2D.rotation_degrees = -90
		elif direction.y < 0:
			$Sprite2D.rotation_degrees = 180
		elif direction.y > 0:
			$Sprite2D.rotation_degrees = 0

	move_and_slide()
