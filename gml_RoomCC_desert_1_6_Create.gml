func = function(argument0) //gml_Script_anon_gml_RoomCC_desert_1_6_Create_7_gml_RoomCC_desert_1_6_Create
{
    if (active == false && argument0.state == states.backbreaker)
    {
        active = true
        obj_secretmanager.touchedtriggers += 1
    }
}
