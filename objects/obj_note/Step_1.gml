/// @description double note fix FIX THE CRAP
//note spacing
var _flip=-48*obj_song.notespeed

if(obj_stats.downscroll)
	_flip *= -1;
/*
if y>=obj_uinotes.y-(32*obj_song.notespeed) {
    image_blend=c_green
} else {
    image_blend=c_white
}
*/
if place_meeting(x,y+_flip,obj_note) && obj_song.songpos>0 {
    if !obj_stats.downscroll {
        var noteabove = -1
        var noteabove = instance_position(x,y+_flip,obj_note) //gets the id of the note above it
        if instance_exists(noteabove) {
            if (noteabove.y>=obj_uinotes.y-(32*obj_song.notespeed)) && (noteabove.type=1 || noteabove.type=2 || noteabove.type=3 || noteabove.type=8 || noteabove.type=9) {
                hitable=false;
                //image_blend=c_red
            } else {
                hitable=true;
                //image_blend=c_white
            }
        } else {
            hitable=true;
            //image_blend=c_white
        }
    } else {
        var noteabove = -1
        var noteabove = instance_position(x,y+_flip,obj_note) //gets the id of the note above it
        if instance_exists(noteabove) {
            if (noteabove.y<=obj_uinotes.y+(32*obj_song.notespeed)) && (noteabove.type=1 || noteabove.type=2 || noteabove.type=3 || noteabove.type=8 || noteabove.type=9) {
                hitable=false;
                //image_blend=c_red
            } else {
                hitable=true;
                //image_blend=c_white
            }
        } else {
            hitable=true;
            //image_blend=c_white
        }
    }
} else {
    hitable=true;
    //image_blend=c_white
}

/* */
/*  */
