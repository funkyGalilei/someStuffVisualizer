//========================================================================
class Cloud {
  float randRadius;
  // float radius = 100;
  float totalRadius;
  float xLocation;
  float yLocation;
  float yOffset;
  float alpha;
  float motion;
  int motionMult;
  int time;
  // int division;

  Cloud(int baseRadius, float yFactor, float motionLow, float motionHi) {

    motion = random(motionLow, motionHi);  

    // yLocation = random(0 + baseRadius, height - baseRadius); // adding padding above and below
    yLocation = random(0, 4);
      if (yLocation < 1) {
        yLocation = height * 1/4;
      }
       else if (yLocation < 2) {
        yLocation = height * 1/2;
      } else if (yLocation < 3) {
        yLocation = height * 3/4;
      } else if (yLocation <= 4) {
        yLocation = height * 2/3;
      }

    randRadius = random(-baseRadius/3, baseRadius/4);
    xLocation = random(0, width*2.5) + width;
    alpha = random(100, 200);
  }

    void update(float motionMult, float randMult) {
      time++;
          yOffset = map(yLocation, 0, height, 0, yFactor); // calculating how much yfactor will affect radius var
        totalRadius = baseRadius + randRadius * randMult + yOffset;

        if (toggle) {
          xLocation = xLocation - motion * motionMult;
        }
        
        // making cloud loop infinite
        if (xLocation  < 0 - totalRadius * 1.5) {           // reset position back to a random location offscreen
          xLocation = random(0, width*2.5) + width;
        }

        // manually changing ylocation to not clip
        // if (yLocation < 0 + totalRadius + yOffset) {
        //     yLocation = yLocation + totalRadius + yOffset;
        // } else if (yLocation > height - totalRadius) {
        //     yLocation = yLocation - totalRadius;
        // }

        // print("xlocation " + xLocation + "\tmotion " + nf(motion, 1, 3) + "\n");
        }

    void show(PGraphics pg) {
        pg.fill(255, 255, 255, alpha);
        pg.noStroke();
        pg.circle(xLocation, yLocation, totalRadius);
    }
}

// the class has functions associated with it woowwww
