class PlateItem{
    constructor(element){
        var rex = /<td class='name'>(.*)<\/td><td class='name'><a .*>(.*)<\/a><\/td><td><a .*>(.*)<br>(.*)<\/a><\/td>/;
        var list = rex.exec(element);
        if(list&&list.length == 5)
        {
            this.levelID1 = 0;
            this.levelID2 = 0;
            this.level1 = list[1];
            this.level2 = list[2];
            this.codes = list[3];
            this.names = list[4];

            console.log(this.level1,this.level2);
        }
        else
        {
            console.log("can not parse ele:" , element);
        }
    }
}

module.exports = PlateItem;