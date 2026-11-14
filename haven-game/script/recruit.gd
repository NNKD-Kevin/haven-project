extends HBoxContainer
@onready var h_box_container: HBoxContainer = $"."
@onready var label: Label = $"../Title"
@onready var option1: AnimatedSprite2D = $"Option 1/AnimatedSprite2D"
@onready var option2: AnimatedSprite2D = $Option2/AnimatedSprite2D
@onready var option3: AnimatedSprite2D = $Option3/AnimatedSprite2D
@onready var sprites=[option1,option2,option3]
var choices=[]
func _ready():
	randomize()
	h_box_container.visible = true
	label.visible = true
	option1.visible = true
	option2.visible = 	true
	option3.visible = true
	choices=[]
	for sprite in sprites:
		var gacha=randi_range(1,4)
		if gacha==1:
			sprite.play('Chicken')
			choices.append('good_chicken')
		elif gacha==2:
			sprite.play('Crab')
			choices.append('good_crab')
		elif gacha==3:
			sprite.play('Turtle')
			choices.append('good_turtle')
		elif gacha==4:
			sprite.play('Wolf')
			choices.append('good_wolf')
func _on_option_1_pressed() -> void:
	h_box_container.visible = false
	label.visible = false
	option1.visible = false
	Global.animals.append(choices[0])
func _on_option_2_pressed() -> void:
	h_box_container.visible = false
	label.visible = false
	option2.visible = false
	Global.animals.append(choices[1])
func _on_option_3_pressed() -> void:
	h_box_container.visible = false
	label.visible = false
	option3.visible = false
	Global.animals.append(choices[2])
