class Dot {

    boolean destroy = false;
    int x,y,w,h,o;
    String animation;

    Dot(int x, int y, int w, int h, String animation) {
        this.o = 255;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.animation = animation;
        this.animation();
    }

    void animation(){
        if (animation == "bang"){
            this.bangStep1();
        }
        else if(animation == "bam"){
            this.bamStep1();
        }
        else if (animation == "dong"){
            this.dongStep1();
        }
        else if (animation == "ding"){
            this.dingStep1();
        }
    }

    void bangStep1(){
        Ani.to(this, BPMTOS * 2, "w", 0, Ani.EXPO_OUT);
        Ani.to(this, BPMTOS * 2, "h", 0, Ani.EXPO_OUT, "onEnd:destroy");
    }

    void bamStep1(){
        Ani.to(this, BPMTOS * 2, "w", this.w * 1.5 , Ani.ELASTIC_OUT);
        Ani.to(this, BPMTOS * 2, "h", this.h * 1.5 , Ani.ELASTIC_OUT, "onEnd:bamStep2");
    }

    void bamStep2(){
        Ani.to(this, BPMTOS * 2, "w", 0, Ani.ELASTIC_OUT);
        Ani.to(this, BPMTOS * 2, "h", 0, Ani.ELASTIC_OUT, "onEnd:destroy");
    }

    void dongStep1(){
        Ani.to(this, BPMTOS * 1, "w", this.w, Ani.BACK_OUT);
        Ani.to(this, BPMTOS * 1, "h", this.h, Ani.BACK_OUT, "onEnd:dongStep2");   
        this.w = 0;
        this.h = 0;
    }

    void dongStep2(){
        Ani.to(this, BPMTOS * 2, "w", 0, Ani.ELASTIC_OUT);
        Ani.to(this, BPMTOS * 2, "h", 0, Ani.ELASTIC_OUT, "onEnd:destroy");
    }

    void dingStep1(){
        Ani.to(this, BPMTOS * 1, "w", this.w, Ani.BACK_OUT);
        Ani.to(this, BPMTOS * 1, "h", this.h, Ani.BACK_OUT, "onEnd:dingStep2");
    }

    void dingStep2(){
        Ani.to(this, BPMTOS * 0.5, "w", 0, Ani.ELASTIC_OUT);
        Ani.to(this, BPMTOS * 0.5, "h", 0, Ani.ELASTIC_OUT);
        Ani.to(this, BPMTOS * 1.5, "o", 0, Ani.EXPO_OUT, "onEnd:destroy");
    }

    void draw(){
        if(animation == "bang"){
            fill(yellow,o);
        }
        else if(animation == "bam"){
            fill(green,o);
        }
        else if(animation == "dong"){
            fill(redblood,o);
        }
        else if (animation == "ding") {
            fill(orange,o);
        }
        else{
            fill(white,o);
        }
        ellipse(this.x, this.y, this.w, this.h);
    }

    void destroy(){
        this.destroy = true;
    }

    boolean isToDestroy(){
        return this.destroy;
    }

}