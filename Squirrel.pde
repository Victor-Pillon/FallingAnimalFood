class Squirrel extends Animal { //<>//
  
  final String squirrel_sprites_path = animals_sprites_path + "Squirrel/";
  
  Squirrel(PVector start_position)
  {
    super(start_position);
    
    // constants and max values
    max_velocity = 7;  // Maximum velocity
    acceleration_increment = 0.07;  // Increment for acceleration
    friction = 0.90;  // Friction coefficient to slow down the squirrel
    
    // Map arrow keys to acceleration vectors
    key_mapping.put(UP, new PVector(0, -acceleration_increment));  // Accelerate forward
    key_mapping.put(DOWN, new PVector(0, acceleration_increment));  // Accelerate backward
    key_mapping.put(LEFT, new PVector(-acceleration_increment, 0));  // Accelerate left
    key_mapping.put(RIGHT, new PVector(acceleration_increment, 0));  // Accelerate right

    moving_sprite = new PImage[6];
    moving_sprite[0] = loadImage(squirrel_sprites_path + "run/player-run-1.png");
    moving_sprite[1] = loadImage(squirrel_sprites_path + "run/player-run-2.png");
    moving_sprite[2] = loadImage(squirrel_sprites_path + "run/player-run-3.png");
    moving_sprite[3] = loadImage(squirrel_sprites_path + "run/player-run-4.png");
    moving_sprite[4] = loadImage(squirrel_sprites_path + "run/player-run-5.png");
    moving_sprite[5] = loadImage(squirrel_sprites_path + "run/player-run-6.png");

    idle_sprite = new PImage[8];
    idle_sprite[0] = loadImage(squirrel_sprites_path + "idle/player-idle-1.png");
    idle_sprite[1] = loadImage(squirrel_sprites_path + "idle/player-idle-2.png");
    idle_sprite[2] = loadImage(squirrel_sprites_path + "idle/player-idle-3.png");
    idle_sprite[3] = loadImage(squirrel_sprites_path + "idle/player-idle-4.png");
    idle_sprite[4] = loadImage(squirrel_sprites_path + "idle/player-idle-5.png");
    idle_sprite[5] = loadImage(squirrel_sprites_path + "idle/player-idle-6.png");
    idle_sprite[6] = loadImage(squirrel_sprites_path + "idle/player-idle-7.png");
    idle_sprite[7] = loadImage(squirrel_sprites_path + "idle/player-idle-8.png");
  }
}
