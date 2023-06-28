function assert(response){        
var m1 = new Map();
m1.set("rate", 4.1);
m1.set("count", 259);
console.log(m1);
var result=new Map(Object.entries(JSON.parse(response.rating)));
console.log(result);
function compareMaps(m1, result) {
  if (m1.size !== result.size) {
    return false;
  }
  
  for (const [key, value] of m1.entries()) {
    if (!result.has(key) || result.get(key) !== value) {
      return false;
    }
  }
  
  return true;
}
return result;
}
