
function handlePickup () : int
{
		// get a random value
	var randomValue : float = Random.value;
		
		// convert our value into an index between 0 and 6
	var newValue : int = ((randomValue*7) % 7);

		// increase by one (as 0 means no pickup ;))
	newValue++;
	
		//not needed here! We get a nice index for free! We'll use that for now
	return (newValue);
}

