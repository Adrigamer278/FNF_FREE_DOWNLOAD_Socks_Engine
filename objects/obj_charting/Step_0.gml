/// @description controlls + stuff 

//It would be cool if I wrote down the id of only one obj_notespace from (notes * 2) and when only one is loaded, 
//the rest would be loaded, but I think that's enough for now
scr_deactivate_obj(obj_notespace);

if(alarm[0] < 0)
	alarm[0] = 10

//play the song
if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space) {
    if songpos=-1 or (!audio_is_playing(songplaying) && !audio_is_paused(songplaying)){
        songplaying=audio_play_sound(song,9999,false)
        songpos=audio_sound_get_track_position(songplaying)
    } else {
        if audio_is_paused(songplaying) {
            audio_resume_sound(songplaying)
        } else {
            audio_pause_sound(songplaying)
        }
    }
}


if songpos>-1 {
//moving through song
if keyboard_check_pressed(vk_up) or mouse_wheel_up() {
    songpos-=audio_sound_length(songplaying)/songlong
    audio_sound_set_track_position(songplaying,songpos)
}
if keyboard_check_pressed(vk_down) or mouse_wheel_down() {
    songpos+=audio_sound_length(songplaying)/songlong
    audio_sound_set_track_position(songplaying,songpos)
}
//MAAATH
    songpos=audio_sound_get_track_position(songplaying)
    yy =(songpos/60*bpm*4)*16
	camera_set_view_pos(view_camera[0], 0, yy);
}

if (songWrite)
{
	//keyboard_string = ""
	songWriter += keyboard_string;
	keyboard_string = ""
	
	if(keyboard_check_pressed(vk_backspace))
		songWriter=string_copy(songWriter, 1, string_length(songWriter)-1)		
}

if (songFileWrite)
{
	//keyboard_string = ""
	songFileWriter += keyboard_string;
	keyboard_string = ""
	
	if(keyboard_check_pressed(vk_backspace))
		songFileWriter=string_copy(songFileWriter, 1, string_length(songFileWriter)-1)		
}

if (bpmWrite)
{
	//keyboard_string = ""
	bpmWriter += keyboard_string;
	keyboard_string = ""
	
	if(keyboard_check_pressed(vk_backspace))
		bpmWriter=string_copy(bpmWriter, 1, string_length(bpmWriter)-1)		
}

//I bad at programming
var coolThing = round(songpos/60*bpm*4)

if(hitsoundCheck)
{
	if songpos>-1
	{
		for (var cc=0; cc<notes*2; cc++) {
		    for (var c=0; c<songlong; c++) {
		       if note[cc,c] > 0 {
					//trace(c, "||", floor((floor(songpos * bpm) + 1)/15))
					//WARNING THIS IS A VERY BROKEN AND STUPID
		            if((c == coolThing) && audio_is_playing(songplaying))
					{
						if(!playHitSound)
							audio_play_sound(snd_hitsound, 999, 0)
						playHitSound = true
						hitsoundTimer = (bpm /songlong) * 12
						//playHitSound = !playHitSound
					}
		        }
		    }
		}
	}
}


if(playHitSound)
{
	hitsoundTimer--
	
	if(hitsoundTimer <= 0)
		playHitSound = false
}