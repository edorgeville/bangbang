class Dots {

    ArrayList<Dot> dots;

    Dots() {
        this.dots = new ArrayList<Dot>();
    }

    void draw(){
        for(int i = 0; i < this.dots.size(); i ++){
            if(this.dots.get(i).isToDestroy()){
                this.dots.remove(i);
            }
            else{
                this.dots.get(i).draw();
            }
        }
    }

    void bang(){
        this.dots.add(new Dot((int)random(0, width/2), (int)random(0,height), (int)(width/10), (int)(width/10), "normal"));
    }

}