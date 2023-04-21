extends Control

@onready var slot_scene = preload("res://slot.tscn")
@onready var grid_container = $Background/MarginContainer/VBoxContainer/ScrollContainer/GridContainer

var grid_array := []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(64):
		create_slot()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_slot():
	var new_slot = slot_scene.instantiate()
	new_slot.slot_ID = grid_array.size()
	grid_container.add_child(new_slot)
	grid_array.push_back(new_slot)
	new_slot.slot_entered.connect(_on_slot_mouse_entered)
	new_slot.slot_exited.connect(_on_slot_mouse_exited)
	pass

func _on_slot_mouse_entered(a_slot):
	a_slot.set_color(a_slot.States.FREE)
	
func _on_slot_mouse_exited(a_slot):
	a_slot.set_color(a_slot.States.DEFAULT)

