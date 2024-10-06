## ダメージを受けた時の処理
# as @e[type=#button_hpbar:mobs]
# unless data entity @s {Health:512.0f} 
# if score $Health button_hpbar.Temporary matches ..511

# 被ダメージ
scoreboard players operation $Damage button_hpbar.Temporary = $Health button_hpbar.Temporary
scoreboard players remove $Damage button_hpbar.Temporary 512

# ダメージ分のスコア減算
scoreboard players operation @s button_hpbar.hp += $Damage button_hpbar.Temporary

# Healthをもとに戻す
data modify entity @s Health set value 512.0f

# HP表示
function button_hpbar:hp_bar/_

# ダメージ表示（）

# 毒エフェクトかつbutton_hpbar.hp=1の時の処理？

# button_hpbar.hp<0で死亡処理
execute if score @s button_hpbar.hp matches ..0 on passengers run kill @s
execute if score @s button_hpbar.hp matches ..0 run kill @s