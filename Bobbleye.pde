float centerX, centerY, scaleX, scaleY, radiusX, radiusY;
float angle, increment, radius, padding, dilation;
int useCos, isPointy, rings;
int[] palette;

void setup() {
  size(1000, 1000);
  noSmooth();
  noStroke();
  angle = 0;
  centerX = width / 2;
  centerY = height / 2;
  //https://coolors.co/110514-32213a-383b53-66717e-d1caa1
  palette = new int[] { #D1CAA1, #66717E, #383B53, #32213A, #110514 }; 
}

void draw() { 
  radius = 150;
  padding = 12;
  increment = -0.025; //radians
  dilation = 0.12; //radians
  scaleX = 1.0;
  scaleY = 1.0;
  rings = 1;
  useCos = 0; //>0 means true
  isPointy = 0; //>0 means true
  background(0);
  for (int c = abs(palette.length * rings) - 1; c >= 0; c--) {
    fill(palette[c % palette.length]);
    radiusX = (radius + padding * c + padding * sin(angle + dilation * c)) * scaleX;
    radiusY = (useCos > 0) ? (radius + padding * c + padding * cos(angle + dilation * c)) * scaleY : (radiusX / scaleX) * scaleY;
    if (isPointy > 0) {
      quad(centerX, centerY - radiusY,
        centerX + radiusX, centerY,
        centerX, centerY + radiusY,
        centerX - radiusX, centerY);
    }
    else {
      ellipse(centerX, centerY, radiusX * 2, radiusY * 2);
    }
  }
  angle += increment;
  if (angle >= TWO_PI) angle -= TWO_PI;
  else if (angle <= -TWO_PI) angle += TWO_PI;
}
