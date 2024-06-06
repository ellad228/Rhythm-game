extends Node

func load_data(data : Array, path : String):
	if not FileAccess.file_exists(path):
		save_data(data, path)
	var file = FileAccess.open(path, FileAccess.READ)
	var text = file.get_as_text()
	var sub = text.split_floats("=", false)
	sub.remove_at(0)
	print(sub)
	file.close()
	return sub
	
func save_data(data : Array, path : String):
	var file = FileAccess.open(path, FileAccess.WRITE)
	for i in data:
		var text = i[0] + "=" + str(i[1])
		file.store_line(text)
	file.close()
