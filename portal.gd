extends Area2D

func _ready() -> void:
	visible = false

func activate():
	visible = true
	$AnimationPlayer.play("show")
	$AnimatedSprite2D.play("default")

func _on_body_entered(body):
	if body.is_in_group("player"):
		var crnt_scene_file = get_tree().current_scene.scene_file_path
		var next_lvl_number = crnt_scene_file.to_int() + 1

		var next_lvl_path = "res://scenes/level" + str(next_lvl_number) + ".tscn"
		get_tree().call_deferred("change_scene_to_file", next_lvl_path)
