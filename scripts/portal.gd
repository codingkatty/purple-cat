extends Area2D

@onready var transition = get_parent().get_node("CanvasLayer/Transition")

var next_lvl

func _ready() -> void:
	visible = false
	transition.play("slide_in")
	body_entered.connect(_on_body_entered)

	var crnt_scene_file = get_tree().current_scene.scene_file_path
	var next_lvl_number = crnt_scene_file.to_int() + 1
	var next_lvl_path = "res://scenes/level" + str(next_lvl_number) + ".tscn"

	if ResourceLoader.exists(next_lvl_path):
		next_lvl = load(next_lvl_path)
	else:
		next_lvl = load("res://scenes/win.tscn")

func activate():
	visible = true
	$AnimationPlayer.play("show")
	$AnimatedSprite2D.play("default")

func _on_body_entered(body):
	if body.is_in_group("player"):
		transition.play("slide_out")

func change_scene():
	get_tree().change_scene_to_packed(next_lvl)