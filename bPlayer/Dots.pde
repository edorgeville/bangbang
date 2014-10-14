class Dots {

    ArrayList<Dot> dots;

    Dots() {
        this.dots = new ArrayList<Dot>();
    }

    void draw(){
        for(int i = 0; i < this.dots.size(); i++){
            this.dots.get(i).draw();
        }
        for(int i = 0; i < this.dots.size(); i++){
            if(this.dots.get(i).isToDestroy()){
                this.dots.remove(i);
            }
        }
    }

    void bang(){
        this.dots.add(new Dot(
            (int)random(0, width/2),
            (int)random(0,height),
            (int)(width/10),
            (int)(width/10),
            "bang"
        ));
    }

    void bam(){
        this.dots.add(new Dot(
            (int)random(width/2, width),
            (int)random(0,height),
            (int)(width/20),
            (int)(width/20),
            "bam"
        ));
    }

    void dong(){
        this.dots.add(new Dot(
            (int)random(0, width),
            (int)random(0,height),
            (int)(width/8),
            (int)(width/8),
            "dong"
        ));
    }

    void ding(){
        float r = random(width/18, width/17);
        this.dots.add(new Dot(
            (int)random(width/3, width/3*2),
            (int)random(height/3,height/3*2),
            (int)(r),
            (int)(r),
            "ding"
        ));
    }

}