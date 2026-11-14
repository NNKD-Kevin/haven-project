extends HBoxContainer
@onready var h_box_container: HBoxContainer = $"."
@onready var label: Label = $"../Title"
@onready var option1: AnimatedSprite2D = $"Option 1/AnimatedSprite2D"
@onready var option2: AnimatedSprite2D = $Option2/AnimatedSprite2D
@onready var option3: AnimatedSprite2D = $Option3/AnimatedSprite2D

func _ready():
	h_box_container.visible = true
	label.visible = true
	option1.visible = true
	option2.visible = 	true
	option3.visible = true
func _on_option_1_pressed() -> void:
	h_box_container.visible = false
	label.visible = false
	option1.visible = false
func _on_option_2_pressed() -> void:
	h_box_container.visible = false
	label.visible = false
	option2.visible = false
func _on_option_3_pressed() -> void:
	h_box_container.visible = false
	label.visible = false
	option3.visible = false
