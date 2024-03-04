-- title:   map generator
-- author:  Undead Dood
-- desc:    simple map generation example
-- license: MIT License
-- script:  lua

--horizontal position			0-239
--verticle position					0-135
--color number  3 is orange

function init()
	spot={x=0,y=0,cnt=0}		--thing that draws the map
	size={max_x=239,max_y=135,min_x=0,min_y=0}	--variables for map dimensions
	spot.x=math.floor(math.random(size.max_x+1))-1	--starts it on a random location
	spot.y=math.floor(math.random(size.max_y+1))-1
	coverage={goal=0.1*size.max_x*size.max_y,current=0}		--from 1.0 to 0.0
	d_change=1		--1=many turns...n=low turnss
end

init()

function gen_map()
	local d=math.floor(math.random(4)) - 1	--0,3 udlr
	while coverage.goal > coverage.current do
		if d==0 and spot.x>size.min_x then spot.x=spot.x-1 end
		if d==1 and spot.x<=size.max_x then spot.x=spot.x+1 end
		if d==2 and spot.y>size.min_y then spot.y=spot.y-1 end
		if d==3 and spot.y<size.max_y then spot.y=spot.y+1 end
		if pix(spot.x,spot.y)==0	--checks if the pixel is blank
			then		--if not,  then count it.
			coverage.current=coverage.current+1 
		end
		pix(spot.x,spot.y,3)		--put an orange pixel here
		if math.floor(math.random(d_change))==1
			then
			d=math.floor(math.random(4)) - 1	--pick a random direction for next loop
		end
	end
end

function TIC()
	if btnp(1) then cls() init() end	--down
	if btnp(2) then gen_map() end	--left
end
