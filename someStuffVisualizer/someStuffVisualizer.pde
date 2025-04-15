
import com.cage.colorharmony.*;

ColorHarmony colorHarmony = new ColorHarmony(this);

color[] colors = new color[7];

int unit = 30;
int count;
int radius = 180;
int r  = radius + 90;
float time = 0;
Module[] mods;

// text
// The message to be displayed
String message = "some stuff!";

PFont f;

void setup() {
  size(800, 800);
  noStroke();
  frameRate(24);
  
  f = createFont("Futura",40,true);
  textFont(f);
  // The text must be centered!
  textAlign(CENTER);
  
  //colors = colorHarmony.GetRandomPalette();
  colors = colorHarmony.Triads();
  
  int widthCount = width/unit;
  int heightCount = height/unit;
  
  count = widthCount * heightCount;
  
  mods = new Module[count];

  int index = 0;
  for (int y = 0; y < heightCount; y++) {
    for (int x = 0; x < widthCount; x++) {
      // if I want to have points be within a circle
      if (pow(x*unit - width/2, 2) + pow(y *unit - height/2, 2) <= pow(radius, 2)) {
        mods[index++] = new Module(x * unit, y * unit, true, widthCount);
      } else {
        mods[index++] = new Module(x * unit, y * unit, false, widthCount);
      }
    }
  }
}


void draw() {
  background(0);
  fill(colors[3]);
  // background circle
  circle(width/2, height/2, radius * 2 + 50); 

  
  for (Module mod: mods) {
      mod.display();
      mod.update();
  }
  strokeWeight(40);
  noFill();
  stroke(255);
  // main circle outline
  circle(width/2, height/2, radius * 2 + 80);
  strokeWeight(0);
  noStroke();
  
  //===================================================================
  // Start in the center and draw the circle
  translate(width / 2, height / 2);
  noFill();
  stroke(0);
  //ellipse(0, 0, r*2, r*2);

  // We must keep track of our position along the curve
  float arclength = 0;

  // For every box
  for (int i = 0; i < message.length(); i++)
  {
    // Instead of a constant width, we check the width of each character.
    char currentChar = message.charAt(i);
    float w = textWidth(currentChar);

    // Each box is centered so we move half the width
    arclength += w/2;
    // Angle in radians is the arclength divided by the radius
    // Starting on the left side of the circle by adding PI
    float theta = PI + arclength / r;

    pushMatrix();
    // Polar to cartesian coordinate conversion
    translate(r*cos(theta), r*sin(theta));
    // Rotate the box
    rotate(theta+PI/2); // rotation is offset by 90 degrees
    
    // Display the character
    fill(255);
    textSize(100);
    text(currentChar,0,0);
    popMatrix();
    // Move halfway again
    arclength += w/2;
  
  }
  
  saveFrame("output3/####.png");
}
