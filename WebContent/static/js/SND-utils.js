/**
 * get current location URL parameter
 * @param paramName
 * @returns
 */
function getParamFromUrl(paramName) {
	   return (window.location.search.match(new RegExp('[?&]' + paramName + '=([^&]+)')) || [, null])[1];
}