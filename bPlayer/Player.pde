import ddf.minim.*;

class Player {

    AudioPlayer player;
    Minim minim;//audio context

    int startedAt;
    boolean started;

    Player(String media, bPlayer those) {
        this.minim = new Minim(those);
        this.player = this.minim.loadFile(media, 2048);
        this.started = false;
    }

    int startedAt(){
        return startedAt;
    }

    boolean isStarted(){
        return this.started;
    }

    int timeElapsed(){
        return this.player.position();
    }

    void start(){
        this.player.play();
        this.startedAt = millis();
        this.started = true;
    }

    void stop(){
        this.player.close();
        this.minim.stop();
    }
}