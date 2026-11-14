extends Control




func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,100)


func _on_check_box_toggled(toggled_on: bool) -> void:
