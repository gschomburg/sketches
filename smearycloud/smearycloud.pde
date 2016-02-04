
class Pnt { 
  float x, y, speed, radius, angle;
  float targetRadius;
  Pnt center;
  Pnt(float _x, float _y){
    x = _x;
    y = _y;
    speed = random(-2, 2);
  }
  void setCenter(float _x, float _y){
   center = new Pnt(_x, _y);
   radius = distance(center);
   targetRadius = radius;
   angle = atan2(y, x);
   println(radius, angle);
  }
  float distance(Pnt toPnt){
    float dX = (x - toPnt.x) * (x - toPnt.x);
    float dY = (y - toPnt.y) * (y - toPnt.y);
    return sqrt(dX+dY);
  }
  
  void angleStep(){
     //step the angle, recalculate x and y
     angle+=.01 * speed;
//     updateXY();
  }
  void stepRadius(){
    radius += (targetRadius - radius)*.05;
    if(abs(radius - targetRadius)<1){
      targetRadius = random(5, 200);
    }
  }
  void updateXY(){
    x = center.x + (radius * cos(angle));
    y = center.y + (radius * sin(angle));
  }
}

ArrayList<Pnt> points= new ArrayList<Pnt>();

float r, g, b;
float rD, gD, bD;
int snakeLength = 7; 
//  int frame=0;
void setup()
{
  size(600, 600);
  frameRate(60);
  background(0);
  smooth();
  
  int i;
  
  r = 255;
  g = 255;
  b = 255;
  
  rD = gD = bD = -.6;

  //reset coords
  int pointCount = round(random(10, 80))*2;
//  coords = new float[pointCount];
//  for ( i=0; i<pointCount; i++){
//    coords[i] = random(200, 400);
//  }
//  
  points = new ArrayList<Pnt>();
  for ( i=0; i<pointCount; i++){
    Pnt p = new Pnt(random(200, 400), random(200, 400));
//    p.setCenter(random(200, 400), random(200, 400));
    p.setCenter(300, 300);
    points.add(p);
  }
}


void draw()
{
//  background(255, 255, 255, 0);
    fill(0, 0, 0, 2.5);
     noStroke();
    rect(0, 0, 600, 600);
    
  
  
  r += rD;
    if(r<30){
      rD=.5;
    }
    if(r>220){
      rD=-.5;
    }
    
//    g += gD;
//    if(g<30){
//      gD=.25;
//    }
//    if(g>220){
//      gD=-.25;
//    }
    
    b += bD;
    if(b<30){
      bD=.7;
    }
    if(b>220){
      bD=-.7;
    }
//  if(frameCount%2 == 0){
//    
//    
//  }else{
//    
//    
//  }
  drawCurves();
  drawCurveLines();
//drawAngles();
  drawBubbles();
  
  
  if(frameCount%3 == 0){
    advanceSnake();
  }
  
   for(int i=0; i<points.size(); i++){
     points.get(i).angleStep();
     points.get(i).stepRadius();
//     points[i].radius += random(-2, 2);
     points.get(i).updateXY();
   }
}
void drawCurves(){
  
    noStroke();
    fill(r, g, b);
    beginShape();
    curveVertex(points.get(0).x, points.get(0).y);
    for(int i=0; i<points.size(); i++){
      curveVertex(points.get(i).x, points.get(i).y);
    }
    curveVertex(points.get(points.size()-1).x, points.get(points.size()-1).y);
    endShape();
}
void drawBubbles(){
//  fill(r, g, b, 200);
//  stroke(g, r, b);
  noStroke();
  fill(g, r, b);
  
  ellipseMode(CENTER);
  for(int i=0; i<snakeLength+4; i++){
    strokeWeight(random(.2, 4));
    ellipse(points.get(i).x, points.get(i).y, 15 - (i), 15 - (i));
  }
  
}
void drawCurveLines(){
  snakeLength= 8;
  noFill();
  stroke(g, r, b);
  strokeWeight(random(.2, 4));
  beginShape();
  curveVertex(points.get(0).x, points.get(0).y);
  for(int i=0; i<snakeLength; i++){
    curveVertex(points.get(i).x, points.get(i).y);
  }
  curveVertex(points.get(snakeLength-1).x, points.get(snakeLength-1).y);
  endShape();
  
}
void drawAngles(){
  snakeLength=7;
  noFill();
    stroke(g, r, b);
//    stroke(0,0,0.160);
    strokeWeight(random(.2, 4));
//    noStroke();
//    fill(255, 255, 255, round(random(180, 210)));
    
    beginShape();
//    stroke(0, 0, 255);
//    for(int i=0; i<points.size(); i++){
//      vertex(points[i].x, points[i].y);
//    }
     for(int i=0; i<snakeLength; i++){
      vertex(points.get(i).x, points.get(i).y);
    }
    endShape(CLOSE);
}

void advanceSnake(){
    Pnt endPnt = points.get(0);
    points.remove(0);
    points.add(endPnt);
}

void randomizeCoords(){
  for(int i=0; i<points.size(); i++){
    points.get(i).x += random(-2, 2);
    points.get(i).y += random(-2, 2);
  }
}

float clamp(float val,float min,float max){
  if(val<min) return min;
  if(val>max) return max;
  return val;
}
