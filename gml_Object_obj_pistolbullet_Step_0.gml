with (instance_place((x + spd), y, obj_shotgunblock))
    instance_destroy()
with (instance_place(x, (y - spdh), obj_shotgunblock))
    instance_destroy()
with (instance_place((x + spd), y, obj_destructibles))
    instance_destroy()
var _x = x
x += (image_xscale * spd)
y += (-spdh)
if instance_exists(obj_bossplayerdeath)
{
    instance_destroy()
    return;
}
if (sprite_index == spr_peppinobulletGIANT)
    var dmg = obj_lightsource
else
    dmg = obj_doisedead
scr_pistolcollision(dmg, _x)
if (sprite_index == spr_peppinobulletGIANT)
    mask_index = sprite_index
