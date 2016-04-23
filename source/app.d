import std.stdio;
import std.file;
import std.datetime;
import core.thread;

import vibe.core.log;
import vibe.http.client;
import vibe.stream.operations;
import vibe.http.status;

void main()
{
	checkLink("http://example.com");
	
}

// stand alone function
void checkLink(string link)
{
	try
	{
		uint status;
		bool isalive;

		requestHTTP(link, (scope req) 
			{
				req.method = HTTPMethod.GET;
			},
			(scope res) 
			{
				if ((res.statusCode) == 200)
					{
						isalive = true;
					}	
				else
					{
						isalive = false;
						writefln("ERROR: response code: %s", (res.statusCode)); 
					}
			}
		);

	}
	
	catch(Exception e)	
	{
		writeln("My Exception:");
		writeln(e.msg);
	}
}