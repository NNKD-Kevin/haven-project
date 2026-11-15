extends HBoxContainer
@onready var h_box_container: HBoxContainer = $"."
@onready var label: Label = $"../Title"
@onready var option1: AnimatedSprite2D = $"Option 1/AnimatedSprite2D"
@onready var option2: AnimatedSprite2D = $Option2/AnimatedSprite2D
@onready var option3: AnimatedSprite2D = $Option3/AnimatedSprite2D
@onready var sprites=[option1,option2,option3]

#Description
@onready var chicken1: Label = $Option1/Description/Chicken
@onready var crab1: Label = $"Option 1/Description/Crab"
@onready var wolf1: Label = $"Option 1/Description/Wolf"
@onready var turtle1: Label = $"Option 1/Description/Turtle"
@onready var description1=[chicken1,crab1,turtle1,wolf1]
@onready var chicken2: Label = $Option2/Description/Chicken
@onready var crab2: Label = $Option2/Description/Crab
@onready var wolf2: Label = $Option2/Description/Wolf
@onready var turtle2: Label = $Option2/Description/Turtle
@onready var description2=[chicken2,crab2,turtle2,wolf2]
@onready var chicken3: Label = $Option3/Description/Chicken
@onready var crab3: Label = $Option3/Description/Crab
@onready var wolf3: Label = $Option3/Description/Wolf
@onready var turtle3: Label = $Option3/Description/Turtle
@onready var description3=[chicken3,crab3,turtle3,wolf3]
@onready var descriptions=[description1,description2,description3]
var index=0




var choices=[]
func _ready():
	randomize()
	h_box_container.visible = true
	label.visible = true
	option1.visible = true
	option2.visible = 	true
	option3.visible = true
	choices=[]
	index=0
	for sprite in sprites:
		var gacha=randi_range(1,4)
		if gacha==1:
			sprite.play('Chicken')
			choices.append('good_chick')
			descriptions[index][0].visible=true
		elif gacha==2:
			sprite.play('Crab')
			choices.append('good_crab')
			descriptions[index][1].visible=true
		elif gacha==3:
			sprite.play('Turtle')
			choices.append('good_turtle')
			descriptions[index][2].visible=true
		elif gacha==4:
			sprite.play('Wolf')
			choices.append('good_wolf')
			descriptions[index][3].visible=true
		index+=1
func hideall():
	h_box_container.visible = false
	label.visible = false
	for description in descriptions:
		for i in description:
			if i:
				i.visible=false
func _on_option_1_pressed() -> void:
	Global.animals.append(choices[0])
	hideall()
func _on_option_2_pressed() -> void:
	Global.animals.append(choices[1])
	hideall()
func _on_option_3_pressed() -> void:
	Global.animals.append(choices[2])
	hideall()
