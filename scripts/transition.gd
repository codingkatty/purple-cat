extends AnimationPlayer

@onready var transition = self

func _on_pressed():
	transition.play("slide_out")

func _ready():
	transition.connect("animation_finished", _on_transition_animation_finished)

func _on_transition_animation_finished(anim_name):
	if anim_name == "slide_out":
		get_tree().root.get_node("Node/Portal").change_scene()
