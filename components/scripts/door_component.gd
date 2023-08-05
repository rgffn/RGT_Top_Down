extends Area2D
class_name DoorComponent

var _player_ref: character = null
@export_category("Variables")
@export var _teleport_position1: Vector2

@export_category("Objects")
@export var _animation: AnimationPlayer = null

func _on_body_entered(_body) -> void:
	if _body is character:
		_player_ref = _body
		_animation.play("open")
		print(_teleport_position1)


func _on_animation_animation_finished(_anim_name: String) -> void:
	if _anim_name == "open":
		_player_ref.global_position = _teleport_position1
		_animation.play("close")
		print(_teleport_position1)
