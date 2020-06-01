obj
	sign
		name = "sign"
		icon_state = "sign"
		density=1
		anchored=1
		var/Message=""
		var/buildinghealth = 10
		DblClick()
			if(usr.z==1) return
			if(usr.shackled==1) return
			if(get_dist(src,usr) <= 1)
				if(buildinghealth >= 1)
					if(usr.inHand(/item/weapon/axe))
						if(buildinghealth >= 1)
							hearers(usr) <<"[usr] chops the [src]"
							buildinghealth-=1
						if(buildinghealth == 0)
							hearers(usr) <<"[usr] cuts the [src] down"
							del src
						return
			usr << output(null, "sign.output")
			winset(usr, "sign", "title=\"[src.name]\"")
			winshow(usr, "sign")
			usr << output(censorText(src.Message), "sign.output")
			..()
		verb
			Engrave()
				set src in view(1)
				if(usr.shackled==1) return
				var/newmsg=input(usr,"What do you want to engrave?","Sign","[src.Message]") as message
				Message=newmsg
		Dungeon_Entrence
			name="Dungeon Ahead!"
			Message = "Welcome to the dungeon"
	gravestone
		name = "gravestone"
		icon = 'icons/turfs.dmi'
		icon_state = "gsign"
		density=1
		anchored=1
		var/Message=""
		var/buildinghealth = 10
		DblClick()
			if(usr.z==1) return
			if(usr.shackled==1) return
			if(get_dist(src,usr) <= 1)
				if(buildinghealth >= 1)
					if(usr.inHand(/item/weapon/sledgehammer))
						if(buildinghealth >= 1)
							hearers(usr) <<"[usr] hits the [src] with his Sledgehammer"
							buildinghealth-=1
						if(buildinghealth == 0)
							hearers(usr) <<"[usr] smashs the [src] down"
							del src
						return
			usr << output(null, "sign.output")
			winset(usr, "sign", "title=\"[src.name]\"")
			winshow(usr, "sign")
			usr << output(censorText(src.Message), "sign.output")
			..()
		verb
			Engrave()
				set src in view(1)
				if(usr.shackled==1) return
				var/newmsg=input(usr,"What do you want to engrave?","Gravestone","[src.Message]") as message
				Message=newmsg
turf
	icon = 'icons/Turfs.dmi'
	proc/Destroy()
	table
		name = "table"
		icon_state = "table"
		density = 1
		var/buildinghealth = 5
		Enter(atom/movable/A)
			if(istype(A, /projectile) || istype(A, /obj/cannonball)) return 1
			return ..()
		DblClick()
			if(!isturf(usr.loc)) return
			if(usr.z==1) return
			if(usr.shackled==1) return
			if(get_dist(src,usr) <= 1)
				if(buildinghealth >= 1)
					if(usr.inHand(/item/weapon/axe))
						if(buildinghealth >= 1)
							hearers(usr) <<"[usr] chops the [src]"
							buildinghealth-=1
						if(buildinghealth == 0)
							hearers(usr) <<"[usr] cuts the [src] down"
							var/z = src.z
							src.Destroy()
							if(MapLayer(z) <= 0 && MapLayer(z) > -2)
								new/turf/path(locate(src.x,src.y,src.z))
							else if(MapLayer(z) == -2)
								new/turf/hard_floor(locate(src.x,src.y,src.z))
							else if(MapLayer(z) == -3)
								new/turf/chaos_brick(locate(src.x,src.y,src.z))
							else
								new/turf/sky(locate(src.x,src.y,src.z))
			..()
		north
			icon_state = "table"
			dir = NORTH
			density = 1
		east
			icon_state = "table"
			dir = EAST
			density = 1
		south
			icon_state = "table"
			dir = SOUTH
			density = 1
		west
			icon_state = "table"
			dir = WEST
			density = 1
		alone
			icon_state = "tableA"
			density = 1
		northeast
			icon_state = "table"
			dir = NORTHEAST
			density = 1
		northwest
			icon_state = "table"
			dir = NORTHWEST
			density = 1
		southeast
			icon_state = "table"
			dir = SOUTHEAST
			density = 1
		southwest
			icon_state = "table"
			dir = SOUTHWEST
			density = 1
		middle
			icon_state = "tableM"
			density = 1
obj
	table
		anchored=1
		name = "table"
		icon_state = "table"
		density = 1
		var/buildinghealth = 5
		DblClick()
			if(usr.z==1) return
			if(usr.shackled==1) return
			if(get_dist(src,usr) <= 1)
				if(buildinghealth >= 1)
					if(usr.inHand(/item/weapon/axe))
						if(buildinghealth >= 1)
							hearers(usr) <<"[usr] chops the [src]"
							buildinghealth-=1
						if(buildinghealth == 0)
							hearers(usr) <<"[usr] cuts the [src] down"
							del src
			..()
		north
			icon_state = "table"
			dir = NORTH
			density = 1
		east
			icon_state = "table"
			dir = EAST
			density = 1
		south
			icon_state = "table"
			dir = SOUTH
			density = 1
		west
			icon_state = "table"
			dir = WEST
			density = 1
		alone
			icon_state = "tableA"
			density = 1
		northeast
			icon_state = "table"
			dir = NORTHEAST
			density = 1
		northwest
			icon_state = "table"
			dir = NORTHWEST
			density = 1
		southeast
			icon_state = "table"
			dir = SOUTHEAST
			density = 1
		southwest
			icon_state = "table"
			dir = SOUTHWEST
			density = 1
		middle
			icon_state = "tableM"
			density = 1
obj
	icon = 'icons/Turfs.dmi'
	chair
		icon_state = "chair"
		name = "chair"
		anchored = 0
		var/buildinghealth = 5
		DblClick()
			if(usr.z==1) return
			if(usr.shackled==1) return
			if(get_dist(src,usr) <= 1)
				if(buildinghealth >= 1)
					if(usr.inHand(/item/weapon/axe))
						if(buildinghealth >= 1)
							hearers(usr) <<"[usr] chops the [src]"
							buildinghealth-=1
						if(buildinghealth == 0)
							hearers(usr) <<"[usr] cuts the [src] down"
							del src
			..()
		verb/rotate()
			set src in view(1)
			if(usr.restrained()) return
			dir = turn(dir, 90)
			if(dir == SOUTH) layer = OBJ_LAYER
			else layer = MOB_LAYER + 10
		south
			dir = SOUTH
		north
			dir = NORTH
			layer = MOB_LAYER+10
		east
			dir = EAST
			layer = MOB_LAYER+10
		west
			dir = WEST
			layer = MOB_LAYER+10

turf
	wooden
		var/buildinghealth = 1
		New()
			. = ..()
			if(buildinghealth == 1)
				buildinghealth = rand(10,15)
			spawn refresh_sky(src)
		Destroy()
			. = ..()
			refresh_sky(src)
		DblClick()
			if(!isturf(usr.loc)) return
			if(usr.shackled==1) return
			if(usr.z==1) return
			if(get_dist(src,usr) <= 1)
				if(buildinghealth >= 1)
					if(usr.inHand(/item/weapon/axe))
						if(buildinghealth >= 1)
							hearers(usr) <<"[usr] cuts the [src]"
							buildinghealth-=1
						if(buildinghealth == 0)
							hearers(usr) <<"[usr] smashs the [src] down"
							var/z = src.z
							src.Destroy()
							if(MapLayer(z) <= 0 && MapLayer(z) > -2)
								new/turf/path(locate(src.x,src.y,src.z))
							else if(MapLayer(z) == -2)
								new/turf/hard_floor(locate(src.x,src.y,src.z))
							else if(MapLayer(z) == -3)
								new/turf/chaos_brick(locate(src.x,src.y,src.z))
							else
								new/turf/sky(locate(src.x,src.y,src.z))
			..()

		icon = 'icons/wood.dmi'
/*		staircase
			icon_state = "staircase"
			Entered()
				if(usr.z != worldz)
					usr.descend() */
		wood_window_wall
			icon_state = "none"
			density = 1
			name="windowed wood wall"
		wood_windowed_wall
			name="windowed wood wall"
			icon_state = "sclosed"
			density=1
			opacity=1
			Click()
				if(usr.shackled==1) return
				if(get_dist(src,usr) <= 1)
					if(icon_state == "sopen")
						icon_state = "sclosed"
						sd_SetOpacity(1)
					else
						icon_state = "sopen"
						sd_SetOpacity(0)
				..()
		wood_wall
			icon_state = "wall"
			density=1
			opacity=1
			DblClick()
				. = ..()
				if(!(src in range(1, usr))) return
				usr.show_message("<tt>You push the wall but nothing happens!</tt>")
		wood_floor
			buildinghealth = 2
			icon_state = "floor"

		rope_bridge
			buildinghealth=5
			icon_state="bridge"
			DblClick()
				if(!isturf(usr.loc)) return
				if(usr.shackled==1) return
				if(get_dist(src,usr) <= 1)
					if(buildinghealth >= 1)
						if(usr.inHand(/item/weapon/axe))
							if(buildinghealth >= 1)
								hearers(usr) <<"[usr] cuts the [src]"
								buildinghealth-=1
							if(buildinghealth == 0)
								hearers(usr) <<"[usr] smashs the [src] down"
								var/z = src.z
								src.Destroy()
								if(MapLayer(z) <= 0 && MapLayer(z) > -2)
									new/turf/path(locate(src.x,src.y,src.z))
								else if(MapLayer(z) == -2)
									new/turf/hard_floor(locate(src.x,src.y,src.z))
								else if(MapLayer(z) == -3)
									new/turf/chaos_brick(locate(src.x,src.y,src.z))
								else
									new/turf/sky(locate(src.x,src.y,src.z))

	stone
		var/buildinghealth = 1
		New()
			. = ..()
			if(buildinghealth == 1)
				buildinghealth = rand(10,15)
			spawn refresh_sky(src)
		Destroy()
			. = ..()
			refresh_sky(src)
		DblClick()
			if(!isturf(usr.loc)) return
			if(usr.z==1) return
			if(usr.shackled==1) return
			if(get_dist(src,usr) <= 1)
				if(buildinghealth >= 1)
					if(usr.inHand(/item/weapon/sledgehammer))
						if(buildinghealth >= 1)
							hearers(usr) <<"[usr] hits the [src] with his Sledgehammer"
							buildinghealth-=1
						if(buildinghealth == 0)
							hearers(usr) <<"[usr] smashs the [src] down"
							var/z = src.z
							src.Destroy()
							if(MapLayer(z) <= 0 && MapLayer(z) > -2)
								new/turf/path(locate(src.x,src.y,src.z))
							else if(MapLayer(z) == -2)
								new/turf/hard_floor(locate(src.x,src.y,src.z))
							else if(MapLayer(z) == -3)
								new/turf/chaos_brick(locate(src.x,src.y,src.z))
							else
								new/turf/sky(locate(src.x,src.y,src.z))
			..()
		icon='icons/stone.dmi'
		stone_wall
			icon_state = "stone wall"
			density = 1
			opacity = 1
			DblClick()
				. = ..()
				if(!(src in range(1, usr))) return
				usr.show_message("<tt>You push the wall but nothing happens!</tt>")
		stained_glass_window
			var/hits = 0
			icon_state = "stwindow"
			density = 1
			DblClick()
				if(usr.shackled==1) return
				if(get_dist(src,usr) <= 1)
					if(src.icon_state == "stwindow")
						if(hits <= 4)
							hearers() << "[usr] hits the stained glass window!"
							hits += 1
						else
							hearers() << "[usr] shatters the stained glass window!"
							src.icon_state = "stwindows"
							src.name = "stone wall"
				..()
		stone_floor
			buildinghealth = 2
			icon_state = "stone floor8"

		stone_window_wall
			icon_state = "none"
			density = 1
			name="windowed stone wall"
		stone_windowed_wall
			name="windowed stone wall"
			icon_state = "sclosed"
			density=1
			opacity=1
			Click()
				if(usr.shackled==1) return
				if(get_dist(src,usr) <= 1)
					if(icon_state == "sopen")
						icon_state = "sclosed"
						sd_SetOpacity(1)
					else
						icon_state = "sopen"
						sd_SetOpacity(0)
				..()



obj
	wooden
		anchored=1
		fence
			name="Fence"
			icon_state = "fence"
			density=1
			buildinghealth=4
		gate
			name="Gate"
			icon_state = "fence close"
			density=1
			buildinghealth=4
			Click()
				if(usr.shackled==1) return
				if(get_dist(src,usr) <= 1)
					if(icon_state == "fence open")
						icon_state = "fence close"
						density=1
					else
						icon_state = "fence open"
						density=0
				..()
		var/buildinghealth = 1
		New()
			..()
			if(buildinghealth == 1)
				buildinghealth = rand(10,15)
		DblClick()
			if(usr.shackled==1) return
			if(get_dist(src,usr) <= 1)
				if(buildinghealth >= 1)
					if(usr.inHand(/item/weapon/axe))
						if(buildinghealth >= 1)
							hearers(usr) <<"[usr] cuts the [src]"
							buildinghealth-=1
						if(buildinghealth == 0)
							hearers(usr) <<"[usr] smashs the [src] down"
							del src
			..()

		icon = 'icons/wood.dmi'
		wood_window_wall
			icon_state = "none"
			density = 1
			name="windowed wood wall"
		wood_windowed_wall
			name="windowed wood wall"
			icon_state = "sclosed"
			density = 1
			opacity=1
			Click()
				if(usr.shackled==1) return
				if(get_dist(src,usr) <= 1)
					if(icon_state == "sopen")
						icon_state = "sclosed"
						density = 1
						sd_SetOpacity(1)
					else
						icon_state = "sopen"
						density = 1
						sd_SetOpacity(0)
				..()
		wood_wall
			icon_state = "wall"
			density = 1
			opacity=1
		wood_floor
			buildinghealth = 2
			icon_state = "floor"

	stone
		anchored=1
		var/buildinghealth = 1
		New()
			if(buildinghealth == 1)
				buildinghealth = rand(10,15)
		DblClick()
			if(usr.shackled==1) return
			if(get_dist(src,usr) <= 1)
				if(buildinghealth >= 1)
					if(usr.inHand(/item/weapon/sledgehammer))
						if(buildinghealth >= 1)
							hearers(usr) <<"[usr] hits the [src] with his Sledgehammer"
							buildinghealth-=1
						if(buildinghealth == 0)
							hearers(usr) <<"[usr] smashs the [src] down"
							del src
			..()
		icon='icons/stone.dmi'
		stone_wall
			icon_state = "stone wall"
			density = 1
			opacity = 1
		stained_glass_window
			var/hits = 0
			icon_state = "stwindow"
			density = 1
			DblClick()
				if(usr.shackled==1) return
				if(get_dist(src,usr) <= 1)
					if(src.icon_state == "stwindow")
						if(hits <= 4)
							hearers() << "[usr] hits the stained glass window!"
							hits += 1
						else
							hearers() << "[usr] shatters the stained glass window!"
							src.icon_state = "stwindows"
							src.name = "stone wall"
				..()
		stone_floor
			buildinghealth = 2
			icon_state = "stone floor8"
		stone_window_wall
			icon_state = "none"
			density = 1
			name="windowed stone wall"
		stone_windowed_wall
			name="windowed stone wall"
			icon_state = "sclosed"
			density = 1
			opacity=1
			Click()
				if(usr.shackled==1) return
				if(get_dist(src,usr) <= 1)
					if(icon_state == "sopen")
						icon_state = "sclosed"
						sd_SetOpacity(1)
					else
						icon_state = "sopen"
						sd_SetOpacity(0)
				..()
turf
	Misc
		Void_Wall
			name = ""
			icon = 'Void Wall.dmi'
			icon_state = "stone floor8"
			density = 1
			opacity = 1

turf
	void_stone
		icon = 'icons/turfs.dmi'
		icon_state = "odd_stone_brick_wall"
		odd_stone_brick_wall
			density = 1
			opacity = 1
		odd_stone_brick_window
			icon_state = "odd_stone_brick_window"
			density = 1
			opacity = 0
		void_stone_wall
			icon_state = "void_stone"
			density = 1
			opacity = 1
		void_stone_floor
			icon_state = "void_floor"
			density = 1
			opacity = 0