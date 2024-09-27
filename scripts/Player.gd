extends CharacterBody3D
class_name Player
@onready var movement_speed:float=10.0
@onready var rotate_speed:float=3.0

func _physics_process(delta):
	var z_movement:float=Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	var rotate:float=Input.get_action_strength("ui_left")-Input.get_action_strength("ui_right")
	rotation.y+=rotate*rotate_speed*delta
	var direction:Vector3=Vector3(0,0,1).rotated(Vector3(0,1,0),rotation.y)
	var motion:Vector3=direction*z_movement*delta*movement_speed
	move_and_collide(motion)







@onready var finalmenu=load("res://finalmenu.tscn")
func _on_goal_body_entered(body):
	if body is CharacterBody3D:
		get_tree().change_scene_to_packed(finalmenu)
