import processing.sound.*;

SoundFile pop_file;
SoundFile lost_file;

final float nutt_chance = 0.015;
final float max_nutt_size = 50;
final float min_nutt_size = 25;


PImage[] nutt_images = new PImage[2];
Animal animal;
Menu menu;
ArrayList<Nutt> nutts;

int nutts_collected = 0;
int remaning_lifes = 3;

PImage background;

void setup() {
  size(1000, 518);
  nutts = new ArrayList<Nutt>();
  background = loadImage("Images/background.jpeg");
  nutt_images[0] = loadImage("Images/Crops/Acorn.png");
  nutt_images[1] = loadImage("Images/Crops/Walnut.png");
  menu = new Menu();
  
 // Load a soundfile from the /data folder of the sketch and play it back
  pop_file = new SoundFile(this, "Sounds/pop.mp3");
  lost_file = new SoundFile(this, "Sounds/lost.wav");
  
}

void draw() {
  imageMode(CORNER);
  image(background, 0, 0);

  switch (menu.currentState) {
  case CHARACTER_SELECTION:
  case HISTORY:
  case MAIN_MENU:
    menu.display();
    break;
  case GAME:
    // Set text properties
    fill(255);  // Set the fill color (text color) to black
    textSize(32);  // Set the text size to 32 pixels
    textMode(MODEL);
    textAlign(BASELINE, BASELINE);
    text("Nutts collected: " + nutts_collected, 0, 32);
    text("Remaning Lifes: " + remaning_lifes, 0, 64);

    animal.display();
    update_moving_elements();
    break;

  default:
    break;
  }
}

void update_nutts_elements() {
  if (random(1) < nutt_chance) {
    float size = random(min_nutt_size, max_nutt_size);
    float half_size = size/2;
    PVector nutt_start_position = new PVector(random(half_size, (width-half_size)), 0, 0);
    nutts.add(new Nutt(nutt_start_position, size, nutt_images[int(random(2))]));
  }

  for (int i=0; i<nutts.size(); i++) {
    Nutt nutt = nutts.get(i);
    if (animal.is_colliding(nutt.position, nutt.size)) {
      nutts.remove(i);
      nutts_collected++;
      pop_file.play();
    } else if (nutt.position.y >= height) {
      nutts.remove(i);
      remaning_lifes--;
      lost_file.play();
      if (remaning_lifes < 1)
        menu.currentState = MenuState.MAIN_MENU;
      
    } else {
      nutt.display();
      nutt.update();
    }
  }
}

void update_moving_elements() {
  update_nutts_elements();
}

void keyPressed() {
  if(menu.currentState == MenuState.GAME)
    animal.on_key_pressed();
  else
    menu.on_key_pressed();
}

void keyReleased() {
  if(menu.currentState == MenuState.GAME)
    animal.on_key_release();
}
