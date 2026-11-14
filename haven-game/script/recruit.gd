extends HBoxContainer
@onready var h_box_container: HBoxContainer = $"."
@onready var label: Label = $"../Label"

func _ready():
	h_box_container.visible = true
	label.visible = true
func _on_option_1_pressed() -> void:
	h_box_container.visible = false
	label.visible = false
func _on_option_2_pressed() -> void:
	h_box_container.visible = false
	label.visible = false
func _on_option_3_pressed() -> void:
	h_box_container.visible = false
	label.visible = false
