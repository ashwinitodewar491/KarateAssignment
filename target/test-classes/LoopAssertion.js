function assert(response){
  	//let ratings=new Map[key,value];
 var result=new Map(Object.entries(JSON.parse(response)));
 console.log(result);
	/*for (var i=0;i<response.rating.length;i++)
	{
		ratings=map.set(response.rating.keys[i], response.rating.values[i]);
	}*/
//console.log(Ratings);
return result;
}
