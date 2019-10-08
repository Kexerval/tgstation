/obj/item/storage/MRE
	name = "\improper MRE"
	desc = "Meal Ready-to-Eat, meant to be consumed in the field, and has an expiration that is two decades past a marine's average combat life expectancy. Nice."
	icon_state = "mealpack"
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound =  'sound/items/handling/cardboardbox_pickup.ogg'
	var/isopened = 0

/obj/item/storage/MRE/ComponentInitialize()
	. = ..()
	desc = pick("Meal Ready-to-Eat, meant to be consumed in the field, and has an expiration that is two decades past a marine's average combat life expectancy. Nice.", "Meal Ready-to-Eat, meant to be consumed in the field, it looks like this one is from [rand(1910,2100)]. Definitely way past expiration. It looks a bit swelled.")
	pickflavor()

/obj/item/storage/MRE/proc/pickflavor()
	var/entree = pick("boneless pork ribs", "grilled chicken", "pizza square", "spaghetti", "chicken tenders")
	var/side = pick("meatballs", "cheese spread", "beef turnover", "mashed potatoes")
	var/snack = pick("biscuit", "pretzels", "peanuts", "cracker")
	var/dessert = pick("spiced apples", "chocolate brownie", "sugar cookie", "choco bar", "crayon")
	var/cigs = pick(/obj/item/storage/fancy/cigarettes,
		/obj/item/storage/fancy/cigarettes/cigpack_midori,
		/obj/item/storage/fancy/cigarettes/cigpack_uplift,
		/obj/item/storage/fancy/cigarettes/cigpack_robust,
		/obj/item/storage/fancy/cigarettes/cigpack_robustgold,
		/obj/item/storage/fancy/cigarettes/cigpack_carp)
	name = "[initial(name)] ([entree])"
	new /obj/item/reagent_containers/food/snacks/packaged_meal(src, entree)
	new /obj/item/reagent_containers/food/snacks/packaged_meal(src, side)
	new /obj/item/reagent_containers/food/snacks/packaged_meal(src, snack)
	new /obj/item/reagent_containers/food/snacks/packaged_meal(src, dessert)
	new /obj/item/reagent_containers/food/drinks/coffeeinstant(src)
	new cigs(src)
	new /obj/item/storage/box/matches(src)

/obj/item/storage/MRE/update_icon()
	if(!isopened)
		isopened = 1
		to_chat(usr, "<span class='notice'>Alright lets get this out onto a tray, nice.</span>")
		icon_state = "mealpackopened"
