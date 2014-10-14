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

color white = color(255);
color green = color(46, 204, 64);
color orange = color(255, 133, 27);
color redblood = color(136, 20, 13);
color yellow = color(255, 220, 0);
color black = color(0);

void setup() {
    size(960, 540);

    Ani.init(this);

    this.data = new JSONReader("data/data.json");
    this.dots = new Dots();
    ellipseMode(CENTER);
    this.player = new Player("data/dexter.mp3", this);
    this.player.start();
}

void draw() {
    background(0);
    noStroke();
    this._time = this.player.timeElapsed();
    // println("_time: "+_time);
    if (this.data.doIPlay(_time, "bang"))
        bang();
    if (this.data.doIPlay(_time, "bam"))
        bam();
    if (this.data.doIPlay(_time, "dong"))
        dong();
    if (this.data.doIPlay(_time, "ding"))
        ding();
    this.dots.draw();
    fill(white);
    text(frameRate, 50, 50);
}

void bang(){
    this.dots.bang();
    // ellipse(width/2, height/2, width/4, height/4);
}

void bam(){
    this.dots.bam();
}

void dong(){
    this.dots.dong();
}

void ding(){
    this.dots.ding();
}

boolean fullscreen(){
    return true;
}