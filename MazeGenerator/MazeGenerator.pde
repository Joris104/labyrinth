int numColumns;
int numRows;
int cellWidth = 40;

PFont font;

Cell currentCell;
ArrayList<Cell> grid = new ArrayList<Cell>();
ArrayList<Cell> stack = new ArrayList<Cell>();
void setup(){
  size(405,405);
  font = createFont("Arial",16,true);
  
  
  numColumns = floor(width/cellWidth);
  numRows = floor(height/cellWidth);
  for(int i = 0; i < numRows; i++){
    for(int j = 0; j < numColumns; j++){
      grid.add(new Cell(j,i));
    }
  }
  currentCell = grid.get(int(random(1,numColumns-1)));
  currentCell.walls[1] = false;
  stack.add(currentCell);
}

void draw(){
  translate(2,2);
  background(51);
  
  currentCell.visited = true;
  currentCell.highlight();
  for(Cell cell : grid){
    cell.display();
  }
  ArrayList<Cell> neighbours = currentCell.getUnvisitedNeighbours();
  if(neighbours.size()>0){
    //If there are any unvisited neighbours left
    Cell nextCell = neighbours.get(floor(random(0,neighbours.size())));
    updateWalls(currentCell,nextCell);
    currentCell = nextCell;
    stack.add(currentCell);
    print(stack.size()+"\n");
  }
  else{
    //If we have no neighbors, we go back through the stack until we find a cell which has neighbours
    int i = 1;
    if(stack.size()!=grid.size()){
      //Check wether we're finished
      while(neighbours.size()==0){
        currentCell = stack.get(stack.size()-i);
        neighbours = currentCell.getUnvisitedNeighbours();
        i++;
      }
    }
    else{
      //We're finished
      finish();
    }
  }

   
  delay(100);
}

void updateWalls(Cell currentCell,Cell nextCell){
  if(currentCell.i == nextCell.i){
      //If we stay in the same ROW
      if(currentCell.j-1 == nextCell.j){
        //This checks wether we're going up
        currentCell.walls[1] = false;
        nextCell.walls[3] = false;
      }
      else{
        currentCell.walls[3] = false;
        nextCell.walls[1] = false;
      }
    }
    else{
      //If we stay in the same COLUMN
      if(currentCell.i-1 == nextCell.i){
        //This checks wether we're going left 
        currentCell.walls[0] = false;
        nextCell.walls[2] = false;
      }
      else{
        currentCell.walls[2] = false;
        nextCell.walls[0] = false;
      }
    }
}
void finish(){
  currentCell.highlight(false);
  print("END");
  delay(1000);
}