function assert(response){        
var m1 = new Map();
m1.set("rate", 4.1);
m1.set("count", 259);
console.log(m1);
  	//let ratings=new Map[key,value];
 var result=new Map(Object.entries(JSON.parse(response.rating)));
 
	/*for (var i=0;i<response.rating.length;i++)
	{
		ratings=map.set(response.rating.keys[i], response.rating.values[i]);
	}*/
//console.log(Ratings);
console.log(result);
log(compareMaps(m1, result))
return result;
}
