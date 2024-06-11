class Animal {
  PVector position;
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  Boolean boost_active = false;
  int current_sprite_index = 0;
  int frame_count = 0;
  int last_key = 1;
  Boolean inverted_flip = false;

  final int frames_to_update_sprite = 10;

  PImage[] moving_sprite;
  PImage[] idle_sprite; 
  PImage[] current_sprite, last_sprite;
  final String animals_sprites_path = "Images/Animals/";

  HashMap<Integer, PVector> key_mapping = new HashMap<Integer, PVector>();  // HashMap to map key codes to acceleration vectors
  ArrayList<Integer> active_keys = new ArrayList<Integer>();  // ArrayList to store active key codes

  // constants and max values
  float max_velocity;  // Maximum velocity
  float acceleration_increment;  // Increment for acceleration
  float friction;  // Friction coefficient to slow down the squirrel

  Animal(PVector start_position)
  {
    this.position = start_position;
  }

  void display() {

    update_position();

    pushMatrix();
    translate(this.position.x, this.position.y);
    imageMode(CENTER);

    if (active_keys.isEmpty()) {
      scale(last_key, 1);
      current_sprite = idle_sprite;
    } else {
      current_sprite = moving_sprite;
      if (active_keys.contains(LEFT) || active_keys.contains(UP) )
      {
        last_key = inverted_flip ? 1 : -1;
        scale(last_key, 1);
      }
      else if (active_keys.contains(RIGHT) || active_keys.contains(DOWN))
      {
        last_key = inverted_flip ? -1 : 1;
        scale(last_key, 1);
      }
    }
    
    if(current_sprite != last_sprite)
    {
     current_sprite_index = 0;
     last_sprite = current_sprite;
    }
    
    frame_count++;

    if (frame_count > frames_to_update_sprite)
    {
      frame_count = 0;
      current_sprite_index++;
      if (current_sprite_index >=  current_sprite.length)
        current_sprite_index = 0;
    }
    
    image(current_sprite[current_sprite_index], 0, 0, 90, 58);
    popMatrix();
  }

  void on_key_pressed() {
    if (key_mapping.containsKey(keyCode)) {
      if (!active_keys.contains(keyCode)) {
        active_keys.add(keyCode);
      }
    }
    if (keyCode == 32)
      boost_active = true;
  }

  void on_key_release() {
    acceleration.mult(0);
    if (active_keys.contains(keyCode)) {
      active_keys.remove(active_keys.indexOf(keyCode));
    }
    if (keyCode == 32)
      boost_active = false;
  }

  void update_position() {

    // Apply friction to the velocity and rotation
     //<>//
    this.velocity.mult(friction);

    // Update the velocity and position
    this.velocity.add(acceleration);
    this.velocity.limit(max_velocity);
    this.position.add(velocity);

    this.position.x = constrain(position.x, 30, width-30);
    this.position.y = constrain(position.y, 380, height-30);
    
    
    //println(friction);
    //println(acceleration);
    //println(velocity);
    //println(position);

    for (Integer key : active_keys) {
      PVector keyAcceleration = key_mapping.get(key);
      if (boost_active)
        this.acceleration.add(keyAcceleration.mult(2));
      else
        this.acceleration.add(keyAcceleration);
    }
  }

  Boolean is_colliding(PVector object_position, float object_radius) {
    float distance = PVector.dist(position, object_position);
    return distance < (10 + object_radius);
  }
}
