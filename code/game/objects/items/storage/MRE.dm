/obj/item/storage/mre
	name = "\improper MRE"
	desc = "Meal Ready-to-Eat, meant to be consumed in the field, and has an expiration that is two decades past a marine's average combat life expectancy. Nice."
	icon_state = "mealpack"
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	drop_sound = 'sound/items/handling/cardboardbox_drop.ogg'
	pickup_sound =  'sound/items/handling/cardboardbox_pickup.ogg'
	var/isopened = 0
	var/age = 2559 //default value

/obj/item/storage/mre/Initialize()
	. = ..()
	age = rand(1940, 2559)
	switch(age)
		if(2200 to 2559)
			desc = "Meal Ready-to-Eat, meant to be consumed in the field, it looks like this one is from [age]. Nice."
		if(1991 to 2199)
			desc = "Meal Ready-to-Eat, meant to be consumed in the field, it looks like this one is from [age]. A bit past expiration, hope there's no black mold."
		if(1940 to 1990)
			desc = "Meal Ready-to-Eat, meant to be consumed in the field, it looks like this one is from [age]. Definitely way past expiration. It looks a bit swelled, hope it's not botulism."
	pickflavor()


/obj/item/storage/mre/proc/pickflavor()
	var/entree = pick("boneless pork ribs", "grilled chicken", "pizza square", "spaghetti", "chicken tenders")
	var/side = pick("meatballs", "cheese spread", "beef turnover", "mashed potatoes")
	var/snack = pick("biscuit", "pretzels", "peanuts", "cracker")
	var/dessert = pick("spiced apples", "chocolate brownie", "sugar cookie", "choco bar", "crayon")
	var/obj/item/reagent_containers/food/snacks/packaged_meal/new_entree = new(src)
	var/obj/item/reagent_containers/food/snacks/packaged_meal/new_side = new(src)
	var/obj/item/reagent_containers/food/snacks/packaged_meal/new_snack = new(src)
	var/obj/item/reagent_containers/food/snacks/packaged_meal/new_dessert = new(src)
	var/cigs = pick(/obj/item/storage/fancy/cigarettes,
		/obj/item/storage/fancy/cigarettes/cigpack_midori,
		/obj/item/storage/fancy/cigarettes/cigpack_uplift,
		/obj/item/storage/fancy/cigarettes/cigpack_robust,
		/obj/item/storage/fancy/cigarettes/cigpack_robustgold,
		/obj/item/storage/fancy/cigarettes/cigpack_carp)
	name = "[initial(name)] ([entree])"
	new_entree.determinetype(entree, age)
	new_side.determinetype(side, age)
	new_snack.determinetype(snack, age)
	new_dessert.determinetype(dessert, age)
	new /obj/item/reagent_containers/food/drinks/coffeeinstant(src)
	new cigs(src)
	new /obj/item/storage/box/matches(src)

/obj/item/storage/mre/update_icon()
	if(!isopened)
		isopened = 1
		to_chat(usr, "<span class='notice'>Alright lets get this out onto a tray, nice.</span>")
		icon_state = "mealpackopened"
