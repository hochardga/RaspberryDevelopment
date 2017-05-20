#Clef Hero by Sean McManus
import pianohat, random, time
WIDTH, HEIGHT = 600, 440
RED = (255,0,0)
GREEN = (0,255,0)
BLUE = (0,0,255)
notes_to_play = list()
note_colours = list()
level = 1
notes_data = [
[0, sounds.note_01, 1, ""], [2, sounds.note_03, 2, ""],
[4, sounds.note_05, 3, ""], [5, sounds.note_06, 4, ""],
[7, sounds.note_08, 5, ""], [9, sounds.note_10, 6, ""], 
[11, sounds.note_12, 7,""], [0, sounds.note_13, 8, ""],
[2, sounds.note_15, 9, ""], [4, sounds.note_17, 10, ""],
[5, sounds.note_18, 11, ""],[7, sounds.note_20, 12, ""], 
[9, sounds.note_22, 13, ""], 
[1, sounds.note_02, 1, "#"],[3, sounds.note_04, 2, "#"], 
[6, sounds.note_07, 4, "#"],[8, sounds.note_09, 5, "#"],
[10, sounds.note_11, 6, "#"], [1, sounds.note_14, 8, "#"],
[3, sounds.note_16, 9, "#"], [6, sounds.note_19, 11, "#"], 
[8, sounds.note_21, 12, "#"], [10, sounds.note_23, 13, "#"],
[1, sounds.note_02, 2, "b"], [3, sounds.note_04, 3, "b"],
[6, sounds.note_07, 5, "b"], [8, sounds.note_09, 6, "b"], 
[10, sounds.note_11, 7, "b"], [1, sounds.note_14, 9, "b"],
[3, sounds.note_16, 10, "b"],[6, sounds.note_19, 12, "b"], 
[8, sounds.note_21, 13, "b"]
]

def round_setup():
   global note_position, note_number, notes_to_play
   del notes_to_play[:]
   del note_colours[:]
   level_data = notes_data[0 : level * 4]
   for i in range(8):
      notes_to_play.append(random.choice(level_data))
      note_colours.append(BLUE)
   note_position = 0
   note_number = 0
   clock.schedule_unique(hint_on, 5)

def draw():
   screen.blit(images.clef_background,(0,0))
   screen.draw.text("Clef", (310,90), color="blue", fontsize=120)
   screen.draw.text("Clef", (315,85), color="white", fontsize=120)
   screen.draw.text("Hero", (310,180), color="blue", fontsize=120)
   screen.draw.text("Hero", (315,175), color="white", fontsize=120)
   BOX = Rect((100,290), (400,120))
   SHADOW = Rect((105,295), (400,120))
   screen.draw.filled_rect(SHADOW, (0,0,0))
   screen.draw.filled_rect(BOX, (255,255,255))
   screen.blit(images.treble_clef,(105,305))
   for y in range(5):
      screen.draw.line((110, 380 - y*16), (490, 380 - y*16), (0,0,0))
   show_notes()

def show_notes():
   for i in range(8):
      draw_note(i)

def draw_note(note_number):
   screen.draw.filled_circle((180 + note_number * 35, 404 - notes_to_play[note_number][2]*8), 7, note_colours[note_number])
   if notes_to_play[note_number][2] == 1 or notes_to_play[note_number][2] == 13:
      screen.draw.line((170 + note_number * 35, 404 - notes_to_play[note_number][2]*8), (190 + note_number * 35, 404 - notes_to_play[note_number][2]*8), note_colours[note_number])   
   screen.draw.text(notes_to_play[note_number][3], (162 + note_number * 35, 395 - notes_to_play[note_number][2]*8), color = note_colours[note_number], fontsize=24)

def update():
   draw_note(note_position)

def handle_note(piano_key, pressed):
   global note_position, note_colours, level
   if pressed == False: #key was released not pressed
      return
   if piano_key == 12: #if top C pressed 
      piano_key = 0   # treat it the same as bottom C
   clock.unschedule(hint_on)
   if piano_key == notes_to_play[note_position][0]:
      note_colours[note_position] = GREEN
      notes_to_play[note_position][1].play()
      lights_out()
      if note_position < 7:    
         note_position += 1
      else:
         lights_on()
         if level < 8:
            level += 1
            round_setup()
      clock.schedule_unique(hint_on, 5)
   else:
      note_colours[note_position] = RED
      sounds.thud.play()

def hint_on():
   pianohat.set_led(notes_to_play[note_position][0], True)

def lights_out():
   for light in range(16):
      pianohat.set_led(light, False)

def lights_on():
   for light in range(13):
      pianohat.set_led(light, True)
   clock.schedule_unique(lights_out, 1)
        
lights_on()
round_setup()
pianohat.auto_leds(False)
pianohat.on_note(handle_note)
