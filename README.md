whc-huboard
===========

debian jessie build for huboard

a bit broken still, but nearly there

Rakefile should be decently functional, i.e. my workflow at the moment seems to be 

`rake`

and then watch the container start and fail at somepoint, then switch to another terminal and 

`rake enter`


which gives me a bash prompt inside the container to debug, then when I’m done

`rake rm`

kills the container, and removes it. Notice the last two rely on the cid file being present from the run command which is ran by default in `rake`
