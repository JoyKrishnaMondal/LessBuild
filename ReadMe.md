#LessBuild - Yet another less compiler


#Why

1. Better Error messages - 90% of compilations result in failure - so why are error messages terrible ?

	![Error Messages](http://i.imgur.com/mJP6zYy.png)

2. Simpler to use then Gulp.
	```
	> npm install https://github.com/JoyKrishnaMondal/LessBuild.git
	> node -p "require('LessBuild')()"
	```

3. Only functional API based on my other  [module](https://github.com/JoyKrishnaMondal/GeneralDev)

	+ For example if you want to do a `css` cleanup (getting rid of all `css` files that got compiled from `less`)
	```
	> node -p "require('LessBuild')(0,0,1)"
	```
	+ Or if you want to **only** compile files that you edit.
	```
	+ node -p "require('LessBuild')(0,1,0)"
	```
	+ Or if you want to compile all your `less` source code to a distribution directory.
	```
	> node -p "require('LessBuild')(1,0,0,"../distribution")"
	```




