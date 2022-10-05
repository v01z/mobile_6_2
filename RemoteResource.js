
var currencyArray = []
var nameArray = []
var valueArray = []

function getData() {
    var xmlhttp = new XMLHttpRequest();
    var url = "https://cdn.cur.su/api/cbr.json"

    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200) {

            parseStaff(xmlhttp.responseText)

            for (var i in currencyArray)
            {
                nameArray.push(currencyArray[i][0])
                valueArray.push(currencyArray[i][1])
            }
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

function parseStaff(response){
    var jsonObj = JSON.parse(response)

    for (var i in jsonObj.rates)
    {
        var currentValue = jsonObj.rates[i]
        var tempObj = [i, currentValue]
        currencyArray.push(tempObj)
    }

}

function getValueByName(currencyName){
    var retVal = 0.00

    for (var i in currencyArray)
    {
        if(currencyArray[i][0] === currencyName)
        {
            retVal = currencyArray[i][1]
            break
        }
    }

    return retVal
}
