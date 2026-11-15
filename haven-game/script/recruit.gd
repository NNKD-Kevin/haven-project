extends HBoxContainer
@onready var h_box_container: HBoxContainer = $"."
@onready var label: Label = $"../Title"
@onready var options = [$"Option1/AnimatedSprite2D", $Option2/AnimatedSprite2D, $Option3/AnimatedSprite2D]

#Description
@onready var chicken1: Label = $Option1/Description/Chicken
@onready var crab1: Label = $"Option1/Description/Crab"
@onready var wolf1: Label = $"Option1/Description/Wolf"
@onready var turtle1: Label = $"Option1/Description/Turtle"
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
@onready var center_container: CenterContainer = $"../../CenterContainer"
@onready var upcoming_sprite: HBoxContainer = $"../../Upcoming Enemy2/Upcoming_sprite"
@onready var upcoming: Label = $"../../Upcoming Enemy2/Upcoming"




var choices=[]
func choose():
	randomize()
	h_box_container.visible = true
	if upcoming_sprite:
		upcoming_sprite.visible = true
	if upcoming:
		upcoming.visible = true
	if label:
		label.visible = true
	for option in options:
		if option:
			option.visible=true
	choices=[]
	index=0
	for sprite in options:
		var gacha=randi_range(1,4)
		if sprite:
			if gacha==1:
				sprite.play('Chicken')
				choices.append('good_chick')
				if descriptions[index][0]:descriptions[index][0].visible=true
			elif gacha==2:
				sprite.play('Crab')
				choices.append('good_crab')
				if descriptions[index][1]:descriptions[index][1].visible=true
			elif gacha==3:
				sprite.play('Turtle')
				choices.append('good_turtle')
				if descriptions[index][2]:descriptions[index][2].visible=true
			elif gacha==4:
				sprite.play('Wolf')
				choices.append('good_wolf')
				if descriptions[index][3]:descriptions[index][3].visible=true
		index+=1
func _ready():
	choose()
func hideall():
	hide()
	label.hide()
	if upcoming_sprite:
		upcoming_sprite.visible = false
	if upcoming:
		upcoming.visible = false
	for description in descriptions:
		for i in description:
			i.hide()
	Global.ready_to_start = true
func _pick(i: int):
	Global.animals.append(choices[i])
	hideall()
	if center_container:
		center_container.visible = true

func _on_option_1_pressed() -> void: _pick(0)
func _on_option_2_pressed() -> void: _pick(1)
func _on_option_3_pressed() -> void: _pick(2)
