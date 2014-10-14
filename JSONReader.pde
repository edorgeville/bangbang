class JSONReader {

    JSONObject json;

    int bangsCount = 0;
    JSONArray bangs;
    int bamsCount = 0;
    JSONArray bams;
    int dongsCount = 0;
    JSONArray dongs;


    JSONReader(String file) {
        this.json = loadJSONObject(file);
        this.bangs = this.json.getJSONArray("bangs");
        this.bams = this.json.getJSONArray("bams");
        this.dongs = this.json.getJSONArray("dongs");
    }

    boolean doIPlay(int _time, String type){
        if(type == "bang"){
            if(bangsCount < this.bangs.size()){
                if (this.bangs.getInt(bangsCount) < _time){
                    this.bangsCount++;
                    return true;
                }
            }
        }else if(type == "bam"){
            if(bamsCount < this.bams.size()){
                if (this.bams.getInt(bamsCount) < _time){
                    this.bamsCount++;
                    return true;
                }
            }
        }else if(type == "dong"){
            if(dongsCount < this.dongs.size()){
                if (this.dongs.getInt(dongsCount) < _time){
                    this.dongsCount++;
                    return true;
                }
            }
        }
        return false;
    }

}