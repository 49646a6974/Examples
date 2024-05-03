-- title:   game title
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

function init()
	cls()
	print("MEH....",1,1,12)
	m={}
	for x=1,5*6 do
		m[x]={}
		for y=1,6 do
			if pix(x,y)==12
				then
				m[x][y]=pix(x,y)
				pix(x,y,m[x][y])
			end
		end
	end
	cls()
	--enlarge
	for x=1,8*29 do
		for y=1,8*5 do
			pix(x,y+50,m[math.floor(x/8)+1][math.floor(y/8)+1])
		end
	end
	--spawn particles		239,135
	c={1,2,3,4,5,6,7,8,9,10,11}
	p={c={},xo={},yo={},r={},x={},y={},a={}}
	for x=0,239 do
		for y=0,135 do
			if pix(x,y)==12
				then
				table.insert(p.c,c[math.floor(math.random(#c))])
				table.insert(p.xo,x)
				table.insert(p.yo,y)
				table.insert(p.r,0)
				table.insert(p.x,x)
				table.insert(p.y,y)
				table.insert(p.a,math.pi*math.random()*2)
			end
		end
	end
	wait=0
end

init()

function TIC()
	if math.random()>0.5 then cls() end
	for i=1,#p.c do
		if wait<=0
			then
			p.r[i]=p.r[i]+(math.random()*2)
			p.x[i]=p.r[i]*(math.cos(p.a[i]))+p.xo[i]
			p.y[i]=p.r[i]*(math.sin(p.a[i]))+p.yo[i]
		end
		pix(p.x[i],p.y[i],p.c[i])
	end
	for i=1,#p.c do
		if p.r[1]>120
			then
			for i=1,#p.c do
				p.r[i]=0
				p.x[i]=p.r[i]*(math.cos(p.a[i]))+p.xo[i]
				p.y[i]=p.r[i]*(math.sin(p.a[i]))+p.yo[i]
			end
			wait=15
		end
	end
	if wait>0
		then
		wait=wait-1
	end
end
