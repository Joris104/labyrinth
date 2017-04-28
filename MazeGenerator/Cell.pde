class Cell {
  
  int i;
  int j;
  //Walls, in order : left, top, right, bottom
  boolean[] walls = {true,true,true,true};
  boolean visited = false;
  
  
  
  Cell(int i,int j) {
    this.i = i;
    this.j = j;
  }
  
  void display(){
    fill(255);
    stroke(255);
    //String text = i +","+j;
    //text(text,i*cellWidth,(j+1)*cellWidth);
    
    //noFill();
    //rect(i*cellWidth,j*cellWidth,cellWidth,cellWidth);
    //LEFT WALL
    if (walls[0]) line(i*cellWidth,j*cellWidth,(i)*cellWidth,(j+1)*cellWidth);
    //TOP WALL
    if (walls[1]) line(i*cellWidth,j*cellWidth,(i+1)*cellWidth,(j)*cellWidth);
    //RIGHT WALL
    if (walls[2]) line((i+1)*cellWidth,j*cellWidth,(i+1)*cellWidth,(j+1)*cellWidth);
    //BOTTOM WALL
    if (walls[3]) line(i*cellWidth,(j+1)*cellWidth,(i+1)*cellWidth,(j+1)*cellWidth);
    
    /*if(visited){
      fill(255,0,255,100);
      noStroke();
      rect(i*cellWidth,j*cellWidth,cellWidth,cellWidth);
    }*/
   }
   
  ArrayList<Cell> getUnvisitedNeighbours(){
    int cellIndex = i + j*numColumns;
    ArrayList<Cell> cells = new ArrayList<Cell>();
    //LEFT
    if(i!=0 && !grid.get(cellIndex-1).visited)                      cells.add(grid.get(cellIndex-1));
    //TOP
    if(j!=0 && !grid.get(cellIndex-numColumns).visited)             cells.add(grid.get(cellIndex-numColumns));
    //RIGHT
    if(i != numColumns-1 &&!grid.get(cellIndex+1).visited)          cells.add(grid.get(cellIndex+1));
    //BOTTOM
    if(j != numRows-1 && !grid.get(cellIndex+numColumns).visited)   cells.add(grid.get(cellIndex+numColumns));
    return cells;
  }
  
  void highlight(boolean b){
    if (b) fill(0,255,255,100);
    else fill(51,100);
    noStroke();
    rect(i*cellWidth,j*cellWidth,cellWidth,cellWidth);
  }
  
  void highlight(){
    highlight(true);
  }
}