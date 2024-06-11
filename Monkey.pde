class Monkey extends Animal {
  
  final String monkey_sprites_path = animals_sprites_path + "Monkey/";
  
  Monkey(PVector start_position)
  {
    super(start_position);
    
    // constants and max values
    max_velocity = 18;  // Maximum velocity
    acceleration_increment = 0.08;  // Increment for acceleration
    friction = 0.90;  // Friction coefficient to slow down the squirrel
    
    // Map arrow keys to acceleration vectors
    key_mapping.put(UP, new PVector(0, -acceleration_increment));  // Accelerate forward
    key_mapping.put(DOWN, new PVector(0, acceleration_increment));  // Accelerate backward
    key_mapping.put(LEFT, new PVector(-acceleration_increment, 0));  // Accelerate left
    key_mapping.put(RIGHT, new PVector(acceleration_increment, 0));  // Accelerate right
    
    moving_sprite = new PImage[6];
    moving_sprite[0] = loadImage(monkey_sprites_path + "Run/MankeyJungle_Run_1.png");
    moving_sprite[1] = loadImage(monkey_sprites_path + "Run/MankeyJungle_Run_2.png");
    moving_sprite[2] = loadImage(monkey_sprites_path + "Run/MankeyJungle_Run_3.png");
    moving_sprite[3] = loadImage(monkey_sprites_path + "Run/MankeyJungle_Run_4.png");
    moving_sprite[4] = loadImage(monkey_sprites_path + "Run/MankeyJungle_Run_5.png");
    moving_sprite[5] = loadImage(monkey_sprites_path + "Run/MankeyJungle_Run_6.png");

    idle_sprite = new PImage[5];
    idle_sprite[0] = loadImage(monkey_sprites_path + "Idle/MankeyJungle_Idle_1.png");
    idle_sprite[1] = loadImage(monkey_sprites_path + "Idle/MankeyJungle_Idle_2.png");
    idle_sprite[2] = loadImage(monkey_sprites_path + "Idle/MankeyJungle_Idle_3.png");
    idle_sprite[3] = loadImage(monkey_sprites_path + "Idle/MankeyJungle_Idle_4.png");
    idle_sprite[4] = loadImage(monkey_sprites_path + "Idle/MankeyJungle_Idle_5.png");
  }
}
