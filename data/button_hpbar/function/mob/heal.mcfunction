## 回復した時の処理
# as @e[type=#button_hpbar:mobs]
# unless data entity @s {Health:512.0f} 
# if score $Health button_hpbar.Temporary matches 513..

# 回復
scoreboard players operation $Heal button_hpbar.Temporary = $Health button_hpbar.Temporary
scoreboard players remove $Heal button_hpbar.Temporary 512

# 回復量分のスコア加算
scoreboard players operation @s button_hpbar.hp += $Heal button_hpbar.Temporary
execute if score @s button_hpbar.hp >= @s button_hpbar.hp_max run scoreboard players operation @s button_hpbar.hp = @s button_hpbar.hp_max

# Healthをもとに戻す
data modify entity @s Health set value 512.0f

# HP表示
function button_hpbar:hp_bar/_