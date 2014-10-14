/**
* Project : bangrecorder 
* Author : Erwan
* Version : 1.0.0
* Date : 07-10-2014
* Description here
*/

JSONObject json;
JSONArray bangs;

static int BPM = 112;
static long BPMTOMS = round(1000.0/(BPM/60.0));

int count = 0;

import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context

boolean started = false;
int startedAt;

void setup() {
    size(960, 540);
    json = new JSONObject();
    bangs = new JSONArray();

    minim = new Minim(this);
    player = minim.loadFile("dexter.mp3", 2048);
}

void draw() {
    background(0);
}

void keyPressed(){
        if(started){
            if(keyCode == 81){
                close();
            }else{
                saveBang();
            }
        }
        else{
            player.play();
            started = true;
            startedAt = millis();
        }
}

void saveBang(){
    bangs.setInt(count, (millis() - startedAt));
    println("bang: "+ (millis() - startedAt));
    count++;
}

void stop(){
    player.close();
    minim.stop();
    super.stop();
}

void close(){
    json.setJSONArray("bangs", bangs);
    saveJSONObject(json, "data/new.json");
    exit();
}
