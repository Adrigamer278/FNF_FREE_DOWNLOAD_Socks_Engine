function trace() //trace
{
    var _string = ""
    for (i = 0; i < argument_count; i++)
        _string += "[" + string(argument[i]) + "]"
    show_debug_message(_string )
    return;
}

function flip(argument0)
{
	return 1 - argument0;	
}

function tween(time, duraction, from, to)
{
	return(lerp(from, to, flip(sqr(flip(time/duraction)))))
}