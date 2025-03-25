/obj/machinery/myui
	name = "My UI Block"
	desc = "A custom machine with an interface."
	icon = 'icons/obj/machines/cloning.dmi'
	icon_state 	= "pod_1" 	// pod_g for active
	anchored 	= TRUE
	var/active 	= FALSE

/obj/machinery/myui/attack_hand(mob/user)
	user.show_message("Вы нажали на [src].")
	src.ui_interact(user)

/obj/machinery/myui/update_icon()
	if (active)
		icon_state = "pod_1"
	else
		icon_state = "pod_g"
	return ..()

/*##################
##### UI PROCS #####
*/
/obj/machinery/myui/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "MyUIBlock", name)
		ui.open()

/obj/machinery/myui/ui_static_data(mob/user)
	return list("active" = active)

/obj/machinery/myui/ui_act(action, params)
	. = ..()
	if (action == "toggle_power")
		active = !active
		update_icon()
		return TRUE


/*##################
##### /UI PROCS/ #####
*/
