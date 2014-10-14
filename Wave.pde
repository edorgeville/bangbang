class Wave {

    int x,y,w,h;
    boolean destroy = false;

    Wave(int x, int y, int w, int h) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.animate();
    }

    void draw(){
        ellipse(this.x, this.y, this.w, this.h);
    }

    void animate(){
        Ani.to(this, BPMTOS * 2, "w", 0, Ani.EXPO_OUT, "onEnd:destroy");
        Ani.to(this, BPMTOS * 2, "h", 0, Ani.EXPO_OUT, "onEnd:destroy");
    }

    void destroy(){
        this.destroy = true;
    }

    boolean isToDestroy(){
        return this.destroy;
    }

}