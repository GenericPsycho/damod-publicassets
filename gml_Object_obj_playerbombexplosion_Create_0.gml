image_speed = 0.5
depth = -1
hit = false
has_ended = false
scr_fmod_soundeffect(global.snd_explosion, x, y)
collision_list = [obj_pizzafaceboss_p2, obj_vigilanteboss, obj_vigilantecow, obj_johnecheese, obj_targetguy]
hitlist = ds_list_create()
hitqueue = ds_queue_create()
collision_function = ds_map_create()
pistol_damage = 4
destroy = false
add_hit = function(argument0, argument1) //gml_Script_anon_gml_Object_obj_playerbombexplosion_Create_0_395_gml_Object_obj_playerbombexplosion_Create_0
{
    if (argument1 == undefined)
        argument1 = -4
    if instance_exists(obj_bossplayerdeath)
        return;
    if (floor(image_index) > 9)
        return;
    if ((!(ds_exists(hitlist, 2))) || (!(ds_exists(hitqueue, 4))))
        return;
    if (ds_list_find_index(hitlist, argument0) == -1)
    {
        if (argument1 == -4)
            ds_queue_enqueue(hitqueue, [argument0, argument0.object_index])
        else
            ds_queue_enqueue(hitqueue, [argument0, argument1])
    }
}

ds_map_set(collision_function, -4, function(argument0) //gml_Script_anon_gml_Object_obj_playerbombexplosion_Create_0_841_gml_Object_obj_playerbombexplosion_Create_0
{
    trace("Non collision, but not misssed")
    return true;
}
)
ds_map_set(collision_function, 700, function(argument0) //gml_Script_anon_gml_Object_obj_playerbombexplosion_Create_0_961_gml_Object_obj_playerbombexplosion_Create_0
{
    if instance_exists(obj_bossplayerdeath)
        return false;
    if (!instance_exists(argument0))
        return false;
    if (argument0.object_index == obj_vigilanteboss || argument0.object_index == obj_pizzafaceboss_p2)
    {
        if scr_pistolhit(argument0, pistol_damage)
            return true;
        return false;
    }
    if (argument0.object_index == obj_pizzafaceboss && argument0.state == states.ram && argument0.substate == states.land && argument0.elitehit == 1)
    {
        with (instance_create(other.x, other.y, obj_explosioneffect))
            sprite_index = spr_bombexplosion
        with (argument0)
            scr_boss_do_hurt_phase2(obj_player1.id)
        if (x != other.x)
            image_xscale = sign(other.x - x)
        destroy = true
        return true;
    }
    if (argument0.object_index == obj_fakepepboss)
    {
        with (argument0)
        {
            if (staggerbuffer <= 0 && flickertime <= 0 && visible && (state == states.walk || (state == states.jump && sprite_index == spr_fakepeppino_bodyslamstart) || (state == states.freefall && sprite_index == spr_fakepeppino_bodyslamland) || (state == states.mach2 && attackspeed < 18) || state == states.Sjumpprep || (state == states.throwing && sprite_index != spr_fakepeppino_flailing)))
            {
                var ix = (-other.image_xscale)
                if (x != other.x)
                    ix = sign(other.x - x)
                if (subhp > 0)
                {
                    if (state == states.walk)
                    {
                        state = states.staggered
                        image_xscale = ix
                        hsp = (-image_xscale) * 20
                        vsp = 0
                        sprite_index = spr_fakepeppino_stagger
                        image_index = 0
                    }
                    else
                        flashbuffer = 9
                    staggerbuffer = 100
                    flash = true
                    subhp--
                    repeat (4)
                        create_debris(x, y, spr_slapstar)
                }
                else
                {
                    with (obj_fakepephead)
                    {
                        create_particle(x, y, (9 << 0))
                        instance_destroy(id, false)
                    }
                    state = states.stun
                    image_xscale = ix
                    hsp = (-image_xscale) * 8
                    vsp = -6
                    thrown = false
                    linethrown = false
                    sprite_index = spr_fakepeppino_vulnerable
                    stunned = 200
                    flash = true
                    repeat (4)
                        create_debris(x, y, spr_slapstar)
                }
                return true;
            }
        }
    }
    if (instance_exists(argument0) && argument0.invtime == 0 && argument0.state != states.grabbed && (!argument0.invincible) && argument0.instantkillable)
    {
        if (room == boss_pizzaface && (argument0.object_index == obj_pepperman || argument0.object_index == obj_vigilanteboss || argument0.object_index == obj_noiseboss || argument0.object_index == obj_fakepepboss || argument0.object_index == obj_pizzafaceboss_p3))
        {
            other.baddiegrabbedID = argument0
            with (argument0)
            {
                grabbedby = 1
                scr_boss_grabbed()
            }
        }
        else
        {
            argument0.invtime = 15
            fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
            if (!argument0.important)
            {
                global.style += (5 + global.combo)
                global.combotime = 60
                global.heattime = 60
            }
            var lag = 2
            argument0.hitLag = lag
            argument0.hitX = argument0.x
            argument0.hitY = argument0.y
            argument0.mach3destroy = true
            argument0.override_throw = true
            argument0.hp -= 1
            instance_create(argument0.x, argument0.y, obj_parryeffect)
            argument0.alarm[3] = 3
            argument0.state = states.hit
            if (argument0.x != other.x)
                argument0.image_xscale = sign(other.x - argument0.x)
            else
                argument0.image_xscale = (-other.image_xscale)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            instance_create(x, y, obj_baddiegibs)
            instance_create(x, y, obj_baddiegibs)
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = 3 / room_speed
            }
            argument0.invtime = 30
            argument0.hitvsp = -4
            argument0.hithsp = (-argument0.image_xscale) * 22
        }
        return true;
    }
    return false;
}
)
ds_map_set(collision_function, 122, function(argument0) //gml_Script_anon_gml_Object_obj_playerbombexplosion_Create_0_4930_gml_Object_obj_playerbombexplosion_Create_0
{
    with (argument0)
    {
        if (fall && hp > 0)
        {
            scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
            with (other)
            {
                instance_create(x, y, obj_bangeffect)
                if (frac(other.hp) == 0)
                {
                    repeat (4)
                        create_debris((other.x + (random_range(0, 64))), (other.y + (random_range(0, 64))), spr_marbledebris)
                }
                repeat (3)
                {
                    with (instance_create((x + (random_range(0, 64))), (y + (random_range(0, 64))), obj_parryeffect))
                    {
                        sprite_index = spr_deadjohnsmoke
                        image_speed = 0.35
                    }
                }
            }
            with (obj_pepperman)
            {
                if (phase == 2)
                    other.hp -= 0.5
                else
                    other.hp -= 1
            }
            if (hitLag > 0)
            {
                x = hitX
                y = hitY
            }
            hitX = x
            hitY = y
            hitLag = 10
            return true;
        }
    }
    return false;
}
)
ds_map_set(collision_function, 896, function(argument0) //gml_Script_anon_gml_Object_obj_playerbombexplosion_Create_0_5873_gml_Object_obj_playerbombexplosion_Create_0
{
    instance_destroy(argument0)
    return true;
}
)
ds_map_set(collision_function, 387, function(argument0) //gml_Script_anon_gml_Object_obj_playerbombexplosion_Create_0_5977_gml_Object_obj_playerbombexplosion_Create_0
{
    if scr_pistolhit(argument0, pistol_damage)
        return true;
    return false;
}
)
