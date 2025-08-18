extends Button

@onready var transition = get_parent().get_node("Transition")
var level1 = preload("res://scenes/level1.tscn")

func _ready():
	transition.play("slide_in")
	AudioPlayer.stop_music()

func _on_pressed():
	transition.play("slide_out")

func _on_transition_animation_finished(anim_name):
	if anim_name == "slide_out":
		get_tree().change_scene_to_packed(level1)
