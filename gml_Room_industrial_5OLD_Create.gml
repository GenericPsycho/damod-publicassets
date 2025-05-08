pal_swap_init_system(shd_pal_swapper)
global.roommessage = "WELCOME TO PIZZA TOWER"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = true
    secret_add(-4, function() //gml_Script_anon_gml_Room_industrial_5OLD_Create_189_gml_Room_industrial_5OLD_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //gml_Script_anon_gml_Room_industrial_5OLD_Create_277_gml_Room_industrial_5OLD_Create
    {
        secret_open_portal(1)
    }
)
}
