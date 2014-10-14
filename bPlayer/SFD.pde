import codeanticode.syphon.*;
class SFD {
  public PGraphics canvas;
  public SyphonServer server;
  PApplet that;
  SFD(PApplet tthat) {
    that = tthat;
    canvas = createGraphics(that.width, that.height, P2D);
    // Create syhpon server to send frames out.
    server = new SyphonServer(that, "Processing Syphon");
  }

  void update() {
    that.loadPixels();
    canvas.loadPixels();
    /*
    for (int i=0;i<that.pixels.length;i++) {
     canvas.pixels[i] = that.pixels[i];
     }
     */

    // Utiliser plutôt le code ci-dessous si l’image apparaît à l’envers dans Syphon
    for (int x = 0; x < that.width; x++) {
      for (int y = 0; y < that.height; y++) {
        canvas.pixels[((that.height-y-1)*that.width+x)] = that.pixels[y*that.width+x];
      }
    }
    canvas.updatePixels();
    server.sendImage(canvas);
  }
}
