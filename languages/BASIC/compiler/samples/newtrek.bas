' Super Star Trek
'   Parrot BASIC 2 version by Clinton Pierce
'
' Original idea goes back as far as the CDC 6600 in 1974
'
' Note: There's only a shell of a game here.  This is intended
'    as a demo for the interpreter.
'
type QuadrantInfo
	klingons as integer
	bases as integer
	stars as integer
	novas as integer
end type
type Location
	quadx as integer
	quady as integer
	sectx as integer
	secty as integer
end type
type Klingon
	shields as integer
	disruptor as integer
	shipname as string
	where as Location
	destroyed as integer
end type
type Starfleet
	shields as double
	shieldstate as integer
	torpedos as integer
	crew as integer
	damage as integer
	energy as integer
	kills as integer
	warpfactor as integer
	impulse as double
	where as Location
end type
dim universe() as QuadrantInfo
dim here as QuadrantInfo
dim quadmap$()
dim enemy() as Klingon

dim enterprise as Starfleet

klingons=10
bases=10
wide=8  ' width of a sector, and the universe
high=8  ' height

sub EnterpriseRecharge
	shared enterprise as Starfleet

	enterprise.shields=100
	enterprise.shieldstate=0
	enterprise.torpedos=5
	enterprise.crew=100
	enterprise.damage=0
	enterprise.energy=1000
	enterprise.kills=0
	enterprise.warpfactor=1
	enterprise.impulse=.25
end sub

sub Status
	shared enterprise as Starfleet

	print 
	print " Shields: ";
	if enterprise.shieldstate then 
		print "up at";enterprise.shields;"%"
	else 
		print "down"
	end if
	print "Torpedos: ";enterprise.torpedos
	print "    Crew: ";enterprise.crew
	print "  Damage: ";enterprise.damage
	print "  Energy: ";enterprise.energy
	print "   Kills: ";enterprise.kills
	print "   Speed: Warp:";enterprise.warpfactor;" Impulse:";enterprise.impulse
	print 
end sub

sub RandPoint(pointx,pointy)
	shared high
	shared wide
	pointx=high*rnd+1
	pointy=wide*rnd+1
end sub

sub CreateUniverse (klingons, bases)
	shared universe() as QuadrantInfo
	shared enemy() as Klingon
	shared high
	shared wide

	for i = 1 to high
		for j = 1 to wide
			universe(i,j).stars=6*rnd+2
		next j
	next i
	restore klingon
	for i = 1 to klingons
		call RandPoint(x,y)
		enemy(i).shields=100
		enemy(i).disruptor=10
		enemy(i).where.quadx=x
		enemy(i).where.quady=y
		enemy(i).destroyed=0
		read enemy(i).shipname
		universe(x,y).klingons=universe(x,y).klingons+1
	next i
	for i = 1 to bases
		call RandPoint(x,y)
		universe(x,y).bases=universe(x,y).bases+1
	next i
end sub
sub DumpUniverse
	shared universe() as QuadrantInfo
	dim current as QuadrantInfo
	shared high
	shared wide

	for i = 1 to high
		for j = 1 to wide
			current=universe(i,j)
			print i;j,current.stars, current.klingons, current.bases
		next j
	next i

end sub
sub DumpQuad(x,y)
	shared quadmap$()
	shared high
	shared wide
	print
	print "Short range scan of sector ";x;",";y;""
	print "   1 2 3 4 5 6 7 8"
	for i=1 to high
		print i;
		for j=1 to wide
			print quadmap$(i,j);" ";
		next j
		print
	next i
end sub
sub Fillin(type$, count)
	shared quadmap$()
	lc=count
	while lc > 0
		call RandPoint(px,py)
		if (quadmap$(px,py) = ".") then
			quadmap$(px,py)=type$
			lc=lc-1
		end if
	wend
end sub

' Pop into a new sector.  
'  
sub AppearIn(x,y)
	shared universe() as QuadrantInfo
	shared enemy() as Klingon
	shared quadmap$()
	shared klingons
	shared enterprise as Starfleet

	shared high
	shared wide

	dim here as QuadrantInfo

	print
	print "You are now in sector ";x;",";y
	print

	' Create a map of this quadrant
	for i=1 to high
		for j=1 to wide
			quadmap$(i,j)="."
		next j
	next i
	here=universe(x,y)
	for i = 1 to klingons
		if (enemy(i).where.quadx=x) and (enemy(i).where.quady=y) and not (enemy(i).destroyed) then
			call RandPoint(kx,ky)
			enemy(i).where.sectx=kx
			enemy(i).where.secty=ky
			quadmap$(kx,ky)="K"
		end if
	next i
	enterprise.where.quadx=x
	enterprise.where.quady=y
	enterprise.where.sectx=0
	enterprise.where.secty=0
	while enterprise.where.sectx + enterprise.where.secty = 0
		call RandPoint(ex, ey)
		if quadmap$(ex, ey) = "." then
			enterprise.where.sectx=ex
			enterprise.where.secty=ey
			quadmap$(ex,ey)="E"
		end if
	wend
	call Fillin("B", here.bases)
	call Fillin("*", here.stars)
end sub

function offsets(direction, offsetx, offsety)
	offsetx=0
	offsety=0
	offsets=1
	select case direction
		case 1
			offsety=-1
		case 2
			offsetx=1
			offsety=-1
		case 3
			offsety=1
		case 4
			offsety=1
			offsetx=1
		case 5
			offsetx=1
		case 6
			offsetx=1
			offsety=-1
		case 7
			offsety=-1
		case 8
			offsetx=-1
			offsety=-1
		case else 
			offsets=0		' Invalid!
			print "Invalid direction! (";direction;") 1-8 accepted."
	end select
end function

function boundedmove(offx,offy,posx,posy,distance,check)
	shared quadmap$()
	shared high
	shared wide

	px=posx+(offx*distance)
	py=posy+(offy*distance)
	if px <= 0 or py <= 0 or px >= (wide+1) or py >= (wide+1) then
		boundedmove=0 
	elseif (quadmap$(px,py) <> ".") and check then
		select case quadmap$(px,py)
			case "K"
				boundedmove=-1
			case "*"
				boundedmove=-2
			case "B"
				boundedmove=-3
			case else 
				print "Invalid thing on board: ";quadmap$(px,py)
				end
		end select
	else 
		posx=px
		posy=py
		boundedmove=1
	end if
end function

' Move ship in the specified direction
'   If impulse flag is set move within sector increments of that * 4 (full imp=4 sq)
'   If warp flag is set move that many sectors
sub Move(direction, impulse) 
	shared enterprise as Starfleet
	shared quadmap$()

	if offsets(direction, mx, my) = 0 then
		exit sub
	end if

	x=enterprise.where.quadx
	y=enterprise.where.quady
	loc$="galaxy"
	distance=enterprise.warpfactor
	if impulse then
		x=enterprise.where.sectx
		y=enterprise.where.secty
		loc$="sector"
		distance=4*enterprise.impulse
	end if
	
	bump=boundedmove(mx, my, x, y, distance, impulse)
	if bump = 0 then
		print "Move would take you out of the ";loc$;"!"
		exit sub
	end if
	
	if impulse then
		if bump < 1 then
			print "You have bumped into ";
			select case bump
				case -1
					print "a Klingon cruiser."
				case -2
					print "a star."
				case -3
					print "a starbase."
			end select
			exit sub
		end if
		quadmap$(enterprise.where.sectx,enterprise.where.secty)="."
		quadmap$(x,y)="E"
		enterprise.where.sectx=x
		enterprise.where.secty=y
		enterprise.energy=enterprise.energy-(enterprise.shieldstate*2)*50*(1/enterprise.impulse)
	else 
		enterprise.where.quadx=x
		enterprise.where.quady=y
		enterprise.energy=enterprise.energy-(enterprise.shieldstate*2)*10
		print "Warping to...";x;",";y
		call AppearIn(x,y)
	end if	
end sub
function nautical$
	f=10*rnd+1
	select case f
		case < 2
			nautical$="amidship"
		case < 5
			nautical$="in engineering"
		case < 7
			nautical$="on the bridge"
		case < 9
			nautical$="on the warp nacelles"
		case 9
			nautical$="in the galley"
		case 10 
			nautical$="in the head"
	end select
end function

sub DamageEnemy(qx, qy, sx, sy, distance, torp)
	shared enemy() as Klingon
	shared klingons
	dim target as Klingon
	shared quadmap$()
	shared enterprise as starfleet
	shared universe() as QuadrantInfo
	
	
	torpdamage=50
	for i=1 to klingons
		target=enemy(i)
		if (target.where.quadx=qx) and (target.where.quady=qy) and (target.where.sectx=sx) and (target.where.secty=sy) then
			exit for
		end if
	next i
	if i > klingons then exit sub
	weap$="phasers"
	if torp then weap$="photon torpedo"
	place$=nautical$()
	print "Your ";weap$;" hit the Klingon cruiser ";target.shipname;" ";place$

	if torp then
		damage=torpdamage
	else
		damage=torpdamage/distance
	end if

	enemy(i).shields=enemy(i).shields-damage
	if enemy(i).shields < 0 then
		print "You have destroyed the enemy vessel!"	
		enemy(i).destroyed=1
		quadmap$(sx,sy)="."
		a=universe(enterprise.where.quadx,enterprise.where.quady).klingons
		a=a-1
		universe(enterprise.where.quadx,enterprise.where.quady).klingons=a
	else 
		print tab(10);" for ";damage;" units of damage to their shields."
	end if
end sub

' Fire!
sub Fire(direction, torpedo)
	shared enterprise as Starfleet
	
	if offsets(direction, fx, fy)=0 then
		exit sub
	end if

	print
	x=enterprise.where.sectx
	y=enterprise.where.secty
	distance=1
	do
		strike=boundedmove(fx, fy, x, y, 1, 1)
		if torpedo then
			print tab(20);"Torpedo now at ";x;",";y
		end if
		if strike = 0 then 
			print "You missed."
			exit do
		end if
		if strike = -2 then
			print "Your shot went into a star"
			exit do
		end if
		if strike = -3 then
			print "Don't shoot your own star base"
			exit do
		end if
		if strike = -1 then
			x=x+fx
			y=y+fy
			print tab(20);"Torpedo struck at ";x;",";y;"!"
			call DamageEnemy(enterprise.where.quadx, enterprise.where.quady, x, y, distance, torpedo)
			exit do
		end if		
		distance=distance+1
	loop
	print
end sub

' Klingon Attack
sub KFire
	shared klingons
	shared enterprise as Starfleet
	shared enemy() as Klingon
	dim target as Klingon

	for i=1 to klingons
		target=enemy(i)
		if (target.where.quadx=enterprise.where.quadx) and (target.where.quady=enterprise.where.quady) and (not target.destroyed) then
			print "Klingon ship takes a shot at the Enterprise"
			if rnd > .075 then
				if enterprise.shieldstate then
					enterprise.shields=enterprise.shields-rnd*25
					print "Shields down to";enterprise.shields
					if enterprise.shields < 0 then
						enterprise.shields=0
						print "Shields are down!"
					end if
				else
					print "Damage taken!"
					enterprise.crew=enterprise.crew-rnd*10
					enterprise.damage=enterprise.damage+rnd*20
					if enterprise.damage > 100 then
						print "The enterprise has been destroyed."
					end if
				end if
						
			else 
				print "Miss!"
			end if
		end if
	next i
end sub
sub LongRange(x,y)
	shared Universe() as QuadrantInfo
	shared wide
	shared high

	for i=x-1 to x+1
		for j=y-1 to y+1
			if  (j < 1) or (j > wide) then
				print "|",
			elseif (i < 1) or (i > wide) then
				print " ---",
			else 
				unv=(universe(i,j).stars * 100) + (universe(i,j).klingons * 10) + (universe(i,j).bases)
				print unv,
			end if
		next j
		print
	next i
end sub
sub Shields
	shared enterprise as Starfleet
	enterprise.shieldstate=not enterprise.shieldstate
	if enterprise.shieldstate then
		print "Shields are up"
	else
		print "Shields are down"
	end if
end sub
sub Menu
	print "SH  Sheilds     LR Long Range Scan"
	print "NA  Navigate    SR Short Range Scan"
	print "ST  Status      PH Phasers"
	print "                TO Torpedos"
end sub
sub Navigate 
	do
		input "(W)arp or (I)mpulse power:";power$
		power$=left$(ucase$(power$),1)
	loop until (power$ = "W") or (power$ = "I")
	print "     1"
	print "   8 | 2"
	print "  7 -+- 3"
	print "   6 | 4"
	print "     5"
	input "Direction (1-8)";direction
	if power$ = "I" then
		call Move(direction, 1)
	else 
		call Move(direction, 0)
	end if
end sub
sub Phasers
	input "Fire Phasers!  Direction (1-8)";direction
	call Fire(direction, 0)
end sub
sub Torpedo
	shared enterprise as starfleet

	input "Fire photon torpedo!  Direction (1-8)";direction
	call Fire(direction, 1)
	enterprise.torpedos=enterprise.torpedos-1
end sub

call CreateUniverse(klingons, bases)
call EnterpriseRecharge
call AppearIn(6,2)

do
	print
	input "Command";cmd$
	cmd$=left$(ucase$(cmd$), 2)
	select case cmd$
		case "SH"
			call Shields
		case "LR"
			call LongRange(enterprise.where.quadx,enterprise.where.quady)
		case "NA"
			call Navigate
		case "ST"
			call Status
		case "SR"
			call DumpQuad(enterprise.where.quadx,enterprise.where.quady)
		case "PH"
			call Phasers
		case "TO"
			call Torpedo
		case else
			print "Unknown command."
			call Menu
	end select
	call KFire
loop

klingon:
  data "T'Acog", "T'Ong", "Pagh", "Maht-H'a", "Toh'Kaht", "Buruk", "Korinar", "Vorn", "Negh'Var", "Qu'Vat"

