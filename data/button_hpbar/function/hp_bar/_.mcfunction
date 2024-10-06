## HPの表示
# mob/hurt.mcfunction
# as @e[type=#button_hpbar:mobs]
# unless data entity @s {Health:512.0f} 
# if score $Health button_hpbar.Temporary matches ..511

# HPの割合計算
  scoreboard players operation @s button_hpbar.hp_raito = @s button_hpbar.hp
  scoreboard players operation @s button_hpbar.hp_raito *= #20 button_hpbar.Constant
  scoreboard players operation @s button_hpbar.hp_raito /= @s button_hpbar.hp_max

# HPの割合小数点を繰り上げる処理
  scoreboard players operation @s button_hpbar.hp_float = @s button_hpbar.hp
  scoreboard players operation @s button_hpbar.hp_float *= #20 button_hpbar.Constant
  scoreboard players operation @s button_hpbar.hp_float %= @s button_hpbar.hp_max
  execute if score @s button_hpbar.hp_float matches 1.. run scoreboard players add @s button_hpbar.hp_raito 1

# HPバー表示用のアマスタ召喚 & ライド
  execute unless data entity @s Passengers at @s anchored eyes positioned ^ ^ ^ run summon armor_stand ~ ~0.25 ~ {CustomName:'{"text": "██████████", "color": "green"}',Marker:true, Invisible:true, Tags:["button_hpbar.HPBar"]}
  execute at @s anchored eyes positioned ~ ~0.25 ~ run ride @e[type=armor_stand, tag=button_hpbar.HPBar, sort=nearest, limit=1] mount @s

# HPの割合に応じてCustomNameをHPbarに変換 (2分探索予定)
  function button_hpbar:hp_bar/binary_search/show_hp

# HPbarを表示
  execute on passengers run data modify entity @s CustomNameVisible set value 1b

# 表示時間を設定
  scoreboard players set @s button_hpbar.display_time 100