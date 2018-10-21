var express = require('express');
var http = require('http');
var url = require('url');
var qs = require('querystring'); 
var mysql = require('mysql');
var plateItem = require('./plateItem');
var option = require('./option');
var dbConnention = require('./dbconnention');


var connObj = new dbConnention('127.0.0.1','3306','root','abc@123','my_test');
var connection = connObj.getConn();

var app = express();
app.get('/',function(req,res){
    res.sendFile(__dirname+"/html/index.html");
});

app.listen(3000,function(){
    console.log("app is running!!");

})







var opt = new option(1,"","");
var options = opt.getOption();
var loadPlateInfo = function(content)
{
    var result = content.match(/<tr><a name=.*<\/td><\/tr>/g);
    var arrList = [];
    if(result)
    {
        for (let index = 0; index < result.length; index++) {
            const element = result[index];
            var item = new plateItem(element);
            arrList.push(item);
        }
    }
    return arrList;
}

var insertPlate2DB = function(arrList,nIndex,cachList)
{
    if(arrList.length <= nIndex){
        console.log("insertPlate2DB OVER!")
        //开始调用插入公司的接口
        connection.query("select company_code from company_dic",function (err,dbRet) {
            if(err)
            {
                console.log(err.message);
            } 
            else
            {
                cachList = dbRet;
                insertCompany2DB(arrList,0,cachList);
            }
        });
        return;
    }
    var addSql = "INSERT INTO plate_dic(plate_name,plate_level,parent_id) VALUES(?,?,?);"
    var addSqlParams = new Array(3);
    //判断第一类
    var bNeedAddLevel1 = true;
    var bNeedAddLevel2 = true;
    var parentID = null;
    for (let index = 0; index < cachList.length; index++) {
        const element = cachList[index];
        if (element.plate_name == arrList[nIndex].level1&&element.plate_level == 1) {
            bNeedAddLevel1 = false;
            parentID = element.id;
            arrList[nIndex].levelID1 =  element.id;
        }
        if (element.plate_name == arrList[nIndex].level2&&element.plate_level == 2) {
            bNeedAddLevel2 = false;
            arrList[nIndex].levelID2 =  element.id;
        }
    }
    if(bNeedAddLevel1)
    {
        addSqlParams[0] = arrList[nIndex].level1;
        addSqlParams[1] = 1;
        addSqlParams[2] = parentID;
        connection.query(addSql,addSqlParams,function(err,ret){
            if(err)
            {
                console.log("INSERT Err：",err.message);
            }
            else
            {
                let cash ={
                    id:ret.insertId,
                    plate_name:addSqlParams[0],
                    plate_level:addSqlParams[1],
                    parent_id:addSqlParams[2]
                }
                cachList.push(cash);
                arrList[nIndex].levelID1 = cash.id;
                insertPlate2DB(arrList,nIndex,cachList);
            }
        });
    }
    else
    {
        if (bNeedAddLevel2)
        {
            addSqlParams[0] = arrList[nIndex].level2;
            addSqlParams[1] = 2;
            addSqlParams[2] = parentID;
            connection.query(addSql,addSqlParams,function(err,ret){
                if(err)
                {
                    console.log("INSERT Err：",err.message);
                }
                else
                {
                    let cash ={
                        id:ret.insertId,
                        plate_name:addSqlParams[0],
                        plate_level:addSqlParams[1],
                        parent_id:addSqlParams[2]
                    }
                    cachList.push(cash);
                    arrList[nIndex].levelID2 = cash.id;
                    nIndex++;
                    insertPlate2DB(arrList,nIndex,cachList);
                }
            });
        }
        else
        {
            nIndex++;
            insertPlate2DB(arrList,nIndex,cachList);
        }
    }

}


var insertCompany2DB = function (arrList,nIndex,cachList) {
    if(arrList.length <= nIndex){
        console.log("Insert Company Over!")
        return;
    }
    var element = arrList[nIndex];
    
    var arrCode = element.codes.split(",");
    var arrName = element.names.split(",");
    var values = [];
    for (let nCodeIndex = 0; nCodeIndex < arrCode.length; nCodeIndex++) {
        var code = arrCode[nCodeIndex];
        code = code.replace(" ","");
        var name = arrName[nCodeIndex];
        name = name.replace(" ","");
        var bNeedAddCompany = true;
        for (let index = 0; index < cachList.length; index++) {
            if(cachList[index].company_code == code)
            {
                bNeedAddCompany = false;
                break;
            }
        }
        if(bNeedAddCompany)
        {
            var item = [name,code,element.levelID1,element.levelID2];
            values.push(item);
        }
    }
    if(values.length > 0)
    {
        var addSql = "INSERT INTO company_dic(company_name,company_code,level1,level2) VALUES ?";
        connection.query(addSql,[values],function (err,dbRet) {
            if(err)
            {
                console.log(err.message);
            } 
            else
            {
                nIndex++;
                insertCompany2DB(arrList,nIndex,cachList);
            }
        })
    }
    else
    {
        nIndex++;
        insertCompany2DB(arrList,nIndex,cachList);
    }
}

var req = http.request(options,function(res){
    var body = '';
    var header=res.headers;
   

    console.log('STATUS: ' + res.statusCode); 
    console.log('HEADERS: ' + JSON.stringify(res.headers)); 
    res.setEncoding('utf8'); 
    res.on('data', function (chunk) { 
        body += chunk;
    }); 

    res.on('end',function(){
        //解析
       
        var arrList = loadPlateInfo(body);
        //
        //插入第一类
        connection.query("select * FROM plate_dic",function (err,dbRet) {
          if(err)
          {
              console.log(err.message);
          } 
          else
          {
            insertPlate2DB(arrList,0,dbRet);
          }
            
        });
    });

});

req.on('error', function (e) { 
    console.log('problem with request: ' + e.message);
}); 




   
req.end();