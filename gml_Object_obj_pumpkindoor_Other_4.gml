event_inherited()
sprite_index = spr_pumpkingate
if ((!(is_holiday((1 << 0)))) || quick_ini_read_real("", "halloween", "pumpkincount", 0) < 20 || global.panic)
{
    instance_destroy()
    if is_holiday((1 << 0))
    {
        with (instance_create(x, y, obj_doorblocked))
        {
            sprite_index = spr_pumpkingate2
            depth = other.depth
        }
    }
}
