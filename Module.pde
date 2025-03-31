
class Module {
  int x;
  int y;
  color randColor;
  float size;
  boolean inCircle;
  int shape;
  float phase;
  
  // Constructor
  Module(int xTemporary, int yTemporary, boolean inCircleTemp, int offset) {
    x = xTemporary - offset;
    y = yTemporary - offset;
    inCircle = inCircleTemp;
    
    randColor = colors[(int)random(8)];
    //size = random(20.0, 40.0); // with 15
    size = random(40.0, 70.0);
    shape = int(round(random(1, 3))); // 1 for circle, 2 for rect(), 3 for triangle
    phase = random(0, 10);
  }
  
  void update() {
    float amplitude = .1;
    size = sin(time + phase) * amplitude + size;
    time = time + 0.00005;

  }
  
  void display() {

    if (inCircle) {
        fill(randColor);
        if (shape == 1) {
          ellipse(x, y, size + 10, size + 10);
        } else if (shape == 2) {
          rect(x, y, size, size);
        } else if (shape == 3) {
          float triFactor = 0.6;
          triangle(x, y, x-size*triFactor, y-size*triFactor, x+size*triFactor, y-size*triFactor);
        }
    } else {
        //fill(25);
        //ellipse(x, y, 10, 10);
    }
  }
}
