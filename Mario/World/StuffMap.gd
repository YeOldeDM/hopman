extends TileMap

var obj = [
	"res://Coin/Coin.tscn",
	"res://Blocks/Bricks.tscn",
	"res://Blocks/LuckyBlock.tscn",
	"res://Googe/Googe.tscn",
	"res://Blocks/Bricks.tscn",
	"res://Blocks/LuckyBlock.tscn",
	"res://Blocks/LuckyBlock.tscn",
	]

func make():
	var cells = get_used_cells()
	for cell in cells:
		var new = load( obj[get_cellv(cell)] ).instance()
		get_parent().call_deferred("add_child", new)
		new.set_pos( map_to_world( cell ) )
	
	print("DONE")
	hide()

func _ready():
	make()
