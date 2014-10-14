class Dot {

    boolean destroy = false;
    int x,y,w,h;
    String animationType;

    // ArrayList<Wave> waves;

    Dot(int x, int y, int w, int h, String animationType) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.animationType = animationType;
        // this.waves = new ArrayList<Wave>();
        // this.waves.add(new Wave(x,y,w,h));
        this.animation();
    }

    void animation(){
        Ani.to(this, BPMTOS * 2, "w", 0, Ani.EXPO_OUT, "onEnd:destroy");
        Ani.to(this, BPMTOS * 2, "h", 0, Ani.EXPO_OUT, "onEnd:destroy");
    }

    void draw(){
        // drawWaves();
        ellipse(this.x, this.y, this.w, this.h);
    }

    void drawWaves(){
        // for(int i = 0; i < this.waves.size(); i++){
        //     if(this.waves.get(i).isToDestroy()){
        //         this.waves.remove(i);
        //     }else{
        //         this.waves.get(i).draw();
        //     }
        // }
        // if(this.waves.size() <= 0){
        //     this.destroy();
        // }
    }

    void destroy(){
        this.destroy = true;
    }

    boolean isToDestroy(){
        return this.destroy;
    }

}