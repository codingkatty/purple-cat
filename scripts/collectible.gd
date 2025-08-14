extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.collect_fosh()

		var portal = get_parent().get_node("Portal")
		portal.activate()

		queue_free()
