/**
* Project : bangplayer 
* Author : Erwan
* Version : 1.0.0
* Date : 10-10-2014
* Description here
*/

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

static int BPM = 112;
static float BPMTOMS = round(1000.0/(BPM/60.0));
static float BPMTOS = BPMTOMS / 1000;

Player player;
JSONReader data;

Dots dots;

int _time = 0;

void setup() {
    size(960, 540);

    Ani.init(this);

    this.data = new JSONReader("data/data.json");
    this.player = new Player("data/dexter.mp3", this);
    this.player.start();
    this.dots = new Dots();
    ellipseMode(CENTER);
}

void draw() {
    background(0);
    this._time = this.player.timeElapsed();
    // println("_time: "+_time);
    if (this.data.doIPlayBang(_time))
        bang();
    this.dots.draw();
    text(frameRate, 50, 50);
}

void bang(){
    this.dots.bang();
    // ellipse(width/2, height/2, width/4, height/4);
}