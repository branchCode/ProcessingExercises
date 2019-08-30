class Circle {
  public PVector p;
  public float r;
  public color c;
  public boolean growing;

  public Circle(float x_, float y_, color c_) {
    this.p = new PVector(x_, y_);
    this.c = c_;
    this.r = 1;
    this.growing = true;
  }

  void grow() {
    for (Circle c : cs) {
      if (this == c)
        continue;
      if (dist(p.x, p.y, c.p.x, c.p.y) < (r * 1.5) + (c.r * 1.5)) {
        growing = false;
        return;
      }
    }
    if (p.x + r > width || p.x - r < 0|| p.y + r > height || p.y - r < 0) {
      growing = false;
      return;
    }
    if (growing) {
      r += speed;
    }
  }

  void show() {
    //noStroke();
    //fill(c);
    noFill();
    stroke(c);
    strokeWeight(r / 2);
    ellipse(p.x, p.y, r * 2, r * 2);
  }
}
