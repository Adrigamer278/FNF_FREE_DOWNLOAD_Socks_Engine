if obj_stats.fullscreen
	sels=6 //I mean i dunno I might want to add more some day lol (I did)
else
	sels=5

if menu_state == MENU_STATE.normal {
//moving cursor
    if keyboard_check_pressed(vk_up) or gamepad_button_check_pressed(0,gp_padu){
        sel--
    }
    if keyboard_check_pressed(vk_down) or gamepad_button_check_pressed(0,gp_padd) {
        sel++
    }
    sel=clamp(sel,0,sels)
//updating text
    //downscroll
    if obj_stats.downscroll=false {
        var coolboys = "false"
    } else {
        var coolboys = "true"
    }
    options[0]=(string("DOWNSCROLL: ")+string(coolboys))
    options[1]="GHOST TAPPING: FALSE"
    options[2]="UPDATE KEYBINDS"
    //note tpyes
    if obj_stats.readable = false {
        var burger="funny"
    } else {
        var burger="readable"
    }
    options[3]=(string("NOTE TYPE: ")+string(burger))
    options[4]="CHANGE SKIN"
	options[5]="FULLSCREEN"
	
	if(obj_stats.funnyNotePos)
		var noteP = "funny"
	else
		var noteP = "normal"
	
	if(obj_stats.fullscreen)
		options[6]="NOTE POSITION: " + string(noteP)
//select something
    if (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0,gp_face1)) {
        switch(sel) {
        case 0: //downscroll
            with(obj_stats) {
                downscroll=!downscroll
            }
        break;
        case 1: //ghost tapping
            audio_stop_all();
            obj_stats.specialroom="chimpgame"
            room_goto(rm_special)
        break;
        case 2:
            keyd=0
            wait=5
            menu_state = MENU_STATE.mapping_keys;
        break;
        case 3: //readable notes
            with(obj_stats) {
                readable=!readable
            }
        break;
        case 4:
            wait=5
            menu_state = MENU_STATE.changing_skin;
        break;
		case 5:
			wait=5
            obj_stats.fullscreen = !obj_stats.fullscreen
        break;
		case 6:
			wait=5
			obj_stats.funnyNotePos = !obj_stats.funnyNotePos
		break;
        }   
    }
//now get out
    if (keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift) or keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(0,gp_face2)) {
        instance_create(0,0,obj_fadeout)
        obj_fadeout.roomgo=rm_stuffselect
    }
} 
if  menu_state == MENU_STATE.mapping_keys { //maping keys
    //WAIT, yeah im an idiot and need to delay this stuf lol
    if (keyboard_check_pressed(keyboard_lastkey) && wait = 0) {
        obj_stats.bind[keyd]=keyboard_lastkey
        wait=5
        if keyd<3 {
            keyd++
        } else {
            menu_state = MENU_STATE.normal;
        }
    }
}
wait--
wait=clamp(wait,0,10)

#region descriptionLOL
switch(sel)
{
	case 0:
		description = "Your Game Could Be Turned Upside Down"
	break;
	case 1:
		description = "Cheat GHOST TAPPING"
	break;
	case 2:
		description = "Let Me Play How I Want"
	break;
	case 3:
		description = "Man These Note Are Awesome!!!"
	break;
	case 4:
		description = "Change Yourself"
	break;
	case 5:
		description = "Make your Game BIG"
	break;
	case 6:
		description = "THIS IS SO STUPIT"
	break;
}
#endregion

if(!obj_stats.fullscreen)
	obj_stats.funnyNotePos = false