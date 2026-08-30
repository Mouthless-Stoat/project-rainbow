extends PanelContainer


@export var lobby_path: String


func _ready() -> void:
	%VersionLb.text = Global.VERSION
	Global.ruleset_changed.connect(_on_ruleset_changed)



func _on_ruleset_changed(ruleset: Ruleset) -> void:
	%RulesetLb.text = ruleset.name


func _on_host_btn_pressed() -> void:
	Global.player_name = %HostPlayerName.text
	await ConnectionManager.create_room()
	get_tree().change_scene_to_file(lobby_path)


func _on_join_btn_pressed() -> void:
	Global.player_name = %JoinPlayerName.text
	ConnectionManager.join_room(%JoinRoomCode.text as String)
	get_tree().change_scene_to_file(lobby_path)


func _on_quit_btn_pressed() -> void:
	get_tree().quit()


func _on_host_setting_btn_pressed() -> void:
	$HostSetting.visible = true
func _on_join_setting_btn_pressed() -> void:
	$JoinSetting.visible = true
