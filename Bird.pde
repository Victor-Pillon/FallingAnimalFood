class Bird extends Animal {
  
  final String bird_sprites_path = animals_sprites_path + "Bird/";
  
  Bird(PVector start_position)
  {
    super(start_position);
    
    // constants and max values
    max_velocity = 20;  // Maximum velocity
    acceleration_increment = 0.1;  // Increment for acceleration
    friction = 0.95;  // Friction coefficient to slow down the squirrel
    inverted_flip = true;
    
    // Map arrow keys to acceleration vectors
    key_mapping.put(UP, new PVector(0, -acceleration_increment));  // Accelerate forward
    key_mapping.put(DOWN, new PVector(0, acceleration_increment));  // Accelerate backward
    key_mapping.put(LEFT, new PVector(-acceleration_increment, 0));  // Accelerate left
    key_mapping.put(RIGHT, new PVector(acceleration_increment, 0));  // Accelerate right
    
    moving_sprite = new PImage[8];
    moving_sprite[0] = loadImage(bird_sprites_path + "Run/Bird_run_frame1.png");
    moving_sprite[1] = loadImage(bird_sprites_path + "Run/Bird_run_frame2.png");
    moving_sprite[2] = loadImage(bird_sprites_path + "Run/Bird_run_frame3.png");
    moving_sprite[3] = loadImage(bird_sprites_path + "Run/Bird_run_frame4.png");
    moving_sprite[4] = loadImage(bird_sprites_path + "Run/Bird_run_frame5.png");
    moving_sprite[5] = loadImage(bird_sprites_path + "Run/Bird_run_frame6.png");
    moving_sprite[6] = loadImage(bird_sprites_path + "Run/Bird_run_frame7.png");
    moving_sprite[7] = loadImage(bird_sprites_path + "Run/Bird_run_frame8.png");

    idle_sprite = new PImage[2];
    idle_sprite[0] = loadImage(bird_sprites_path + "Idle/Bird_idle_frame1.png");
    idle_sprite[1] = loadImage(bird_sprites_path + "Idle/Bird_idle_frame2.png");
  }
}
