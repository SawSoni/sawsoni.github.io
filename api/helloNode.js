// this is core node module it is all ready in the system
//Load HTTP module
const http = require('http');

//to load the file, bring file system module 
const fs = require('fs');


//Loopback address is a special IP(Internet Protocol address (IP address)) number (127.0.0.1);

const hostname = '127.0.0.1';
const port = 3000;

/*fs.readFile('index.html',(error,html) => {
	if(error){
		throw error;
	}

	const server = http.createServer((request,response)=>{
		response.statusCode = 200;
		response.setHeader('Content-type','text/html');
		response.write(html);
		response.end();
	});

	server.listen(port,hostname,()=>{
	console.log('server started on port' + port);
	});
});
*/
/**/

//Create HTTP server and listen on port 3000 for requests
const server = http.createServer((request,response) => {
	response.statusCode = 200;

   // Set the response HTTP header with HTTP status and Content type
	response.setHeader('Content-type','text/plain');
	response.end('Hello World');
});
// Print URL for accessing server
server.listen(port,hostname,()=>{
	console.log('server started on port' + port);
})