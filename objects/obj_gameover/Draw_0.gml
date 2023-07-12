/// @description dude and text
shake=shake*-1
shake=shake/1.5
x=xx+shake
draw_set_halign(fa_center);
var stupid = make_colour_rgb(215,57,89)
var stupid2 = make_colour_rgb(162,51,103)
var time = floor(shader_get_uniform(sh_cool, "Time"))
var texel = floor(shader_get_uniform(sh_cool, "Texel"))
//sprite
shader_set(sh_cool)
    scr_skinswapdude(c_red);
        shader_set_uniform_f(time, current_time)
        shader_set_uniform_f(texel, -0.005, -0.005)
        draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,whatever/4)
    shader_reset();
shader_reset();
shader_set(sh_cool)
    scr_skinswapdude(c_blue);
        shader_set_uniform_f(time, current_time)
        shader_set_uniform_f(texel, 0.005, 0.005)
        draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_white,whatever/4)
    shader_reset();
shader_reset();
//real sprite
scr_skinswapdude(c_white);
    draw_sprite(sprite_index,0,x,y)
shader_reset();
//text
draw_text_colour(room_width/2,80+sin(current_time/200),string_hash_to_newline("retry?"),stupid,stupid,stupid2,stupid2,whatever)
//resetting stuff
draw_set_halign(fa_left);
draw_set_font(fnt_comic1);

