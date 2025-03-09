extends Node

const SAVE_PATH = "user://highscore.json"

# Saves the high score as JSON
func save_highscore(score: int):
    var data = {"highscore": score}
    var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
    file.store_string(JSON.stringify(data))
    file.close()

# Loads the high score
func load_highscore() -> int:
    if not FileAccess.file_exists(SAVE_PATH):
        return 0 # Default score if no file exists

    var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
    var content = file.get_as_text()
    file.close()
    
    var parsed = JSON.parse_string(content)
    if parsed is Dictionary and "highscore" in parsed:
        return parsed["highscore"]
    
    return 0 # Default if file is corrupted
