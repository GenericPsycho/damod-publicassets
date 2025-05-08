if (!instance_exists(obj_noiseboss))
{
    instance_destroy(id, false)
    return;
}
hsp = 0
vsp = 0
grav = 0.4
hsp_carry = 0
vsp_carry = 0
platformid = obj_noisecredit
grounded = false
dir = 0
cooldown = 120
bounce = 0
anglespd = 1
angle = random(360)
depth = obj_noiseboss.depth - 10
parried = false
