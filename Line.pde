

class Line {
  
  PVector p1 = new PVector();
  PVector p2 = new PVector();
  PVector p3 = new PVector();
  float a, b, c;
  
  Line(PVector p1_, PVector p2_, PVector p3_) {
    p1 = p1_;
    p2 = p2_;
    p3 = p3_;
    
    calculateABC();
  }
  
  void calculateABC() {
    float A1 = -(p1.x*p1.x)+p2.x*p2.x;
    float B1 = -p1.x+p2.x;
    float D1 = -p1.y+p2.y;
    float A2 = -(p2.x*p2.x)+p3.x*p3.x;
    float B2 = -p2.x+p3.x;
    float D2 = -p2.y+p3.y;
    float Bm = -B2/B1;
    float A3 = Bm * A1 + A2;
    float D3 = Bm * D1 + D2;
    
    a = D3/A3;
    b = (D1-A1*a) / B1;
    c = p1.y - a*p1.x*p1.x - b*p1.x;
    
    print("a: "+a+" b: "+b+" c: "+c);
  }
  
  float f(float z) {
    return a*z*z+b*z+c;
  }
  
  void display() {
    for (float x = -width/2; x < width/2; x+=0.1) {
      stroke(255);
      fill(255);
      point(x, f(x));
    }
  }
}
