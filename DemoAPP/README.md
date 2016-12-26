# DemoAPP

Step 1: Create a Basic Azure Node.js Express 4 Application in Visual Studio 2015

Step 2: Install the required modules with npm command line
		# npm install

Step 3: In order to keep the server running, I recommend you use node-supervisor to run ./bin/www, 
	which requires installation:
		# npm install supervisor@0.11.0 -g
	and invoking:
		# set NODE_TLS_REJECT_UNAUTHORIZED=0 
		(to resolve 'UNABLE_TO_VERIFY_LEAF_SIGNATURE' issue)
		# supervisor ./bin/www

#End Of File#