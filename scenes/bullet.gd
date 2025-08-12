extends Area2D

class_name Bullet

var direction_vector: Vector2 = Vector2(50, -50)


func _process(delta: float) -> void:
	position.x += direction_vector.x * delta
	position.y += direction_vector.y * delta
