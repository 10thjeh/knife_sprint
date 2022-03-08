#include <amxmodx>
#include <fun>

new PLUGIN[]="Knife Sprint"
new AUTHOR[]="the10thjeh"
new VERSION[]="1.00"

new Float:speed = 250.0

public plugin_init()
{
     register_plugin(PLUGIN, VERSION, AUTHOR)
     register_concmd("amx_knife_sprint", "cmd_sprint", ADMIN_SLAY, "<target> <hp>")
}

public plugin_precache(){
     precache_sound("misc/sprint.wav")	
}

public play_sprint_sound(id){
     client_cmd(id, "spk misc/sprint.wav")
}

public ks_showhudmessage(id){
     set_hudmessage(0, 255, 0, -1.0, -1.0, 0, 3.0, 1.0)
     show_hudmessage(id, "!!Sprint Activated!!")
}


public knife_sprint(){
     new players[32], num
     get_players(players, num)
     new i
     for(i = 0; i<num;i++){
	if(get_user_weapon(players[i]) == 29){ //29 is knife
	    if(speed == 250.0){
	    	play_sprint_sound(players[i])
		ks_showhudmessage(players[i])
		//client_print(0, print_chat, "Knife Sprint activated!")
	    }
	    
	    //client_print(0, print_chat, "Your current speed : %f", speed)
	    set_user_maxspeed(players[i],speed)
	    speed = speed + 25.0
	}
	else{
	    speed = 250.0	
	}
     }
}

public config_cvars(){
     new default_speed = 800
     set_cvar_num("sv_maxspeed", default_speed)
     set_cvar_num("cl_forwardspeed", default_speed)
     set_cvar_num("cl_backspeed", default_speed)
     set_cvar_num("cl_sidespeed", default_speed)
     
}

public cmd_sprint(id, level, cid)
{
     client_print(0, print_chat, "Knife Sprint Activated!")
     config_cvars()
     set_task(0.3, "knife_sprint", _, _, _, "b") 
     //knife_sprint()
	
      /*
     if (!cmd_access(id, level, cid, 3))
        return PLUGIN_HANDLED
	
     new Arg1[24]
     new Arg2[4]

     //Get the command arguments from the console
     read_argv(1, Arg1, 23)
     read_argv(2, Arg2, 3)

     //Convert the health from a string to a number
     new Health = str_to_num(Arg2)

     //Is the first character the @ symbol?
     if (Arg1[0] == '@')
     {
          new Team = 0
          if (equali(Arg1[1], "CT"))
          {
               Team = 2
          } else if (equali(Arg1[1], "T")) {
               Team = 1
          }
          new players[32], num
          get_players(players, num)
          new i
          for (i=0; i<num; i++)
          {
               if (!Team)
               {
                    set_user_health(players[i], Health)
               } else {
                    if (get_user_team(players[i]) == Team)
                    {
                         set_user_health(players[i], Health)
                    }
               }
          }
     } else {
          new player = cmd_target(id, Arg1, 1)
          if (!player)
          {
               console_print(id, "Sorry, player %s could not be found or targetted!", Arg1)
               return PLUGIN_HANDLED
          } else {
               set_user_health(player, Health)
          }
     }*/

     return PLUGIN_HANDLED
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ ansicpg1252\\ deff0\\ deflang1033{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ f0\\ fs16 \n\\ par }
*/
