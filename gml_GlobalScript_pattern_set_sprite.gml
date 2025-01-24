function pattern_set_sprite(argument0, argument1, argument2, argument3, argument4) //gml_Script_pattern_set_sprite
{
    if (argument4 == undefined)
        argument4 = false
    var _tex = sprite_get_texture(argument0, argument1)
    var _uvs = sprite_get_uvs(argument0, argument1)
    if argument4
    {
        var langspr = lang_get_sprite(argument0)
        if (langspr != -4)
        {
            argument1 = floor(argument1)
            var frame = lang_get_frame(langspr, argument1)
            var texture = lang_get_texture(frame.texture)
            if (texture != -4)
            {
                _tex = sprite_get_texture(texture, 0)
                var texw = texture_get_width(_tex) / texture_get_texel_width(_tex)
                var texh = texture_get_height(_tex) / texture_get_texel_height(_tex)
                _uvs = [(frame.x / texw), (frame.y / texh), ((frame.x + frame.width) / texw), ((frame.y + frame.height) / texh), frame.crop_x, frame.crop_y]
            }
        }
    }
    shader_set_uniform_f(global.Pattern_Spr_UVs, _uvs[0], _uvs[1], _uvs[2], _uvs[3])
    shader_set_uniform_f(global.Pattern_Spr_Tex_Data, _uvs[4], _uvs[5], (texture_get_width(_tex) / texture_get_texel_width(_tex)), (texture_get_height(_tex) / texture_get_texel_height(_tex)))
    shader_set_uniform_f(global.Pattern_Spr_Scale, argument2, argument3)
}
