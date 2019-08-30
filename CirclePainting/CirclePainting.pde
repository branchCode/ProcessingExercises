
PImage img;
float speed = 2;

ArrayList<Circle> cs;
String imgFile = "dog";

void setup() {
  size(700, 525);  // the size of picture
  img = loadImage(imgFile + ".jpg");
  img.loadPixels();
  cs = new ArrayList<Circle>();
}

void draw() {
  //background(img);
  background(0);

  for (Circle c : cs) {
    if (c.growing)
      c.grow();
    c.show();
  }


  int count = 0;
  int attemps = 0;
  while (count < 100) {
    PVector pos = new PVector(random(width), random(height));
    boolean valied = true;
    for (Circle c : cs) {
      attemps++;
      if (dist(pos.x, pos.y, c.p.x, c.p.y) < c.r) {
        valied =false;
        break;
      }
    }
    if (valied) {
      int x = int(pos.x);
      int y = int(pos.y);
      color col = color(img.pixels[x + y * img.width]);
      cs.add(new Circle(pos.x, pos.y, col));
      count++;
    }
    if (attemps > 100000)
      break;
  }
}

void keyPressed(){
  if(key == ENTER){    // save 
    String path = imgFile + "_after.jpg"; 
    save(path);
  }
}
