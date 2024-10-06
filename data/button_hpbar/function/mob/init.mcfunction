### 初期処理
## as @e[type=#button_hpbar:mobs]
## if entity @s[tag=!button_hpbar.Init]

# モブのステータスをスコアに
data modify storage button_hpbar:temp Init.Health set from entity @s Health
execute store result score @s button_hpbar.hp run data get storage button_hpbar:temp Init.Health
execute store result score @s button_hpbar.hp_max run data get storage button_hpbar:temp Init.Health

# 大きなダメージで死なないようにHPを1024に設定
data modify entity @s attributes append value {id:"minecraft:generic.max_health", base:1024.0d}
data modify entity @s Health set value 512.0f

# Initタグ付け
tag @s add button_hpbar.Init

# リセット
data remove storage button_hpbar:temp Init