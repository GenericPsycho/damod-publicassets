if (hurted == false && other.grounded == false && other.team == 0 && (state != states.backbreaker || parrytimer <= 0) && state != states.parry)
{
    instance_destroy(other)
    instance_create(x, y, obj_canonexplosion)
}