
ArrayList<PVector> dots = new ArrayList<PVector>();
ArrayList<Line> lines = new ArrayList<Line>();

void setup() {
  fullScreen();  
  
  lines.add(new Line(new PVector(0,0), new PVector(1,1), new PVector(-1,1)));
}

void draw() {
  background(51);
  
  
  
  translate(width/2,0);
  stroke(255);
  for (Line l : lines) {
    l.display();
  }
  
  for (PVector d : dots) {
    circle(d.x, d.y, 5);  
  }
}

void mousePressed() {
  print("HI");
  dots.add(new PVector(mouseX-width/2, mouseY));
  if (dots.size() == 3) {
    lines.add(new Line(dots.get(0), dots.get(1), dots.get(2)));
    dots.clear();
  }
}
