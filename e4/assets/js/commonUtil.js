window.base_uri = function() {
	var getUri = window.location;
	var baseUri = getUri.protocol + "//" + getUri.host + "/" + getUri.pathname.split('/')[1];
	return baseUri;
}