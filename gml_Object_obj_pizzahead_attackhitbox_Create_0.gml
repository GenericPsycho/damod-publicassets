event_inherited()
dmg = 30
parryable = true
boss_parry_hitbox = function(argument0, argument1) //gml_Script_anon_gml_Object_obj_pizzahead_attackhitbox_Create_0_74_gml_Object_obj_pizzahead_attackhitbox_Create_0
{
    if (!argument1.collisioned)
    {
        self.SUPER_parry()
        with (obj_pizzafaceboss)
            self.SUPER_boss_hurt(30, argument0)
        with (argument1)
            event_user(0)
    }
}

