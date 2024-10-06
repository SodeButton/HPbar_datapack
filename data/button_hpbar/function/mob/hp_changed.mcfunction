## HPが変更されたときの検知 
# as @e[type=#button_hpbar:mobs]
# unless data entity @s {Health:512.0f}

# モブHPデータの取得
execute store result score $Health button_hpbar.Temporary run data get entity @s Health

# ダメージを受けた場合
execute if score $Health button_hpbar.Temporary matches ..511 run function button_hpbar:mob/hurt

# 回復した場合
execute if score $Health button_hpbar.Temporary matches 513.. run function button_hpbar:mob/heal

# リセット
scoreboard players reset $Health