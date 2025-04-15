import com.krab.lazy.*;

LazyGui gui;

PGraphics pg;

//========================================================================

Cloud[] clouds = new Cloud[50];

void setup() {
  size(1600, 600, P2D);
  frameRate(24);
  pg = createGraphics(width, height);
  gui = new LazyGui(this);

   for (int i = 0; i < clouds.length; i++)  {
   clouds[i] = new Cloud(baseRadius, yFactor, motionLow, motionHi);
 }
}

//========================================================================

int baseRadius = 50;
float randMult;
int iterator = 0;
float yFactor;
float motionLow = 0.6;
float motionHi = 1;
float motionMult;
boolean toggle;

//========================================================================
void draw() {
  background(0, 0, 0);
  iterator++;

  toggle = gui.toggle("stop", false);
  baseRadius = gui.sliderInt("Radius", 50);
  randMult = gui.slider("Random Radius Multiplier", 1.1, 1, 10);
  yFactor = gui.slider("Y Location Factor to Radius", 200, 0, height);
  gui.pushFolder("Motion");
  motionLow = gui.slider("Motion Spread Lower Bound", 0.6, 0.01, 1);
  motionHi = gui.slider("Motion Spread Upper Bound", 1, 0.01, 1);
  motionMult = gui.slider("Motion Multiplier", 3, 1, 20);

  gui.popFolder();

  pg.beginDraw();
  pg.clear();

     for (int i = 0; i < clouds.length; i++)  {
       clouds[i].update(motionMult, randMult);
       clouds[i].show(pg);
    }
  
 pg.endDraw();

 image(pg, 0, 0);

//  pg.save("outputFive/cloud" + iterator + ".png");
  //  saveFrame("outputFour/clouds######.png");
}
