class Tile{
  PNT position;
  PNT size;
  int[] edges = {0,0,0,0};
  Tile(PNT _size, PNT _position, int[] _edges ){
    this.size = _size;
    this.position = _position;
    this.edges = _edges;
  }
  
  void draw(){
    //take context
    
    //top -> right -> bottom -> left... like a clock
    
    //based on position and edges draw tile
    
    for(int i=0; i<edges.length; i++){
      if(edges[i]>0){
        //draw a line to the center
        switch(i){
          case 0:
            drawTop(edges[i]);
          break;
          case 1:
            drawRight(edges[i]);
          break;
          case 2:
            drawBottom(edges[i]);
          break;
          case 3:
            drawLeft(edges[i]);
          break;
        }
      }
    }
  }
  int getEdgeVal(int _edge){
    return this.edges[_edge];
  }
  PNT getCenter(){
    return new PNT(this.position.x + (this.size.x *.5f), this.position.y + (this.size.y *.5f));
  }
  void drawTop(int val){
    float x1 = this.position.x + (this.size.x *.5f);
    float y1 = this.position.y;
    line(x1, y1, getCenter().x, getCenter().y);
  }
  void drawRight(int val){
    float x1 = this.position.x + (this.size.x);
    float y1 = this.position.y + (this.size.y *.5f);
    line(x1, y1, getCenter().x, getCenter().y);
  }
  void drawBottom(int val){
    float x1 = this.position.x + (this.size.x *.5f);
    float y1 = this.position.y + (this.size.y);
    line(x1, y1, getCenter().x, getCenter().y);
  }
  void drawLeft(int val){
    float x1 = this.position.x;
    float y1 = this.position.y + (this.size.y  *.5f);
    line(x1, y1, getCenter().x, getCenter().y);
  }
}