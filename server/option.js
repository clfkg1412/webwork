class Option{
    constructor(type,arg0,arg1){
        this.host = this.getHost(type);
        this.path = this.getPath(type,arg0);
        this.method = this.getMethod(type);
        this.arg1 = arg1;
        this.headers = {
            'Accept':'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
            'Accept-Encoding':'deflate',
            'Accept-Language':'zh-CN,zh;q=0.9',
            'Connection':'keep-alive',
            'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8',
            'Host':"",
            'Referer':"",
            'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36',
            'X-Forwarded-For':"10.0.2.22"
        }

    };


    getOption()
    {
        var options = {};
        options.host = this.host;
        options.path = this.path;
        options.method = this.method;
        options.headers = this.headers;
        options.headers["Host"] = this.host;
        options.headers["Referer"] = this.host + this.path;
        return options;
    }

    getHost(type)
    {
        if(type == 1)
        {
            return "www.aigaogao.com";
        }
        else if(type == 2)
        {
            return "quotes.money.163.com";
        }
        return "";
    }
    

    getPath(type,arg0)
    {
        if(type == 1)
        {
            return '/tools/sectorslist.html';
        }
        else if(type == 2)
        {
            return "/f10/gszl_"+arg0+".html";
        }
        return "";
    }

    getMethod(type)
    {
        return 'GET';
    }
}

module.exports = Option;