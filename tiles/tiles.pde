Tile[][] allTiles;
void setup() {
  int w =900;
  int h =900;
  size(900, 900);
  background(255);
  smooth();
  
  strokeCap(SQUARE);
  
  //rectMode(CENTER); // show bounding boxes
  //stroke(128);
  //rect(35, 35, 50, 50);
  //rect(105, 35, 50, 50);
  //rect(175, 35, 50, 50);
  //rect(105, 105, 100, 50);
  
  //stroke(0);
  //arc(35, 35, 50, 50, 0, PI / 2.0); // lower quarter circle 
  //arc(105, 35, 50, 50, -PI, 0);  // upper half of circle
  //arc(175, 35, 50, 50, -PI / 6, PI / 6); // 60 degrees
  //arc(105, 105, 100, 50, PI / 2, 3 * PI / 2); // 180 degrees
  
  /*
  PNT gridSize = new PNT(20,20);
  
  PNT tileSize = new PNT(20,20);
  
  strokeWeight(3);
  
  for(int c=0; c<gridSize.x; c++){
    for(int r=0; r<gridSize.y; r++){
      PNT tilePosition = new PNT(c * tileSize.x , r * tileSize.y);
      int[] tileEdges = getEdges(c, r);
      Tile testTile = new Tile(tileSize, tilePosition, tileEdges);
      stroke(random(50, 240), random(50, 240), random(50, 240));
      testTile.draw();
    }
  }
  */
  
  blerp();
 
  //Tile mainTile = new Tile(tileSize, tilePosition, tileEdges);
  
  //mainTile.draw();
}

int[] getEdges(int _c, int _r){
    int[] edges = {(int)random(0, 3), (int)random(0, 3), (int)random(0, 3), (int)random(0, 3)};
    return edges;
  }
  void blerp(){
    background(random(200, 255), random(200, 255), random(200, 255), random(10, 100));
    
    /*randomize*/
    PNT gridSize = new PNT(random(5, 40),random(5, 40));
    PNT tileSize = new PNT(random(5, 40),random(5, 40));
    strokeWeight(random(1, 10));
    
    /*
    PNT gridSize = new PNT(20,20);
    PNT tileSize = new PNT(20,20);
    strokeWeight(3);
    */
    
    for(int c=0; c<gridSize.x; c++){
      for(int r=0; r<gridSize.y; r++){
        PNT tilePosition = new PNT(c * tileSize.x , r * tileSize.y);
        int[] tileEdges = getEdges(c, r);
        Tile testTile = new Tile(tileSize, tilePosition, tileEdges);
        stroke(random(50, 240), random(50, 240), random(50, 240));
        testTile.draw();
      }
    }
  }
  void draw(){
    //blerp();
    
  }