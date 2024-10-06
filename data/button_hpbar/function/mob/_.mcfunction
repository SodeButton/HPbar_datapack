### 常時実行function (as @e[type=#button_hpbar:mobs])

# モブ召喚時に初期処理
execute if entity @s[tag=!button_hpbar.Init] run function button_hpbar:mob/init

# HPが変更されたときの検知
execute unless data entity @s {Health:512.0f} run function button_hpbar:mob/hp_changed

# HP表示時間切れ
execute if score @s button_hpbar.hp matches 1.. run scoreboard players remove @s button_hpbar.display_time 1
execute if score @s button_hpbar.display_time matches ..0 run function button_hpbar:hp_bar/reset