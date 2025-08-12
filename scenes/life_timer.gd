extends Node

@export var life_timer: int

func _ready() -> void:
	await get_tree().create_timer(life_timer).timeout
	get_parent().call_deferred('queue_free')
