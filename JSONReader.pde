class JSONReader {

    JSONObject json;
    JSONArray jBangs;
    int[] bangs;

    int count = 0;

    JSONReader(String file) {
        this.json = loadJSONObject(file);
        this.jBangs = this.json.getJSONArray("bangs");
        this.bangs = new int[this.jBangs.size()];
        for(int i = 0; i < this.jBangs.size(); i++){
            this.bangs[i] = this.jBangs.getInt(i);
        }
    }

    int[] getBangs(){
        return this.bangs;
    }

    boolean doIPlayBang(int _time){
        if(count < this.jBangs.size()){
            if (this.bangs[count] < _time){
                this.count++;
                return true;
            }
        }
        return false;
    }

}