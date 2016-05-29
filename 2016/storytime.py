import random
import os

while True:
    name = input('What is your name? ')
    print("Hello " + name)
    gender = input('What is your gender?' )
    print("Gender: " + name)
    if gender == "girl":
        pronoun = "she"
    elif gender == "boy":
        pronoun = "he"
    else:
        pronoun = "it"

    names = ["Ben", "Dave", "Liz", "Alex", "Rachel", "Chloe", "Ethan"]
    roles = ["knight", "pricess", "prince", "frog", "wizard", "fairy"]
    places = ["forest", "castle", "creek", "ballroom", "ocean"]
    actions = ["jumping", "wave of wand", "running", "walking", "swimming", "talking"]


    actor_name = random.choice(names)
    actor_role = random.choice(roles)
    quest = random.choice(actions)
    magic_place = random.choice(places)

    story = "Once upon a time, there was a " + actor_role +" called " + name + ".  " + pronoun + " and some friends found in the magic land of " + magic_place  + ". This land was ruled by " + actor_name + " the " + actor_role + ".  All of the sudden a mysterious voice spoke to them from high in the sky and said you must " + quest + " " + actor_name + " the " + actor_role + " to lift the curse of not being able to use technology... "

    print(story)

    os.system('flite -t "' + story + '"&')

    from sense_hat import SenseHat
    sense = SenseHat()
    sense.show_message(story, 0.015)


