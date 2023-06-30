function ResponseValidator(response,expResponse){        
	
//verify the rate
if (response.rating.rate!=expResponse.expRate){
	return false;
}
//Verify the count
if (response.rating.count!=expResponse.expCount){
	return false;
}
return true;
}
