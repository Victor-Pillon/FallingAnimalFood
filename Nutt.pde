class Nutt {
  PVector position;
  PImage fruit;
  float size;
  float rotation;
  
  Nutt(PVector start_position, float size, PImage fruit) {
    this.position = start_position; 
    this.size = size;
    this.fruit = fruit;
  }
  
  void display() {
    pushMatrix();
    fill(0, 0, 255);
    translate(position.x, position.y);
    rotate(rotation);
    imageMode(CENTER);
    image(fruit, 0, 0, size, size);
    rotation += 0.01;
    rotation %= TWO_PI;
    popMatrix();
  }
  void update() {
    if(animal instanceof Monkey)
      position.y += 1;
    else if (animal instanceof Bird)
      position.y += 2;
    else if (animal instanceof Squirrel)
      position.y += 2.4;
    else
      position.y += 1;
  }
}
