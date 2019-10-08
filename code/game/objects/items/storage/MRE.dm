/obj/item/storage/MRE
	name = "\improper MRE"
	desc = "Meal Ready-to-Eat, meant to be consumed in the field, and has an expiration that is two decades past a marine's average combat life expectancy. Nice."
	icon_state = "deliverypackage2"
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound =  'sound/items/handling/cardboardbox_pickup.ogg'
	var/isopened = 0

/obj/item/storage/MRE/ComponentInitialize()
	. = ..()
	pickflavor()

/obj/item/storage/MRE/proc/pickflavor()
	var/entree = pick("boneless pork ribs", "grilled chicken", "pizza square", "spaghetti", "chicken tenders")
	var/side = pick("meatballs", "cheese spread", "beef turnover", "mashed potatoes")
	var/snack = pick("biscuit", "pretzels", "peanuts", "cracker")
	var/dessert = pick("spiced apples", "chocolate brownie", "sugar cookie", "choco bar", "crayon")
	var/cigs = pick("", "cigpack_midori", "cigpack_uplift", "cigpack_robust", "cigpack_robustgold","cigpack_carp")
	name = "[initial(name)] [entree]"
	new /obj/item/reagent_containers/food/snacks/packaged_meal(src, entree)
	new /obj/item/reagent_containers/food/snacks/packaged_meal(src, side)
	new /obj/item/reagent_containers/food/snacks/packaged_meal(src, snack)
	new /obj/item/reagent_containers/food/snacks/packaged_meal(src, dessert)
	new /obj/item/storage/fancy/cigarettes(src, cigs)
	new /obj/item/storage/box/matches

/obj/item/storage/MRE/update_icon()
	if(!isopened)
		isopened = 1
		to_chat(usr, "<span class='notice'>Lets get this out onto a tray, nice.</span>")
		icon_state = "deliverypackage1"
