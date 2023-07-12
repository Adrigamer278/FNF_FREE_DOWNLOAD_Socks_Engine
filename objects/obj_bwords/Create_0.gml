if(obj_stats.randomMenuSong == 0)
{
	nextSeq = 8.72
	obj_midi_clock.bpm = 110
}
else
{
	nextSeq = 14.69
	obj_midi_clock.bpm = 150
}

song=audio_play_sound(asset_get_index("mus_menu" + string(obj_stats.randomMenuSong)),9999,true)

trace("mus_menu" + string(obj_stats.randomMenuSong))


randomtextvar=random(250) div 1
text[1]="bopeebo"
text[2]="roses"
part=0
tick=0
