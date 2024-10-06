## HPを設定するときに使うマクロFunction

# モブのステータスをスコアに
$scoreboard players set @s button_hpbar.hp $(value)
$scoreboard players set @s button_hpbar.hp_max $(value)

# 大きなダメージで死なないようにHPを1024に設定
data modify entity @s attributes append value {id:"minecraft:generic.max_health", base:1024.0d}
data modify entity @s Health set value 512.0f

# Initタグ付け
tag @s add button_hpbar.Init