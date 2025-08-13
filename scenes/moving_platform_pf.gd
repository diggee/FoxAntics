extends PathFollow2D

@export var speed: float = 50.0

func _physics_process(delta: float) -> void:
	progress += speed * delta
